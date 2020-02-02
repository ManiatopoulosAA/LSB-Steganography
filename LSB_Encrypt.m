clear all;
clc;
tic

%read big image-------
disp('Please choose the masking image');

Filter={'*.png;*.bmp'};
[FileName, FilePath]=uigetfile(Filter);
pause(0.01);

if FileName==0
    return;
end

FullFileName=[FilePath FileName];

reference=imread(FullFileName);
disp('DONE :)');
%---------------------

[s_Mask1,s_Mask2,s_Mask3]=size(reference);
s_Secret1=ceil(s_Mask1/sqrt(8));
s_Secret2=ceil(s_Mask2/sqrt(8));

for i=1:s_Mask1
    for j=1:s_Mask2
        for k=1:s_Mask3
            if mod(reference(i,j,k),2)==1
                reference(i,j,k)=reference(i,j,k)-1;
            end
        end
    end
end

limit=s_Secret1*s_Secret2;

%read secret image-------
disp('Please choose the secret image');

Filter={'*.png;*.bmp'};
[FileName, FilePath]=uigetfile(Filter);
pause(0.01);

if FileName==0
    return;
end

FullFileName=[FilePath FileName];

simage=imread(FullFileName);
disp('DONE ;)');
%---------------------

simage=imresize(simage,[s_Secret1 s_Secret2]);

secret=zeros(limit,3);

p=0;
for i=1:s_Secret1
    for j=1:s_Secret2;
        p=p+1;
        for k=1:s_Mask3
            secret(p,k)=simage(i,j,k);
        end
    end
end

matrix=zeros(limit,1);

p=0;
for i=1:8:s_Mask1
    for j=1:s_Mask2
        p=p+1;
        if p>limit
            break;
        end
        for k=1:s_Mask3
            str1=dec2bin_2(secret(p,k));
            for n=0:7
                if (str1(n+1)==1)&&(mod(reference(i+n,j,k),2)==0)
                    reference(i+n,j,k)=reference(i+n,j,k)+1;
                elseif (str1(n+1)==0)&&(mod(reference(i+n,j,k),2)==1)
                    reference(i+n,j,k)=reference(i+n,j,k)-1;
                end
            end
        end
    end
end
imwrite(reference,'Sent_image.png');
toc
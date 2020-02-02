clear all
clc
tic

%read sent image---------------

disp('Please choose the masking image');

Filter={'*.png;*.bmp'};
[FileName, FilePath]=uigetfile(Filter);
pause(0.01);

if FileName==0
    return;
end

FullFileName=[FilePath FileName];

reference=imread(FullFileName);

%-------------------------------

[s_Mask1,s_Mask2,s_Mask3]=size(reference);
s_Secret1=ceil(s_Mask1/sqrt(8));
s_Secret2=ceil(s_Mask2/sqrt(8));

decrypt=zeros(s_Secret1*s_Secret2,3);
p=0;

limit=s_Secret1*s_Secret2;
for i=1:8:s_Mask1
    for j=1:s_Mask2
        p=p+1;
        if p>limit
            break;
        end
        for k=1:s_Mask3
            str=zeros(8,1);
            for n=0:7
                if mod(reference(i+n,j,k),2)~=0
                    str(n+1)=1;
                end
            end
            for m=1:8
                decrypt(p,k)=decrypt(p,k)+2^(8-m)*str(m);
            end
        end
    end
end

im=zeros(s_Secret1,s_Secret2,3);
p=0;
for i=1:s_Secret1
    for j=1:s_Secret2
        p=p+1;
        for k=1:s_Mask3
            im(i,j,k)=decrypt(p,k);
        end
    end
end
toc

im=imresize(im,[s_Mask1 s_Mask2]);

im=uint8(im);
image(im);

imwrite(im,'recomposed.png');
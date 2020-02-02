function s = dec2bin_2(input)

if input == 255
    s = [1;1;1;1;1;1;1;1];
    return;
end

s = [0;0;0;0;0;0;0;0];

if input == 0
    return;
end

if input >= 128
    input = input - 128;
    s(1) = 1;
    if input == 0
        return;
    end
end

if input >= 64
    input = input - 64;
    s(2) = 1;
    if input == 0
        return;
    end
end

if input >= 32
    input = input - 32;
    s(3) = 1;
    if input == 0
        return;
    end
end

if input >= 16
    input = input - 16;
    s(4) = 1;
    if input == 0
        return;
    end
end

if input >= 8
    input = input - 8;
    s(5) = 1;
    if input == 0
        return;
    end
end

if input >= 4
    input = input - 4;
    s(6) = 1;
    if input == 0
        return;
    end
end

if input >= 2
    input = input - 2;
    s(7) = 1;
    if input == 0
        return;
    else
        s(8) = 1;
    end
end
end


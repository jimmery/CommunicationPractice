fileID = fopen('testfile.txt');
read = textscan(fileID, '%c');
fclose(fileID);
in = read{1}

c = [1 1 1 1 1 1 1];
c = [c; int8(dec2bin(int8(in), 7) - '0')];


Fs = 8192; %default sound frequency.
t2 = 1:1:Fs; %0.2 seconds. 

f0 = 74;
f1 = 89;


A0 = cos(2*pi*f0/Fs *(t2));
A1 = cos(2*pi*f1/Fs *(t2));

A = [];
s = size(c);
rows = s(1);
cols = s(2);
for j = 1:rows
    for i=1:cols
        if (c(j, i)==1)
           A = [A, A1]; 
        else
           A = [A, A0];
        end
    end
end


sound(A, Fs*5);
%load gong.mat;

Fs = 8192; %default sound frequency.
t2 = 1:1:Fs/5; %0.2 seconds. 
A = cos(2*pi/32*(t2));

sound(A);
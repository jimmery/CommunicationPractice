Fs = 8192; %default sound frequency.
t2 = 1:1:Fs; %0.2 seconds. 

f_base = Fs / 32;
nums = 0:127;
f = f_base + 10 * nums; 

x = [ 0 0 0 1 1 1 1 1 12 3 60 127 40 20 0 1 ];

P = zeros(length(f), length(t2));
for i=1:length(f)
    P(i,:) = cos(2*pi*f(i) / Fs * (t2));
end

A = []; %zeros(1, length(x)*length(t2));
for i=1:length(x)
    A = [A P(x(i)+1,:)];
end

sound(A, Fs);
%plot(A);
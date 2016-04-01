Fs = 1000;
T = 1/Fs;
L = 10000; 
t1 = (-L+1:L-1)*T;
f = Fs*(-(L/2):(L/2))/L;

p = sinc(t1);

y = conv(p, p, 'same') / Fs;

w = fft(p);
x = abs(w/L);
x1 = x(1:L/2+1);
x1(2:end-1) = 2*x1(2:end-1);

figure
plot(t1, y);
hold on
plot(t1, p);

figure
plot(x);


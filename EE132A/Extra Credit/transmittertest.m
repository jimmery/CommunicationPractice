Fs = 8192; %default sound frequency.
t2 = 1:1:Fs; %0.2 seconds. 

f0 = 74;
f1 = f0 + 15;

%x = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
x = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%x = [1 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 ];

A0 = cos(2*pi*f0/Fs *(t2));
A1 = cos(2*pi*f1/Fs *(t2));

A = [];
for i=1:1:length(x)
    if (x(i)==1)
       A = [A, A1]; 
    else
       A = [A, A0];
    end
end

sound(A, Fs*5);
Fs = 8192;
recObj = audiorecorder(5*Fs, 16, 1);
disp('Start recording.');
recordblocking(recObj, 2);
disp('End recording.');

play(recObj);

y = getaudiodata(recObj);

plot(y);

f0 = Fs / 32;
f1 = Fs / 64;

receive = [];
for i = Fs:Fs:length(y)
    t = 1:1:Fs;
    A0 = cos(2*pi*f0/Fs *(t));
    A1 = cos(2*pi*f1/Fs *(t));
    
    symbol0 = trapz(t, A0.*y(i - (Fs - 1):i)');
    symbol1 = trapz(t, A1.*y(i - (Fs - 1):i)');
    
    if symbol0 > symbol1
        receive = [receive 0];
    else
        receive = [receive 1];
    end
end

rec_text = [];
for i=1:7:length(receive)-6
    rec_text = [rec_text char(bin2dec(char(receive(i:i+6) + '0')))];
end


%read SymbolSequence.txt and NoiseSequence.txt
fileID = fopen('SymbolSequence.txt');
read = textscan(fileID, '%f');
fclose(fileID);
in = read{1};

fileID = fopen('NoiseSequence.txt');
read = textscan(fileID, '%f');
fclose(fileID);
noise = read{1};

n_values = 1000000;
SNR_dB = -5 : 10;
SNR = 10.^(SNR_dB / 10);
n = 1;
p = 3 / 2 * n * SNR;

%theoretical calculations
%threshold calculation
low_bound = zeros(16, 1);
up_bound = zeros(16, 1);
for i = 1:16
    low_bound(i) = -n/sqrt(p(i))*(p(i)/(2*n)+log(2));
    up_bound(i) = n/sqrt(p(i))*(p(i)/(2*n)-log(3/2));
end

%computing theoretial error. 
%p_th = 1/6*qfunc(1/2./sqrt(p).*(3/2*SNR-log(2))) + 1/3*qfunc(-1/2./sqrt(p).*(3/2*SNR+log(2))) + 1/3*qfunc(1./sqrt(p)/2.*(3/2*SNR-log(3/2))) + 1/2*qfunc(-1./sqrt(p)/2.*(3/2*SNR + log(3/2)));

%emperical calculatrion
out = zeros(n_values, 1);
for j = 1:16
    x = (in - 1) * sqrt(p(j));
    y = x + noise;
    for i = 1:n_values
        if y(i) < low_bound(j)
            out(i) = 0;
        elseif y(i) > up_bound(j)
            out(i) = 2;
        else
            out(i) = 1;
        end
    end
    error = in ~= out;
    p_error(j) = mean(error); %find the probability of error. 
    
    p_msg = sprintf('The probability of error is %f for SNR_dB %d', p_error(j), SNR_dB(j));
    %t_msg = sprintf('The theoretical probability is %f.', p_th(j));
    disp(p_msg);
    %disp(t_msg);
end

figure;
plot(SNR_dB, p_error);
                
        
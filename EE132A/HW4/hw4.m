N = 100000;
SNR_dB = [3 4 5 6 7 8 9 10];
SNR = 10.^(SNR_dB / 10);
E_av = 10;
sig = sqrt(E_av ./ SNR);
H = randi(8, 1, N);

X = zeros(N, 2);

constel = [-1 3; 3 3; -3 1; 1 1; -1 1; 3 -1; -3 -3; 1 -3];

for i=1:N
    X(i,:) = constel(H(i),:);
end

basis0 = [ones(1,10) zeros(1,10)];
basis1 = [zeros(1,10) ones(1,10)];

factor = norm(basis0);

basis0 = basis0 / factor;
basis1 = basis1 / factor;

S = zeros(N, 20);

for i=1:N
    S(i,:) = X(i,1) * basis0 + X(i,2) * basis1;
end

p_e = zeros(1,8);

for k=1:8
    noise = sig(k) * randn(N,20) / factor;
    R = S + noise;

    Y = zeros(N,2);

    for i=1:N
        C_0 = conv(R(i,:), basis1);
        C_1 = conv(R(i,:), basis0);
        Y(i,1) = C_0(20);
        Y(i,2) = C_1(20);
    end

    H_hat = zeros(1,10000);

    for i=1:N
        min = 1;
        dist = (Y(i,1)-constel(1,1))^2 + (Y(i,2)-constel(1,2))^2;
        for j=1:8
            if dist > (Y(i,1)-constel(j,1))^2 + (Y(i,2)-constel(j,2))^2
                min = j;
                dist = (Y(i,1)-constel(j,1))^2 + (Y(i,2)-constel(j,2))^2;
            end
        end
        H_hat(i) = min;
    end

    error = H ~= H_hat;
    p_e(k) = mean(error);
end

plot(SNR_dB, log(p_e));
title('Error Probability as a Function of SNR');
xlabel('SNR (dB)');
ylabel('log(p_e)');



    
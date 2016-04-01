E = 1;
DPAM = 0.21963;
DQAM = sqrt(0.4);
M = 16;

% random PAM variable. 
sig = .1;
x_pts_PAM = -7.5*DPAM:DPAM:7.5*DPAM;

N = 10000;
H = ceil(16*rand(1, N));

V1 = (H - 8.5) * DPAM;
V2 = zeros(1, N);
Z = randn(1, N) * sig;
Y1 = V1 + Z;

%plot scatterplot. 
figure;
scatter(Y1, V2);
title('DAM Symbols');
xlabel('Y1');
ylabel('Y2');
%hold on;

decode = H;

%determine each decoded value using ML rule. 
for i = 1:N
    min = 1;
    dist = abs(Y1(i) - x_pts_PAM(1));
    for j = 2:M
        if abs(Y1(i) - x_pts_PAM(j)) < dist
            min = j;
            dist = abs(Y1(i) - x_pts_PAM(j));
        end
    end
    decode(i) = min;
end

%finding the probability of error. 
p_error = mean(decode ~= H);
PAM_msg = sprintf('The probability of error in PAM is %f', p_error);
disp(PAM_msg);


%random QAM variable. 
%since it doesn't actually matter too much, 
%we will use the same H vector. 

x_pts_QAM = -1.5*DQAM:DQAM:1.5*DQAM;
y_pts_QAM = x_pts_QAM;

V1_QAM = (mod(H - 1, 4) - 1.5) * DQAM;
V2_QAM = (floor((H - 1)/ 4) - 1.5) * DQAM;

Z1 = randn(1, N) * sig;
Z2 = randn(1, N) * sig;

Y1_QAM = V1_QAM + Z1;
Y2_QAM = V2_QAM + Z2;

figure;
scatter(Y2_QAM, Y1_QAM);
title('QAM Symbols');
xlabel('Y1');
ylabel('Y2');
%hold on; 

decode_QAM = H;

%determine each decoded value using ML rule. 
for i = 1:N
    min_x = 1;
    min_y = 1;
    dist = (Y1_QAM(i) - x_pts_QAM(1))^2 + (Y2_QAM(i) - y_pts_QAM(1))^2;
    for j = 1:4
        for k = 1:4
            if (Y1_QAM(i) - x_pts_QAM(j))^2 + (Y2_QAM(i) - y_pts_QAM(k))^2 < dist
                min_x = j;
                min_y = k;
                dist = (Y1_QAM(i) - x_pts_QAM(j))^2 + (Y2_QAM(i) - y_pts_QAM(k))^2;
            end
        end
    end
    decode_QAM(i) = 4*(min_y-1) + min_x;
end

%finding the probability of error. 
p_error_QAM = mean(decode_QAM ~= H);
QAM_msg = sprintf('The probability of error in QAM is %f', p_error_QAM);
disp(QAM_msg);

%random PSK variable. 
angles = 0:2*pi/M:(M-1)*2*pi/M;
x_pts_PSK = sqrt(E) * cos(angles);
y_pts_PSK = sqrt(E) * sin(angles);

V1_PSK = sqrt(E) * cos((H-1) * 2*pi / M);
V2_PSK = sqrt(E) * sin((H-1) * 2*pi / M);

Z1 = randn(1, N) * sig;
Z2 = randn(1, N) * sig;

Y1_PSK = V1_PSK + Z1;
Y2_PSK = V2_PSK + Z2;

figure; 
scatter(Y2_PSK, Y1_PSK);
title('PSK Symbols');
xlabel('Y1');
ylabel('Y2');

decode_PSK = H;

%determine each decoded value using ML rule. 
for i = 1:N
    min = 1;
    dist = (Y1_PSK(i) - x_pts_PSK(1))^2 + (Y2_PSK(i) - y_pts_PSK(1))^2;
    for j = 1:M
        if (Y1_PSK(i) - x_pts_PSK(j))^2 + (Y2_PSK(i) - y_pts_PSK(j))^2 < dist
            min = j;
            dist = (Y1_PSK(i) - x_pts_PSK(j))^2 + (Y2_PSK(i) - y_pts_PSK(j))^2;
        end
    end
    decode_PSK(i) = min;
end

%finding the probability of error. 
p_error = mean(decode_PSK ~= H);
PSK_msg = sprintf('The probability of error in PSK is %f', p_error);
disp(PSK_msg);
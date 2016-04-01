% Project Part 4
% part a: alpha = 0.5
step = 0.1;
alpha = 0.5;
n_samples = 10000;
x = Laplacian_distribution(alpha, n_samples);
s = -15:step:15;

%getting and plotting pdf. 
y = hist(x, s);
laplace_pdf = y / n_samples / step;
ideal = alpha/2 * exp(-alpha*abs(s));
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';

figure;
plot(s,laplace_pdf);
hold on;
plot(s, ideal);
title(sprintf('Laplacian pdf of alpha = %0.1f', alpha));
xlabel('x');
ylabel('f_X(x)');
legend(exp_label, ideal_label);

%getting and plotting cdf. 
size_s = size(s, 2);
laplace_cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    laplace_cdf(i) = sum(laplace_pdf(1:i)) * step;
end
figure;
plot(s, laplace_cdf);
title(sprintf('Laplacian cdf of alpha = %0.1f', alpha));
xlabel('x');
ylabel('F_X(x)');

%alpha = 2.
step = 0.1;
alpha = 2;
n_samples = 10000;
x = Laplacian_distribution(alpha, n_samples);
s = -4:step:4;

%getting and plotting pdf. 
y = hist(x, s);
laplace_pdf = y / n_samples / step;
ideal = alpha/2 * exp(-alpha*abs(s));
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';

figure;
plot(s,laplace_pdf);
hold on;
plot(s, ideal);
title(sprintf('Laplacian pdf of alpha = %0.1f', alpha));
xlabel('x');
ylabel('f_X(x)');
legend(exp_label, ideal_label);

%getting and plotting cdf. 
size_s = size(s, 2);
laplace_cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    laplace_cdf(i) = sum(laplace_pdf(1:i)) * step;
end
figure;
plot(s, laplace_cdf);
title(sprintf('Laplacian cdf of alpha = %0.1f', alpha));
xlabel('x');
ylabel('F_X(x)');

%part b: generate the empirical transmission values.
alpha = sqrt(2);
n_samples = 10000;
s = -8:step:8;

%generate the signal. 
X = 4 * floor(0.5 + rand(1, n_samples)) - 2; %signal
N = Laplacian_distribution(alpha, n_samples); %noise
Y = X + N; %recieved signal

y = hist(Y, s);
received_pdf = y / n_samples / step;
figure;
plot(s, received_pdf);
title('pdf received signal');
xlabel('x');
ylabel('f_X(x)');

%emperically compute the error probability: 
incorrectly_left = 0;
incorrectly_right = 0;
for i = 1:n_samples
    if ( X(i) > 0 && N(i) < -2 )
        incorrectly_left = incorrectly_left + 1;
    end
    if ( X(i) < 0 && N(i) > 2 )
        incorrectly_right = incorrectly_right + 1;
    end
end
n_errors = incorrectly_left + incorrectly_right;
p_errors = n_errors / n_samples;
err_msg = sprintf('The probability of error is %f', p_errors);
disp(err_msg);


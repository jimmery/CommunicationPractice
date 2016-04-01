%generation of Gaussian
step = 0.1;
n_samples = 1e7; %input value for t here.
x = randn(1,n_samples);
s = -4:step:4;

%determine mean and variance.
exp_mean = sprintf('The mean is %f', mean(x));
exp_vari = sprintf('The variance is %f', var(x));
disp(exp_mean);
disp(exp_vari);

%create the plot of the pdf
y = hist(x,s);
normal_pdf = y / n_samples / step;
figure;
plot(s, normal_pdf);
exp_label = 'experimental pdf';
hold on
ideal_pdf = exp(-s.^2/2)/sqrt(2*pi);
ideal_label = 'ideal pdf';
plot(s, ideal_pdf);
title('normal pdf');
xlabel('x');
ylabel('f_X(x)');
legend(exp_label, ideal_label);

%create the plot of the cdf
size_s = size(s, 2);
normal_cdf = zeros(1, size_s);
for i = 1:size_s
    normal_cdf(i) = sum(normal_pdf(1:i)) * step;
end
figure;
plot(s, normal_cdf);
title('normal cdf');
xlabel('x');
ylabel('F_X(x)');

%determine the fraction of values exceeding 1, 2, 3.
q1 = 1 - normal_cdf(5/step + 1);
q2 = 1 - normal_cdf(6/step + 1);
q3 = 1 - normal_cdf(7/step + 1);

msg1 = sprintf('The fraction of values exceeding 1 is %f', q1);
msg2 = sprintf('The fraction of values exceeding 2 is %f', q2);
msg3 = sprintf('The fraction of values exceeding 3 is %f', q3);
disp(msg1);
disp(msg2);
disp(msg3);

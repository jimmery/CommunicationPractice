step = 0.1;
n_repeats = 10000;

n = 1; % TODO change to check n
s = 1:step:6; % TODO change to fit values.
s_n = zeros(1, n_repeats);
for i = 1:n_repeats
    x = 1 + 5*rand(1, n); %uniform random var (1,6)
    s_n(i) = sum(x); %an instance of s_n
end

y = hist(s_n, s);
pdf = y / n_repeats / step;
mean = n*7/2;
var = n*25/12;
ideal = exp(-(s-mean).^2/(2*var))/(sqrt(2*pi*var));
figure;
plot(s,pdf);
hold on
plot(s,ideal);
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';
title(sprintf('pdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('f_S_n(x)');
legend(exp_label, ideal_label);

%create the plot of the cdf
size_s = size(s, 2);
cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    cdf(i) = sum(pdf(1:i)) * step;
    ideal_cdf(i) = sum(ideal(1:i)) * step;
end
figure;
plot(s, cdf);
hold on
plot(s, ideal_cdf);
exp_label = 'experimental cdf';
ideal_label = 'ideal cdf';
title(sprintf('cdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('F_S_n(x)');
legend(exp_label, ideal_label);

n = 5;
s = 5:step:30;
s_n = zeros(1, n_repeats);
for i = 1:n_repeats
    x = 1 + 5*rand(1, n); %uniform random var (1,6)
    s_n(i) = sum(x); %an instance of s_n
end

y = hist(s_n, s);
pdf = y / n_repeats / step;
mean = n*7/2;
var = n*25/12;
ideal = exp(-(s-mean).^2/(2*var))/(sqrt(2*pi*var));
figure;
plot(s,pdf);
hold on
plot(s,ideal);
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';
title(sprintf('pdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('f_S_n(x)');
legend(exp_label, ideal_label);

%create the plot of the cdf
size_s = size(s, 2);
cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    cdf(i) = sum(pdf(1:i)) * step;
    ideal_cdf(i) = sum(ideal(1:i)) * step;
end
figure;
plot(s, cdf);
hold on
plot(s, ideal_cdf);
exp_label = 'experimental cdf';
ideal_label = 'ideal cdf';
title(sprintf('cdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('F_S_n(x)');
legend(exp_label, ideal_label);

n = 10;
s = 20:step:50;
s_n = zeros(1, n_repeats);
for i = 1:n_repeats
    x = 1 + 5*rand(1, n); %uniform random var (1,6)
    s_n(i) = sum(x); %an instance of s_n
end

y = hist(s_n, s);
pdf = y / n_repeats / step;
mean = n*7/2;
var = n*25/12;
ideal = exp(-(s-mean).^2/(2*var))/(sqrt(2*pi*var));
figure;
plot(s,pdf);
hold on
plot(s,ideal);
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';
title(sprintf('pdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('f_S_n(x)');
legend(exp_label, ideal_label);

%create the plot of the cdf
size_s = size(s, 2);
cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    cdf(i) = sum(pdf(1:i)) * step;
    ideal_cdf(i) = sum(ideal(1:i)) * step;
end
figure;
plot(s, cdf);
hold on
plot(s, ideal_cdf);
exp_label = 'experimental cdf';
ideal_label = 'ideal cdf';
title(sprintf('cdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('F_S_n(x)');
legend(exp_label, ideal_label);

n = 50;
s = 125:step:225;
s_n = zeros(1, n_repeats);
for i = 1:n_repeats
    x = 1 + 5*rand(1, n); %uniform random var (1,6)
    s_n(i) = sum(x); %an instance of s_n
end

y = hist(s_n, s);
pdf = y / n_repeats / step;
mean = n*7/2;
var = n*25/12;
ideal = exp(-(s-mean).^2/(2*var))/(sqrt(2*pi*var));
figure;
plot(s,pdf);
hold on
plot(s,ideal);
exp_label = 'experimental pdf';
ideal_label = 'ideal pdf';
title(sprintf('pdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('f_S_n(x)');
legend(exp_label, ideal_label);

%create the plot of the cdf
size_s = size(s, 2);
cdf = zeros(1, size_s);
ideal_cdf = zeros(1, size_s);
for i = 1:size_s
    cdf(i) = sum(pdf(1:i)) * step;
    ideal_cdf(i) = sum(ideal(1:i)) * step;
end
figure;
plot(s, cdf);
hold on
plot(s, ideal_cdf);
exp_label = 'experimental cdf';
ideal_label = 'ideal cdf';
title(sprintf('cdf of sum of n = %d u.d. r.v.', n));
xlabel('x');
ylabel('F_S_n(x)');
legend(exp_label, ideal_label);

%generation of a discrete Bernoulli trial

%generation of a binomial random distribution
step = 1;
prob = 0.2;
n_samples = 100;
n_trials = 10000;
binom = binom_rv(n_samples, prob, n_trials);
s = 0:step:40;

y = hist(binom, s);

density = y / n_trials / step;
plot(s,density);
title('binomial pmf');
xlabel('x');
ylabel('f_X(x)');

%finding the k of maximum probability.
% = find the k of the maximum value. 
[k,ki] = max(y);
disp_msg = sprintf('The k with maximum probability is %d', ki);
disp(disp_msg);
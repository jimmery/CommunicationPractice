function X = Laplacian_distribution(alpha, n_trials)
X = zeros(1, n_trials);
uniform = rand(1,n_trials);

%the cdf of a laplacian is: 
% 1/2 exp(ax) for x < 0. 1 - 1/2 exp(-ax) for x > 0. 
% note that when x = 0, cdf = 1/2.

for i = 1:n_trials
    if ( uniform(i) <= 0.5 )
        X(i) = log(2*uniform(i))/alpha;
    else
        X(i) = -log(2*(1-uniform(i)))/alpha;
    end
end
end
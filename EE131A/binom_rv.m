function s = binom_rv(n, p, k)
s = zeros(1, k);
for i = 1:k
    s(i) = sum(floor(p + rand(1,n)));
end
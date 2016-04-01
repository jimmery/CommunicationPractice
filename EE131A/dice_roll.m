function rolls = dice_roll(n_rolls, n_times)
rolls = zeros(1, n_times);
for i = 1:n_times
    rolls(i) = sum(floor(1 + 6 * rand(1, n_rolls)));
end
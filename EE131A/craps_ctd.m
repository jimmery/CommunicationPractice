function win = craps_ctd(target, n_repeats)
win = 0;
for i = 1:n_repeats
    roll = dice_roll(2, 1);
    while (roll ~= target) && (roll ~= 7)
        roll = dice_roll(2,1);
    end
    if roll == target
        win = win + 1;
    end
end

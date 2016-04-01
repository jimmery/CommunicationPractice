function win = craps(n_repeats)
%result = zero(1,n_repeats);
win = 0;
for i = 1:n_repeats
    roll = dice_roll(2, 1);
    if (roll == 7) || (roll == 11)
        %disp('You win!');
        win = win + 1;
    elseif (roll == 2) || (roll == 3) || (roll == 12)
        %disp('You lose!');
    else
        target = roll;
        result = craps_ctd(target, 1);
        win = win + result;
    end
end
end
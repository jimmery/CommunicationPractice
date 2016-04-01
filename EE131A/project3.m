
% generate the probabiltiy of winning the first time 
n_times = 10000;
rolls = dice_roll(2, n_times);
win_round_1 = (sum(rolls == 7) + sum(rolls == 11)) / n_times;
prob_win_1 = sprintf('The prob. of winning round 1 is %f', win_round_1);
disp(prob_win_1);

% generate the probability of winning given first roll is 5.
prob_win_5 = craps_ctd(5, n_times) / n_times;
win_5_msg = sprintf('The winning prob. w/ 1st roll 5 is %f', prob_win_5);
disp(win_5_msg);

%generate the probability of winning the game of craps. 
prob_win = craps(n_times) / n_times;
win_msg = sprintf('The probability of winning is %f', prob_win);
disp(win_msg);
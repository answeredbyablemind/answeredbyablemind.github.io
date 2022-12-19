clear;
rng(1); % for reproducibility
is_male = false(1, 100);
ismale(rand(1, 100) > 0.5) = true;
age = clip(round(randn(1,100)) + 20, 20, inf);
temp = clip(...
    round(mvnrnd([0; 0], [2, 1; 1,2], 100) * 10) + [50, 70]...
    , 0, 100);
score_english = temp(:,1)';
score_math = temp(:, 2)'; 
clear temp
is_football_lover = false(1, 100);
is_football_lover(rand(1, 100) > 0.5) = true;
is_chicken_lover = false(1, 100);
is_chicken_lover(rand(1, 100) > 0.5) = true;

save('logical_data_example.mat')

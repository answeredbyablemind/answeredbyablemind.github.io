data = [4.6, 4.6, 4.3, 4.3;
    4.7, 5.0, 4.4, 4.4;
    4.7, 5.2, 4.9, 4.5;
    4.9, 5.2, 4.9, 4.9;
    5.1, 5.5, 5.1, 4.9;
    5.3, 5.5, 5.3, 5.0;
    5.4, 5.6, 5.6, 5.6];

%% 데이터의 description

g = repmat([1,2,3,4], 7,1);
boxplot(data(:), g(:))
anova1(data(:), g(:))

%%

m = size(data,2);
n = size(data,1);
gm = mean(data(:));
tr_mean = mean(data,1);

SS_wit = 0;

for i_tr = 1:m
    SS_wit = SS_wit + sum((data(:,i_tr)-mean(data(:,i_tr))).^2);
end
DF_wit = m * (n - 1);
MS_wit = SS_wit / DF_wit;

SS_bet = n * sum((tr_mean-gm).^2);
DF_bet = m-1;
MS_bet = SS_bet / DF_bet;

SS_tot = sum(sum((data- gm).^2));

%%

F = MS_bet / MS_wit;
F_crit = finv(0.975, DF_bet, DF_wit)

fcdf(F, DF_bet, DF_wit,'upper')

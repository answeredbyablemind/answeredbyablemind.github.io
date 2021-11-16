clear; close all; clc;

data = [45,50,55
    42,42,45
    36,41,43
    39,35,40
    51,55,59
    44,49,56];

[n, m] = size(data);
grp = repmat([1,2,3], n, 1);

boxplot(data(:), grp(:));
set(gca,'xtick',1:3);
set(gca,'xticklabel', {'Time 1','Time 2','Time 3'})
grid off;
set(gca,'fontsize',12);
set(gca,'fontname','나눔고딕')

%% X_1, X_2, X_3 계산

T_bar = mean(data);

%% S_1, S_2, S_3 계산

S_bar = mean(data,2);

%% Grandmean

mn = mean(data(:));

%%

DF_between_subjects = n-1;
SS_between_subjects = m * sum((S_bar - mn).^2);
MS_between_subjects = SS_between_subjects / DF_between_subjects;

%%

DF_wit_subj = n * (m-1);
SS_wit_subj = sum(sum((data-S_bar).^2));
MS_wit_subj = SS_wit_subj / DF_wit_subj;

%%

DF_treat = m-1;
SS_treat = n * sum((T_bar - mn).^2);
MS_treat = SS_treat / DF_treat;

%%

DF_res = (n-1) * (m-1);
SS_res = SS_wit_subj - SS_treat;
MS_res = SS_res / DF_res;

%%

F = MS_treat / MS_res
p = 1-fcdf(F, DF_treat, DF_res)

finv(0.95, DF_treat, DF_res)

%% Greenhouse Geisser epsilon 계산하기


s = cov(data);

num = m^2 * (mean(diag(s)) - mean(s(:)))^2;
den = (m-1) * (sum(sum(s.^2)) - 2 * m * sum(mean(s,2).* mean(s,2)) + m^2 * mean(s(:))^2);
epsilon_GG = num/den

%% Huynh-Feldt epsilon

epsilon_HF = (n*(m-1) *epsilon_GG - 2) / ((m-1) *((n-1) - (m-1) * epsilon_GG))

%% lower bound

epsilon_LB = 1/(m-1);


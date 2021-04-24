clear; close all; clc;

%% 이항 분포 그리기

n = 10;
p = 0.5;
x = 0:n;

f = @(x, n, p) factorial(n)./(factorial(x).*factorial(n-x)) .* p.^x .* (1-p).^(n-x);

my_color = lines(3);
stem(x, f(x, n, p), 'o' ,'markerfacecolor',my_color(1,:),'linewidth',2);
xlabel('성공 횟수(k)');
ylabel('probability, Pr(K=k)');
grid on;
title(['binomial distribution PMF',' / n: ',num2str(n),', p: ',num2str(p)]);

%% 이항 분포 시뮬레이션

n_sim = 10^4;
% n_sim = 1000;
res_sim = zeros(1, n_sim);

for i_sim = 1:n_sim
    count = 0;
    for i = 1:n
        if rand(1) < p
            count = count + 1;
        end
    end
    res_sim(i_sim) = count;
end

figure; histogram(res_sim,'Normalization','pdf');
hold on;
stem(x, f(x, n, p), 'o' ,'markerfacecolor',my_color(1,:));

%% simulation + discrete histogram으로 ...
figure;
hold on;
count = zeros(1, 11);
stem(x, f(x, n, p) * n_sim, 'o' ,'markerfacecolor',my_color(1,:),'linewidth',2);

for i_data = 1:length(res_sim)
    count(res_sim(i_data)+1) = count(res_sim(i_data)+1) + 1;
    
    plot(res_sim(i_data), count(res_sim(i_data)+1),'o','markerfacecolor',0.8 * ones(1,3),'markeredgecolor','k');
%     pause(0.1);
end






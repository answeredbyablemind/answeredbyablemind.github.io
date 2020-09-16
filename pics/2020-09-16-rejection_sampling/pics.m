clear; close all; clc;

rng(1)
n = 50000;
xx = linspace(-10,20, 1000);

% target distribution
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);

%% plotting target distribution
figure('color','w');
plot(xx, target(xx),'linewidth',2);

xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x)$$','interpreter','latex');
grid on;

title('$$f(x) = 0.3 e^{-0.2x^2} + 0.7 e^{-0.2(x-10)^2}$$','interpreter','latex');

%% target distribution and proposal distribution

proposal = @(x) double((x>=-7) & (x<17)) / 24;

figure('color','w');
h1 = plot(xx, target(xx),'linewidth',2);
hold on;
h2 = plot(xx, proposal(xx),'linewidth',2);

xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x), g(x)$$','interpreter','latex');
grid on;

legend([h1, h2], 'target','proposal');
title('타겟 분포와 제안 분포');

set(gca,'ytick',sort([0:0.1:8, 1/24]))
set(gca,'xtick',sort([-10:5:20, -7, 17]))

%% target distribution and proposal distribution

proposal = @(x) double((x>=-7) & (x<17)) / 24;

figure('color','w');
h1 = plot(xx, target(xx),'linewidth',2);
hold on;
h2 = plot(xx, proposal(xx) *24 * 0.7,'linewidth',2);

xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x), Mg(x)$$','interpreter','latex');
grid on;

legend([h1, h2], 'target','proposal x 상수','location','best');
title('타겟 분포와 제안 분포의 상수배');

% set(gca,'ytick',sort([0:0.1:8, 0.04]))
set(gca,'xtick',sort([-10:5:20, -7, 17]))

%% uniform을 이용하여 rejection sampling
% 성능에 크게 차이는 없으나 reject되는 sample 수가 조금 차이가 있음.

pseudo_dist2 = @(x) (x>=-10 * x<20) / 30;

figure;
plot(xx, target(xx));
hold on;
plot(xx, pseudo_dist2(xx)*21); % 21은 30 * 0.7을 얘기함. 30은 출력값이 1인 x의 범주, 0.7은 target의 최고 높이.

x_q = (rand(1, n) - 0.5) * 30 + 5; % 10에서 20사이의 uniform distribution

crits = target(x_q) ./ (pseudo_dist2(x_q) * 21);
coins = rand(1, length(crits));

x_p_uniform = x_q(coins<crits);

figure; h = histogram(x_p_uniform,'BinWidth',0.5, 'Normalization','probability');
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))



%% normal distribution을 이용하여 rejection sampling
pseudo_dist = @(x, mu, sigma) 1/(sigma*sqrt(2*pi)) * exp(-((x-mu).^2)/(2*sigma^2));


figure; 
plot(xx, target(xx))
hold on;
plot(xx, 20 * pseudo_dist(xx, 6.5, 4.5))

x_q = randn(1, n) * 4.5 + 6.5; 

crits = target(x_q) ./ (pseudo_dist(x_q, 6.5, 4.5) * 20);
coins = rand(1, length(crits));

x_p_normal = x_q(coins<crits);
figure; h = histogram(x_p_normal,'BinWidth',0.5, 'Normalization','probability');
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values))

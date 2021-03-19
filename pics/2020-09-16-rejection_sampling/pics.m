clear; close all; clc;
%% inverse CDF
rng(1)
addpath('D:\angeloyeo.github.io\pics\')
x = linspace(-3,3,100);
p = normcdf(x);

plot(x,p)
n = 15;
yy = linspace(eps, 1-eps, n);
xx = norminv(yy);
xx(xx < -3) = -3;
xx(xx > 3 ) = 3;

for i = 1:n
    mArrow2(xx(i),normcdf(xx(i)), xx(i),-0.1,{'color','r'})
    mArrow2(-3,normcdf(xx(i)), xx(i),normcdf(xx(i)),{'color','r'})
%     line([xx(i), xx(i)], [0, normcdf(xx(i))],'color','r','linestyle','--');
%     line([-3, xx(i)], [normcdf(xx(i)), normcdf(xx(i))],'color','r','linestyle','--')
end

xlim([-3.1, 3.1])
ylim([-0.1, 1.1])
xlabel('x');
ylabel('F(x)');

figure;
histogram(xx,7)
xlabel('x');
ylabel('frequency')
%%
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
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values),'linewidth',3,'color','r')

xlabel('$$x$$','interpreter','latex');
grid on;
%% accept된 경우들과 기각된 경우들을 plot

accepted = coins<crits;

x_accepted = x_q(accepted);
y_accepted = coins(accepted);

x_rejected = x_q(~accepted);
y_rejected = coins(~accepted);

figure;
idx = randperm(length(x_accepted), 500);
h1 = plot(x_accepted(idx), y_accepted(idx),'o','markerfacecolor',lines(1),'markeredgecolor','none');
hold on;
idx = randperm(length(x_rejected), 500);
h2 = plot(x_rejected(idx), y_rejected(idx),'o','markerfacecolor',[0.85, 0.325, 0.098],'markeredgecolor','none');

legend([h1, h2], 'accepted','rejected');



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

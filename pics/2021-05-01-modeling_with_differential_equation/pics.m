clear; close all; clc;

%% logistic growth

N = 1000;
C = 9;
k = 0.3;
t = linspace(0, 40, 100);

P = N./(C*exp(-k*t)+1);

figure;
plot(t, P,'linewidth',2)
ylim([0, 1200])
grid on;

xlabel('time');
ylabel('인구 수');
title('$$P(t)=1000/({9e^{-0.3*t}+1})$$','interpreter','latex')
set(gca,'fontname','나눔고딕')
set(gca,'fontsize',10)

%%

xx = linspace(0, 1, 10);
figure;
plot(xx, 0.1*xx,'k','linewidth',2);
xlabel('변형된 길이, x (m)');
ylabel('탄성력, F (N)')
grid on;
title('탄성력과 변형된 용수철 길이의 관계')
set(gca,'fontname','나눔고딕')


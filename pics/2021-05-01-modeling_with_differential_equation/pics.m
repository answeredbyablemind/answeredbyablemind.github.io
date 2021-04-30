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
ylabel('ÀÎ±¸ ¼ö');
title('$$P(t)=1000/({9e^{-0.3*t}+1})$$','interpreter','latex')
set(gca,'fontname','³ª´®°íµñ')
set(gca,'fontsize',10)
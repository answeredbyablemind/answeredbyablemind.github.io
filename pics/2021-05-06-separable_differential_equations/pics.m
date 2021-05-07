clear; close all; clc;

xx = linspace(0, 500, 100);
yy = 80*exp(-0.0253*xx)+20;

plot(xx, yy,'linewidth',2)
ylim([0, 120])
grid on;
xlabel('시간 (s)');
ylabel('온도 (''C)');
title('$$y=80e^{-0.0253x}+20$$','interpreter','latex')

%%
xx = linspace(0, 1000, 100);

yy = 500 - 500 * exp(-0.01*xx);
figure;
plot(xx, yy,'linewidth',2)
ylim([0, 600])
grid on;
xlabel('시간 (s)');
ylabel('소금의 양 (kg)');
title('$$x(t)=500-500e^{-0.01t}$$','interpreter','latex')


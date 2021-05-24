clear; close all; clc;

xx = linspace(0, 500, 1000);
C = -0.5*500^10;
yy = 0.5*(500+xx)+C./((500+xx).^9);

figure;
plot(xx, yy,'linewidth',2);
xlabel('시간 (분)');
ylabel('소금의 양 (kg)');
title('$$x(t) = \frac{1}{2}(500+t)-0.5\frac{500^{10}}{(500+t)^9}$$','interpreter','latex')
grid on;
clear; close all; clc;

dydx = @(x,y) x;

fun_dirfield(dydx, -2:0.4:2, -4:0.4:4)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=x$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680, 343, 565, 635])
xx = linspace(-2, 2, 100);
yy = 1/2 * xx.^2;
hold on;
plot(xx, yy,'k','linewidth',2)
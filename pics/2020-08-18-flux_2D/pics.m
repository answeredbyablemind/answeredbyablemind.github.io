clear; close all; clc;

%% pic1 등에 사용된 벡터장
[x,y]=meshgrid(linspace(-2, 2, 15), linspace(-2, 2, 15));
u =x.^2;
v = y;
quiver(x, y, u, v)
grid on;
title('Vector Field: $$F(x,y) = x^2\hat{i}+y\hat{j}$$','interpreter','latex')

%% pic 6에 사용되는 벡터장

[x,y]=meshgrid(linspace(-1, 3, 10), linspace(-1, 4, 10));
u =2*ones(size(x));
v = zeros(size(y));
figure('position',[488, 250, 668, 508]);
quiver(x, y, u, v, 0.4)
grid on;
title('Vector Field: $$F(x,y) = 2\hat{i}$$','interpreter','latex')

line([3, 0], [0, 3], 'color','k','linestyle','-','linewidth',2)
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
set(gca,'fontsize',12)
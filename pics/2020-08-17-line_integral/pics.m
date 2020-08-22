clear; close all; clc;

figure('color','w')
line([2, 2], [0, 1], 'linestyle','--')
line([0, 2], [1, 1],'linestyle','--')
plotXY(-0.5, 2.5, -0.5, 1.5, false, 15)
hold on;
plot([0, 2], [0, 1],'color','k','linewidth',2)

[x, y] = meshgrid(linspace(-0.5, 2.5, 10), linspace(-0.5, 1.2, 10));
u = x.*y;
v = -y.^2;
quiver(x, y, u, v)
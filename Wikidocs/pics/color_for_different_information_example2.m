clear; close all; clc;

[x, y] = meshgrid(linspace(-2, 2, 20));
z = x + y;

figure('position', [228, 380, 1650, 420])

subplot(1, 3, 1);
h1 = surf(x, y, z);
h1.CData = x;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');

subplot(1, 3, 2);
h2 = surf(x, y, z);
h2.CData = y;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');

subplot(1, 3, 3);
h3 = surf(x, y, z);
h3.CData = z;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
exportgraphics(gcf, 'color_for_different_information_example2.png')

clear; close all; clc;

xx = linspace(-3,3,100);

p1 = [-2, 1.5, 1];
p2 = [3, -2, -5];
yy1 = polyval(poly(p1), xx);
yy2 = polyval(poly(p2), xx);

my_color = lines(3);
%% 표시할 부분 선정

highlight = 65:70;

figure;
plot(xx, yy1, 'color',my_color(1,:),'linewidth',3);
hold on;
plot(xx(highlight), yy1(highlight),'color','r','linewidth',5)
set(gca,'visible','off')
figure;
plot(xx, yy2, 'color',my_color(3,:),'linewidth',3);
hold on;
plot(xx(highlight), yy2(highlight),'color','r','linewidth',5)
set(gca,'visible','off')
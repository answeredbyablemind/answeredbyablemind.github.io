clear; close all; clc;

xx = linspace(-3,3,100);
yy = (xx+2).*(xx-1.5).*(xx-1);
plot(xx,yy,'linewidth',8);
set(gca,'visible','off')

%%

yy2 = -(xx+3).*(xx-2).*(xx-5);
figure;
plot(xx, yy2,'linewidth',8,'color',[0.85, 0.325, 0.098])
set(gca,'visible','off')


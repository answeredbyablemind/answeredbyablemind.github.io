clear; close all; clc;

fs = 1000;
t = -5:1/fs:5;

f1 = 1.6;
f2 = 0.5;
sigma = 1.1;

figure;
subplot(2,1,1);
plot(t, cos(2*pi*f1*t-0.1),'color',[50, 168, 82]/255,'linewidth',2)
hold on;
plot(t, 1.5 * cos(2*pi*f2*t),'color','r','linewidth',2)
ylim([-2, 2])
xlabel('t');
ylabel('Fourier basis');

subplot(2,1,2);
plot(t, exp(sigma*t/20) .* cos(2*pi*f1*t-0.1),'color',[50, 168, 82]/255,'linewidth',2)
ylim([-2, 2])
hold on;
plot(t, exp(sigma*t/10) .* cos(2*pi*f2*t),'color','r','linewidth',2)
ylim([-2, 2])
xlabel('t');
ylabel('Laplace basis');

%%

plotXY(-2.5, 2.5, -2.5, 2.5)
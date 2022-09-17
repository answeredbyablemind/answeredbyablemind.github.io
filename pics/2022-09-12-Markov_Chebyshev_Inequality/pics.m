clear; close all; clc;

my_norm = @(X, mu, sigma) 1/(sigma*sqrt(2*pi)) * exp(-(X-mu).^2)/(2*sigma^2);

x = linspace(0,6,100);
y = my_norm(x, 3, 4);

figure;
plot(x, y,'color','k','linewidth',2)
hold on;
area(x(70:end), y(70:end),'facecolor',lines(1),'edgecolor','none')
set(gca,'visible','off')
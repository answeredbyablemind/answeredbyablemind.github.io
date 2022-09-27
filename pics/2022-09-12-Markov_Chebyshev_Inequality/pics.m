clear; close all; clc;


%% pic1
my_norm = @(X, mu, sigma) 1/(sigma*sqrt(2*pi)) * exp(-(X-mu).^2)/(2*sigma^2);

x = linspace(0,6,100);
y = my_norm(x, 3, 4);

figure;
plot(x, y,'color','k','linewidth',2)
hold on;
area(x(70:end), y(70:end),'facecolor',lines(1),'edgecolor','none')
set(gca,'visible','off')

%% pic2
x = linspace(-1,7,100);
y1 = my_norm(x, 2.8, 6.8);
y2 = my_norm(x, 5, 7);
y = y1+y2;



figure;
plot(x, y,'color','k','linewidth',2)
hold on;

area(x(1:45), y(1:45),'facecolor',lines(1),'edgecolor','none')
area(x(80:end), y(80:end),'facecolor',lines(1),'edgecolor','none')
set(gca,'visible','off')

line(sum(x.*y)/sum(y) * ones(1,2), ylim)
clear; close all; clc;

addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
addpath('C:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

%% 원 위의 2pi/8 만큼 CW 회전한 곳의 점 

figure('color','w','position',[680, 317, 500, 413]);
hold on;
set(gca,'Visible','off')
xlim([-1.5, 1.5])
ylim([-1.5, 1.5])

Annotate(gca,'arrow', [-1.5, 1.5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1.5, 1.5]);

theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta),'k');
plot(cos(-2*pi/8), sin(-2*pi/8),'o','markerfacecolor','k','markeredgecolor','none');
plot([0, cos(-2*pi/8)], [0, sin(-2*pi/8)],'k','linewidth',2)

axis square

theta = linspace(-2*pi/8, 0, 20);
plot(0.3 * cos(theta), 0.3 * sin(theta),'k');

for i = [0, 2:7]
    plot(cos(-2*pi/8 * i), sin(-2*pi/8 * i),'r*','markersize',8);
end


%% cosine
fs = 500;
t = 0:1/fs:1;

for i = 0:7
    x = cos(2*pi*i*t);
    t2 = 0:1/8:1;
    t2(end) = [];
    x2 = cos(2*pi*i*t2);
    
    figure('position', [680, 871, 250, 50])
    plot(t,x,'color',lines(1), 'linewidth',2);
    hold on;
    plot(t2, x2 ,'o','markerfacecolor','r','markeredgecolor','none');
    set(gca,'visible','off')
    line([0, 1], [0, 0],'color','k','linewidth',2)
end

for i = 1:8
    figure(8-i+1);
end

%% sine
close all
fs = 500;
t = 0:1/fs:1;

for i = 0:7
    x = sin(2*pi*i*t);
    t2 = 0:1/8:1;
    t2(end) = [];
    x2 = sin(2*pi*i*t2);
    
    figure('position', [680, 871, 250, 50])
    plot(t,x,'color',lines(1), 'linewidth',2);
    hold on;
    plot(t2, x2 ,'o','markerfacecolor','r','markeredgecolor','none');
    set(gca,'visible','off')
    line([0, 1], [0, 0],'color','k','linewidth',2)
end

for i = 1:8
    figure(8-i+1);
end

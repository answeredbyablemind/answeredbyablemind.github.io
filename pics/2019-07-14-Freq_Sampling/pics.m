clear; close all; clc;

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

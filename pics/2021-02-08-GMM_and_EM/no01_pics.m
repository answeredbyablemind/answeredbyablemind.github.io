clear; close all; clc;
my_color = lines(2);

%% MLE와 비교 설명

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',my_color(1,:),'markeredgecolor', 'k','markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

data = [-1,1,4,6,9]+20;
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',my_color(2,:),'markeredgecolor', 'k','markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

xlim([-2, 32])

%% MLE와 비교 설명

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',my_color(1,:),'markeredgecolor', 'k','markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

pd = fitdist(data', 'Normal');
xx = linspace(-3, 13, 100);
yy = pdf(pd,xx);
plot(xx, yy,'linewidth',3,'color',my_color(1,:))

data = [-1,1,4,6,9]+20;
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',my_color(2,:),'markeredgecolor', 'k','markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

pd2 = fitdist(data', 'Normal');
xx2 = linspace(12, 32, 100);
yy2 = pdf(pd2,xx2);
plot(xx2, yy2,'linewidth',3,'color',my_color(2,:))
xlim([-2, 32])


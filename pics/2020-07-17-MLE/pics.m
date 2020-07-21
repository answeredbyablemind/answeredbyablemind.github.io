clear; close all; clc;

%% Fig 1. Example of MLE 1

figure('color','w','position',[680, 588, 700, 400]);
line([-5, 20],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-5,0,20,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(20, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

pd = fitdist(data', 'Normal');
xx = linspace(-3, 13, 100);
yy = pdf(pd,xx);
plot(xx, yy,'linewidth',3)

pd2 = fitdist(data'+5, 'Normal');
xx2 = linspace(-3+5, 13+5, 100);
yy2 = pdf(pd2,xx2);
plot(xx2, yy2,'linewidth',3,'color',lines(1))

saveas(gcf,'pic1.png')


%% Fig 2. Example of MLE 1 --> Likelihood

figure('color','w','position',[680, 588, 700, 400]);

line([-5, 15],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-5,0,15,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(20, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

pd = fitdist(data', 'Normal');
xx = linspace(-3, 13, 100);
yy = pdf(pd,xx);
plot(xx, yy,'linewidth',3,'color',[0.85, 0.32, 0.098])

for i = 1:length(data)
    line([data(i) data(i)], [0, pdf(pd, data(i))], 'linestyle','--','color','k')
end

plot(data, zeros(1,5), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)


saveas(gcf,'pic2.png')

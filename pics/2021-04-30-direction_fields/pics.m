clear; close all; clc;

%% dydx = x+y
dydx = @(x,y) x;
fun_dirfield(dydx, -4:0.4:4, -3:0.4:3)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=x$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])

ylim([-3, 3])

%%
dydx = @(x,y) x;
fun_dirfield(dydx, -4:0.4:4, -3:0.4:3)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=x$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])
xx = linspace(-4, 4, 100);

yy = 1/2 * xx.^2;
hold on;

plot(xx, yy,'linewidth',2,'color',[0.494, 0.184, 0.556])


ylim([-3, 3])

%% ±×¸² 2

fun_dirfield(dydx, -4:0.4:4, -3:0.4:3)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=x$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])
xx = linspace(-4, 4, 100);
my_color = lines(6);
ii=1;
for i = -3:2
    yy = 1/2 * xx.^2 + i;
    hold on;
    
    plot(xx, yy,'linewidth',2,'color',my_color(ii,:))
    ii=ii+1;
end
ylim([-3, 3])

%%

dydx = @(x,y) y./(x+eps);
fun_dirfield(dydx, -4:0.4:4, -3:0.4:3)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$x \frac{dy}{dx}=y$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])

hold on;

plot(0,0,'o','markeredgecolor','r','markerfacecolor','w','linewidth',2)


ylim([-3, 3])

%%
dydx = @(x,y) x./(y-x.^2.*y+eps);
fun_dirfield(dydx, -10:0.4:10, -10:0.4:10)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$x \frac{dy}{dx}=y$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])

hold on;

xx = linspace(-10, 10, 100);

yy = sqrt(3-log(abs(1-xx.^2)));
hold on;

plot(xx, yy,'linewidth',2,'color',[0.494, 0.184, 0.556])


ylim([-3, 3])

%% Exponential Growth
dydx = @(x,y) y;
figure;
fun_dirfield(dydx, linspace(-1,10,20), linspace(-50, 1200, 20))
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=y$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])

hold on;
XLIMs = xlim;
YLIMs = ylim;
line(XLIMs, [0, 0],'color','k','linewidth',2)
line([0, 0], YLIMs, 'color','k','linewidth',2)
xx = linspace(-2, 10, 100);
yy = 100*exp(xx);
plot(xx, yy,'linewidth',2,'color',lines(1))
xlim(XLIMs)
ylim(YLIMs)

%% Logistic Growth
dydx = @(x,y) y.*(1-y/1000);
figure;
fun_dirfield(dydx, linspace(-1,10,20), linspace(-50, 1200, 20))
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$\frac{dy}{dx}=y\left(1-\frac{y}{1000}\right)$$','interpreter','latex')
set(gca,'fontsize',12)
set(gcf,'position',[680   498   622   480])

hold on;
XLIMs = xlim;
YLIMs = ylim;
line(XLIMs, [0, 0],'color','k','linewidth',2)
line([0, 0], YLIMs, 'color','k','linewidth',2)
xx = linspace(-2, 10, 100);
yy = 1000*exp(xx)./(exp(xx)+9);
plot(xx, yy,'linewidth',2,'color',lines(1))
xlim(XLIMs)
ylim(YLIMs)
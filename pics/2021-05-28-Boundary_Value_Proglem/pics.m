clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');
addpath('C:\angeloyeo.github.io\pics\');


global A BoundaryCondition

A = [0, 1;-3, 4];
% BoundaryCondition = [1, 1.5]; BoundaryCondition_Time = [0, 1.5];
% BoundaryCondition = [1, 3]; BoundaryCondition_Time = [0, 2];
BoundaryCondition = [2, 7]; BoundaryCondition_Time = [1, 3];

%% phase plane of the ODE to solve (IVP)

fun_dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
fun_dydt = @(x,y) A(2,1) * x + A(2,2) * y;

xx = linspace(-10,10,20);
yy = xx;

figure;
fun_dirfield_system(fun_dxdt, fun_dydt, xx, yy)
hold on;
xlim([xx(1), xx(end)])
ylim(xlim)

posX = 2; posY = 2;

plot(posX, posY, 'o', 'markerfacecolor','r','markeredgecolor','k')
text(posX+0.5, posY-1, '@ t = 0',...
    'HorizontalAlignment','left','backgroundColor','w','edgecolor','k')

%% phase plane of the ODE to solve (BVP)

fun_dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
fun_dydt = @(x,y) A(2,1) * x + A(2,2) * y;

xx = linspace(-10,10,20);
yy = xx;

figure;
fun_dirfield_system(fun_dxdt, fun_dydt, xx, yy)
hold on;
xlim([xx(1), xx(end)])
ylim(xlim)

my_color = lines(2);
line(ones(1,2) * BoundaryCondition(1), ylim, 'color',my_color(1,:),'linestyle','--','linewidth',2)
line(ones(1,2) * BoundaryCondition(2), ylim, 'color',my_color(2,:),'linestyle','--','linewidth',2)
YLIMs = ylim;
text(BoundaryCondition(1), (YLIMs(2) - YLIMs(1)) * 1.05 + YLIMs(1), ['@ t = ',num2str(BoundaryCondition_Time(1))],...
    'HorizontalAlignment','center','backgroundColor','w','edgecolor','k')
text(BoundaryCondition(2), (YLIMs(2) - YLIMs(1)) * 1.05 + YLIMs(1), ['@ t = ',num2str(BoundaryCondition_Time(2))],...
    'HorizontalAlignment','center','backgroundColor','w','edgecolor','k')

%% the ODE to solve

odefun = @bvpfcn;
bcfun = @bcfcn;
r = linspace(BoundaryCondition_Time(1), BoundaryCondition_Time (2), 30);
solinit = bvpinit(r, @guess);
sol = bvp4c(odefun, bcfun, solinit);

fun_dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
fun_dydt = @(x,y) A(2,1) * x + A(2,2) * y;

xx = linspace(-10,10,20);
yy = xx;

figure;
fun_dirfield_system(fun_dxdt, fun_dydt, xx, yy)
hold on;
plot(sol.y(1,:), sol.y(2,:),'linewidth',2,'color','k')
xlim([xx(1), xx(end)])
ylim(xlim)

my_color = lines(3);
line(ones(1,2) * BoundaryCondition(1), ylim, 'color',my_color(1,:),'linestyle','--','linewidth',2)
line(ones(1,2) * BoundaryCondition(2), ylim, 'color',my_color(2,:),'linestyle','--','linewidth',2)
YLIMs = ylim;
text(BoundaryCondition(1), (YLIMs(2) - YLIMs(1)) * 1.05 + YLIMs(1), ['@ t = ',num2str(BoundaryCondition_Time(1))],...
    'HorizontalAlignment','center','backgroundColor','w','edgecolor','k')
text(BoundaryCondition(2), (YLIMs(2) - YLIMs(1)) * 1.05 + YLIMs(1), ['@ t = ',num2str(BoundaryCondition_Time(2))],...
    'HorizontalAlignment','center','backgroundColor','w','edgecolor','k')

time2see = BoundaryCondition_Time(1):BoundaryCondition_Time(2);

for i_time = 1:length(time2see)
    [~,idx] = min(abs(sol.x - time2see(i_time)));
    plot(sol.y(1, idx), sol.y(2, idx),'o','markerfacecolor','y', 'markeredgecolor','k');
    text(sol.y(1, idx)-2.8, sol.y(2, idx)+1.2, ['@ t = ', num2str(time2see(i_time))],'BackgroundColor','w','EdgeColor','k')
end
%     plot(sol.y(1, idx), sol.y(2, idx),'o','markerfacecolor','k', 'markeredgecolor','k');


%% the ODE to solve

c = [exp(3), exp(1); exp(9), exp(3)]\[2;7];

t_sol = linspace(0, 3, 100);
x_sol = c(1)*exp(3*t_sol)+c(2)*exp(t_sol);
y_sol = 3*c(1)*exp(3*t_sol)+c(2)*exp(t_sol);

figure;
plot(x_sol, y_sol,'-','linewidth',2)
hold on;
time2see = [0,1,2,3];
for i_time = 1:length(time2see)
    [~,idx] = min(abs(t_sol - time2see(i_time)));
    plot(x_sol(idx), y_sol(idx),'o','markerfacecolor','y', 'markeredgecolor','k');
    text(x_sol(idx)-2.8,y_sol(idx)+1.2, ['@ t = ', num2str(time2see(i_time))],'BackgroundColor','w','EdgeColor','k')
end

xlim([xx(1), xx(end)])
ylim(xlim)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
axis square
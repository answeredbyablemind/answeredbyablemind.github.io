clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 1계 미분방정식 
figure('position',[680, 558, 1122, 420]);

dxdt = @(t, x) x;
xx = linspace(-4,4,20);

subplot(1,2,1);
fun_dirfield(dxdt, xx, xx,'linewidth',1.5);
[t, x] = ode45(@(t,x) x, [-4, 4], [-0.3, -0.05, -0.01, 0, 0.01, 0.05, 0.3]);
plot(t, x, 'b')
xlim([-4, 4])
ylim([-4, 4])
title('$$\frac{dx}{dt}-x=0$$','interpreter','latex')

subplot(1,2,2);
fun_dirfield(dxdt, xx, xx,...
    'p', @(t) exp(t/2),'color',[235, 64, 52]/255,'linewidth',1.5);
title('$$\frac{dx}{dt}-x=exp(t/2)$$','interpreter','latex')

pt = linspace(-4, 4, 100);
p = exp(pt/2);

[t, x] = ode45(@(t,x) my_difeq(t,x,pt,p), [-4, 4], [-0.3, -0.27, -0.26, -0.24, -0.2]);
plot(t, x, 'b')
xlim([-4, 4])
ylim([-4, 4])

%% 1계 미분방정식 
figure('position',[500, 300, 1340, 480]);

dxdt = @(t, x) x;
xx = linspace(-4,4,20);

subplot(1,2,1);
fun_dirfield(dxdt, xx, xx,'linewidth',1.5);
% [t, x] = ode45(@(t,x) x, [-4, 4], [-0.3, -0.05, -0.01, 0, 0.01, 0.05, 0.3]);
% plot(t, x, 'b')

my_color = jet(8);
for i_patch = -4:3
    p = patch([i_patch, i_patch+1, i_patch+1, i_patch], [-4, -4, 4, 4], my_color(i_patch+5,:),'edgecolor', ones(1,3) * 0.6);
    alpha(p, 0.2)
    t = text(i_patch+0.5,3.3,sprintf('기울기\n+%.1f',exp(i_patch/2)),'HorizontalAlignment','center','Color','k','BackgroundColor','w','edgecolor','k','fontname','나눔고딕')
end



xlim([-4, 4])
ylim([-4, 4])
title('$$\frac{dx}{dt}-x=0$$','interpreter','latex')

subplot(1,2,2);
fun_dirfield(dxdt, xx, xx,...
    'p', @(t) exp(t/2),'color',[235, 64, 52]/255,'linewidth',1.5);
title('$$\frac{dx}{dt}-x=exp(t/2)$$','interpreter','latex')

pt = linspace(-4, 4, 100);
p = exp(pt/2);
% 
% [t, x] = ode45(@(t,x) my_difeq(t,x,pt,p), [-4, 4], [-0.3, -0.27, -0.26, -0.24, -0.2]);
% plot(t, x, 'b')
xlim([-4, 4])
ylim([-4, 4])

%% 2원 1차 연립 미분방정식 (비제차 --> 제차 형태의 phase plane 먼저)
figure('color','w');
A = [0, 1;1, 0];
dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
dydt = @(x,y) A(2,1) * x + A(2,2) * y;
xx = -3:0.3:3;
yy = xx;

tt = linspace(0, 4*pi, 100);
p = @(t) cos(t);
q = @(t) sin(t);

fun_dirfield_system(dxdt, dydt, xx, yy)
xlim([-3, 3])
ylim([-3, 3])


%% 2원 1차 연립 미분방정식 (비제차)
figure('color','w');
A = [0, 1;1, 0];
dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
dydt = @(x,y) A(2,1) * x + A(2,2) * y;
xx = -3:0.3:3;
yy = xx;

pt = linspace(0, 4*pi, 100);
p = cos(pt);
qt = linspace(0, 4*pi, 100);
q = sin(qt);

tt = linspace(0, 4*pi, 100);
pp = @(t) cos(t);
qq = @(t) sin(t);

initial_points = [...
    2, -3; 
    1, 0; 
    0, -0.5;
    -0.5, 0.5;
    -0.5, -0.5;
    -1, -0.3];
% initial_points = [1, -0.5];
clear x_ode45 y_ode45
for i_points = 1:size(initial_points, 1)
    initial_point = initial_points(i_points,:);
    [t_ode45, z_ode45] = ode45(@(t, x) my_difeq2(t, x, pt, p, qt, q), [0; 4*pi], initial_point);
    
    x_ode45(:,i_points) = interp1(t_ode45, z_ode45(:,1), tt);
    y_ode45(:,i_points) = interp1(t_ode45, z_ode45(:,2), tt);
end

fun_dirfield_system(dxdt, dydt, xx, yy,...
    't',tt,'p', pp(tt),'q', qq(tt), 'stream',false,'record',true,'filename','pic5',...
    'x_ode45',x_ode45,'y_ode45',y_ode45)

hold on;
% 
% figure;
% plot(z_ode45(:,1), z_ode45(:,2), 'b')
% xlim([-3, 3])
% ylim([-3, 3])

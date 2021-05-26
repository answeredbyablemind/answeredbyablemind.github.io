clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 1°è ¹ÌºÐ¹æÁ¤½Ä 
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

%% 1°è ¹ÌºÐ¹æÁ¤½Ä 
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
    t = text(i_patch+0.5,3.3,sprintf('±â¿ï±â\n+%.1f',exp(i_patch/2)),'HorizontalAlignment','center','Color','k','BackgroundColor','w','edgecolor','k','fontname','³ª´®°íµñ')
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

%% 2ï¿½ï¿½ 1ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ÌºÐ¹ï¿½ï¿½ï¿½ï¿½ï¿½
figure('color','w');
A = [0, 1;1, 0];
dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
dydt = @(x,y) A(2,1) * x + A(2,2) * y;
xx = -3:0.3:3;
yy = xx;

tt = linspace(0, 4*pi, 100);
p = @(t) cos(t);
q = @(t) sin(t);

fun_dirfield_system(dxdt, dydt, xx, yy,...
    't',tt,'p', p(tt),'q', q(tt), 'stream',false,'record',true,'filename','pic3')

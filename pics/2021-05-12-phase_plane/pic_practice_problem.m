clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%%
A = [-5/500, 5/300; 5/500, -7/300];
figure;
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,0:5:100)
[V,D] = eig(A);

hold on;

xlim([0, 100])
ylim([0, 100])
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

XLIMs = xlim;
xx = linspace(XLIMs(1),XLIMs(2),100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;
if D(1,1) < 0
    color = lines(1);
else
    color = lines(2);
    color = color(2,:);
end

plot(xx, yy1,'color',color,'linewidth',2);

if D(2,2) < 0
    color = lines(1);
else
    color = lines(2);
    color = color(2,:);
end

plot(xx, yy2,'color',color,'linewidth',2);


% Numerical Solution
x0s = [0, 100];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq6(z, A);
    [t, z] = ode45(dzdt, [-10, 1000], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end
% 
% t = linspace(0,10,100);
% x = -0.5 * exp(3*t).*t;
% y = -0.5 * exp(3*t).*(-2*t+1);
% plot(x, y,'r')


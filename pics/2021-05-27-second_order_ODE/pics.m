clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%%

a = 1;
b = -4;
c = 3;

% A = [0, 1;1, 0];
A = [0, 1;-c/a, -b/a];

[V,D] = eig(A);

dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
dydt = @(x,y) A(2,1) * x + A(2,2) * y;

xx = -3:0.3:3;
yy = xx;

fun_dirfield_system(dxdt, dydt, xx, yy)

yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;
hold on;
plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])
axis sqaure
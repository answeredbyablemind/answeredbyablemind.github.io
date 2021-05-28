clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% the ODE to solve

global A BoundaryCondition

A = [0, 1;-3, 4];
% BoundaryCondition = [1, 1.5]; BoundaryCondition_Time = [0, 1.5];
% BoundaryCondition = [1, 3]; BoundaryCondition_Time = [0, 2];
BoundaryCondition = [-2, -7]; BoundaryCondition_Time = [1, 3];

odefun = @bvpfcn;
bcfun = @bcfcn;
r = linspace(BoundaryCondition_Time(1), BoundaryCondition_Time (2), 30);
solinit = bvpinit(r, @guess);
sol = bvp4c(odefun, bcfun, solinit);

fun_dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
fun_dydt = @(x,y) A(2,1) * x + A(2,2) * y;

xx = linspace(-10,10,30);
yy = xx;

figure;
fun_dirfield_system(fun_dxdt, fun_dydt, xx, yy)
hold on;
plot(sol.y(1,:), sol.y(2,:),'linewidth',2)
xlim([xx(1), xx(end)])
ylim(xlim)
% 
% figure;
% plot(sol.y(1,:), sol.y(2,:),'linewidth',2)
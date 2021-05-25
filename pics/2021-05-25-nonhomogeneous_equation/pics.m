clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 1차 비제차 미분방정식
figure('position',[680, 558, 1122, 420]);

dxdt = @(t, x) x;
xx = linspace(-4,4,20);

subplot(1,2,1);
fun_dirfield(dxdt, xx, xx,'linewidth',1.5);
title('$$\frac{dx}{dt}-x=0$$','interpreter','latex')
subplot(1,2,2);
fun_dirfield(dxdt, xx, xx,...
    'p', @(t) exp(t/2),'color',[235, 64, 52]/255,'linewidth',1.5);
title('$$\frac{dx}{dt}-x=exp(t/2)$$','interpreter','latex')

%% 2원 1차 비제차 미분방정식
figure;
A = [0, 1;1, 0];
dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
dydt = @(x,y) A(2,1) * x + A(2,2) * y;
xx = -3:0.3:3;
yy = xx;

tt = linspace(0, 4*pi, 100);
p = @(t) cos(t);
q = @(t) sin(t);

fun_dirfield_system(dxdt, dydt, xx, yy,...
    't',tt,'p', p(tt),'q', q(tt), 'stream',false,'record',true,'filename','pic2')

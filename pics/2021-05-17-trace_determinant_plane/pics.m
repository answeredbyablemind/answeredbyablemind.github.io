clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% A = [0, 1;1, 0]이라는 행렬에서 Euler Method 접목시켜보기

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
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

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% Numerical Solution
x0s = [3, -2.8; 2.8, -3; -2.8, 3; -3, 2.8];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq1(z);
    [~, z] = ode45(dzdt, [-10, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end


%% 복소 고윳값 갖는 행렬 (inward spiral)

figure;
A = [-0.1, 1;
    -1, -0.1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)

hold on;

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% Numerical Solution
x0s = [2, 2];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq2(z);
    [~, z] = ode45(dzdt, [-10, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end

%% 복소 고윳값 갖는 행렬 (outward spiral)

figure;
A = [0.1, 1;
    -1, 0.1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)

hold on;

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% Numerical Solution
x0s = [0, 0.5];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq3(z);
    [~, z] = ode45(dzdt, [-10, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end

%% 중근 고윳값 갖는 경우

figure;
A = [0.1, 1;
    -1, 0.1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)

hold on;

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% Numerical Solution
x0s = [0, 0.5];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq3(z);
    [~, z] = ode45(dzdt, [-10, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end
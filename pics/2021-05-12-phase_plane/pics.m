clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 가장 기본적인 phase plane

figure;
A = [1, 0;0, 1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(1,1)/(V(2,1)+eps) * xx;
yy2 = V(1,2)/(V(2,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

%% 가장 기본적인 phase plane (2)

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(1,1)/(V(2,1)+eps) * xx;
yy2 = V(1,2)/(V(2,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

%% A = [0, 1;1, 0]이라는 행렬에서 Euler Method 접목시켜보기

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(1,1)/(V(2,1)+eps) * xx;
yy2 = V(1,2)/(V(2,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% 첫 스타트 포인트
x0 = [2; -1];
n_iter = 5;
my_color = parula(n_iter);

for i_iter = 1:n_iter
    temp = A * x0;
    dxdt = temp(1); 
    dydt = temp(2);
    
    delta = 0.5;
    
    % 화살표 하나 그어주기
    quiver(x0(1), x0(2), dxdt * delta, dydt * delta, 0, 'color',my_color(i_iter,:),'linewidth',2)
    
    x0(1) = x0(1) + dxdt * delta;
    x0(2) = x0(2) + dydt * delta;
end

%% 가장 기본적인 phase plane + cosine & sine

figure;
A = [1, 0;0, 1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3,...
    't',linspace(0, 4*pi, 100),'p',cos(linspace(0,4*pi,100)),'q',sin(linspace(0,4*pi,100)))

%% phase plane

figure;
A = [1, 3;1, -1];
fun_dirfield_system(@(x,y) x+3*y, @(x,y) x-y,-3:0.3:3)

[V,D] = eig(A);
line([0, V(1,1)],[0, V(2,1)])
line([0, V(1,2)],[0, V(2,2)])

dzdt = @(t,z) fun_phase_plane(z, A);
[t, z] = ode45(dzdt, [0, 10], [1; 0]);
hold on;
plot(z(:,1), z(:,2))
[t, z] = ode45(dzdt, [0, 10], [1; -2]);
hold on;
plot(z(:,1), z(:,2))
xlim([-3, 3])
ylim([-3, 3])

%% phase plane

figure;
A = [-2, 0;0, 2];
fun_dirfield_system(@(x,y) -2*x, @(x,y) 2*y,-3:0.3:3)

[V,D] = eig(A);
line([0, V(1,1)],[0, V(2,1)])
line([0, V(1,2)],[0, V(2,2)])

dzdt = @(t,z) fun_phase_plane(z, A);
[t, z] = ode45(dzdt, [0, 10], [1; 0]);
hold on;
plot(z(:,1), z(:,2))
[t, z] = ode45(dzdt, [0, 10], [1; -2]);
hold on;
plot(z(:,1), z(:,2))
xlim([-3, 3])
ylim([-3, 3])


%% phase plane with linear transformation

figure();

A_final = [1, 2; 3, 2]; % a matrix with real eigenvalues
% A_final = [-3, 1; -2, -1]; % complex eigenvalue
% A_final = [0, 2; -2, 0]; % circle
% A_final = [-1/10, 1;-1, -1/10]; % inward spiral
% A_final = [-1, 1;0, -1]; % repeated eigenvalues 1
% A_final = [5, 1;-4, 1]; % repeated eigenvalues 2
n_step = 100;
for i_step = 1:n_step
    A_step = (A_final - eye(2)) / n_step;
    
    A = eye(2) + A_step * i_step;
    
    fun_dirfield_system(@(x,y) A(1,1)*x+A(1,2)*y, @(x,y) A(2,1) * x+ A(2,2) * y, -3:0.3:3)
%     title([num2str(i_step),'/',num2str(n_step)]);
    xlim([-3, 3])
    ylim([-3, 3])
    hold on;
    
    [V,D] = eig(A);
    
    if sum(abs(imag(V(:))))==0
        xx = linspace(-3,3,100);
        yy1 = V(2,1)/(V(1,1)+eps) * xx;
        yy2 = V(2,2)/(V(1,2)+eps) * xx;

        plot(xx, yy1,'color','k','linewidth',2);
        plot(xx, yy2,'color','k','linewidth',2);

        my_color = lines(2);
        for i = 1:2
            mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
        end
    end
% 
%     dzdt = @(t,z) fun_phase_plane(z, A);
%     opts = odeset('Refine',10);
%     [t, z] = ode45(dzdt, [0, 10], [1; 0],opts);
%     hold on;
%     plot(z(:,1), z(:,2),'linewidth',2)
%     
    drawnow;
    
    if i_step < n_step
        cla;
    end
end
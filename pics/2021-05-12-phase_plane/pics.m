clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);

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
A = [1, 0;0, 1];
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


figure('position',[1000, 559, 1158, 420]);
subplot(1,2,1);
A = eye(2);
fun_dirfield_system(@(x,y) A(1,1)*x+A(1,2)*y, @(x,y) A(2,1) * x+ A(2,2) * y, -3:0.3:3)
axis square 

subplot(1,2,2)
A_final = [2, 1; 1, 2]; % shear
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
    title([num2str(i_step),'/',num2str(n_step)]);
    
    
    [V,D] = eig(A_final);
    line([0, V(1,1)],[0, V(2,1)])
    line([0, V(1,2)],[0, V(2,2)])
    
    dzdt = @(t,z) fun_phase_plane(z, A);
    
    [x_mesh, y_mesh] = meshgrid(-3:3);
    my_color = parula(numel(x_mesh));
    for i_mesh = 1:numel(x_mesh)
        [t, z] = ode45(dzdt, [0, 10], [x_mesh(i_mesh); y_mesh(i_mesh)]);
        hold on;
        plot(z(:,1), z(:,2),'linewidth',2,'color',my_color(i_mesh,:))
    end
    
    xlim([-3, 3])
    ylim([-3, 3])
    axis square

    drawnow;
    
    if i_step < n_step
        cla;
    end
end
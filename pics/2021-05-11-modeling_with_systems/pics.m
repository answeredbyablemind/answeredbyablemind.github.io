clear; close all; clc;

%% Prey-Predator model
figure('position',[227, 480, 1432, 420],'color','w');
subplot(1,2,2);
fun_dirfield_system(@(x,y) 2*x - x.*y, @(x,y) -5*y + x.*y,0:0.5:15)
hold on;
dzdt = @(t, z) fun_prey_predator(z);
opts = odeset('Refine', 10);
[t, z] = ode45(dzdt, [0, 10], [1; 1], opts);
plot(z(:,1), z(:,2),'color',[0.494, 0.184, 0.556],'linewidth',2)

xlabel('prey population');
ylabel('predator population');
title('phase plane plot');

subplot(1,2,1);
clear h
h(1) = plot(t, z(:,1),'linewidth',2);
hold on;
h(2) = plot(t, z(:,2),'linewidth',2);
xlabel('time');
ylabel('population')
grid on;
legend(h, 'prey population','predator population');
title('prey, predator populations over time');

%% Prey-Predator model (logistic growth)
figure('position',[227, 480, 1432, 420],'color','w');
subplot(1,2,2);
fun_dirfield_system(@(x,y) 2*x .* (1-x/10) - x.*y, @(x,y) -5*y + x.*y,0:0.2:10, 0:0.2:3)
hold on;
dzdt = @(t, z) fun_prey_predator_logistic(z);
opts = odeset('Refine', 10);
[t, z] = ode45(dzdt, [0, 10], [1; 1], opts);
plot(z(:,1), z(:,2),'color',[0.494, 0.184, 0.556],'linewidth',2)

xlabel('prey population');
ylabel('predator population');
title('phase plane plot (logistic growth)');

subplot(1,2,1);
clear h
h(1) = plot(t, z(:,1),'linewidth',2);
hold on;
h(2) = plot(t, z(:,2),'linewidth',2);
xlabel('time');
ylabel('population')
grid on;
legend(h, 'prey population','predator population');
title('prey, predator populations over time (logistic growth)');

%% SIR model
alpha = 0.005;
beta = 0.08;
N = 110;

figure('position',[227, 480, 1432, 420],'color','w');
subplot(1,2,2);
fun_dirfield_system(@(x,y) -alpha * x.* y, @(x,y) alpha * x.* y - beta * y,0:5:100)
hold on;
dzdt = @(t, z) fun_SIR(z, alpha, beta);
opts = odeset('Refine', 10);
[t, z] = ode45(dzdt, [0, 100], [100; 10], opts);
plot(z(:,1), z(:,2),'color',[0.494, 0.184, 0.556],'linewidth',2)

xlabel('susceptible population');
ylabel('infected population');
title('phase plane plot');

subplot(1,2,1);
clear h
h(1) = plot(t, z(:,1),'linewidth',2);
hold on;
h(2) = plot(t, z(:,2),'linewidth',2);
h(3) = plot(t, N - z(:,1) - z(:,2),'linewidth',2);
xlabel('time');
ylabel('population')
grid on;
legend(h, 'susceptible','infected','removed','location','best');
title('susceptible, infected, removed populations over time');

%% Damped pendulum
global fig_dirfield

fig_dirfield = figure('position',[109, 370, 1323, 420],'color','w');
subplot(1,2,1);
% fun_dirfield_system(@(x,y) y, @(x,y) -0.5*y-sin(x),-3:0.3:9, -4:0.3:4)
fun_dirfield_system(@(x,y) y, @(x,y) -0.4*y-1.04*x,-3:0.3:3, -4:0.3:4)
hold on;
dzdt = @(t, z) fun_damped_pendulum(z);
[t1, z1] = ode45(dzdt, [0, 15], [0; 2]);
plot(z1(:,1), z1(:,2),'linewidth',2)
% [t2, z2] = ode45(dzdt, [0, 15], [0; -2]);
% plot(z2(:,1), z2(:,2),'linewidth',2)
% [t3, z3] = ode45(dzdt, [0, 15], [2; 3]);
% plot(z3(:,1), z3(:,2),'linewidth',2)
xlabel('position (x)');
ylabel('velocity (x'')');

fun_plot_pendulum(z1,'isRecording',true)

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

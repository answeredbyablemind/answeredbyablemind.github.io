clear; close all; clc;

%% Prey-Predator model
fun_dirfield_system(@(x,y) 2*x - x.*y, @(x,y) -5*y + x.*y,0:0.5:15)
hold on;
dzdt = @(t, z) fun_prey_predator(z);
[t, z] = ode45(dzdt, [0, 10], [1; 1]);
plot(z(:,1), z(:,2))
[t, z] = ode45(dzdt, [0, 10], [2; 1]);
plot(z(:,1), z(:,2))

%% Damped pendulum
global fig_dirfield

fig_dirfield = figure('position',[109, 370, 1323, 420],'color','w');
subplot(1,2,1);
fun_dirfield_system(@(x,y) y, @(x,y) -0.5*y-sin(x),-3:0.3:9, -4:0.3:4)
hold on;
dzdt = @(t, z) fun_damped_pendulum(z);
[t1, z1] = ode45(dzdt, [0, 15], [0; 2]);
plot(z1(:,1), z1(:,2),'linewidth',2)
[t2, z2] = ode45(dzdt, [0, 15], [0; -2]);
plot(z2(:,1), z2(:,2),'linewidth',2)
[t3, z3] = ode45(dzdt, [0, 15], [2; 3]);
plot(z3(:,1), z3(:,2),'linewidth',2)
xlabel('position (x)');
ylabel('velocity (x'')');

fun_plot_pendulum(z3,'isRecording',true)

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

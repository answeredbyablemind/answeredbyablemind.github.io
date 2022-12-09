clear; close all; clc;
clea
%% Prey-Predator model
a=2;
b=1;
c=5;
d=1;

figure('position',[227, 480, 1432, 420],'color','w');
subplot(1,2,2);
fun_dirfield_system(@(x,y) a*x - b * x.*y, @(x,y) -c*y + d*x.*y,0:0.5:15)
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
a = 2;
b = 1;
c = 5;
d = 1;
N = 10;

figure('position',[227, 480, 1432, 420],'color','w');
subplot(1,2,2);
fun_dirfield_system(@(x,y) a*x .* (1-x/N) - b * x.*y, @(x,y) -c*y + d *x.*y,0:0.2:10, 0:0.2:3)
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
figure('position',[109, 370, 1323, 420],'color','w');
subplot(1,2,2);
% fun_dirfield_system(@(x,y) y, @(x,y) -0.5*y-sin(x),-3:0.3:9, -4:0.3:4)
fun_dirfield_system(@(x,y) y, @(x,y) -0.4*y-1.04*x,-3:0.3:3, -4:0.3:4)
hold on;
dzdt = @(t, z) fun_damped_pendulum(z);
[t1, z1] = ode45(dzdt, [0, 15], [0; 2]);
plot(z1(:,1), z1(:,2),'linewidth',2,'color',[0.494, 0.184, 0.556])
xlabel('position (x)');
ylabel('velocity (x'')');

subplot(1,2,1);
clear h
h(1) = plot(t1, z1(:,1),'linewidth',2);
hold on;
h(2) = plot(t1, z1(:,2),'linewidth',2);
grid on;
xlabel('time(s)');
ylabel('position or velocity');
legend(h,'position','velocity','location','best');


%% Damped pendulum (video)
global fig_dirfield

fig_dirfield = figure('position',[109, 370, 1323, 420],'color','w');
subplot(1,2,1);
fun_dirfield_system(@(x,y) y, @(x,y) -0.4*y-1.04*x,-3:0.3:3, -4:0.3:4)
hold on;
dzdt = @(t, z) fun_damped_pendulum(z);
[t1, z1] = ode45(dzdt, [0, 15], [0; 2]);
plot(z1(:,1), z1(:,2),'linewidth',2,'color',[0.494, 0.184, 0.556])
xlabel('position (x)');
ylabel('velocity (x'')');

fun_plot_pendulum(z1,'isRecording',false)

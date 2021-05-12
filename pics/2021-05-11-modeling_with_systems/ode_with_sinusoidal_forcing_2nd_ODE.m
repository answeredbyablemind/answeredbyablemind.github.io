clear; close all; clc;
ft = linspace(0, 11, 100);
f = -2 * sin(3*ft);

tspan = [0, 11];
ic = [0;0];
opts = odeset('RelTol', 1e-2, 'AbsTol', 1e-4, 'Refine', 10);
[t, z] = ode45(@(t,z) myode(t, z, ft, f), tspan, ic, opts);

figure;
plot(t, z(:,1));
hold on;
plot(t, z(:,2));
axis square

figure;
plot(z(:,1), z(:,2));

x_analytic = -3/40 * exp(-2*ft).* cos(4*ft)+ 3/80*exp(-2*ft).*sin(4*ft)+3/40*cos(2*ft)-3/20*sin(2*ft);
figure;     
plot(ft, x_analytic)

% figure('color','w');
% fun_plot_pendulum(z,'isRecording',false,'onlyPendulum', true,'videoname','damped_harmonic_with_sinusoidal_forcing')

tt = linspace(0, 11, 100);
figure;
fun_dirfield_system(@(x,y) y, @(x,y) -2 * y -17 * x, linspace(-0.5, 0.5, 20), linspace(-1, 1, 20),...
    't',tt,'q',-2*sin(3*tt));

function dzdt = myode(t, z, ft, f)
f_val = interp1(ft, f, t);
dzdt(1,1) = z(2);
dzdt(2,1) = -2 * z(2) - 17 * z(1) + f_val;

end
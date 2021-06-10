clear; close all; clc;
% https://web.mit.edu/jorloff/www/chaosTalk/double-pendulum/double-pendulum-en.html
global g L1 L2 m1 m2
g = 9.8;
L1 = 1;
L2 = 1.5;
m1 = 2;
m2 = 1;

dzdt = @(t, z) my_difeq(z);

T = 10;
z0 = [pi/6;pi/4;0;0];
reltol = 1e-5;
abstol = 1e-5;
[t, z]= ode45(dzdt, [0, T], z0, odeset('RelTol', reltol, 'AbsTol', abstol));
figure; plot(t, z);

figure('color','w');

for i_t = 1:length(t)
    theta1 = z(i_t, 1);
    theta2 = z(i_t, 2);
    
    pendulum1 = [L1 * sin(theta1), - L1 * cos(theta1)];
    pendulum2 = pendulum1 + [L2 * sin(theta2), - L2 * cos(theta2)];
    
    plot(pendulum1(1), pendulum1(2), 'o','markerfacecolor',[0, 0.447, 0.741],'markeredgecolor','k');
    hold on;
    plot(pendulum2(1), pendulum2(2), 'o','markerfacecolor',[0.85, 0.325, 0.098],'markeredgecolor','k');
    
    line([0, pendulum1(1)], [0, pendulum1(2)],'color','k')
    line([pendulum1(1), pendulum2(1)], [pendulum1(2), pendulum2(2)],'color','k')
    
    ylim([-L1-L2-1, 1])
    xlim([-3, 3]);
    text(0, 0.5, ['t = ',num2str(t(i_t))],'HorizontalAlignment','center');
    drawnow;
    if i_t < length(t)
        cla;
    end
    
    
end

function res = my_difeq(z)

% z: [theta1; theta2; w1; w2];

global g L1 L2 m1 m2

res(1,1) = z(3); % dtheta1/dt
res(2,1) = z(4); % dtheta2/dt
res(3,1) = (-g * ( 2 * m1 + m2) * sin(z(1)) - m2 * g * sin(z(1) - 2 * z(2)) - 2 * sin(z(1) - z(2)).*m2 * (z(4)^2*L2 + z(3)^2 * L1.*cos(z(1)-z(2)))) ./ ...
    (L1*(2*m1+m2-m2*cos(2*z(1)-2*z(2))));

res(4,1) = 2*sin(z(1)-z(2)).*(z(3)^2 * L1 * (m1+m2) + g * (m1 + m2) * cos(z(1)) + z(4)^2*L2*m2*cos(z(1)-z(2))) ./ ...
    (L2 * (2 * m1 + m2 - m2 * cos(2*z(1)-2*z(2))));
end
clear; close all; clc;
ft = linspace(0, 5, 25);
f = ft.^2 - ft - 3;
gt = linspace(1, 6, 25);
g = 3 * sin(gt-0.25);

tspan = [1, 5];
ic = 1;
opts = odeset('RelTol', 1e-2, 'AbsTol', 1e-4);
[t, y] = ode45(@(t,y) myode(t, y, ft, f, gt, g), tspan, ic, opts);


plot(t, y)
function dydt = myode(t, y, ft, f, gt, g)
f = interp1(ft, f, t);
g = interp1(gt, g, t);
dydt = -f .* y + g;
end
clear; close all; clc;

% the ODE to solve
% D^2 v_z + 1/r D v_z - \Delta P/(\mu L) = 0

global DeltaP mu L V

DeltaP = -3;
mu = 2;
L = 100;
V = 20;
R = 10;
kappa = 0.1;

odefun = @bvpfcn;
bcfun = @bcfcn;
r = linspace(kappa*R, R, 30);
solinit = bvpinit(r, @guess);
sol = bvp4c(odefun, bcfun, solinit);

%% Comparing wiht analytic solution 

v_z_analytic = -DeltaP * R^2 / (4 * mu * L) * (1-r.^2/R^2) + log(R./r)/log(1/kappa) * (V + DeltaP*R^2/(4*mu*L)*(1-kappa^2));

clear h
figure;
h(1) = plot(sol.x, sol.y(1,:),'b-','linewidth',2);
hold on;
h(2) = plot(r, v_z_analytic,'ro','linewidth',2);
xlabel('$$r$$','interpreter','latex');
ylabel('$$v_z$$','interpreter','latex');
legend(h, 'Solution from ODE solver', 'Analytic Solution');
grid on;
set(gca,'fontsize',11)
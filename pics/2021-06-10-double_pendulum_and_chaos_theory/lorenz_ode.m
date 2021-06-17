function res = lorenz_ode(z)
global sigma beta rho
res(1,1) = sigma*(z(2)-z(1));
res(2,1) = z(1)*(rho - z(3)) - z(2);
res(3,1) = z(1)*z(2)-beta * z(3);
end
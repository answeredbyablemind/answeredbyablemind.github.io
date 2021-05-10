
function res = fun_damped_pendulum(z)
 
res(1,1) = z(2);
res(2,1) = -0.5*z(2)-sin(z(1));

end

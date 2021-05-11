
function res = fun_prey_predator_logistic(z)
    
res(1,1) = 2*z(1).*(1-z(1)/10) - z(1).*z(2);
res(2,1) = -5 * z(2) + z(1).*z(2);
end

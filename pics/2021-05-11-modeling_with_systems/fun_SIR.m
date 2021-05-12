
function res = fun_SIR(z, alpha, beta)
res(1,1) = -alpha * z(1).* z(2);
res(2,1) = alpha * z(1).*z(2) - beta * z(2);
end

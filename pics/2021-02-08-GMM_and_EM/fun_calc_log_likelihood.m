function L = fun_calc_log_likelihood(x, my_mu, my_var)

L = sum(log(my_normal(x, my_mu, sqrt(my_var))));
end

function res = my_normal(x, mu, sigma)
res =  1/(sigma * sqrt(2*pi)).*exp(-1 * (x-mu).^2/(2*sigma^2));
end


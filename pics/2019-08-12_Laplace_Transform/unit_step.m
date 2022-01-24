function u = unit_step(t, t0)

u = zeros(1, length(t));
u(t>=t0) = 1;


end
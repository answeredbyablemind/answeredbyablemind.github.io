function res = my_difeq2(t, x, pt,p,qt,q)
p = interp1(pt, p, t);
q = interp1(qt, q, t);

res(1, 1) = x(2) + p;
res(2, 1) = x(1) + q;

end
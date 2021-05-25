function dxdt = my_difeq(t,x,pt,p)
p = interp1(pt, p, t);
dxdt = x + p;

end
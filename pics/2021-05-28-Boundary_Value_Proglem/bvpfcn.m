function res = bvpfcn(x, y)
global DeltaP mu L 

res(1, 1) = y(2);
res(2, 1) = -1./x * y(2) + DeltaP/(mu*L);

end
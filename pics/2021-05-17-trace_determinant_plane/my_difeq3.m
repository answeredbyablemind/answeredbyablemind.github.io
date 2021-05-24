function res = my_difeq3(z)
res(1,1) = 0.1*z(1) + z(2);
res(2,1) = -z(1)+0.1*z(2);
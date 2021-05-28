function res = bvpfcn(t, z)
% t: 독립변수
% z: 종속 변수. z는 2차원 벡터이며 [x; y]를 담고 있음.
global A

res(1, 1) = A(1,1) * z(1) + A(1, 2) * z(2);
res(2, 1) = A(2,1) * z(1) + A(2, 2) * z(2);

end
function res = bcfcn(xa, xb)
% xa: 哭率 场 Boundary Value
% xb: 坷弗率 场 Boundary Value
%
global BoundaryCondition
res = [...
    xa(1) - BoundaryCondition(1)
    xb(1) - BoundaryCondition(2)];
end
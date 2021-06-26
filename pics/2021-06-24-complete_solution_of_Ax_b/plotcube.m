function plotcube(vec)

% vec = [...
%     1, 0, 1;
%     1, 1, 1;
%     0, 1, 1;
%     0, 0, 1;
%     1, 0, 0;
%     1, 1, 0;
%     0, 1, 0;
%     0, 0, 0;
%     ]

num = [1, 5, 6, 2;
    2, 6, 7, 3;
    3, 7, 8, 4;
    4, 8, 5, 1;
    1, 2, 3, 4;
    5, 6, 7 , 8];

for i = 1:size(num,1)
    patch(...
        [vec(num(i,1),1),vec(num(i,2),1), vec(num(i,3),1) vec(num(i,4),1)], ...
        [vec(num(i,1),2),vec(num(i,2),2), vec(num(i,3),2) vec(num(i,4),2)], ...
        [vec(num(i,1),3),vec(num(i,2),3), vec(num(i,3),3) vec(num(i,4),3)], ...
        [0.2, 0.2, 0.2]);
    alpha(0.5)
end




end
clear; close all; clc;

%{
아래와 같이 두 벡터를 포함하는 평면의 방정식
(-1, 0, 2), (1, 1, 1)

==> -2x +3y -z = 0
%}

%%
v = [-1, 0, 2;
    1, 1, 1;
    0, 1, 5];

[x,y] = meshgrid(linspace(-1, 1, 10));

surf(x, y, -2 * x + 3 * y)
hold on;

my_color = lines(4);
for i = 1:size(v,1)
    plot3([0, v(i, 1)], [0, v(i, 2)], [0, v(i, 3)],'-','color',my_color(i,:),'linewidth',3)
    plot3(v(i, 1), v(i, 2), v(i, 3), 'o','markerfacecolor',my_color(i,:),'markeredgecolor','none')
end

% projected vector on a plane

A = [-1, 0, 2; 1, 1, 1]';
beta = inv(A'*A)*A'*[0, 1, 5]';

v = [v; transpose(A*beta)];

for i = 4
    plot3([0, v(i, 1)], [0, v(i, 2)], [0, v(i, 3)],'-','color',my_color(i,:),'linewidth',3)
    plot3(v(i, 1), v(i, 2), v(i, 3), 'o','markerfacecolor',my_color(i,:),'markeredgecolor','none')
end


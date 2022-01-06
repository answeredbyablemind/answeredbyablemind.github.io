clear; close all; clc;

addpath('..\');

%% pic1 복소평면
plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true)

%% pic2 복소수 1+j0.5
plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true)
hold on;
line([1, 1], [0, 0.5], 'color','k','linestyle','--')
line([0, 1], [0.5, 0.5], 'color','k','linestyle','--')
line([0, 1], [0, 0.5], 'color','k','linestyle','--')
plot(1, 0.5, 'o', 'markerfacecolor', 'r' ,'markeredgecolor','k','markersize',15,'linewidth',2)
text(1, 0.5 + 0.2, '$$z = 1+j0.5$$', 'HorizontalAlignment','center','fontsize',15,'interpreter','latex')

%% pic 3. cartesian coordinate

plotXY(-3.5, 3.5, -3.5, 3.5, 'newFigure', true)
% (2,3), (0,0), (-3, 1), (-2, -2) 네 개의 점을 표현하자.

dots = [2, 3; 0, 0; -3, 1; -2, -2];
hold on;
my_color = lines(size(dots,1));
for i_dot = 1:size(dots,1)
    plot(dots(i_dot, 1), dots(i_dot, 2), 'o','markerfacecolor', my_color(i_dot,:),'markeredgecolor','k','markersize',12);
    line(ones(1,2) * dots(i_dot, 1), [0, dots(i_dot, 2)],'color', my_color(i_dot,:),'linestyle','--')
    line([0, dots(i_dot,1)], ones(1,2) * dots(i_dot, 2),  'color', my_color(i_dot,:),'linestyle','--')
    text(dots(i_dot,1)+0.2, dots(i_dot,2)+0.2, ['(',num2str(dots(i_dot,1)),',', num2str(dots(i_dot,2)),')'],'HorizontalAlignment','left','fontsize',15,'color',my_color(i_dot,:))
end

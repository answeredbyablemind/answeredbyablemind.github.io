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

%% pic 4. 복소수 1+j0.5를 polar coordinate으로 표현

plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true,'plot_polar',true)
hold on;

plot([0, 1], [0, 0.5],'color','k','linestyle','--','linewidth',2)
plot(1, 0.5, 'o', 'markerfacecolor', 'r' ,'markeredgecolor','k','markersize',10,'linewidth',1.5)

th = linspace(0, atan(0.5), 100);
plot(0.3 * cos(th), 0.3 * sin(th),'k')
text(0.35, 0.1, '\theta','fontsize',15)
text(0.45, 0.4, '$$r$$','fontsize',15,'interpreter','latex')
% 
% %% pic 5. r = 2, theta = 30도 --> 60도 두 개의 점
% 
% plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true,'plot_polar',true)
% hold on;
% plot(2 * cosd(15), 2 * sind(15),'o','markerfacecolor','r','MarkerEdgeColor','k','markersize',10);
% plot(2 * cosd(40), 2 * sind(40),'o','markerfacecolor','b','MarkerEdgeColor','k','MarkerSize',10);

%% pic 5. 직교좌표계와 극좌표계의 관계를 표현하는 그림

figure('color','w','position',[680, 546, 620, 350]);
gca
xlim([-0.2, 2.5])
ylim([-0.2, 2])
set(gca,'visible','off');
mArrow2(0, 0, 2.5, 0, {'color','k','linewidth',1.5});
mArrow2(0, 0, 0, 2, {'color','k','linewidth',1.5});
text(2.5, -0.15, '실수 축','fontsize',12,'fontname','나눔고딕','HorizontalAlignment','center');
text(0, 2.1, '허수 축','fontsize',12,'fontname','나눔고딕','HorizontalAlignment','center');
text(-0.02, 0, '0','fontsize',12,'fontname','나눔고딕','HorizontalAlignment','right','VerticalAlignment','top');

mArrow2(0, 0, 2, 1.5, {'color', lines(1),'linewidth',2});
mArrow2(0, -0.1, 2, -0.1, {'color', [0.85, 0.325, 0.098], 'linewidth',2},'arrow_type','doublearrow');
mArrow2(2, 0.05, 2, 1.5-0.05, {'color', [0.85, 0.325, 0.098], 'linewidth',2},'arrow_type','doublearrow');
text(1, -0.2, '$$x$$', 'interpreter','latex','HorizontalAlignment','center','fontsize',15,'color', [0.85, 0.325, 0.098]);
text(2.1, 0.75, '$$y$$', 'interpreter','latex','HorizontalAlignment','center','fontsize',15,'color',[0.85, 0.325, 0.098]);
text(2.05, 1.5, '$$z=x+jy$$', 'interpreter','latex','HorizontalAlignment','left','fontsize',15,'color',[0.85, 0.325, 0.098]);

% th = linspace(0, atan(1.5/2)-0.05, 8);
% xx = 0.4 * cos(th);
% yy = 0.4 * sin(th);
% hold on;
% plot(xx, yy, 'k.','color',lines(1))

%% pic 6. 복소수의 합

plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true)

% z_1 = 0.5 - j, z_2 = 1 + j0.5
mArrow2(0, 0, 0.5, -1, {'color','k'})
mArrow2(0, 0, 1, 2, {'color','k'})
mArrow2(0, 0, 1.5, 1, {'color','r'})
mArrow2(1, 2, 1.5, 1, {'color','b','linestyle','--'})

%% pic 7. 복소수의 차

plotXY(-2.5, 2.5, -2.5, 2.5, 'newFigure', true,'complex_plane',true)

% z_1 = 0.5 - j, z_2 = 1 + j0.5
mArrow2(0, 0, 0.5, -1, {'color','k'})
mArrow2(0, 0, 1, 1, {'color','k'})
mArrow2(0, 0, 0.5, 2, {'color','r'})
mArrow2(1, 1, 0.5, 2, {'color','b','linestyle','--'})
mArrow2(0, 0, -0.5, 1, {'color',ones(1,3) * 0.5,'linestyle','--'})

%% pic 8. 복소수 곱셈 --> MATLAB에서 너무 안예쁨. PPT로 그림.

z1 = 1.3 * exp(1j * deg2rad(40));
z2 = 0.8 * exp(1j * deg2rad(120));
z3 = z1.* z2;

plotXY(-1.1, 1.1, 0, 1.1, 'newFigure', true,'complex_plane',true)
xlim([-1.1, 1.1]);
ylim([-0.1, 1.1])
axis tight
mArrow2(0,0, real(z1), imag(z1), {'color','k'})
mArrow2(0,0, real(z2), imag(z2), {'color','k'})
mArrow2(0,0, real(z3), imag(z3), {'color','r'})

th = linspace(0, 40, 100);
hold on;
plot(0.2 * cosd(th), 0.2 * sind(th),'k')

clear; close all; clc;

plot2DPlane(-1, 10, -1, 10, true)
hold on;

% line([1, 4], [3, 4],'linestyle','-','linewidth',5,'color','k')
% 
% line([4, 8], [4, 6],'linestyle','--','linewidth',1, 'color', 0.4 * ones(1,3))
% line([4, 8], [4, 4],'linestyle','--','linewidth',1, 'color', 0.4 * ones(1,3))
% line([4, 8], [4, 2],'linestyle','--','linewidth',1, 'color', 0.4 * ones(1,3))
% mArrow2(1,3,4-0.2,4-0.2,{'linestyle','-','linewidth',5,'color','k'})

plot(1, 3, 'o','markerfacecolor','w','markersize',15,'markeredgecolor','k')
plot(1, 3, 'o','markersize',10,'markerfacecolor','k','markeredgecolor','none')

plot(4, 4, 'o','markerfacecolor','w','markersize',15,'markeredgecolor','k')
plot(4, 4, 'o','markersize',10,'markerfacecolor','k','markeredgecolor','none')

plot(8, 6, 'o','markersize',10,'markerfacecolor',0.4 * ones(1,3), 'markeredgecolor','none')
plot(8, 4, 'o','markersize',10,'markerfacecolor',0.4 * ones(1,3), 'markeredgecolor','none')
plot(8, 2, 'o','markersize',10,'markerfacecolor',0.4 * ones(1,3), 'markeredgecolor','none')

line([1, 1],[-0.1, 0.1],'color','k')
line([4, 4],[-0.1, 0.1],'color','k')
line([8, 8],[-0.1, 0.1],'color','k')
set(gcf,'color','w')




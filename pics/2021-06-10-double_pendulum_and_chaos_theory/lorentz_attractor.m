clear; close all; clc;

global sigma beta rho

sigma = 10;
beta = 8/3;
rho = 28;

% x0vals = [...
%     1, 1, 1;
%     1, 1, -1;
%     1, -1, 1;
%     1, -1, -1;
%     -1, 1, 1;
%     -1, 1, -1;
%     -1, -1, 1;
%     -1, -1, -1;
%     ]*10;
rng(1)
x0vals = randn(8, 3)*10;

for i_x0 = 1:size(x0vals,1)
    [~,z{i_x0}] = ode45(@(t,z) lorenz_ode(z), [0, 100], x0vals(i_x0,:),odeset('RelTol',1e-3,'AbsTol', 1e-3, 'Refine',10));
end

hold on;
my_color = parula(size(x0vals,1));
clear h


% xlim, ylim, zlim 적절하게 결정
empty = [];
for i_x0 = 1:size(x0vals,1)
    empty =[empty; z{i_x0}];
end

newVid = VideoWriter('lorenz_attractor','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

for t=  1:3:3000
    for i_x0 = 1:size(x0vals,1)
        z2plot = z{i_x0};
        h(i_x0+size(x0vals,1)) = plot3(z2plot(1:t,1), z2plot(1:t,2), z2plot(1:t,3),'-','color',my_color(i_x0,:),'linewidth',2);
        h(i_x0) = plot3(z2plot(t,1), z2plot(t,2), z2plot(t,3),'o','markerfacecolor',my_color(i_x0,:),'markeredgecolor','k','markersize',10);

    end
    set(gcf,'color','w','position',[997, -45, 900, 1600])
    
    xlim([min(empty(:,1)), max(empty(:,1))]);
    ylim([min(empty(:,2)), max(empty(:,2))]);
    zlim([min(empty(:,3)), max(empty(:,3))]);
    view(16 + t/10, 22.8)
    set(gca,'visible','off')
    title('Lorenz System');
    
    
    writeVideo(newVid, getframe(gcf));
    drawnow;
    
    if t < 3000
        delete(h)
    end
    
end


close(newVid)
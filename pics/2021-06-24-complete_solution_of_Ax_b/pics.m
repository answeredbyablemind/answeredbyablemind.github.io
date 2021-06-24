clear; close all; clc;
current_dir = cd;
addpath(genpath(current_dir))

%%

n=10;
[X,Y]=meshgrid(linspace(-10,10,n));

plane1 = zeros(n,n);
plane2 = zeros(n,n);
plane3 = zeros(n,n);

for i = 1:n
    for j = 1:n
        plane1(i,j) = -X(i,j)-Y(i,j)+6;
        plane2(i,j) = 1/2*X(i,j) - 2;
        plane3(i,j) = 2*X(i,j) + Y(i,j) - 10;
    end
end

figure('position',[680, 107, 1140, 870],'color','w')
surf(X,Y,plane1,'edgecolor',ones(1,3)*0.6);
hold on;
surf(X,Y,plane2,'edgecolor',ones(1,3)*0.6);
surf(X,Y,plane3,'edgecolor',ones(1,3)*0.6);
alpha(0.2);

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
zlabel('$$z$$','interpreter','latex');
set(gca,'fontsize',12)

xlim([-10, 10])
ylim([-10, 10])
% zlim([-40, 40])
% line([-10, 10],[0, 0],[0, 0],'color','k','linewidth',2)
% line([0, 0], [-10, 10], [0, 0],'color','k','linewidth',2)
% line([0, 0], [0, 0], [-40, 40],'color','k','linewidth',2)

arrow3([0 0 -30],[0, 0, 30],'k-1.5')
arrow3([-10, 0, 0],[10, 0, 0],'k-1.5')
arrow3([0, -10, 0],[0, 10, 0],'k-1.5')
% set(gca,'visible','off')

t= linspace(-5,5,100);
z = [4;2;0] + t.* [2;-3;1];
plot3(z(1,:), z(2,:), z(3,:),'r','linewidth',2)

arrow3([0, 0, 0], [4, 2, 0],'b--2')

newVid = VideoWriter('Comp_Sol','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;

open(newVid);
for i = 1:360
    view([38+i, 16])
    
    writeVideo(newVid, getframe(gcf));
    drawnow;
end

close(newVid)

%% When a whole plane is a solution

figure('position',[680, 107, 1140, 870],'color','w')

plane4 = zeros(n,n);

for i = 1:n
    for j = 1:n
        plane4(i,j) = -X(i,j)-Y(i,j);
    end
end

surf(X,Y,plane4,'edgecolor',ones(1,3)*0.6);
hold on;
alpha(0.2);

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
zlabel('$$z$$','interpreter','latex');
set(gca,'fontsize',12)

xlim([-10, 10])
ylim([-10, 10])

arrow3([0 0 -30],[0, 0, 30],'k-1.5')
arrow3([-10, 0, 0],[10, 0, 0],'k-1.5')
arrow3([0, -10, 0],[0, 10, 0],'k-1.5')
% set(gca,'visible','off')


arrow3([0, 0, 0], [6, 0, 0],'b--2')

%% Thinking about the meaning of a null space in 3D vector space
% 이건 아무리해도 안 예쁘네... 젠장
ii=1;
for i_y = -2:2
    for i_x = -5:5
        pts(ii,:,1) = [i_x, i_y,-5];
        pts(ii,:,2) = [i_x, i_y, 5];
        ii=ii+1;
    end
    
    for i_z = -5:5
        pts(ii,:,1) = [-5, i_y, i_z];
        pts(ii,:,2) = [5, i_y, i_z];
        ii=ii+1;
    end
end

figure;

% A_final = [1, 1, 1;1, 0, -2;2, 1, -1];
A_final = [...
    1, 1, 1;
    1, 0, -2; ...
    2, 2, -1];
n_step = 30;
my_color = parula(11);
for i_step = 0:n_step
    
    A = eye(3) + (A_final - eye(3)) * i_step/n_step;
    
    new_pts = zeros(size(pts));
    for i= 1:size(pts,1)
        new_pts(i,:,1) = A*pts(i,:,1)';
        new_pts(i,:,2) = A*pts(i,:,2)';
    end
    
    for i = 1:size(pts,1)        
        temp1 = new_pts(i,:,1);
        temp2 = new_pts(i,:,2);
        
        line([temp1(1), temp2(1)], [temp1(2), temp2(2)], [temp1(3), temp2(3)],'color',my_color(pts(i,3,1)+6,:))
    end
    
    
    vec = [...
        1, 0, 1;
        1, 1, 1;
        0, 1, 1;
        0, 0, 1;
        1, 0, 0;
        1, 1, 0;
        0, 1, 0;
        0, 0, 0;
        ];

    plotcube(transpose(A*vec'));
    
    xlim([-5, 5])
    ylim([-5, 5])
    zlim([-5, 5])
    
    view([60, 24.4])
    set(gca,'visible','off')
    drawnow;
% pause;
    if i_step < n_step 
        cla;
    end
    
end


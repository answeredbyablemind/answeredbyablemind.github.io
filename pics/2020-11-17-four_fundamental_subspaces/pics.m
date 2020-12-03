clear; close all; clc;

addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
addpath('C:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

%% 좌표평면만 

%% 임의의 subspace

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, -1], [0, 1]);
h.Primitive.Color = [0, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 3]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 4]);
h.Primitive.Color = [0.2, 0.2, 1];
h.Primitive.LineWidth = 2;

line([-1, 1],[1, 4],'linestyle','--')
line([2, 1],[3, 4],'linestyle','--')

xx = linspace(-5,5,100);
yy1 = 2/3*xx+5/3;
plot(xx, yy1,'b');

%% subspace가 아닌 경우의 그림
figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 2], [0, 2]);
h.Primitive.Color = [0, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = xx;
plot(xx, yy1,'b');
%% 행렬 A = [2, 1; 4, 2]의 행공간과 영공간의 시각화

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 4], [0, 2]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 1/2 * xx;
plot(xx, yy1,'r');
yy2 = -2 * xx;
plot(xx, yy2, 'r--');

yy1 = 2 * xx;
plot(xx, yy1,'b:'); % 열공간
%% column space 그릴 것

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 2], [0, 4]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 2]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 2 * xx;
plot(xx, yy1,'b');
% yy2 = -1/2 * xx;
% plot(xx, yy2, 'b--');

%% 행렬 A = [2, 1; 4, 2]의 행공간과 영공간의 시각화

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 4], [0, 2]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 1/2 * xx;
plot(xx, yy1,'r');
yy2 = -2 * xx;
plot(xx, yy2, 'r--');

%% 행렬 A = [2, 1; 4, 2]의 행공간과 영공간 + 임의의 벡터 하나 더

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 4], [0, 2]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 2], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 1/2 * xx;
plot(xx, yy1,'r');
yy2 = -2 * xx;
plot(xx, yy2, 'r--');


h = Annotate(gca,'arrow', [0, 2], [0, 3]);
h.Primitive.Color = [0, 0.8, 0];
h.Primitive.LineWidth = 2;

%% 열공간과 left null space

figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-5, 5])
ylim([-5, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-5, 5]);

for i = -5:4
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -5:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(4.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.5, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

% row space and null space
h = Annotate(gca,'arrow', [0, 2], [0, 4]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

h = Annotate(gca,'arrow', [0, 1], [0, 2]);
h.Primitive.Color = [0, 0, 1];
h.Primitive.LineWidth = 2;

xx = linspace(-5,5,100);
yy1 = 2 * xx;
plot(xx, yy1,'b');
yy2 = -1/2 * xx;
plot(xx, yy2, 'b--');

%% 3차원인 경우의 null space 도시하기

% A = [1,2,3; 1,2,1;3,5,4];
% A = [1 2 3;2,1,4;3,4,1]; % shear
% A = [1,0,0;0,2,0;0,0,3]; % scaling
% A = [0,1,0; 1,0,0; 0,0,1] % xy permutation
% A = [1,0,0; 0,0,1; 0,1,0] % yz permutation
% A = [0,0,1; 0,1,0; 1,0,0] % xz permutation
% angle = pi/4; A = [1,0,0;0,cos(angle),-sin(angle);0,sin(angle),cos(angle)]; % rotation around x
% A=[1,0,0;0,1,0;0,0,0]; % projection on xy plane

vector1 = [-1,2,1]'; vector2 = [1,1,1]'; 
T = [vector1/norm(vector1) vector2/norm(vector2)]; % projection onto a plane defined with vectors 1 & 2
A = T*inv(T'*T)*T';
null_vec = null(A);

null_line1 = null_vec/null_vec(1) * 0.5;
null_line2 = null_line1 * (-1);

% animation with dots
[X,Y,Z] = ndgrid(-1:0.3:1);
n_steps = 100;
n_cam=50;
step_mtx = eye(3);
newXYZ=A*[X(:), Y(:), Z(:)]';
xyz_min=min(min(min([newXYZ(:),newXYZ(:),newXYZ(:)]')))*1.5;
xyz_max=max(max(max([newXYZ(:),newXYZ(:),newXYZ(:)]')))*1.5;
LIMS = [xyz_min, xyz_max];

dot_colors = jet(length(X(:)));

figure(2)
scatter3(X(:),Y(:),Z(:),30,dot_colors,'filled');
xlim(LIMS); ylim(LIMS); zlim(LIMS);
% axis off
grid on;
hold on;
line([xyz_min, xyz_max], [0,0], [0,0],'linewidth',3)
line([0,0], [xyz_min, xyz_max], [0,0],'linewidth',3)
line([0,0], [0,0], [xyz_min, xyz_max],'linewidth',3)
xlabel('x'); ylabel('y'); zlabel('z')
line([null_line1(1), null_line2(1)], [null_line1(2), null_line2(2)], [null_line1(3), null_line2(3)],'color','r','linewidth',3)

hold off;
pause;
for i_steps = 1:n_steps
    step_mtx = (A-eye(3))/n_steps*i_steps;
    
    new_xyz = (eye(3)+step_mtx)*[X(:), Y(:), Z(:)]';
    new_null_line1 = (eye(3)+step_mtx) * null_line1;
    new_null_line2 = (eye(3)+step_mtx) * null_line2;
    scatter3(new_xyz(1,:), new_xyz(2,:), new_xyz(3,:),30,dot_colors,'filled');
    grid on; hold on;
    
    line([xyz_min, xyz_max], [0,0], [0,0],'linewidth',1)
    line([0,0], [xyz_min, xyz_max], [0,0],'linewidth',1)
    line([0,0], [0,0], [xyz_min, xyz_max],'linewidth',1)
    
    line([new_null_line1(1), new_null_line2(1)], [new_null_line1(2), new_null_line2(2)], [new_null_line1(3), new_null_line2(3)],'color','r','linewidth',2)
    
    hold off;
    xlim(LIMS); ylim(LIMS); zlim(LIMS);
    xlabel('x'); ylabel('y'); zlabel('z')  
    pause(0.01);
end


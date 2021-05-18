clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 가장 기본적인 phase plane

figure;
% A = [1, 0;0, 1];
A = [0, 1;10, -3]
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

%% 가장 기본적인 phase plane (2)

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

my_color = lines(2);
for i = 1:2
    mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

%% A = [0, 1;1, 0]이라는 행렬에서 Euler Method 접목시켜보기

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

% my_color = lines(2);
% for i = 1:2
%     mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
% end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% 첫 스타트 포인트
x0 = [2; -1];
n_iter = 5;
my_color = lines(n_iter);

for i_iter = 1:n_iter
    temp = A * x0;
    dxdt = temp(1);
    dydt = temp(2);
    
    delta = 0.5;
    
    % 화살표 하나 그어주기
    quiver(x0(1), x0(2), dxdt * delta, dydt * delta, 0, 'color',my_color(i_iter,:),'linewidth',2,'maxheadsize',1)
    
    plot(x0(1), x0(2),'o','markerfacecolor','r','markeredgecolor','k')
    x0(1) = x0(1) + dxdt * delta;
    x0(2) = x0(2) + dydt * delta;
end


%% A = [0, 1;1, 0]이라는 행렬에서 Euler Method 접목시켜보기

figure;
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D]= eig(A);

hold on;

xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

% my_color = lines(2);
% for i = 1:2
%     mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
% end


xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% 첫 스타트 포인트 여러개로
x0s = [...
    2, -1;
    -1.5, 1;
    2, -2.5;
    -2, 2.5]';

for i_x0 = 1:size(x0s, 2)
    x0 = x0s(:,i_x0);
    n_iter = 5;
    my_color = lines(n_iter);
    
    for i_iter = 1:n_iter
        temp = A * x0;
        dxdt = temp(1);
        dydt = temp(2);
        
        delta = 0.5;
        
        % 화살표 하나 그어주기
        quiver(x0(1), x0(2), dxdt * delta, dydt * delta, 0, 'color',my_color(i_iter,:),'linewidth',2,'maxheadsize',1)
        
        plot(x0(1), x0(2),'o','markerfacecolor','r','markeredgecolor','k')
        x0(1) = x0(1) + dxdt * delta;
        x0(2) = x0(2) + dydt * delta;
    end
end
%% 가장 기본적인 phase plane + cosine & sine --> 비제차 미분방정식 쪽으로 넘길 내용

figure;
A = [1, 0;0, 1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3,...
    't',linspace(0, 4*pi, 100),'p',cos(linspace(0,4*pi,100)),'q',sin(linspace(0,4*pi,100)))

%% phase plane with linear transformation

h_record = false;
for i_matrix = 1:5
    matrix2choose = i_matrix;
    
    switch matrix2choose
        case 1
            A_final = [1, 2; 3, 2]; % one positive, one negative eigenvalue (real ones)
        case 2
            A_final = [2, 0; 0, 3]; % two positive eigenvalues
        case 3
            A_final = [-2, 0; 0, -3]; % two negative eigenvalues
        case 4
            A_final = [-3, 1; -2, -1]; % complex eigenvalues
        case 5
            A_final = [-1, 1;0, -1]; % repeated eigenvalues
    end
    
    if h_record
        newVid = VideoWriter(['phase_plane_case',num2str(matrix2choose)],'MPEG-4');
        
        newVid.FrameRate = 20;
        newVid.Quality = 100;
        open(newVid);
    end
    
    figure('color','w');
    n_step = 100;
    for i_step = 1:n_step
        A_step = (A_final - eye(2)) / n_step;
        
        A = eye(2) + A_step * i_step;
        
        fun_dirfield_system(@(x,y) A(1,1)*x+A(1,2)*y, @(x,y) A(2,1) * x+ A(2,2) * y, -3:0.3:3)
        %     title([num2str(i_step),'/',num2str(n_step)]);
        xlim([-3, 3])
        ylim([-3, 3])
        hold on;
        
        [V,D] = eig(A);
        
        if sum(abs(imag(V(:))))==0
            xx = linspace(-3,3,100);
            yy1 = V(2,1)/(V(1,1)+eps) * xx;
            yy2 = V(2,2)/(V(1,2)+eps) * xx;
            
            plot(xx, yy1,'color','k','linewidth',2);
            plot(xx, yy2,'color','k','linewidth',2);
            
            my_color = lines(2);
            for i = 1:2
                mArrow2(0, 0, V(1,i) * D(i,i), V(2,i) * D(i,i), {'linewidth',2,'color',my_color(i,:)});
            end
        end
        %
        %     dzdt = @(t,z) fun_phase_plane(z, A);
        %     opts = odeset('Refine',10);
        %     [t, z] = ode45(dzdt, [0, 10], [1; 0],opts);
        %     hold on;
        %     plot(z(:,1), z(:,2),'linewidth',2)
        %
        xlabel('$$x$$','interpreter','latex');
        ylabel('$$y$$','interpreter','latex');
        if h_record
            writeVideo(newVid, getframe(gcf));
        end
        
        drawnow;
        
        if i_step < n_step
            cla;
        end
    end
    
    for i = 1:10
        if h_record
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    if h_record
        close(newVid)
    end
    
end

%% complex eigenvalue에 대한 고찰
A = [-2, 6;-3, 4];
close all;
figure;
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3);

[V,D] = eig(A);

real(D(1,1))
t = linspace(0,1,100);
hold on;
val = exp(t).*exp(3i*t);
plot(real(val),imag(val),'o')
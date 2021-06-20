clear; close all; clc;

fn = cd;
fn = fullfile(fn, '..');
fn = [fn '\2021-05-11-modeling_with_systems'];
addpath(fn);
addpath('D:\angeloyeo.github.io\pics\');

%% 가장 기본적인 phase plane

figure;
A = [1, 0;0, 1];
% A = [0, 1;10, -3]

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

axis square

%% 가장 기본적인 phase plane (2)

figure;
axis square
A = [0, 1;1, 0];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3, 'stream',false)
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

axis square
% fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3, 'stream',true,'record', true)


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

%% A = [0, 1;1, 0]이라는 행렬에서 solution까지

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

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');

% 첫 스타트 포인트

% Analytic Solution
t = 0:1/100:10;
z = -3/2*[-1;1].*exp(-t) + 1/2 * [1;1].*exp(t);
plot(z(1,:), z(2,:),'linewidth',2,'color','r')
axis square
t2plot = find(ismember(t, 0:0.3:10));
my_color = lines(length(t2plot));
for i_t2plot = 1:length(t2plot)
    plot(z(1,t2plot(i_t2plot)), z(2,t2plot(i_t2plot)),'o','markerfacecolor',my_color(i_t2plot,:),'markeredgecolor',ones(1,3) * 0.4,'markersize',10,'linewidth',2)
end
% Numerical Solution
% x0 = [2; -1];
% clear z
% dzdt = @(t, z) my_difeq(z);
% [t, z] = ode45(dzdt, [0, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
% plot(z(:,1), z(:,2),'b--','linewidth',2)
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
%% 고윳값의 의미 확인

A = [0, 1;1, 0];
[V,~]= eig(A);
figure;
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)

hold on;

xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

plot(xx, yy1,'color','k','linewidth',2);
plot(xx, yy2,'color','k','linewidth',2);

xlim([-3, 3])
ylim([-3, 3])

% 첫 스타트 포인트 여러개로
x0 = [2, -1]';
x0_history = x0;

n_iter = 5;
my_color =[0, 0, 0; lines(n_iter)];
for i_iter = 1:n_iter
    temp = A * x0;
    dxdt = temp(1);
    dydt = temp(2);
    
    delta = 0.5;
    
    % 화살표 하나 그어주기
    quiver(x0(1), x0(2), dxdt * delta, dydt * delta, 0, 'color',0.4*ones(1,3),'linewidth',2,'maxheadsize',1)
    
    plot(x0(1), x0(2),'o','markerfacecolor',my_color(i_iter,:),'markeredgecolor','k','markersize',10)
    x0(1) = x0(1) + dxdt * delta;
    x0(2) = x0(2) + dydt * delta;
    x0_history = [x0_history, x0];
end

%% projections on eigenvectors (1)

A = [0, 1;1, 0];
[V,~]= eig(A);
figure('position',[1000, 558, 1020, 420]);
for i_vec = 1:2
    subplot(1,2,i_vec)
    % fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
    axis square
    hold on;
    
    xx = linspace(-3,3,100);
    yy1 = V(2,1)/(V(1,1)+eps) * xx;
    yy2 = V(2,2)/(V(1,2)+eps) * xx;
    
    plot(xx, yy1,'color','k','linewidth',1);
    plot(xx, yy2,'color','k','linewidth',1);
    
    xlim([-3, 3])
    ylim([-3, 3])
    
    % 첫 스타트 포인트 여러개로
    x0 = [2, -1]';
    
    n_iter = 5;
    my_color =[0, 0, 0; lines(n_iter)];
    for i_iter = 1:n_iter
        temp = A * x0;
        dxdt = temp(1);
        dydt = temp(2);
        
        delta = 0.5;
        x1 = (V(:,i_vec)'*x0) * V(:,i_vec);
        
        line([x0(1), x1(1)], [x0(2), x1(2)],'color',my_color(i_iter,:),'linestyle','-','linewidth',2)
        
        % 화살표 하나 그어주기
        quiver(x0(1), x0(2), dxdt * delta, dydt * delta, 0, 'color',0.6*ones(1,3),'linewidth',2,'maxheadsize',1,'linestyle','-')
        
        plot(x0(1), x0(2),'o','markerfacecolor',my_color(i_iter,:),'markeredgecolor','k','markersize',10)
        x0(1) = x0(1) + dxdt * delta;
        x0(2) = x0(2) + dydt * delta;
        grid on;
    end
    
    xlabel('$$x$$','interpreter','latex');
    ylabel('$$y$$','interpreter','latex');
    title([num2str(i_vec),'번째 고유벡터로 정사영'],'fontname','NanumBarunGothic')
end
%% projections on eigenvectors (2)
for i_vec = 1:2
    eigvec = V(:,i_vec);
    eigvec = sign(eigvec(1)) * eigvec;
    proj_on_eigvec = eigvec'*x0_history;
    figure('position',[1000, 558, 1140, 420]);
    
    subplot(1,2,1);
    mArrow2(0,0,max(proj_on_eigvec)+0.5,0, {'color','k','linewidth',1})
    xlim([0, max(proj_on_eigvec)+0.5])
    set(gca,'visible','off')
    
    xticks = get(gca,'xtick');
    for i_xtick = 1:length(xticks)
        line(xticks(i_xtick) * ones(1,2), [-0.01, 0.01],'color','k')
        text(xticks(i_xtick),-0.05,num2str(xticks(i_xtick)),'HorizontalAlignment','center')
    end
    text(mean(xlim), -0.15, [num2str(i_vec),'번 고유벡터 위에서의 좌표'],'HorizontalAlignment','center','fontsize',12)
    ylim([-0.5, 0.5])
    
    hold on;
    for i_x0 = 1:length(x0_history)
        subplot(1,2,1);
        plot(proj_on_eigvec(i_x0),0, 'o','markerfacecolor',my_color(i_x0,:),'markeredgecolor','k','markersize',10)
        
        subplot(1,2,2);
        hold on;
        plot(i_x0-1, proj_on_eigvec(i_x0),'o','markerfacecolor',my_color(i_x0,:),'markeredgecolor','k','markersize',10)
        hold on;
        xlabel('순번');
        ylabel([num2str(i_vec),'번 고유벡터 위에서의 좌표'])
        grid on;
        %         text(i_x0-1, proj_on_eigvec(i_x0)+ 0.15, num2str(i_x0-1))
    end
end


%% 가장 기본적인 phase plane + cosine & sine --> 비제차 미분방정식 쪽으로 넘길 내용

figure;
A = [1, 0;0, 1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3,-3:0.3:3,...
    't',linspace(0, 4*pi, 100),'p',cos(linspace(0,4*pi,100)),'q',sin(linspace(0,4*pi,100)),'stream',false)

%% phase plane with particle movement

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
    
    figure('color','w','position',[680, 558, 1090, 420]);
    n_step = 100;
    
    subplot(1,2,1);
    fun_dirfield_system(@(x,y) A_final(1,1)*x+A_final(1,2)*y, @(x,y) A_final(2,1) * x+ A_final(2,2) * y, -3:0.3:3,-3:0.3:3, 'stream',false)
    xlim([-3, 3])
    ylim([-3, 3])
    hold on;
    
    [V,D] = eig(A_final);
    
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
    
    subplot(1,2,2);
    fun_dirfield_system(@(x,y) A_final(1,1)*x+A_final(1,2)*y, @(x,y) A_final(2,1) * x+ A_final(2,2) * y, -3:0.3:3,-3:0.3:3,...
        'stream',true,'record',true,'filename',['phase_plane_with_particle_case',num2str(i_matrix)])
    xlim([-3, 3])
    ylim([-3, 3])
end

%% 선형 변환 애니메이션 다시 만들기 + eigenvector 위의 arrow 들은 변하지 않음을 명확히 보여줄 것

A_final = [0, 1;1, 0];
n_step = 100;

figure('color','w');

h_specify_eigenvector = true;
h_record = true;

if h_specify_eigenvector
    filename = 'phase_plane_as_linear_transformation_with_eig';
else
    filename = 'phase_plane_as_linear_transformation';
end

if h_record
    newVid = VideoWriter(filename,'MPEG-4');
    
    newVid.FrameRate = 20;
    newVid.Quality = 100;
    open(newVid);
end

for i_step = 1:n_step
    A_step = (A_final - eye(2)) / n_step;
    
    A = eye(2) + A_step * i_step;
    func_dxdt = @(x,y) A(1,1) * x + A(1,2) * y;
    func_dydt = @(x,y) A(2,1) * x + A(2,2) * y;
    xval = -3:0.3:3;
    yval = -3:0.3:3;
    h_quiver = fun_dirfield_system(func_dxdt, func_dydt, xval, yval,'stream',false,'record',false);
    
    % eigenvector 위의 arrow들만 색깔 추가해주기
    if h_specify_eigenvector
        [V,D] = eig(A);
        
        [xm,ym]=meshgrid(xval, yval);
        
        idx = xm == ym | xm == -ym;
        
        xp=feval(func_dxdt,xm,ym);
        yp=feval(func_dydt,xm,ym);
        
        xp(~idx) = nan;
        yp(~idx) = nan;
        
        hold on;
        s = sqrt(xp.^2+yp.^2); % 모든 quiver는 방향만 나타내면 되므로 크기로 정규화 하겟음.
        h_quiver2 = quiver(xval,yval,xp./s,yp./s, 1,'color','r','linewidth',1.5);
    end
    
    grid on;
    axis square;
    
    xlim([-3, 3])
    ylim([-3, 3])
    xlabel('$$x$$','interpreter','latex');
    ylabel('$$y$$','interpreter','latex');
    
    if h_record
        writeVideo(newVid, getframe(gcf));
    end
    
    pause(0.01);
    if i_step < n_step
        delete([h_quiver, h_quiver2])
    end
end



if h_record
    for i = 1:20
        writeVideo(newVid, getframe(gcf));
    end
    close(newVid)
end

%%

figure('color','w');
hold on;
plot(1*cos(acos(1/sqrt(5))), 1*sin(acos(1/sqrt(5))),'ko','linewidth',2);
line([0, cos(acos(1/sqrt(5)))], [0, sin(acos(1/sqrt(5)))],'linestyle','-','color','k')

theta = linspace(0, acos(1/sqrt(5)), 100);
r = 0.15;
plot(r*cos(theta), r*sin(theta),'k')

theta= linspace(0, 2*pi,100);
r = 1;
plot(r*cos(theta), r*sin(theta),'--','color',lines(1));
plotComplexPlane(-2,2,-2,2,false)
text(0.17, 0.118, '$$\theta$$','interpreter','latex','fontsize',15)
text(0.519, 1.085,'$$e^{i\theta}$$','interpreter','latex','fontsize',20)


%% 회전하면서 값이 점점 커지는 케이스

newVid = VideoWriter('rotate_and_bigger','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w','position',[680, 334, 1045, 644]);
hold on;
plotComplexPlane(-5,5,-5,5,false)

n_step = 500;
thetas = linspace(0, 10*pi, n_step);
rs = exp(linspace(0, 2, n_step));

clear h

trail = rs.*exp(1i*thetas);

plot(real(trail), imag(trail),'k--');

n_step = 100;
thetas = linspace(0, 10*pi, n_step);
rs = exp(linspace(0, 2, n_step));

for i_step = 1:n_step
    r = rs(i_step);
    theta = thetas(i_step);
    pos = r*exp(1i*theta);
    h(1) = plot(real(pos), imag(pos),'ro','linewidth',2);
    h(2) = line([0, real(pos)], [0, imag(pos)],'color','r','linewidth',2);
    h(3) = text(3.9, -3.8, ['$$\theta =',sprintf('%.2f',theta),', r = ',sprintf('%.2f',r),'$$'],'interpreter','latex','fontsize',15);
    
    writeVideo(newVid, getframe(gcf));
    
    
    drawnow;
    if i_step < n_step
        delete(h);
    end
    
end

close(newVid)

%% 중복 고윳값을 갖는 케이스?

figure;
A = [3, 1;0, 3];
fun_dirfield_system(@(x,y) A(1,1)*x+A(1,2)*y, @(x,y) A(2,1) * x+ A(2,2) * y, -3:0.3:3,-3:0.3:3, 'stream',false);
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


%% 중근 고윳값 갖는 경우

figure;
A = [-1, 1;0, -1];
fun_dirfield_system(@(x,y) A(1,1) * x + A(1,2) * y, @(x,y) A(2,1) * x + A(2,2) * y,-3:0.3:3)
[V,D] = eig(A);

hold on;

xlim([-3, 3])
ylim([-3, 3])

xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');


xx = linspace(-3,3,100);
yy1 = V(2,1)/(V(1,1)+eps) * xx;
yy2 = V(2,2)/(V(1,2)+eps) * xx;

if D(1,1) < 0
    color = lines(1);
else
    color = lines(2);
    color = color(2,:);
end

plot(xx, yy1,'color',color,'linewidth',2);

if D(2,2) < 0
    color = lines(1);
else
    color = lines(2);
    color = color(2,:);
end

plot(xx, yy2,'color',color,'linewidth',2);

% Numerical Solution
x0s = [5, 0; 1, 2.5;-1, -2.5;-1, 2.5;2.5, -2;-2.5, 1];

for i_x0 = 1:size(x0s,1)
    x0 = x0s(i_x0,:);
    clear z
    dzdt = @(t, z) my_difeq4(z);
    [~, z] = ode45(dzdt, [-10, 10], x0, odeset('RelTol', 1e-3, 'AbsTol', 1e-3,'Refine',10));
    plot(z(:,1), z(:,2),'b-','linewidth',1.5)
end


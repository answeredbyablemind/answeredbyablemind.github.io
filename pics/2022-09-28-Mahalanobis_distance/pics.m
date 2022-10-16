clear; close all; clc;
rng('default')

%%
X = mvnrnd([0;0], [1,0;0,1], 1000);

figure;
scatter(X(:,1), X(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2)
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-7, 7]);
ylim([-7, 7]);
set(gca,'visible','off')


%%
X = mvnrnd([0;0], [3,2;2, 4], 1000);

figure;
scatter(X(:,1), X(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2)
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-7, 7]);
ylim([-7, 7]);
set(gca,'visible','off')



%% Cholesky 분해를 이용해 시각화하는 방법도 있음
R = chol([3,2;2,4]);
rng('default')
X = randn(1000,2);
X_new = X * R;

figure;

plot(X_new(:,1), X_new(:,2),'o','markerfacecolor',lines(1),'markeredgecolor','none');
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-7, 7]);
ylim([-7, 7]);

% S_new = (X_new - mean(X_new))'*(X_new - mean(X_new))/(1000-1);
S_new = 1/1000*X_new'*X_new;
% 이것은 R'*transpose(R')과 동일한 결과임.
R'*transpose(R')
S_new
%% 
d_m = sqrt(mahal([4, 4; 4, -4; -4, -4; -4, 4], X_new))

D_inv = inv(R')*transpose([4, 4; 4, -4; -4, -4; -4, 4]);
sqrt(sum(D_inv.^2))



%% pic 6
R = chol([3,2;2,4]);
rng('default')
X_ori = randn(1000,2);

theta = transpose(linspace(0, 2*pi, 1000));
circle1 = [1 * cos(theta), 1 * sin(theta)];
circle2 = [2 * cos(theta), 2 * sin(theta)];
circle3 = [3 * cos(theta), 3 * sin(theta)];
circle4 = [4 * cos(theta), 4 * sin(theta)];

my_color = lines(4);
my_color(1,:) = [0,0,0];
figure('position',[753, 233, 1811, 745]);
subplot(1,2,1)
h1=scatter(X_ori(:,1), X_ori(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
hold on;
h2 = plot(circle1(:,1), circle1(:,2), 'color', my_color(1,:),'linewidth',3);
h3 = plot(circle2(:,1), circle2(:,2), 'color', my_color(2,:),'linewidth',3);
h4 = plot(circle3(:,1), circle3(:,2), 'color', my_color(3,:),'linewidth',3);
h5 = plot(circle4(:,1), circle4(:,2), 'color', my_color(4,:),'linewidth',3);
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);
legend([h1, h2, h3, h4, h5], 'data', '1\sigma (68%)','2\sigma (95%)','3\sigma (99.7%)', '4\sigma','location','SE')
set(gca,'fontsize',15)
title('(a)')

subplot(1,2,2)
X_new = X_ori * R;
circle1_new = circle1 * R;
circle2_new = circle2 * R;
circle3_new = circle3 * R;
circle4_new = circle4 * R;

h1 = scatter(X_new(:,1), X_new(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
hold on;
h2 = plot(circle1_new(:,1), circle1_new(:,2), 'color', my_color(1,:),'linewidth',3);
h3 = plot(circle2_new(:,1), circle2_new(:,2), 'color', my_color(2,:),'linewidth',3);
h4 = plot(circle3_new(:,1), circle3_new(:,2), 'color', my_color(3,:),'linewidth',3);
h5 = plot(circle4_new(:,1), circle4_new(:,2), 'color', my_color(4,:),'linewidth',3);
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);
legend([h1, h2, h3, h4, h5], 'data', '1\sigma (68%)','2\sigma (95%)','3\sigma (99.7%)', '4\sigma','location','SE')

axis square
set(gca,'fontsize',15)
title('(b)')

%% pic 7
R = chol([3,2;2,4]);
rng('default')
X_ori = randn(1000,2);

theta = transpose(linspace(0, 2*pi, 1000));
circle1 = [1 * cos(theta), 1 * sin(theta)];
circle2 = [2 * cos(theta), 2 * sin(theta)];
circle3 = [3 * cos(theta), 3 * sin(theta)];
circle4 = [4 * cos(theta), 4 * sin(theta)];

my_color = lines(4);
my_color(1,:) = [0,0,0];
figure('position',[753, 233, 1811, 745]);
subplot(1,2,1)
h1=scatter(X_ori(:,1), X_ori(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
hold on;
h2 = plot(circle1(:,1), circle1(:,2), 'color', my_color(1,:),'linewidth',3);
h2.Color(4) = 0.2;
h3 = plot(circle2(:,1), circle2(:,2), 'color', my_color(2,:),'linewidth',3);
h3.Color(4) = 0.2;
h4 = plot(circle3(:,1), circle3(:,2), 'color', my_color(3,:),'linewidth',3);
h4.Color(4) = 0.2;
h5 = plot(circle4(:,1), circle4(:,2), 'color', my_color(4,:),'linewidth',3);
h5.Color(4) = 0.2;

xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);
set(gca,'fontsize',15)
title('(a)')
set(gca,'visible','off')

subplot(1,2,2)
X_new = X_ori * R;
circle1_new = circle1 * R;
circle2_new = circle2 * R;
circle3_new = circle3 * R;
circle4_new = circle4 * R;

h1 = scatter(X_new(:,1), X_new(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
hold on;
h2 = plot(circle1_new(:,1), circle1_new(:,2), 'color', my_color(1,:),'linewidth',3);
h2.Color(4) = 0.2;
h3 = plot(circle2_new(:,1), circle2_new(:,2), 'color', my_color(2,:),'linewidth',3);
h3.Color(4) = 0.2;
h4 = plot(circle3_new(:,1), circle3_new(:,2), 'color', my_color(3,:),'linewidth',3);
h4.Color(4) = 0.2;
h5 = plot(circle4_new(:,1), circle4_new(:,2), 'color', my_color(4,:),'linewidth',3);
h5.Color(4) = 0.2;
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);

axis square
set(gca,'fontsize',15)
title('(b)')
set(gca,'visible','off')


%% pic 10
R = chol([3,2;2,4]);
rng('default')
X_ori = randn(1000,2);

theta = transpose(linspace(0, 2*pi, 1000));

my_color = lines(4);
my_color(1,:) = [0,0,0];
figure('position',[753, 233, 1811, 745]);
subplot(1,2,1)
scatter(X_ori(:,1), X_ori(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);
set(gca,'fontsize',15)
title('(a)')
set(gca,'visible','off')

subplot(1,2,2)
X_new = X_ori * R;

h1 = scatter(X_new(:,1), X_new(:,2),80, lines(1),'filled','MarkerFaceAlpha', 0.2);
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-10, 10]);
ylim([-10, 10]);

axis square
set(gca,'fontsize',15)
title('(b)')
set(gca,'visible','off')

%% types of bivariate gaussian

bi_norm = @(x, mu, S) (2*pi)^(-1)/sqrt(det(S))*exp(-1/2*(x-mu)'*inv(S)*(x-mu));

[X, Y] = meshgrid(linspace(-1,1,100));
mu = [0; 0];
S1 = [2,1;1,3]/2;
S2 = [2,-1;-1,3]/2;
S3 = [1,0;0,1];
z1 = zeros(100,100);
z2 = zeros(100,100);
z3 = zeros(100,100);

for i = 1:100
    for j = 1:100
        x = [X(i,j); Y(i,j)];
        z1(i,j) = bi_norm(x, mu, S1);
        z2(i,j) = bi_norm(x, mu, S2);
        z3(i,j) = bi_norm(x, mu, S3);
    end
end

figure('position',[422, 558, 2114, 420]);
subplot(1,3,1);
imagesc(linspace(-1,1,100), linspace(-1,1,100), z1)
hold on;
contour(linspace(-1,1,100), linspace(-1,1,100), z1,'color','k')
plot(-0.8, -0.8, 'w+','markersize',20,'linewidth',3)
set(gca,'ydir','normal')
colorbar;
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
set(gca,'fontsize',11)

subplot(1,3,2);
imagesc(linspace(-1,1,100), linspace(-1,1,100), z2)
hold on;
contour(linspace(-1,1,100), linspace(-1,1,100), z2,'color','k')
plot(-0.8, -0.8, 'w+','markersize',20,'linewidth',3)
set(gca,'ydir','normal')
colorbar
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
set(gca,'fontsize',11)

subplot(1,3,3);
imagesc(linspace(-1,1,100), linspace(-1,1,100), z3)
hold on;
contour(linspace(-1,1,100), linspace(-1,1,100), z3,'color','k')
plot(-0.8, -0.8, 'w+','markersize',20,'linewidth',3)
set(gca,'ydir','normal')
colorbar
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
set(gca,'fontsize',11)

%% types of bivariate gaussian

bi_norm = @(x, mu, S) (2*pi)^(-1)/sqrt(det(S))*exp(-1/2*(x-mu)'*inv(S)*(x-mu));

[X, Y] = meshgrid(linspace(-1,1,100));
mu = [0; 0];
S1 = [2,1;1,3]/2;
z1 = zeros(100,100);

for i = 1:100
    for j = 1:100
        x = [X(i,j); Y(i,j)];
        z1(i,j) = bi_norm(x, mu, S1);
    end
end

figure;
imagesc(linspace(-1,1,100), linspace(-1,1,100), z1)
hold on;
contour(linspace(-1,1,100), linspace(-1,1,100), z1,'color','k')
plot(-0.8, -0.8, 'w+','markersize',20,'linewidth',3)
set(gca,'ydir','normal')
colorbar;
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
set(gca,'fontsize',11)
axis square
[V,D] = eig(S1);

quiver(0,0, V(1,1), V(2,1),'color',[0.85, 0.325, 0.098],'linewidth',2)
quiver(0,0, V(1,2), V(2,2),'color',[0, 0.4470, 0.7410],'linewidth',2);

%% movie clip: change in covariance matrix

bi_norm = @(x, mu, S) (2*pi)^(-1)/sqrt(det(S))*exp(-1/2*(x-mu)'*inv(S)*(x-mu));

[X, Y] = meshgrid(linspace(-1,1,100));
mu = [0; 0];
S1 = [1,0;0,1];
S2 = [2,1;1,3]/2;
z1 = zeros(100,100);
z2 = zeros(100,100);

for i = 1:100
    for j = 1:100
        x = [X(i,j); Y(i,j)];
        z1(i,j) = bi_norm(x, mu, S1);
        z2(i,j) = bi_norm(x, mu, S2);
    end
end

n_step = 100;

newVid = VideoWriter('pic_cov_change', 'MPEG-4'); % New
newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

for i_step = 0:n_step

    z = z1 + i_step / n_step * (z2-z1);
    imagesc(linspace(-1,1,100), linspace(-1,1,100), z)
    hold on;
    contour(linspace(-1,1,100), linspace(-1,1,100), z,'color','k')
    plot(-0.8, -0.8, 'w+','markersize',20,'linewidth',3)
    set(gca,'ydir','normal')
    colorbar;
    xlabel('$x_1$','interpreter','latex')
    ylabel('$x_2$','interpreter','latex')
    set(gca,'fontsize',11)

        writeVideo(newVid, getframe(gcf))

    if i_step == n_step || i_step == 0
        for ii = 1:30
        writeVideo(newVid, getframe(gcf));
        end
    end
    drawnow;
    if i_step < n_step
        cla
    end

    
end

close(newVid)


%% alien dataset
close all;
R = chol([3,2;2,4]);
rng('default')
X = randn(1000,2) * R;

min(X)

height = X(:,1) + 10;
weight = X(:,2) + 8;

figure('position',[1000, 558, 1437, 420]);
subplot(1,2,1);
histogram(height);
xlabel('height'); ylabel('frequency')
grid on;
title('height of martians') 
subplot(1,2,2);
histogram(weight)
xlabel('weight'); ylabel('frequency')
grid on;
title('weight of martians')

round([height(1:5), weight(1:5)])

[height, weight]

figure;
scatter(height, weight,80, lines(1),'filled','MarkerFaceAlpha', 0.2);
xlabel('height (cm)')
ylabel('weight (kg)')
grid on;
title('distribution of $$\mathcal{D}$$','interpreter','latex')

xlim([2, 18])
ylim([0, 16])


figure('position',[1000, 558, 1448, 420]);
subplot(1,2,1)
scatter(height, weight,80, lines(1),'filled','MarkerFaceAlpha', 0.2);
xlabel('height (cm)')
ylabel('weight (kg)')
grid on;
title('distribution of $$\mathcal{D}$$','interpreter','latex')

xlim([2, 18])
ylim([0, 16])

subplot(1,2,2)
scatter(height-10, weight-8,80, lines(1),'filled','MarkerFaceAlpha', 0.2);
xlabel('x_1')
ylabel('x_2')
grid on;
title('distribution of $$X$$','interpreter','latex')

xlim([2, 18]-10)
ylim([0, 16]-8)
clear; close all; clc;
rng(1)

%% 클러스터링 문제 설명 위한 그림
% pic 1
S1 = [0.2, 1;1, 0.3] /10;
S2 = [0.3, -1; -1, 0.2] /10;
n = 500;
clust1 = randn(n,2) * S1 + repmat([0.2, 0.2], n, 1);
clust2 = randn(n,2) * S2 + repmat([0.8, 0.8], n, 1);

figure;
plot(clust1(:,1), clust1(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none')
hold on;
plot(clust2(:,1), clust2(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none');
grid on;
xlabel('x');
ylabel('y');

%% pic 2
% pic 1
my_color = lines(2);

figure;
plot(clust1(:,1), clust1(:,2),'o','markerfacecolor',my_color(1,:),'markeredgecolor','none')
hold on;
plot(clust2(:,1), clust2(:,2),'o','markerfacecolor',my_color(2,:),'markeredgecolor','none');
grid on;
xlabel('x');
ylabel('y');

%%
% 
clust = [clust1; clust2];
% [idx, centroids] = kmeans(clust ,2);
% 
% figure;
% plot(clust(idx==1,1), clust(idx==1,2),'o');
% hold on;
% plot(clust(idx==2,1), clust(idx==2,2),'o');
% 
% plot(centroids(1,1), centroids(1,2),'kx','linewidth',3,'markersize',15);
% plot(centroids(2,1), centroids(2,2),'kx','linewidth',3,'markersize',15);
    
%% k-means를 직접 구현하기

% initializing the cluster centroids (k = 2)
mu = [1, 0; 0, 1]; % (1,0)과 (0,1)로 두 개의 centroid를 잡고 시작함.

epoch_lim = 10000;
epoch = 1;

x = clust;
m = size(x, 1);
c = zeros(1, m); % 각 데이터들에게 주어진 라벨
figure;
plot(x(:,1), x(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none');
hold on;
plot(mu(1,1), mu(1,2),'x','color','k','linewidth',5,'markersize',17);
plot(mu(1,1), mu(1,2),'x','color',my_color(1,:),'linewidth',3,'markersize',15);
plot(mu(2,1), mu(2,2),'x','color','k','linewidth',5,'markersize',17);
plot(mu(2,1), mu(2,2),'x','color',my_color(2,:),'linewidth',3,'markersize',15);
grid on;
xlabel('x');
ylabel('y');

pause;

while(1)
    mu_old = mu;
    for i = 1:m
        [~, c(i)] = min(sum(sqrt((x(i,:) - mu).^2), 2));
    end
    
    for j = 1:2
        mu(j,:) = sum(x(c==j,:)) / sum(c == j);
    end
    
    cla;
    plot(x(c==1,1), x(c==1,2),'o','markerfacecolor',my_color(1,:),'markeredgecolor','none')
    hold on;
    plot(x(c==2,1), x(c==2,2),'o','markerfacecolor',my_color(2,:),'markeredgecolor','none')
    
    plot(mu(1,1), mu(1,2),'x','color','k','linewidth',5,'markersize',17);
    plot(mu(1,1), mu(1,2),'x','color',my_color(1,:),'linewidth',3,'markersize',15);
    plot(mu(2,1), mu(2,2),'x','color','k','linewidth',5,'markersize',17);
    plot(mu(2,1), mu(2,2),'x','color',my_color(2,:),'linewidth',3,'markersize',15);
    pause;
    
    if sum(sum((mu_old - mu).^2))<0.01 || epoch > epoch_lim
        break % run until convergence
    end
    
    epoch = epoch + 1;
end


%% k-means를 직접 구현하기 (녹화하기)

newVid = VideoWriter('pic3', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

% initializing the cluster centroids (k = 2)
mu = [1, 0; 0, 1]; % (1,0)과 (0,1)로 두 개의 centroid를 잡고 시작함.

epoch_lim = 10000;
epoch = 1;

x = clust;
m = size(x, 1);
c = zeros(1, m); % 각 데이터들에게 주어진 라벨
figure('color','w');
plot(x(:,1), x(:,2),'o','markerfacecolor',ones(1,3) * 0.4,'markeredgecolor','none');
hold on;
plot(mu(1,1), mu(1,2),'x','color','k','linewidth',5,'markersize',17);
plot(mu(1,1), mu(1,2),'x','color',my_color(1,:),'linewidth',3,'markersize',15);
plot(mu(2,1), mu(2,2),'x','color','k','linewidth',5,'markersize',17);
plot(mu(2,1), mu(2,2),'x','color',my_color(2,:),'linewidth',3,'markersize',15);
grid on;
xlabel('x');
ylabel('y');

t = text(0.6, 0.4,'Random Initialization','fontsize',12,'fontweight','bold','fontname','나눔고딕');

for i = 1:15 % 첫장면 750 ms 대기
    writeVideo(newVid, getframe(gcf))
end

while(1)
    mu_old = mu;
    for i = 1:m
        [~, c(i)] = min(sum(sqrt((x(i,:) - mu).^2), 2));
    end
    
    for j = 1:2
        mu(j,:) = sum(x(c==j,:)) / sum(c == j);
    end
    
    cla; delete(t);
    plot(x(c==1,1), x(c==1,2),'o','markerfacecolor',my_color(1,:),'markeredgecolor','none')
    hold on;
    plot(x(c==2,1), x(c==2,2),'o','markerfacecolor',my_color(2,:),'markeredgecolor','none')
    
    plot(mu(1,1), mu(1,2),'x','color','k','linewidth',5,'markersize',17);
    plot(mu(1,1), mu(1,2),'x','color',my_color(1,:),'linewidth',3,'markersize',15);
    plot(mu(2,1), mu(2,2),'x','color','k','linewidth',5,'markersize',17);
    plot(mu(2,1), mu(2,2),'x','color',my_color(2,:),'linewidth',3,'markersize',15);
    
    t = text(0.6, 0.4,['Epoch: ',num2str(epoch)],'fontsize',12,'fontweight','bold','fontname','나눔고딕');

    for i = 1:15 % 장면마다 750 ms 만큼 할애
        writeVideo(newVid, getframe(gcf))
    end
    
    if sum(sum((mu_old - mu).^2))<0.01 || epoch > epoch_lim
        delete(t)
        t = text(0.6, 0.4,sprintf('알고리즘 수렴함. \n 종료합니다.'),'fontsize',12,'fontweight','bold','fontname','나눔고딕');
        break % run until convergence
    end
    
    epoch = epoch + 1;
end

for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)
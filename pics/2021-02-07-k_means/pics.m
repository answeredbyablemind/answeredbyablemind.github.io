clear; close all; clc;

%% 클러스터링 문제 설명 위한 그림

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
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
X_new = randn(1000,2) * R;

figure;

plot(X(:,1), X(:,2),'o','markerfacecolor',lines(1),'markeredgecolor','none');
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-7, 7]);
ylim([-7, 7]);

S_new = (X_new - mean(X_new))'*(X_new - mean(X_new))/(1000-1);

%%
X = randn(200,2) * [3,2;2,4];

chol(X'*X/200)

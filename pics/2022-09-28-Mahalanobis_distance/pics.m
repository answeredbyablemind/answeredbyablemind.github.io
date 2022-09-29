clear; close all; clc;
rng('default')

X = mvnrnd([0;0], [3,2;2, 4], 1000);

figure;
plot(X(:,1), X(:,2),'o','markerfacecolor',lines(1),'markeredgecolor','none');
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;
xlim([-7, 7]);
ylim([-7, 7]);

% S = (X-mean(X))'*(X-mean(X))/(1000-1);
% X_p= X* inv(S);
% hold on;
% plot(X_p(:,1), X_p(:,2),'o','markerfacecolor',[0.85, 0.325, 0.098], 'markeredgecolor','none')

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

clear; close all; clc;
rng(2)
x1 = randn(1,200) * 0.3;
x2 = randn(1,200) * 0.3;

X = [3,2;2,4] * [x1; x2];

x1 = X(1,:);
x2 = X(2,:);

figure;
plot(x1, x2,'o','markerfacecolor',lines(1),'markeredgecolor','none');
xlabel('$$x_1$$','interpreter','latex');
ylabel('$$x_2$$','interpreter','latex');
grid on;


S = X*X'/200;

X_p= inv(S)*X;
hold on;
plot(X_p(1,:), X_p(2,:),'o','markerfacecolor',[0.85, 0.325, 0.098], 'markeredgecolor','none')


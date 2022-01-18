clear; close all; clc;

n = -9:10;
c = zeros(1, length(n));

c(n==1) = 1;
c(n==2) = 3;

figure('position', [680, 802, 778, 230]);
stem(n, c ,'color','k','linewidth',2)
ylim([-0.5, 3.5])
grid on;
xlabel('$$i$$','interpreter','latex');
ylabel('$$c_i$$','interpreter','latex');
set(gca,'fontsize',12)
title('계수 c_i를 이용한 스펙트럼 표현');
text(0.2, c(n==1), '$$c_1$$','Interpreter','latex','fontsize',15)
text(1.2, c(n==2), '$$c_2$$','Interpreter','latex','fontsize',15)
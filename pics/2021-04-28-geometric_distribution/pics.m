clear; close all; clc;

ps = [0.2, 0.5, 0.8];
my_color = lines(3);

f = @(p, k) p*(1-p).^(k-1);
xx = 1:10;

for i_ps = 1:length(ps)
    p = ps(i_ps);
    Pr(i_ps,:) = f(p, xx);
end

%%
figure;
hold on;
clear h
for i =1:3
    h(i) = plot(xx, Pr(i,:),'o-','markerfacecolor',my_color(i,:),'markeredgecolor','k','color','k','markersize',8,'linewidth',1.2);
end
xlim([0, 10])
grid on;
xlabel('처음 성공한 회차 k');
ylabel('Pr(K=k)');
ylim([-0.05, 0.85])
title('기하 분포의 확률질량함수')
legend(h, 'p = 0.2', 'p = 0.5', 'p = 0.8');
set(gca,'fontname','나눔고딕');

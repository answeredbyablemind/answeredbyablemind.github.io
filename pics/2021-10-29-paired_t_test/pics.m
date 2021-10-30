clear; close all; clc;
placebo = [788,859,928,957,994,1034,1049,1078,1110,1147];
drug = [849,879,910,1019,1145,1003,1114,1162,1201,1184];

grp = [zeros(1,10), ones(1,10)];

figure('position',[680, 558, 750, 420]);
subplot(1,2,1)
hold on;
plot(grp, [placebo, drug],'o','markerfacecolor',lines(1),'markeredgecolor','k')
xlim([-1, 2])
ylim([600, 1400])
grid on;
set(gca,'xtick',[0, 1]);
set(gca,'xticklabel',{'플라시보','처치약'})
ylabel('일일 소변량 (mL/d)');
title('A');
% set(gca,'fontname','나눔고딕')

subplot(1,2,2);
hold on;
xlim([-1, 2])
ylim([600, 1400])

for i = 1:10
    plot([0, 1], [placebo(i), drug(i)],'k');
end
plot(grp, [placebo, drug],'o','markerfacecolor',lines(1),'markeredgecolor','k')

grid on;
set(gca,'xtick',[0, 1]);
set(gca,'xticklabel',{'플라시보','처치약'})
ylabel('일일 소변량 (mL/d)');
title('B');
% set(gca,'fontname','나눔고딕')

%% independent t-test 수행 시

[h, p, ci, stats] = ttest2(placebo, drug); % 검증용

n1 = length(placebo);
n2 = length(drug);

mn1 = mean(placebo);
mn2 = mean(drug);
s1 = std(placebo);
s2 = std(drug);
s_pool = sqrt(s1^2/n1 + s2^2/n2);
my_t = (mn1-mn2)/s_pool

%% paired sample t-test 수행 시

[h,p,ci,stat] = ttest(placebo, drug); % 검증용
d = placebo - drug;
d_bar = mean(d);
s_d_bar = std(d)/sqrt(length(d));

my_t_paired = d_bar / s_d_bar;
tinv(0.025, length(d)-1)
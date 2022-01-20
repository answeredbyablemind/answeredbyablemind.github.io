clear; close all; clc;

%% ADC DAC 그림
close all;
sigma = 1;

my_norm = @(x) exp(-x.^2/ 2) / sqrt(2*pi);
my_norm_dif = @(x) -x.*exp(-x.^2/2)/sqrt(2*pi);

xx = linspace(-3,3,100);
xx_d = linspace(-3,3,10);

linewidth = 3;

% 연속 신호
figure('position',[680, 812, 570, 160])
plot(xx, my_norm(xx),'linewidth',linewidth);
set(gca,'visible','off')

% 이산화 된 입력 신호
figure('position',[680, 812, 570, 160])
plot(xx, my_norm(xx),'--');
hold on;

stem(xx_d, my_norm(xx_d),'linewidth',linewidth);
set(gca,'visible','off')

% 디지털 시스템을 통과한 후의 이산 신호
figure('position',[680, 812, 570, 160])
plot(xx, my_norm_dif(xx),'--');
hold on;

stem(xx_d, my_norm_dif(xx_d),'linewidth',linewidth);
set(gca,'visible','off')
% 복원된 연속 신호
figure('position',[680, 812, 570, 160])
plot(xx, my_norm_dif(xx),'linewidth',linewidth);
set(gca,'visible','off')



%% 디지털 각주파수가 동일하게 샘플링되는 여러 케이스들
% 연속신호

fs = 1000;
t = 0:1/fs:2;

x1_ct = cos(pi*t);
x2_ct = cos(2 * pi * t);
x3_ct = cos(4 * pi * t);

% 이산신호
Ts_1 = 0.2;
t_1 = 0:Ts_1:2;
x1_dt = cos(pi*t_1);

Ts_2 = 0.1;
t_2 = 0:Ts_2:2;
x2_dt = cos(2 * pi * t_2);

Ts_3 = 0.05;
t_3 = 0:Ts_3:2;
x3_dt = cos(4 * pi* t_3);

figure('position',[680, 409, 1100, 568]);
subplot(3,1,1);
plot(t, x1_ct,'--');
hold on;
stem(t_1, x1_dt, 'linewidth', 2)
title('cos(\pit), T_s = 0.2');
xlabel('time (s)');

subplot(3,1,2);
plot(t, x2_ct,'--');
hold on;
stem(t_2, x2_dt, 'linewidth', 2)
title('cos(2\pit), T_s = 0.1');
xlabel('time (s)');

subplot(3,1,3);
plot(t, x3_ct,'--');
hold on;
stem(t_3, x3_dt, 'linewidth', 2)
title('cos(4\pit), T_s = 0.05');
xlabel('time (s)');

%%
Ts = 0.001;
t = -2:Ts:4;
x1 = cos(pi*t);
x2 = cos(1.5*pi*t);
x3 = cos(6*pi*t);

figure('position',[680, 558, 1100, 240]);
plot(t, x1,'k');
hold on;
plot(t, x2,'b--')
plot(t, x3,'b');

Ts = 0.8; % fs: 1.25 Hz
t_dt = unique(cat(2, 0:-Ts:-2, 0:Ts:4));
x1_dt = cos(pi*t_dt);
x2_dt = cos(1.5 * pi*t_dt);
x3_dt = cos(6 * pi*t_dt);
stem(t_dt, x1_dt,'color',[0, 0.4470, 0.7410],'linewidth',2);
stem(t_dt, x2_dt,'color',[0.85, 0.325, 0.098],'linewidth',2);
stem(t_dt, x3_dt,'color','k','linewidth',2);
xlabel('time (s)');
grid on;

%%
tt = linspace(-0.3, 1.3, 100);
xx = cos(2*pi*1*tt);

Ts1 = 10;
tt_d1 = unique([0:-1/Ts1:-0.3, 0:1/Ts1:1.3]);
Ts2 = sqrt(110);
tt_d2 = unique([0:-1/Ts2:-0.3, 0:1/Ts2:1.3]);

xx_d1 = cos(2*pi*1*tt_d1);
xx_d2 = cos(2*pi*1*tt_d2);

figure('position',[680, 501, 830, 478]);
subplot(2,1,1);
plot(tt, xx,'--')
hold on;
stem(tt_d1, xx_d1, 'color','k','linewidth',2);
axis tight
title('주기 이산 신호: \omega_0=2\pi, \Omega_0 = 2\pi * 10');
xlabel('time (s)');
grid on;
set(gca,'fontname','나눔고딕');

subplot(2,1,2);
plot(tt, xx,'--')
hold on;
stem(tt_d2, xx_d2, 'color','k','linewidth',2);
axis tight
title('비주기 이산 신호: \omega_0=2\pi, \Omega_0 = 2\pi * \surd 110');
xlabel('time (s)');
grid on;
set(gca,'fontname','나눔고딕');

%% Replicated frequency spectrum of sampled signal (주기 신호)

xx = linspace(-0.8,0.8,10);
yy = normpdf(xx, 0, 1/4);

figure('position',[680, 558, 940, 400]);

subplot(2,1,1);
stem(xx, yy,'b','linewidth',2)
hold on;

plot([0, 0], [-1, 2.5],'k','linewidth',2)

ylim([0, 2.5])
xlim([-4, 4])
set(gca,'xtick', [-0.8, 0.8]);
set(gca,'xticklabel',{'-\omega_B','\omega_B'})

set(gca,'ytick',[]);
title('연속 주기 신호의 주파수 스펙트럼 (CTFS)');
set(gca,'fontname','나눔고딕');
xlabel('각주파수 \omega [rad/s]');

subplot(2,1,2);
stem(xx, yy,'b','linewidth',2)
hold on;

for i = [-4, -2, 2, 4]
    stem(xx+i, yy,'k--','linewidth', 2)
end

plot([0, 0], [-1, 2.5],'k','linewidth',2)

for i = [-3, -1, 1, 3]
    plot(ones(1,2) * i, [-1, 2.5],'r--','linewidth',0.5)
end
ylim([0, 2.5])
xlim([-4, 4])
set(gca,'xtick', [-4:-1, -0.8, 0, 0.8, 1:4]);
set(gca,'xticklabel', {'-4\pi','-3\pi','-2\pi','-\pi','-\Omega_B','0','\Omega_B','\pi','2\pi','3\pi','4\pi'})
set(gca,'ytick',[]);
title('이산 주기 신호의 주파수 스펙트럼 (DTFS)');
set(gca,'fontname','나눔고딕');
xlabel('디지털 각주파수 \Omega [rad]');

%% Replicated frequency spectrum of sampled signal (비주기 신호)

xx = linspace(-0.8,0.8,100);
yy = normpdf(xx, 0, 1/4);

figure('position',[680, 558, 940, 400]);

subplot(2,1,1);
plot(xx, yy,'b','linewidth',2)
hold on;

plot([0, 0], [-1, 2.5],'k','linewidth',2)

ylim([0, 2.5])
xlim([-4, 4])
set(gca,'xtick', [-0.8, 0.8]);
set(gca,'xticklabel',{'-\omega_B','\omega_B'})

set(gca,'ytick',[]);
title('연속 비주기 신호의 주파수 스펙트럼 (CTFT)');
set(gca,'fontname','나눔고딕');
xlabel('각주파수 \omega [rad/s]');

subplot(2,1,2);
plot(xx, yy,'b','linewidth',2)
hold on;

for i = [-4, -2, 2, 4]
    plot(xx+i, yy,'k--','linewidth', 2)
end

plot([0, 0], [-1, 2.5],'k','linewidth',2)

for i = [-3, -1, 1, 3]
    plot(ones(1,2) * i, [-1, 2.5],'r--','linewidth',0.5)
end
ylim([0, 2.5])
xlim([-4, 4])
set(gca,'xtick', [-4:-1, -0.8, 0, 0.8, 1:4]);
set(gca,'xticklabel', {'-4\pi','-3\pi','-2\pi','-\pi','-\Omega_B','0','\Omega_B','\pi','2\pi','3\pi','4\pi'})
set(gca,'ytick',[]);
title('이산 비주기 신호의 주파수 스펙트럼 (DTFT)');
set(gca,'fontname','나눔고딕');
xlabel('디지털 각주파수 \Omega [rad]');
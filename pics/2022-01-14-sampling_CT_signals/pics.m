clear; close all; clc;


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
stem(t_1, x1_dt)
title('cos(\pit), T_s = 0.2');

subplot(3,1,2);
plot(t, x2_ct,'--');
hold on;
stem(t_2, x2_dt)
title('cos(2\pit), T_s = 0.1');

subplot(3,1,3);
plot(t, x3_ct,'--');
hold on;
stem(t_3, x3_dt)
title('cos(4\pit), T_s = 0.05');

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



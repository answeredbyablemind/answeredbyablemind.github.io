clear; close all; clc;

%% Impulse response
close all;
t = 0:1:10;
x = sin(t) + 3*cos(t/3) + 4* sin(t/4);
stem(t, x,'color','k', 'linewidth', 1.5)

t2 = linspace(-0.5,10.5,100);
x2 = sin(t2) + 3*cos(t2/3) + 4* sin(t2/4);
hold on;
plot(t2, x2, 'r--')

xlabel('n (time sample) (bin)');
ylabel('x[n]');
grid on;
xlim([-0.5 10.5])

%% 신호를 분해하자
close all;

for i = 1:11
    figure;
    hold on;
    plot(t2, x2, 'r--')
    
    xlabel('n (time sample) (bin)');
    ylabel('x[n]');
    grid on;
    xlim([-0.5 10.5])
    x = sin(t(i)) + 3*cos(t(i)/3) + 4* sin(t(i)/4);
    stem(t(i), x,'color','k', 'linewidth', 1.5)
end





%% Moving Average

rng(2);
a = rand(1,20);
sig = a+0.1*(1:20);

% calculating moving average
M=5;
sig_MA = nan(1, length(sig));

for i = M:length(a)
    sig_MA(i) = mean(sig(i-(M-1):i));
end

figure;
subplot(2,1,1);
plot(sig,'o-')
ylim([0, 3])
title('원래의 신호')
subplot(2,1,2)
plot(sig_MA,'o-')
xlim([0, 20]); ylim([0, 3])
title('moving average 신호')
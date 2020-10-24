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
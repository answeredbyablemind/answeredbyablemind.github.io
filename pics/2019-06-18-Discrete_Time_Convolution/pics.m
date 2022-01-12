clear; close all; clc;

%% impulse response

x = zeros(1,11);
t = -5:5;
x(6) = 1;

figure;
stem(t, x,'linewidth',2)
xlabel('time bin(n)');
ylabel('\delta[n]');
grid on;
ylim([-0.5, 1.5])

%%
n = -2:7;
x = [0, 0, 2, 4, 6, 3, 1, 0, 0, 0];

stem(n, x,'linewidth',2);
xlabel('n');
ylabel('x[n]');
ylim([-0.5, 6.5])
grid on;
%%
close all
figure('position',[680, 558, 1180, 400]);
for i = 1:length(n)
    x2show = zeros(1,length(n));
    x2show(i) = x(i);
    subplot(2,5, i)
    stem(n, x2show,'linewidth',2)
    xlabel('n');
    
    if n(i)<0
        title(['x[',num2str(n(i)),']\delta[n+',num2str(-n(i)),']']);
    elseif n(i) == 0
        title(['x[',num2str(n(i)),']\delta[n]']);
    else
        title(['x[',num2str(n(i)),']\delta[n-',num2str(n(i)),']']);
    end
    grid on;
    xlim([n(1), n(end)]);
    ylim([-0.5, 6.5])
end

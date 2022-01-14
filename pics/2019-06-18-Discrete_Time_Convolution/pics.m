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

%% physical meaning of impulse response

x = linspace(-5, 17, 100);
y = 3*normpdf(x, 3, 5)+0.5;

xs1 = -3:15;
ys1 = 3*normpdf(xs1, 3, 5) + 0.5;

xs2 = xs1(6:end-5);

hs = exp(1/10*(xs2-10));

figure;
plot(x, y,'k--');
hold on;
stem(xs1, ys1,'k','linewidth',2)
stem(xs2, hs,'b','linewidth',2)
xlim([-5, 17])
ylim([0, 1.2])

set(gca,'visible','off')
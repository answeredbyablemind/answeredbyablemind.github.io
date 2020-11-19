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
t = linspace(0, 10, 10);
x = sin(t) + 3* cos(t/3) + 4 * sin(t/4);
stem(x,'linewidth',2)
xlabel('time bin(n)');
ylabel('x[n]');
grid on;

%%
t = linspace(0, 10, 10);
x = sin(t) + 3* cos(t/3) + 4 * sin(t/4);
close all

for i = 1:10
    x2show = zeros(1,10);
    x2show(i) = x(i);
    figure('position',[680, 745, 223, 233]);
    stem(x2show,'linewidth',2)
    xlabel('time bin(n)');
    ylabel('x[n]');
    grid on;
    ylim([-2, 6])
end

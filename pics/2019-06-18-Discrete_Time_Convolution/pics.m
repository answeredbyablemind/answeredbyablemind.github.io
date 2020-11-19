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
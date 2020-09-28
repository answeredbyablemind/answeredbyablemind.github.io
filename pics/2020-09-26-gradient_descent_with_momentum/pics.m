clear; close all; clc;

%% exponentially weighted average 구현

close all;
n = 300;
% 데이터
rng(1);
x = randn(1, n);
x = x + cos(linspace(0, pi, n)) * 2;
plot(x,'o','markerfacecolor',lines(1),'markeredgecolor','none')

% Exponentially Weighted Average

beta = 0.8;
v = zeros(1,length(x));
v_c = zeros(1,length(x));
for i = 1:length(v)
    if i == 1
        v(i) = (1-beta) * x(i);
    else
        v(i) = beta * v(i-1) + (1-beta) * x(i);
    end
    % Exponentially Weighted Average with Bias Corrected
    v_c(i) = v(i) / (1-beta^i);
end

hold on;
plot(v,'color', 'r', 'linewidth',3)
plot(v_c, 'color',[0.466, 0.674, 0.188],'linewidth',3)

grid on;
xlabel('time');
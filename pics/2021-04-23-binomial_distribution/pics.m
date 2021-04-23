clear; close all; clc;

%% 이항 분포 그리기

n = 20;
p = 0.5;
x = 0:n;

f = @(x, n, p) factorial(n)./(factorial(x).*factorial(n-x)) .* p.^x .* (1-p).^(n-x);

my_color = lines(3);
stem(x, f(x, n, p), 'o' ,'markerfacecolor',my_color(1,:));
xlabel('x');
ylabel('probability mass');
grid on;
title('Binomial PMF');

%% 이항 분포 시뮬레이션

n_sim = 10^4;
res_sim = zeros(1, n_sim);

for i_sim = 1:n_sim
    count = 0;
    for i = 1:n
        if rand(1) < p
            count = count + 1;
        end
    end
    res_sim(i_sim) = count;
end

figure; histogram(res_sim,'Normalization','pdf');
hold on;
stem(x, f(x, n, p), 'o' ,'markerfacecolor',my_color(1,:));

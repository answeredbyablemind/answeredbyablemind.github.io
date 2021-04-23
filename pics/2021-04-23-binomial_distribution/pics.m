clear; close all; clc;

%% 이항 분포 그리기

n = 10;
p = 0.5;
x = 0:n;

f = @(x, n, p) factorial(n)./(factorial(x).*factorial(n-x)) .* p.^x .* (1-p).^(n-x);

my_color = lines(3);
stem(x, f(x, n, p), 'o' ,'markerfacecolor',my_color(1,:),'linewidth',2);
xlabel('x');
ylabel('probability');
grid on;
title(['binomial distribution PMF',' / n: ',num2str(n),', p: ',num2str(p)]);

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

%% 실제 코인 flip을 그리려면?
n= 3;
res = zeros(2^n, n);

h_up = false;
for i_col = 1:size(res,2)
    count2switch= 2^(n-i_col);
    
    count = 0;
    
    for i_row = 1:size(res,1)
        
        if h_up
            res(i_row, i_col) = 1;
        end
        
        count = count + 1;
        
        if count == count2switch
            h_up = true;
            count= 0;
        end
        
    end
end












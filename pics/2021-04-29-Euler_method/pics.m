clear; close all; clc;

%% h = 10인 경우
figure;
x = -10:10;

f = zeros(1,length(x));
f(x==0) = 0;

% 양의 x에 대해서

for i = find(x==0):length(f)-1
    f(i+1) = x(i) + f(i);
end

% 음의 x에 대해서
for i = find(x==0):-1:2
   f(i-1) =  f(i) - x(i-1);
end

plot(x, f,'o-','linewidth',2)
xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x)$$','interpreter','latex');
grid on;

title('$$f(x+1) = x + f(x)$$','interpreter','latex')
set(gca,'fontsize',12)
set(gca,'xtick', -10:1:10)
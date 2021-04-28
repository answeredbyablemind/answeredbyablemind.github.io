clear; close all; clc;

%% h = 1인 경우
figure;
x1 = -10:10;

f1 = zeros(1,length(x1));
f1(x1==0) = 0;

% 양의 x에 대해서

for i = find(x1==0):length(f1)-1
    f1(i+1) = x1(i) + f1(i);
end

% 음의 x에 대해서
for i = find(x1==0):-1:2
   f1(i-1) =  f1(i) - x1(i-1);
end

plot(x1, f1,'o-','linewidth',2)
xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x)$$','interpreter','latex');
grid on;

title('$$f(x+1) = x + f(x)$$','interpreter','latex')
set(gca,'fontsize',12)
set(gca,'xtick', -10:1:10)


%% h = 0.5인 경우
x2 = -10:0.5:10;
figure;
f2 = zeros(1,length(x2));
f2(x2==0) = 0;

% 양의 x에 대해서

for i = find(x2==0):length(f2)-1
    f2(i+1) = 0.5*x2(i) + f2(i);
end

% 음의 x에 대해서
for i = find(x2==0):-1:2
   f2(i-1) =  f2(i) - 0.5*x2(i-1);
end

plot(x2, f2,'o-','linewidth',2)
xlabel('$$x$$','interpreter','latex');
ylabel('$$f(x)$$','interpreter','latex');
grid on;

title('$$f(x+0.5) = 0.5x + f(x)$$','interpreter','latex')
set(gca,'fontsize',12)
set(gca,'xtick', -10:1:10)
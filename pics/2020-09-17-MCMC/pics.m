clear; close all; clc;

n_iter = 10000;
accept = 0;
reject = 0;
figure('position',[680, 558, 453, 420],'color','w')

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

for i_iter = 1:n_iter
    x = rand(1) * 2 -1;
    y = rand(1) * 2 -1;
    
    if (x^2 + y^2) <= 1
        accept = accept + 1;
        c = 'r';
    else
        reject = reject + 1;
        c = 'b';
    end
    plot(x, y,'.', 'color',c);
    hold on;
    
    t = text(0, -0.77557, sprintf('추정 넓이: %.4f',4 * accept / i_iter),'fontsize',15,'fontweight','bold','BackgroundColor','w');
    
    if rem(i_iter, 100) == 0
        xlim([-1, 1])
        ylim([-1, 1])
        writeVideo(newVid, getframe(gcf))
        drawnow;
    end
    
    if i_iter < n_iter
        delete(t);
    end
end

for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end


close(newVid)

%% sampling 

% 참고문헌: https://www.cs.ubc.ca/~arnaud/andrieu_defreitas_doucet_jordan_intromontecarlomachinelearning.pdf
%
%

rng(1)
n_iter = 5000;
target = @(x) 0.3*exp(-0.2 * x.^2) + 0.7 * exp(-0.2 * (x - 10).^2);
xx = linspace(-10,20, 1000);
figure('color','w');
plot(xx, target(xx),'linewidth',2)
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$f(x) = 0.3e^{-0.2x^2} + 0.7e^{-0.2(x-10)^2}$$','interpreter','latex')

%% 정규 분포 하나 그려넣기

figure('color','w');
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('$$f(x) = 0.3e^{-0.2x^2} + 0.7e^{-0.2(x-10)^2}$$','interpreter','latex')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
legend([h1, h2], '타겟 분포', '제안 분포')

%% 제안분포로부터 다음 포인트 추천 받기

figure('color','w','position',1000*[0.3298, 0.3420, 1.2048, 0.4200]);
subplot(1,2,1);
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('새로운 제안을 거절하는 경우')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
rng(1); x_new = randn(1) * 2 + 7

line([7, 7],[0, target(7)],'color','r','linestyle','--')
plot(7, target(7),'o','markerfacecolor','r');

line([x_new x_new],[0, target(x_new)],'color','b','linestyle','--')
plot(x_new, target(x_new),'o','markerfacecolor','b');

legend([h1, h2], '타겟 분포', '제안 분포')

subplot(1,2,2);
h1 = plot(xx, target(xx),'linewidth',2);
grid on;
xlabel('$$x$$','interpreter','latex');
ylabel('$$y$$','interpreter','latex');
title('새로운 제안을 수용하는 경우')
hold on;
h2 = plot(xx, normpdf(xx, 7, 2),'linewidth',2,'linestyle','--');
x_new = 10;

line([7, 7],[0, target(7)],'color','r','linestyle','--')
plot(7, target(7),'o','markerfacecolor','r');

line([x_new x_new],[0, target(x_new)],'color','b','linestyle','--')
plot(x_new, target(x_new),'o','markerfacecolor','b');

legend([h1, h2], '타겟 분포', '제안 분포')

%%  Metropolis Hastings

% initialize x_0
x = [];
x = [x, (rand(1, 1) - 0.5) * 30 + 5]; % -10에서 20사이의 범위에서 random uniform

proposal = @(x, mu, s) 1/(s*sqrt(2*pi))*exp(-(x-mu)^2/(2*s^2)); % 정규분포

my_std = 10;

for i = 1 : n_iter
    u = rand(1); % sample u
    x_old = x(i);
    
    % 제안 분포 q(x_new | x_old) = N(x_old, sigma)로부터 샘플 추출
    x_new = randn(1) * my_std + x_old;
    
    % A(x_old, x_new) 계산
    A = min(1, ...
        (target(x_new) * proposal(x_old, x_new, my_std)) / ...
        (target(x_old) * proposal(x_new, x_old, my_std))...
        );
    
    if u < A
        x = [x x_new];
        
    else
        x = [x x_old];
    end
end


% 결과 plot
figure; h = histogram(x);
hold on; plot(xx, target(xx)/max(target(xx))*max(h.Values),'linewidth',2)

%% %%%%%%%%%%%%%%%%%%%%% Bayesian Estimation %%%%%%%%%%%%%%%%%%%%%%

% 총 데이터는 5개가 있었다고 해보자.
 
std_obs = 3.1591; % 계산해둔 것을 넣어두기.
pop_mu = 10;
pop_std = 3;

data = randn(1, 5) * pop_std + pop_mu;

xx = linspace(-10, 25, 1000);

pdf_prev = normpdf(xx, 1, std_obs);

figure;
plot(xx, pdf_prev)
normpdf(data, 1, std_obs)


%% Likelihood 비교

figure('color','w','position',[680, 340, 700, 400]);
% line([-5, 10],[0, 0],'color','k')
set(gca,'visible','off')
% ylim([-0.05, 0.25])
mArrow2(-2,0,6,0,{'color','k'});

data = -1:5;
hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.05, num2str(data(i)),'fontsize',13);
end

text(20, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xx = linspace(-1, 3, 100);
yy = normpdf(xx, 1, 0.5);
plot(xx, yy,'linewidth',3,'color',[0.4, 0.4, 0.4])
xlim([-1.5 6])

line([1, 1], [0, normpdf(1, 1, 0.5)],'color','k','linestyle','--')
%% Likelihood 비교

figure('color','w','position',[680, 340, 700, 400]);
line([-5, 20],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-5,0,20,0,{'color','k'});

data = [1,6,9,10, 13];
hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(20, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xx = linspace(-7, 17, 100);
yy = normpdf(xx, 1, 3.1591);
plot(xx, yy,'linewidth',3)

yy2 = normpdf(xx, 7, 3.1591);
plot(xx, yy2,'linewidth',3,'color',lines(1))

for i = 1:length(data)
    line([data(i), data(i)], [0, normpdf(data(i), 7, 3.1591)],'color', lines(1),'linestyle','--','linewidth',2)

    line([data(i), data(i)], [0, normpdf(data(i), 1, 3.1591)],'color', [0.85, 0.32, 0.098],'linestyle','--','linewidth',2)
    
end

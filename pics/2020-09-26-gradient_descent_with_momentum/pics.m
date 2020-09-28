clear; close all; clc;

%% exponentially weighted average 구현

close all;
n = 300;
% 데이터
rng(1);
x = randn(1, n);
x = x + cos(linspace(0, pi, n)) * 2;
plot(x,'o','markerfacecolor',lines(1),'markeredgecolor','none')

% Exponentially Weighted Moving Average

beta = 0.8;
v = zeros(1,length(x));
v_c = zeros(1,length(x));
for i = 1:length(v)
    if i == 1
        v(i) = (1-beta) * x(i);
    else
        v(i) = beta * v(i-1) + (1-beta) * x(i);
    end
    % Exponentially Weighted Moving Average with Bias Corrected
    v_c(i) = v(i) / (1-beta^i);
end

hold on;
plot(v,'color', 'r', 'linewidth',3)
plot(v_c, 'color',[0.466, 0.674, 0.188],'linewidth',3)

grid on;
xlabel('time');

%%


%% 여러가지 beta 값에 대한 MA 결과

close all;
n = 300;
% 데이터
rng(1);
x = randn(1, n);
x = x + cos(linspace(0, pi, n)) * 2;
plot(x,'o','markerfacecolor',lines(1),'markeredgecolor','none')

% Exponentially Weighted Moving Average
betas = [linspace(0.3, 0.99, 100), ones(1, 20) * 0.99, linspace(0.99, 0.3, 100)];


newVid = VideoWriter('picN', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);

for i_beta = 1:length(betas)
    beta = betas(i_beta);
    v = zeros(1,length(x));
    v_c = zeros(1,length(x));
    for i = 1:length(v)
        if i == 1
            v(i) = (1-beta) * x(i);
        else
            v(i) = beta * v(i-1) + (1-beta) * x(i);
        end
        % Exponentially Weighted Moving Average with Bias Corrected
        %     v_c(i) = v(i) / (1-beta^i);
    end
    
    hold on;
    h = plot(v,'color', 'r', 'linewidth',3);
    t = text(210, 3, ['beta: ',sprintf('%.2f',beta)],'BackgroundColor', 'w','fontsize',12);
    % plot(v_c, 'color',[0.466, 0.674, 0.188],'linewidth',3)
    
    grid on;
    xlabel('time');
    drawnow;
    writeVideo(newVid, getframe(gcf))

    if i_beta < length(betas)
        delete(h);
        delete(t);
    end
end

close(newVid)
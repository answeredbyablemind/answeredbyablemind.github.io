clear; close all; clc;

my_color = lines(2);

%% label이 주어져있지 않은 경우

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

my_gaussian = @(x, mu, sigma) 1/(sigma*sqrt(2*pi))*exp(-1*(x-mu).^2./(2 * sigma^2));

% 여기부터 ... 랜덤하게 mu 값을 지정해둔 경우를 상정해 그림 그릴 것.
% 그리고 각 데이터들에 대해 likelihood 비교하여 label 주어줄 것.
xx = linspace(-5, 32, 100);
yy1 = my_gaussian(xx, 3, std(data1));
yy2 = my_gaussian(xx, 10, std(data2));
plot(xx, yy1,'linewidth',3,'color',my_color(1,:))
plot(xx, yy2,'linewidth',3,'color',my_color(2,:))
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)


%% label이 주어져있지 않은 경우

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

my_gaussian = @(x, mu, sigma) 1/(sigma*sqrt(2*pi))*exp(-1*(x-mu).^2./(2 * sigma^2));

% 여기부터 ... 랜덤하게 mu 값을 지정해둔 경우를 상정해 그림 그릴 것.
% 그리고 각 데이터들에 대해 likelihood 비교하여 label 주어줄 것.
xx = linspace(-5, 32, 100);
yy1 = my_gaussian(xx, 3, std(data1));
yy2 = my_gaussian(xx, 10, std(data2));
plot(xx, yy1,'linewidth',3,'color',my_color(1,:))
plot(xx, yy2,'linewidth',3,'color',my_color(2,:))

line([9, 9],[0, my_gaussian(9, 3, std(data1))],'color','k','linestyle','--')
line([9, 9],[0, my_gaussian(9, 10, std(data2))],'color','k','linestyle','--')
line([-2, 9],my_gaussian(9, 3, std(data1))*[1, 1],'color','k','linestyle','--')
line([9, 32],my_gaussian(9, 10, std(data2))*[1, 1],'color','k','linestyle','--')
plot(9, my_gaussian(9, 3, std(data1)),'o','markerfacecolor','r','markeredgecolor','k')
plot(9, my_gaussian(9, 10, std(data2)),'o','markerfacecolor','r','markeredgecolor','k')
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

%% 위의 분포를 통해 새로운 label을 획득

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
hold on;
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

new_label = zeros(1, length(data));

for i_data = 1:length(data)
    x = data(i_data);
    y1 = my_gaussian(x, 3, std(data1));
    y2 = my_gaussian(x, 10, std(data2));
    
    new_label(i_data) = y2>y1;
    
    if y2>y1
        plot(x, 0, 'o','markerfacecolor',my_color(2,:),'markeredgecolor', [0, 0, 0], 'markersize',10)
    else
        plot(x, 0, 'o','markerfacecolor',my_color(1,:),'markeredgecolor', [0, 0, 0], 'markersize',10)
    end
    
end

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end


%% label이 주어져있지 않은 경우

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

idx0 = new_label == 0;
idx1 = new_label == 1;
% 여기부터 ... 랜덤하게 mu 값을 지정해둔 경우를 상정해 그림 그릴 것.
% 그리고 각 데이터들에 대해 likelihood 비교하여 label 주어줄 것.
xx = linspace(-5, 35, 100);
yy1 = my_gaussian(xx, mean(data(idx0)), std(data(idx0)));
yy2 = my_gaussian(xx, mean(data(idx1)), std(data(idx1)));
plot(xx, yy1,'linewidth',3,'color',my_color(1,:))
plot(xx, yy2,'linewidth',3,'color',my_color(2,:))

plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

%% 여러 스텝에 걸친 비디오 만들어주기
%
h_record = 0;
n_iter = 10;

if h_record
    newVid = VideoWriter('pic9', 'MPEG-4'); % New
    newVid.FrameRate = 20;
    newVid.Quality = 100;
    open(newVid);
end

clear h
my_normal = @(x, mu, sigma) 1/(sigma * sqrt(2*pi)).*exp(-1 * (x-mu).^2/(2*sigma^2));
% random initialization
n_data = length(data);
est_mu = [3, 10];
est_vars = [std(data1)^2,std(data2)^2];

est_w = zeros(n_data, 2);
rng(1)
% rand_num = rand(1);
% est_phi = [rand_num 1-rand_num];
est_phi = [0.5, 0.5];

figure('color','w');
hold on;

% The first E-step according to the random initialization
for i_data = 1:n_data
    l1 = my_normal(data(i_data), est_mu(1), sqrt(est_vars(1)));
    l2 = my_normal(data(i_data), est_mu(2), sqrt(est_vars(2)));
    
    est_w(i_data, 1) = (l1 * est_phi(1)) / (l1 * est_phi(1) + l2 * est_phi(2));
    est_w(i_data, 2) = (l2 * est_phi(2)) / (l1 * est_phi(1) + l2 * est_phi(2));
end

est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));

h1 = plot(xx, est_yy1 * est_phi(1), 'color',my_color(1,:),'linewidth',4);
h2 = plot(xx, est_yy2 * est_phi(2), 'color',my_color(2,:),'linewidth',4);

% 데이터 원 그리기
for i_data = 1:n_data
    if est_w(i_data,1) >= est_w(i_data,2)
        plot(data(i_data), 0, 'o', 'markersize', 10, 'markerfacecolor',my_color(1,:),'markeredgecolor','k');
    else
        plot(data(i_data), 0, 'o', 'markersize', 10, 'markerfacecolor',my_color(2,:),'markeredgecolor','k');
    end
end

my_str = sprintf('Random Initialization \nmu_1 = %.2f, sigma_1 = %.2f \nmu_2 = %.2f, sigma_2 = %.2f',...
    est_mu(1), sqrt(est_vars(1)), est_mu(2), sqrt(est_vars(2)));
xlim([-5, 35])
ylim([0, 0.08])
t = text(15, 0.068,  my_str, 'fontsize',12,'backgroundcolor','w','edgecolor','k');

xlabel('x');
ylabel('pdf');
grid on;

if h_record
    for i = 1:15 % 첫장면 750 ms 대기
        writeVideo(newVid, getframe(gcf))
    end
else
    pause;
end
delete(t);
delete(h1);
delete(h2);

% GMM iteration
for i_iter = 1:n_iter
    
    % M-step
    est_phi = mean(est_w, 1);
    est_mu(1) = (data * est_w(:,1))/sum(est_w(:,1));
    est_mu(2) = (data * est_w(:,2))/sum(est_w(:,2));
    
    est_vars(1) = sum(est_w(:,1)'.*(data-est_mu(1)).^2)/sum(est_w(:,1));
    est_vars(2) = sum(est_w(:,2)'.*(data-est_mu(2)).^2)/sum(est_w(:,2));
    
    est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
    est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));
    
    % E-step
    for i_data = 1:n_data
        l1 = my_normal(data(i_data), est_mu(1), sqrt(est_vars(1)));
        l2 = my_normal(data(i_data), est_mu(2), sqrt(est_vars(2)));
        
        est_w(i_data, 1) = (l1 * est_phi(1)) / (l1 * est_phi(1) + l2 * est_phi(2));
        est_w(i_data, 2) = (l2 * est_phi(2)) / (l1 * est_phi(1) + l2 * est_phi(2));
    end
    % E-step에 대한 시각화
    h1 = plot(xx, est_yy1 * est_phi(1), 'color',my_color(1,:),'linewidth',4);
    h2 = plot(xx, est_yy2 * est_phi(2), 'color',my_color(2,:),'linewidth',4);
    my_str = sprintf('Epoch: %d / %d \nmu_1 = %.2f, sigma_1 = %.2f \nmu_2 = %.2f, sigma_2 = %.2f',...
        i_iter, n_iter, est_mu(1), sqrt(est_vars(1)), est_mu(2), sqrt(est_vars(2)));
    
    t = text(15, 0.068,  my_str, 'fontsize',12,'backgroundcolor','w','edgecolor','k');
    
    % 데이터 원 그리기
    for i_data = 1:n_data
        if est_w(i_data,1) >= est_w(i_data,2)
            plot(data(i_data), 0, 'o', 'markersize', 10, 'markerfacecolor',my_color(1,:),'markeredgecolor','k');
        else
            plot(data(i_data), 0, 'o', 'markersize', 10, 'markerfacecolor',my_color(2,:),'markeredgecolor','k');
        end
    end
    
    xlabel('x');
    ylabel('pdf');
    grid on;
    if h_record
        for i = 1:15 % 각 장면별로 750ms씩
            writeVideo(newVid, getframe(gcf))
        end
        
        drawnow;
    else
        pause
    end
    
    if i_iter < n_iter
        delete(t);
        delete(h1);
        delete(h2);
    end
    
    
end

if h_record
    for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
        writeVideo(newVid, getframe(gcf))
    end
    %
    close(newVid)
end
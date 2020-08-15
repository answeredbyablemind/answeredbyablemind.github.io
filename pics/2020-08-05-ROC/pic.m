clear; close all; clc;

gaussian = @(x, mu, var) 1/sqrt(2*pi*var).*exp(-(x-mu).^2/(2*var)); % 가우스분포 함수

my_var = 1;

%% pic 1

mu1 = 1;
mu2 = 2;

xx = linspace(-10,10,200);
ROC1 = zeros(length(xx), 2);
ROC2 = zeros(length(xx), 2);
ROC3 = zeros(length(xx), 2);

for i = 1:length(xx)
    ROC1(i, 1) = 1-normcdf(xx(i), 1, my_var); % FP
    ROC1(i, 2) = 1-normcdf(xx(i), 2, my_var); % TP
    
    ROC2(i, 1) = 1-normcdf(xx(i), 1, my_var);
    ROC2(i, 2) = 1-normcdf(xx(i), 3, my_var);
    
    ROC3(i, 1) = 1-normcdf(xx(i), 1, my_var);
    ROC3(i, 2) = 1-normcdf(xx(i), 4, my_var);
end

temp = hsv(100);
my_color = zeros(3,3);
my_color(1,:) = temp(70,:);
my_color(2,:) = temp(45,:);
my_color(3,:) = temp(1,:);


plotXY(-0.2, 1.2, -0.2, 1.2, true, 20)
hold on;

plot([0, 1], [0, 1],'r--')
line([1, 1,], [0, 1],'linestyle','--')
line([0, 1],[1, 1,], 'linestyle','--')
plot(ROC1(:,1), ROC1(:,2),'color', my_color(1,:),'linewidth',3)
plot(ROC2(:,1), ROC2(:,2),'color', my_color(2,:),'linewidth',3)
plot(ROC3(:,1), ROC3(:,2),'color', my_color(3,:),'linewidth',3)

%% two gaussian dist's and low threshold

xx = linspace(-5,5, 200);
yy1 = gaussian(xx, -1, 2);
yy2 = gaussian(xx, 1, 2);

my_color = lines(2);

figure('position',[488, 342, 560, 420]);
% threshs = fliplr(linspace(-5, 0, 40)); % lowering의 경우
threshs = linspace(0, 5, 40); % 올려주는 경우

% my_ttl = 'threshold를 계속 내리는 경우';
my_ttl = 'threshold를 계속 올리는 경우';

set(gcf,'color','w')
for i_thresh = 1:length(threshs)
    plot(xx, yy1)
    hold on;
    plot(xx, yy2);
    
    
    thresh = threshs(i_thresh);
    YLIMs = ylim;
    line([thresh, thresh], YLIMs,'color','k','linewidth',2)
    
    [~, idx_th] = min(abs(xx - thresh));
    ha1=area(xx(idx_th:end),yy1(idx_th:end)); % area([X(1) X(2)], [Y(2), Y(2)])로 그려주면 된다.
    set(ha1,'FaceAlpha',0.1); % 1에 가까울 수록 어두워짐.
    set(ha1,'EdgeColor',my_color(1,:)) % 사각형의 테두리 색깔. 테두리를 쓰지 않으려면 'none'으로 설정.
    % set(ha1.BaseLine,'BaseValue',YLIM(1)) % 사각형의 아랫변. 이 코드가 없으면 y=0이 아랫변으로 자동 설정됨.
    set(ha1,'FaceColor',my_color(1,:)) % 사각형의 면적 색깔
    
    ha2=area(xx(idx_th:end),yy2(idx_th:end)); % area([X(1) X(2)], [Y(2), Y(2)])로 그려주면 된다.
    set(ha2,'FaceAlpha',0.1); % 1에 가까울 수록 어두워짐.
    set(ha2,'EdgeColor',my_color(2,:)) % 사각형의 테두리 색깔. 테두리를 쓰지 않으려면 'none'으로 설정.
    % set(ha1.BaseLine,'BaseValue',YLIM(1)) % 사각형의 아랫변. 이 코드가 없으면 y=0이 아랫변으로 자동 설정됨.
    set(ha2,'FaceColor',my_color(2,:)) % 사각형의 면적 색깔
    
    ylim(YLIMs)
    
    legend([ha1, ha2],'False Positive', 'True Positive')
    
    xlabel('x');
    ylabel('probability density')
    
    title(my_ttl)
    
    drawnow;
    if i_thresh < length(threshs)
        cla;
    end
end

%% threshold 변화에 따른 ROC 커브상 점의 위치 변화

xx = linspace(-5, 5, 100);
yy1 = gaussian(xx, -1, 2);
yy2 = gaussian(xx, 1, 2);

ROC = zeros(length(xx), 2);
for i = 1:length(xx)
    ROC(i, 1) = 1-normcdf(xx(i), -1, 2);
    ROC(i, 2) = 1-normcdf(xx(i), 1, 2);
end

figure('position', [488, 450, 820, 320],'color','w')

threshs = [linspace(-5, 5, 50), linspace(5, -5, 50)];

for i_thresh = 1:length(threshs)
    thresh = threshs(i_thresh);
    
    subplot(1, 2,1);
    plot(xx, yy1,'color', my_color(1,:),'linewidth',2);
    hold on;
    plot(xx, yy2,'color', my_color(2,:),'linewidth',2);
    
    YLIMs = ylim;
    line([thresh, thresh], YLIMs, 'color','k','linewidth',2)
    ylim(YLIMs)
    grid on;
    xlabel('x');
    ylabel('probability density');
    set(gca,'xtick',-5:2.5:5)
    
    subplot(1,2, 2);
    plot(ROC(:,1), ROC(:,2),'k','linewidth',2)
    
    [~, idx_thresh] = min(abs(xx - thresh));
    hold on;
    plot(ROC(idx_thresh,1), ROC(idx_thresh,2),'o', 'markersize', 10, 'markerfacecolor','r','markeredgecolor','none')
    
    xlabel('FPR');
    ylabel('TPR');
    grid on;
    
    drawnow;
    
    if i_thresh < length(threshs)
        subplot(1,2,1)
        cla;
        subplot(1,2,2);
        cla;
    end
    
end

%% gaussian 분포가 멀어지는 경우


xx = linspace(-10, 5, 100);
mu1_range = [fliplr(linspace(-5, 0.5, 20)), linspace(-5, 0.5, 20)];
yy2 = gaussian(xx, 1, 2);
ROC = zeros(length(xx), 2);

figure('position', [488, 450, 820, 320],'color','w')

for i_mu1 = 1:length(mu1_range)
    mu1 = mu1_range(i_mu1);
    yy1 = gaussian(xx, mu1, 2);
    
    for i = 1:length(xx)
        ROC(i, 1) = 1-normcdf(xx(i), mu1, 2);
        ROC(i, 2) = 1-normcdf(xx(i), 1, 2);
    end
    
    subplot(1, 2,1);
    plot(xx, yy1,'color', my_color(1,:),'linewidth',2);
    hold on;
    plot(xx, yy2,'color', my_color(2,:),'linewidth',2);
    
    YLIMs = ylim;
    grid on;
    xlabel('x');
    ylabel('probability density');
    set(gca,'xtick',-10:2:5)
    
    subplot(1,2, 2);
    plot(ROC(:,1), ROC(:,2),'k','linewidth',2)
    hold on;
    plot([0, 1], [0, 1],'r--')
    xlabel('FPR');
    ylabel('TPR');
    grid on;
    
    drawnow;
    
    if i_mu1 < length(mu1_range)
        subplot(1,2,1)
        cla;
        subplot(1,2,2);
        cla;
    end
end

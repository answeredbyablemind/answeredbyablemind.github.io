clear; close all; clc;

%% 두 가우시안 분포의 곱
xx = linspace(-10, 20, 1000);

mu1 = 0; mu2 = 8;
sigma1 = 2; sigma2 = 4;

yy1 = normpdf(xx, mu1, sigma1);
yy2 = normpdf(xx, mu2, sigma2);

mu_new = (sigma1^2*mu2 + sigma2^2*mu1)/(sigma1^2 + sigma2^2);
sigma_new = sqrt(1/(1/sigma1^2 + 1/sigma2^2));

yy3_1 = yy1.*yy2/(sum(yy1.*yy2)*(xx(2)-xx(1))); % 아래것과 같은 결과 보여줌
yy3_2 = normpdf(xx, mu_new, sigma_new);

yy3_1 = yy1.*yy2;

clear h
figure('color','w');
h(1) = plot(xx, yy1,'linewidth',2);
hold on;
h(2) = plot(xx, yy2,'linewidth',2);
h(3) = plot(xx, yy3_2,'linewidth',2);
xlabel('x');
ylabel('pdf');
title('두 가우시안 분포의 곱')
grid on;
% legend(h,'Anyword For Length','Anyword For Length','Anyword For Length')
set(gca,'fontname','나눔고딕')

%% 두 가우시안 분포의 합성곱

clear; close all;
xx = linspace(-3, 20, 1000);

mu1 = 3;
mu2 = 5;
sigma1 = 1;
sigma2 = 2;

yy1 = normpdf(xx, mu1, sigma1);
yy2 = normpdf(xx, mu2, sigma2);

yy3_1 = my_conv(yy1, yy2);
dx = xx(2) - xx(1);

yy3_2 = normpdf(xx, mu1+mu2, sqrt(sigma1^2+sigma2^2)); % 위의 것과 동일한 결과임

figure;
plot(xx, yy1,'linewidth',2);
hold on;
plot(xx, yy2,'linewidth',2);
[~,idx] = min(abs(xx));
plot(xx, yy3_1(idx:1000+idx-1) * dx,'linewidth',2)
% plot(xx, yy3_2,'--')
% set(gca,'xtick',-10:20)
grid on;
xlabel('x');
ylabel('pdf');
title('두 가우시안 분포의 합성곱(conv)');
set(gca,'fontname','나눔고딕')

%% 두 가우시안의 합성곱 애니메이션으로

newVid = VideoWriter('pic_conv', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

mu1 = 3;
mu2 = 5;
sigma1 = 1;
sigma2 = 2;
xx = linspace(-10, 25, 250);

yy1 = normpdf(xx, mu1, sigma1);
yy3 = zeros(1, length(xx));
tautau = linspace(-10, 25, 250);
figure('color','w');
for i_tau = 1:length(tautau)
    tau = tautau(i_tau);
    plot(xx, yy1,'linewidth',2); hold on;
    yy2 = normpdf(xx, -mu2+tau, sigma2);
    plot(xx, yy2,'linewidth',2);
    yy3_temp = yy1.*yy2; % multiplication of the moment
    plot(xx, yy3_temp,'linewidth',2);
    patch(xx, yy3_temp,[0, 1, 0])
    
    yy3(i_tau) = sum(yy3_temp) * (tautau(2)-tautau(1));
    plot(xx(1:i_tau), yy3(1:i_tau),'k','linewidth',2)
    text(tau-0.5, -0.01, ['↑\tau=',num2str(tau)],'fontsize',15)
    grid on;
    xlabel('x');
    ylabel('pdf');
    set(gca,'fontname','나눔고딕');
    title('두 정규 분포의 합성곱');
    
    writeVideo(newVid, getframe(gcf))

    drawnow;
    
    if tau < tautau(end)
        cla;
    end
end


close(newVid)
%% 분산이 다른 두 gaussian 분포
xx = linspace(-5, 5, 1000);
yy1 = normpdf(xx, 0, 1);
yy2 = normpdf(xx, 0, 2);

figure('color','w');
plot(xx, yy1,'linewidth',2);
hold on;
plot(xx, yy2,'linewidth',2)
xlabel('x'); ylabel('f(x)');
ylim([0, 0.45])
xlim([-5, 5])
title('분산이 다른 두 정규 분포');
grid on;
set(gca,'xtick',-5:5)
set(gca,'fontname','나눔고딕')

%% 불확실한 이동을 표현한 것
xx = linspace(-5, 15, 1000);
yy1 = normpdf(xx, 4, 1);

figure('color','w');
plot(xx, yy1,'linewidth',2);
hold on;
line([4, 4], [0, 0.5],'color','k','linestyle','--','linewidth',1.5)
xlabel('x'); ylabel('f(x)');
ylim([0, 0.5])
t = text(4.8, 0.42, '$$x=4$$','interpreter','latex','fontsize',15,'BackgroundColor','w','edgecolor','k');
grid on;
title('x=4 만큼의 불확실한 이동')
set(gca,'fontname','나눔고딕')

%% 물체의 이동
xx = linspace(-5, 15, 1000);
yy1 = normpdf(xx, 0, 1);
yy2 = normpdf(xx, 4, 2);
yy3 = normpdf(xx, 8, 3);

figure('color','w');
plot(xx, yy1,'linewidth',2);
hold on;
plot(xx, yy2,'linewidth',2);
plot(xx, yy3,'linewidth',2);
xlabel('x'); ylabel('f(x)');
ylim([0, 0.5])

line([0, 0], [0, 0.5],'color',0.4*ones(1,3),'linestyle','--','linewidth',1.5)
line([4, 4], [0, 0.5],'color',0.4*ones(1,3),'linestyle','--','linewidth',1.5)
line([8, 8], [0, 0.5],'color',0.4*ones(1,3),'linestyle','--','linewidth',1.5)

text(0.8, 0.42, '$$x=0$$','interpreter','latex','fontsize',15,'BackgroundColor','w','edgecolor',0.4*ones(1,3));
text(4.8, 0.22, '$$x=4$$','interpreter','latex','fontsize',15,'BackgroundColor','w','edgecolor',0.4*ones(1,3));
text(8.8, 0.17, '$$x=8$$','interpreter','latex','fontsize',15,'BackgroundColor','w','edgecolor',0.4*ones(1,3));
grid on;
title('x=0에서 x=4만큼 씩 불확실한 이동 2회 수행 시')
set(gca,'fontname','나눔고딕')
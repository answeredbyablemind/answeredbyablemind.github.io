clear; close all; clc;

%% gaussian 분포
xx = linspace(-5, 5, 1000);
yy = normpdf(xx, 0, 1);

figure('color','w');
plot(xx, yy,'linewidth',2);
xlabel('x'); ylabel('f(x)');
ylim([0, 0.45])
xlim([-5, 5])
title('표준 정규 분포');
grid on;

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


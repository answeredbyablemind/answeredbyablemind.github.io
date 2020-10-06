clear; close all; clc;

x = [ones(1, 10), 2 * ones(1, 100), 3 * ones(1, 50)];

figure;
histogram(x, 'Normalization','probability')

set(gca,'xtick',[1,2,3]);
set(gca,'xticklabel',{'●','▲','■'});
set(gca,'fontsize',15);
xlabel('코의 모양');
ylabel('확률');
grid on;
title('온 세상 모든 얼굴의 코 모양에 대한 확률분포');
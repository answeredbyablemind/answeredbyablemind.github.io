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

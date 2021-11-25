clear; close all; clc;

% 참고한 글: 원프레딕트 기술 블로그, 연속 웨이블릿 변환의 원리와 구현
% https://www.notion.so/94d98ece06be4215b5ef87a58ab8d2e3?v=788459563a6c4da1aa02242000d19b14

y1 = my_psi(100);
y2 = my_psi(400);
t = linspace(0, 10, 500);
x = sin(2*pi*t);
res100 = wavelet_convolution(x, 100);
res400 = wavelet_convolution(x, 400);
% figure; plot(real(res100))
% hold on;
% plot(real(res400));

%% 직접 convolution 해보면?
% 
% figure;plot(conv(x, real(y1)))
% hold on;
% plot(real(res100))

%% wavelet transform?

x = 0:1/100:10-1/100;
y1 = sin(1 * pi * x);
y2 = [y1, sin(2*pi*x)];
y3 = [y2, sin(4*pi*x)];

plot(y3);

res = my_cwt(y3);
figure;
imagesc(sqrt(real(res).^2 + imag(res).^2))


clear; close all; clc;


my_color = lines(3);
my_color(3,:) = [0.494, 0.184, 0.556];

%% pic0: 두 점을 통과하는 직선 찾기 문제
figure; hold on;
xlim([-2, 3])
ylim([-2, 7])
line([0, 0], ylim)
line(xlim, [0, 0])
plot(-1, 0,'o','markerfacecolor',my_color(1,:),'markeredgecolor','none','markersize',12);
% plot(0, 1,'o','markerfacecolor',my_color(2,:),'markeredgecolor','none','markersize',12);
plot(0, 3,'o','markerfacecolor',my_color(3,:),'markeredgecolor','none','markersize',12);
grid on;

set(gcf,'color','w')
xlabel('$$x$$','interpreter','latex')
ylabel('$$y$$','interpreter','latex')

text(-1.2, 0.71574, '(-1, 0)','fontsize',12)
% text(0.2, 1.2143, '(0, 1)','fontsize',12)
text(0.2, 3.3397, '(0, 3)','fontsize',12)
%% pic1
figure; hold on;
xlim([-2, 3])
ylim([-2, 7])
line([0, 0], ylim)
line(xlim, [0, 0])
plot(-1, 0,'o','markerfacecolor',my_color(1,:),'markeredgecolor','none','markersize',12);
plot(0, 1,'o','markerfacecolor',my_color(2,:),'markeredgecolor','none','markersize',12);
plot(0, 3,'o','markerfacecolor',my_color(3,:),'markeredgecolor','none','markersize',12);
grid on;

set(gcf,'color','w')
xlabel('$$x$$','interpreter','latex')
ylabel('$$y$$','interpreter','latex')

text(-1.2, 0.71574, '(-1, 0)','fontsize',12)
text(0.2, 1.2143, '(0, 1)','fontsize',12)
text(0.2, 3.3397, '(0, 3)','fontsize',12)
saveas(gcf, 'pic1.png')

%% pic2
close all;
v = [-1, 1, 0;
    0, 1, 1;
    0, 1, 3];

%{
아래와 같이 두 벡터를 포함하는 평면의 방정식
(-1, 0, 0), (1, 1, 1)

==> y-z = 0
%}

[x,y] = meshgrid(linspace(-1, 1, 10));

figure;
surf(x, y, y)
hold on;
axis vis3d
for i = 1:size(v,2)
    plot3([0, v(1, i)], [0, v(2, i)], [0, v(3, i)],'-','color',my_color(i,:),'linewidth',3)
    plot3(v(1, i), v(2, i), v(3, i), 'o','markerfacecolor',my_color(i,:),'markeredgecolor','none')
end
xlim([-1, 1])
ylim([-1, 1])

newVid = VideoWriter('pic4', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);
set(gcf,'color','w')
xlabel('$$x$$','interpreter','latex')
ylabel('$$y$$','interpreter','latex')
zlabel('$$z$$','interpreter','latex')

for i = 1:360
    disp(i)
    camorbit(1, 0, 'data')
    writeVideo(newVid, getframe(gcf))
    drawnow
end
close(newVid)

%% x hat 계산

A = [-1, 1; 0, 1; 0, 1];
b = [0; 1; 3];

x_hat = inv(A'*A)*A'*b;


figure; hold on;
xlim([-2, 3])
ylim([-2, 7])
line([0, 0], ylim)
line(xlim, [0, 0])
plot(-1, 0,'o','markerfacecolor',my_color(1,:),'markeredgecolor','none','markersize',12);
plot(0, 1,'o','markerfacecolor',my_color(2,:),'markeredgecolor','none','markersize',12);
plot(0, 3,'o','markerfacecolor',my_color(3,:),'markeredgecolor','none','markersize',12);
grid on;

set(gcf,'color','w')
xlabel('$$x$$','interpreter','latex')
ylabel('$$y$$','interpreter','latex')

text(-1.2, 0.71574, '(-1, 0)','fontsize',12)
text(0.2, 1.2143, '(0, 1)','fontsize',12)
text(0.2, 3.3397, '(0, 3)','fontsize',12)

xx = linspace(-2, 3, 100);
yy = x_hat(1) * xx + x_hat(2);
plot(xx, yy,'r','linewidth',2)

saveas(gcf, 'pic6.png')

%% pic 7
rng(1)
x = rand(1, 50) * 100 + 1; % 1~100 사이의 랜덤한 데이터 50개
y = 3 * x + 1 + randn(size(x)) * 30;
y = abs(y);

figure; plot(x, y, 'o');
% xlabel('인구 수 (만 명)'); ylabel('고속도고 사고 발생 건수 (건)'); grid on;
% title('여러 도시에서 발생한 교통사고 건수와 그 주의 인구');
xlabel('# Population(10k)'); ylabel('# Accidents on Highway'); grid on;
title('# Accidents on highway in various cities and their population');

c1 = fit(x', y', 'poly1');
XLIMs = xlim;

xx = linspace(XLIMs(1), XLIMs(2), 100);
yy = c1.p1 * xx + c1.p2;
% hold on;
% plot(xx, yy, 'r','linewidth',2)

saveas(gcf, 'pic7.png')

%% pic 10
close all;
Ngrid = 50;
[a, b] = meshgrid(linspace(-30, 30, Ngrid), linspace(-30, 30, Ngrid));

f = zeros(size(a));
[x_norm, min_x_norm, max_x_norm] = fun_minmax_normalize(x);
[y_norm, min_y_norm, max_y_norm] = fun_minmax_normalize(y);
c2 = fit(x_norm', y_norm', 'poly1');

for i = 1:Ngrid
    for j = 1:Ngrid
        f(i, j) = 1/2 * 1/length(x) * sum((a(i,j) * x_norm + b(i,j) - y_norm).^2);
    end
end
figure('position',[488.0000  342.0000  926.6000  420.0000])
subplot(1,2,1);
surf(a, b, f)
hold on;
plot3(c2.p1, c2.p2, 1/2 * 1/length(x) * sum((c2.p1 * x_norm + c2.p2 - y_norm).^2),'p',...
    'markersize',20,'markerfacecolor','r','markeredgecolor','none');
axis vis3d
xlabel('s'); ylabel('i'); zlabel('cost');

subplot(1,2,2);
contour(a,b,f, 30)
hold on;

plot(c2.p1, c2.p2, 'p',...
    'markersize',20,'markerfacecolor','r','markeredgecolor','none');
xlabel('slope (normalized)'); ylabel('intercept (normalized)'); 

xx = fun_restore_minmax_normalization(linspace(-30, 30, 100), min_x_norm, max_x_norm);
yy = fun_restore_minmax_normalization(linspace(-30, 30, 100), min_y_norm, max_y_norm);

%% 녹화를 위한 회전
newVid = VideoWriter('pic10', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);
set(gcf,'color','w')
subplot(1,2,1)
for i = 1:360
    disp(i)
    camorbit(1, 0, 'data')
    writeVideo(newVid, getframe(gcf))
    drawnow
end
close(newVid)

%% Gradient 설명하기 위한 추가 그림
figure;
contour(a,b,f, 30)
xlabel('slope (normalized)'); ylabel('intercept (normalized)'); 
axis tight
%% Gradient descent 해보기

my_function = @(x, slp, int) slp * x + int;
N = length(x);

lr = 0.05;
temp = rand(2, 1) * 30;
slp = temp(1);
intcpt = temp(2);

slp_saved = slp;
intcpt_saved = intcpt;

n_epoch = 10000;
for i_epoch = 1:n_epoch
    MSE = 0;
    rEra = 0;
    rErb = 0;
    for i_data = 1:N
        yhat = my_function(x_norm(i_data), slp, intcpt);
        rEra = rEra + 1/N * (yhat-y_norm(i_data)) * x_norm(i_data);
        rErb = rErb + 1/N * (yhat-y_norm(i_data));
        MSE = MSE + 1/(2*N) * (yhat - y_norm(i_data))^2;
    end
    
     slp = slp - lr * rEra;
     intcpt = intcpt - lr * rErb;

     slp_saved = [slp_saved, slp];
     intcpt_saved = [intcpt_saved, intcpt];
end

%% 영상 촬영 

newVid = VideoWriter('pic13_en', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);
figure('position',[488.0000  342.0000  926.6000  420.0000],'color','w')
for i_epoch = 1:10:2000

    slp_restored = (slp_saved(i_epoch) * (max_y_norm - min_y_norm) + min_y_norm) / max_x_norm;
    intcpt_restored = (intcpt_saved(i_epoch) * (max_y_norm - min_y_norm) + min_y_norm);
    
    subplot(1, 2, 1);
    plot(x, y, 'o');
    hold on;
    plot(xx, slp_restored * xx + intcpt_restored,'r-','linewidth',2);
    xlim([0, 100])
    ylim([0, 350])

    xlabel('# Population (10k)'); ylabel('# Accidents on Highway'); grid on;
    title('# traffic accidents that occurred in various cities and their population.');
    
    % xlabel('인구 수 (만 명)'); ylabel('고속도고 사고 발생 건수 (건)'); grid on;
    % title('여러 도시에서 발생한 교통사고 건수와 그 주의 인구');
    subplot(1, 2, 2);
    contour(a,b,f, 30)
    hold on;
    plot(slp_saved(1:i_epoch), intcpt_saved(1:i_epoch), 'r');
    plot(slp_saved(i_epoch), intcpt_saved(i_epoch), 'p',...
        'markersize',20,'markerfacecolor','r','markeredgecolor','none');
    xlabel('slope (normalized)'); ylabel('intercept (normalized)'); grid on;
    drawnow

    disp(i_epoch)
    writeVideo(newVid, getframe(gcf))
    
    if i_epoch < n_epoch
        subplot(1,2,1);
        cla
        subplot(1,2,2);
        cla
    end
end
close(newVid)
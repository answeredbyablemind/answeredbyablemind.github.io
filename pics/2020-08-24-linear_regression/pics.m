clear; close all; clc;


my_color = lines(3);
my_color(3,:) = [0.494, 0.184, 0.556];

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

load accidents
x = hwydata(:,14)/10000; %Population of states
y = hwydata(:,4); %Accidents per state

figure; plot(x, y, 'o');
xlabel('인구 수 (만 명)'); ylabel('고속도고 사고 발생 건수 (건)'); grid on;
title('한 주에서 발생한 교통사고 건수와 그 주의 인구');
saveas(gcf,'pic7.png');

%% pic 8
rng(1)
x = rand(1, 50) * 100 + 1; % 1~100 사이의 랜덤한 데이터 50개
y = 3 * x + 1 + randn(size(x)) * 30;
y = abs(y); 

figure; plot(x, y, 'o');
xlabel('인구 수 (만 명)'); ylabel('고속도고 사고 발생 건수 (건)'); grid on;
title('여러 도시에서 발생한 교통사고 건수와 그 주의 인구');

c = fit(x', y', 'poly1');
XLIMs = xlim;

xx = linspace(XLIMs(1), XLIMs(2), 100);
yy = c.p1 * xx + c.p2;
hold on;
plot(xx, yy, 'r','linewidth',2)

%% pic 10
close all;
Ngrid = 50;
[a, b] = meshgrid(linspace(-30, 30, Ngrid), linspace(-30, 30, Ngrid));

f = zeros(size(a));
xx = fun_minmax_normalize(x);
yy = fun_minmax_normalize(y);
for i = 1:Ngrid
    for j = 1:Ngrid
        f(i, j) = 1/2 * 1/length(x) * sum((a(i,j) * xx + b(i,j) - yy).^2);
    end
end
figure;
subplot(1,2,1);
surf(a, b, f)
hold on;
plot3(c.p1, c.p2, 1/2 * 1/length(x) * sum((c.p1 * xx + c.p2 - yy).^2),'p',...
    'markersize',20,'markerfacecolor','r','markeredgecolor','none');


subplot(1,2,2);
contour(a,b,f, 30)

clear; close all; clc;

xx = linspace(-3,3,100);

p1 = [-2, 1.5, 1];
p2 = [3, -2, -5];
yy1 = polyval(poly(p1), xx);
yy2 = polyval(poly(p2), xx);

my_color = lines(4);

%% 표시할 부분 선정

highlight = 65:70;

figure;
plot(xx, yy1, 'color',my_color(1,:),'linewidth',5);
hold on;
plot(xx(highlight), yy1(highlight),'color','r','linewidth',8)
set(gca,'visible','off')
figure;
plot(xx, yy2, 'color',my_color(1,:),'linewidth',5);
hold on;
plot(xx(highlight), yy2(highlight),'color','r','linewidth',8)
set(gca,'visible','off')


%% 박스와 화살표 모든 것들을 MATLAB에서 그려버릴 수 없을까?

newVid = VideoWriter('pic4', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

addpath('../')
figure('position',[680, 558, 1080, 420],'color','w');
patch([-2, -2, 2, 2], [10, -10, -10, 10],'w','edgecolor','k','linewidth',2)
xlim([-9, 9])
ylim([-12, 12])
hold on;
text(0, 0, sprintf('미분방정식 시스템 \n (제차+비제차)'),'HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',12)
text(-6, 10, '<입력 벡터>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',15,'FontWeight','bold')
text(6, 10, '<출력 벡터>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',15,'FontWeight','bold')

% set(gca,'visible','off')
mArrow2(-3.5,0,-2.5,0,{'linewidth',2})
mArrow2(2.5,0,3.5,0,{'linewidth',2})
set(gca,'visible','off');

clear h
for i_text = 1:5
    txt_colors = {'black','black','black','black','black'};
    txt_colors{i_text} = 'red';
    h(1) = text(-6, 0, sprintf('[\\color{%s}2, \\color{%s}3, \\color{%s}5, \\color{%s}1, \\color{%s}4\\color{%s}]', txt_colors{1}, txt_colors{2}, txt_colors{3}, txt_colors{4}, txt_colors{5}, 'black'),...
        'HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',20,'fontweight','bold');
    h(2) = text(6, 0, sprintf('[\\color{%s}8, \\color{%s}5, \\color{%s}1, \\color{%s}2, \\color{%s}7\\color{%s}]', txt_colors{1}, txt_colors{2}, txt_colors{3}, txt_colors{4}, txt_colors{5},'black'),...
        'HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',20,'fontweight','bold');
    
    for ii = 1:10
        writeVideo(newVid, getframe(gcf))
    end
    delete(h);
end

close(newVid)

%% 박스와 화살표 모든 것들을 MATLAB에서 그려버릴 수 없을까?

newVid = VideoWriter('pic5', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

addpath('../')
xx1 = linspace(-8,-4,100);
xx2 = linspace(4,8,100);

p1 = [-11, -8, -6]+2;
p2 = [5.8, 7.9, 10.6]-2;
yy1 = polyval(poly(p1), xx1)-3;
yy2 = -polyval(poly(p2), xx2)-3;

my_color = lines(4);

figure('position',[680, 558, 1080, 420],'color','w');
plot(xx1, yy1, 'color',my_color(1,:),'linewidth',2);
hold on;
plot(xx2, yy2, 'color',my_color(1,:),'linewidth',2);
patch([-2, -2, 2, 2], [10, -10, -10, 10],'w','edgecolor','k','linewidth',2)
text(0, 0, sprintf('미분방정식 시스템 \n (제차+비제차)'),'HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',12)
text(-6, 10, '<입력 함수>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',15,'FontWeight','bold')
text(6, 10, '<출력 함수>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',15,'FontWeight','bold')
xlim([-9, 9])
ylim([-12, 12])
% set(gca,'visible','off')
mArrow2(-3.5,0,-2.5,0,{'linewidth',2})
mArrow2(2.5,0,3.5,0,{'linewidth',2})
set(gca,'visible','off');

highlight = 1:10;

clear h
while(1)
    if any(highlight>length(xx1))
        break;
    end
    h(1) = plot(xx1(highlight), yy1(highlight), 'color','r','linewidth',3);
    h(2) = plot(xx2(highlight), yy2(highlight), 'color','r','linewidth',3);
    
    h(3) = mArrow2(mean(xx1(highlight)) + 1.5, mean(yy1(highlight)) + 1.5,  mean(xx1(highlight)) + 0.5 , mean(yy1(highlight)) + 0.5,{'color','r'});
    h(4) = mArrow2(mean(xx2(highlight)) + 1.5, mean(yy2(highlight)) + 1.5,  mean(xx2(highlight)) + 0.5 , mean(yy2(highlight)) + 0.5,{'color','r'});
    
    for ii = 1:10
        writeVideo(newVid, getframe(gcf))
    end
    
    delete(h)
    highlight = highlight + 10;
end

close(newVid)

%% Delfa function 그리기

newVid = VideoWriter('pic6', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

xis = [0.5, 0.25, 0.1, 0.05, 0.01, 0.0001];
figure('color','w');
linewidth=2;
color = lines(1);
clear h
for i_xi = 1:length(xis)
    xi = xis(i_xi);
    height = 1/(2*xi);
    
    h(1) = plot([-1, -xi],[0, 0],'linewidth',linewidth,'color',color);
    hold on;
    h(2) = plot([-xi,-xi],[0, height],'linewidth',linewidth,'color',color);
    h(3) = plot([-xi, xi],ones(1,2)*height,'linewidth',linewidth,'color',color);
    h(4) = plot([xi,xi],[0, height],'linewidth',linewidth,'color',color);
    h(5) = plot([xi, 1],[0, 0],'linewidth',linewidth,'color',color);
    ylim([0, 10])
    grid on;
    h(6)= text(0.29, 7.39,['$\epsilon = ',num2str(xi),'$'],'interpreter','latex','fontsize',15);
    xlabel('x');
    ylabel('r(x)');
    for ii = 1:10
        writeVideo(newVid, getframe(gcf))
    end
    
    if i_xi < length(xis)
        delete(h)
    end
end

for ii = 1:10
    writeVideo(newVid, getframe(gcf))
end
close(newVid)

%% 함수와 디랙델타함수의 내적

newVid = VideoWriter('pic7', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w');

subplot(2,1,1);
p = [0.00018238, -0.0010983, 0.0041346, 0.020829, -0.063281, 0.3753];
xx = linspace(-5,5,100);
yy = polyval(p, xx);
plot(xx, yy)
hold on; grid on;

xlim([-5, 5])
ylim([-1, 1])

xis = linspace(0.5,0.01, 50);
clear h

linewidth=2;
color = lines(1);

p1 = [0.7, -0.1];
p2 = [0.05, polyval(p,0.05)-0.05];
dp = p2-p1;
quiver(p1(1), p1(2), dp(1), dp(2), 0,'linewidth',2,'MaxHeadSize', 1,'color','r');

for i_xi = 1:length(xis)
    xi = xis(i_xi);

    subplot(2,1,1);
    xx = linspace(-xi,xi,10);
    yy = polyval(p, xx);
    h(1) = plot(xx, yy,'r','linewidth',3);
    
    subplot(2,1,2);
    height = 1/(2*xi);
    
    h(2) = plot([-5, -xi],[0, 0],'linewidth',linewidth,'color',color);
    hold on;
    h(3) = plot([-xi,-xi],[0, height],'linewidth',linewidth,'color',color);
    h(4) = plot([-xi, xi],ones(1,2)*height,'linewidth',linewidth,'color',color);
    h(5) = plot([xi,xi],[0, height],'linewidth',linewidth,'color',color);
    h(6) = plot([xi, 5],[0, 0],'linewidth',linewidth,'color',color);
    grid on;
    h(7)= text(0.29, 7.39,['$\epsilon = ',num2str(xi),'$'],'interpreter','latex','fontsize',15);
    xlabel('x');
    ylabel('r(x)');
    
    xlim([-5, 5])
    ylim([-0.5, 3])
    
        writeVideo(newVid, getframe(gcf))
    
    if i_xi < length(xis)
        delete(h)
    end
end

for ii = 1:10
    writeVideo(newVid, getframe(gcf))
end
close(newVid)

%% 디랙 델타 함수의 이동 및 내적

newVid = VideoWriter('pic8', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w');

subplot(2,1,1);
p = [0.00018238, -0.0010983, 0.0041346, 0.020829, -0.063281, 0.3753];
xx = linspace(-5,5,100);
yy = polyval(p, xx);
plot(xx, yy)
hold on; grid on;

xlim([-5, 5])
ylim([-1, 1])

xis = linspace(0.5,0.01, 50);
clear h

linewidth=2;
color = lines(1);

n_shift = 30;
my_shift = linspace(0,2,n_shift);

clear h

xi= xis(1);
height = 1/(2*xi);

for i_shift = 1:n_shift
    subplot(2,1,1);
    p1 = [0.7+my_shift(i_shift), -0.1];
    p2 = [0.05+my_shift(i_shift), polyval(p,0.05+my_shift(i_shift))-0.05];
    dp = p2-p1;
    h(1) = quiver(p1(1), p1(2), dp(1), dp(2), 0,'linewidth',2,'MaxHeadSize', 1,'color','r');

    subplot(2,1,2);
    h(2) = plot([-5, -xi+my_shift(i_shift)],[0, 0],'linewidth',linewidth,'color',color);
    hold on;
    h(3) = plot([-xi,-xi]+my_shift(i_shift),[0, height],'linewidth',linewidth,'color',color);
    h(4) = plot([-xi, xi]+my_shift(i_shift),ones(1,2)*height,'linewidth',linewidth,'color',color);
    h(5) = plot([xi,xi]+my_shift(i_shift),[0, height],'linewidth',linewidth,'color',color);
    h(6) = plot([xi+my_shift(i_shift), 5],[0, 0],'linewidth',linewidth,'color',color);
    xlabel('x');
    ylabel('r(x)');
    grid on;
    xlim([-5, 5])
    ylim([-0.5, 3])
    writeVideo(newVid, getframe(gcf))
    
    delete(h)
end
subplot(2,1,1);

quiver(p1(1), p1(2), dp(1), dp(2), 0,'linewidth',2,'MaxHeadSize', 1,'color','r');

for i_xi = 1:length(xis)
    xi = xis(i_xi);

    subplot(2,1,1);
    xx = linspace(-xi+my_shift(end),xi+my_shift(end),10);
    yy = polyval(p, xx);
    h(1) = plot(xx, yy,'r','linewidth',3);
    
    subplot(2,1,2);
    height = 1/(2*xi);
    
    h(2) = plot([-5, -xi+my_shift(end)],[0, 0],'linewidth',linewidth,'color',color);
    hold on;
    h(3) = plot([-xi,-xi]+my_shift(end),[0, height],'linewidth',linewidth,'color',color);
    h(4) = plot([-xi, xi]+my_shift(end),ones(1,2)*height,'linewidth',linewidth,'color',color);
    h(5) = plot([xi,xi]+my_shift(end),[0, height],'linewidth',linewidth,'color',color);
    h(6) = plot([xi+my_shift(end), 5],[0, 0],'linewidth',linewidth,'color',color);
    grid on;
    h(7)= text(0.29, 7.39,['$\epsilon = ',num2str(xi),'$'],'interpreter','latex','fontsize',15);
    xlabel('x');
    ylabel('r(x)');
    
    xlim([-5, 5])
    ylim([-0.5, 3])
    
        writeVideo(newVid, getframe(gcf))
    
    if i_xi < length(xis)
        delete(h)
    end
end

for ii = 1:10
    writeVideo(newVid, getframe(gcf))
end
close(newVid)

%%

[X,Y]=meshgrid(linspace(2,10,50));

f = [];

for i = 1:size(X,1)
    for j = 1:size(Y,1)
        if X(i,j)<Y(i,j)
            f(i,j) = 0;
        else
            f(i,j) = 1;
        end
    end
end

figure('color','w')
surf(X,Y,f);
xlabel('x');
ylabel('y');
zlabel('G(x,y)');
% colormap(jet)

%% unit step function

figure;
line([-2, 0], [0, 0],'color','b')
hold on;
plot(0,0,'o','markerfacecolor','w','markeredgecolor','b');
line([0, 0],[0, 1],'linestyle','--','color','b')
plot(0,0.5,'o','markerfacecolor','b','markeredgecolor','none');
line([0, 2], [1, 1],'color','b')
plot(0,1,'o','markerfacecolor','w','markeredgecolor','b');
grid on;
ylim([-0.2, 1.2])
xlabel('$$x$$','interpreter','latex');
ylabel('$$H(x)$$','interpreter','latex');
title('Unit step function $$H(x)$$','interpreter','latex');


%% unit step function H(x-y)

figure;
line([-1, 3], [1, 1],'color','b')
hold on;
line([3, 3], [1, 0],'linestyle','--','color','b')
line([3, 7], [0, 0],'color','b')
plot(3, 1,'o','markerfacecolor','w','markeredgecolor','b');
plot(3, 0.5,'o','markerfacecolor','b','markeredgecolor','none');
plot(3, 0,'o','markerfacecolor','w','markeredgecolor','b');

set(gca,'xtick',[0, 3])
grid on;
set(gca,'xticklabel',{'$$0$$','$$x$$'},'TickLabelInterpreter','latex')

ylim([-0.2, 1.2])
xlabel('$$y$$','interpreter','latex');
ylabel('$$H(x-y)$$','interpreter','latex');
title('Unit step function $$H(x-y)$$','interpreter','latex');
set(gca,'fontsize',12)

%% Green function for 예시 문제 2

[X,Y]=meshgrid(linspace(0,1,50));
f = [];
for i = 1:size(X,1)
    for j = 1:size(Y,1)
        if X(i,j)<Y(i,j)
            f(i,j) = -X(i,j);
        else
            f(i,j) = -Y(i,j);
        end
    end
end

figure;
surf(X,Y, f)
xlabel('x');
ylabel('y');
zlabel('G(x,y)');
view([-81.9, 24.4])

%% Green function 예시 문제 3

[X,Y]=meshgrid(linspace(0,1,50));
k=1;
f = [];
for i =1:size(X,1)
    for j = 1:size(Y,1)
        if X(i,j) < Y(i,j)
            f(i,j) = cos(k*X(i,j))*cos(k*(Y(i,j)-1))./(k*sin(k*1));
        else
            f(i,j) = cos(k*(X(i,j)-1))*cos(k*Y(i,j))/(k*sin(k*1));
        end
    end
end

figure;
surf(X,Y,f)
xlabel('x');
ylabel('y');
zlabel('G(x,y)');
view(-76.3, 32.4)

%% 양 끝이 고정되어 있는 로프의 움직임에 관한 미분방정식의 그린 함수

y = pi/3;

x = linspace(0,pi,100);
for i_x = 1:length(x)
    if x(i_x)<y
        G(i_x)=(1/pi*y-1) * x(i_x);
    else
        G(i_x)=(1/pi*y) * x(i_x)-y;
    end
end


figure;
plot(x,G,'linewidth',2)

xlabel('$$x$$','interpreter','latex');
ylabel('$$G(x, \pi/3)$$','interpreter','latex')
grid on;
xlim([0, pi])
ylim([-1, 0.2])
set(gca,'xtick',[0, pi/3, 2*pi/3, pi]);
set(gca,'xticklabel',{'$$0$$','$$\pi/3$$','$$2\pi/3$$','$$\pi$$'},'TickLabelInterpreter','latex')
title('y=pi/3 인 경우의 그린 함수 G(x,pi/3)')
set(gca,'fontsize',12)
%%
[X,Y]=meshgrid(linspace(0,pi,50));
f = [];
for i =1:size(X,1)
    for j = 1:size(Y,1)
        if X(i,j) < Y(i,j)
            f(i,j) = (Y(i,j)/pi-1)*X(i,j);
        else
            f(i,j) = Y(i,j)/pi*X(i,j)-Y(i,j);
        end
    end
end

figure;
surf(X,Y,f)
xlim([0, pi])
ylim([0, pi])
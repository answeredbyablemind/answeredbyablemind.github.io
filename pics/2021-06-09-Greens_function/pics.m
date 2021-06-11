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
xx1 = linspace(-8,-4,100);
xx2 = linspace(4,8,100);

p1 = [-11, -8, -6]+2;
p2 = [5.8, 7.9, 10.6]-2;
yy1 = polyval(poly(p1), xx1);
yy2 = -polyval(poly(p2), xx2);

my_color = lines(4);

figure('position',[680, 558, 1080, 420],'color','w');
plot(xx1, yy1, 'color',my_color(1,:),'linewidth',2);
hold on;
plot(xx2, yy2, 'color',my_color(1,:),'linewidth',2);
patch([-2, -2, 2, 2], [10, -10, -10, 10],'w','edgecolor','k','linewidth',2)
text(0, 0, sprintf('미분방정식 시스템 \n (제차+비제차)'),'HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',12)
text(mean(xx1), 10, '<입력 함수>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',12)
text(mean(xx2), 10, '<출력 함수>','HorizontalAlignment','center','VerticalAlignment','middle','fontname','나눔고딕','fontsize',12)
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
    
    


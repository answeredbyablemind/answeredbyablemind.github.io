clear; close all; clc;

%% pic1 원 위의 회전
newVid = VideoWriter('pic1','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:8;

figure('color','w');
xs = cos(2*pi*0.25*t);
ys = sin(2*pi*0.25*t);

plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
hold on;
axis square
grid on;
set(gca,'visible','off')
for i_t = 1:length(t)
    h = plot(xs(i_t), ys(i_t), 'o', 'markerfacecolor','r','markeredgecolor','k','markersize',10);
    txt = text(0, 0, sprintf('$$t = %.2fs$$', t(i_t)),'HorizontalAlignment','center','fontsize',20,'interpreter','latex');
    writeVideo(newVid, getframe(gcf));
    
    drawnow;
    if i_t< length(t)
        delete(h)
        delete(txt)
    end
end
close(newVid);


%% pic2 원 위의 회전 + x, y 축 위에 정사영 된 것도 표현
newVid = VideoWriter('pic2','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:8;

figure('color','w','position',[667, 421, 936, 420]);
xs = cos(2*pi*0.25*t);
ys = sin(2*pi*0.25*t);

subplot(1,2,1);
plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
hold on;
axis square
grid on;
set(gca,'visible','off')

subplot(1,2,2);
plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
hold on;
axis square
grid on;
set(gca,'visible','off')


for i_t = 1:length(t)
    subplot(1,2,1);
    h1 = plot(xs(i_t), ys(i_t), 'o', 'markerfacecolor',ones(1,3) * 0.3,'markeredgecolor','k','markersize',10);
    txt1 = text(0, 0, sprintf('$$t = %.2fs$$', t(i_t)),'HorizontalAlignment','center','fontsize',20,'interpreter','latex');
    h1_1 = plot(xs(i_t), 0, 'o', 'markerfacecolor','r','markeredgecolor','k','markersize',10);
    
    h1_2 = line(ones(1,2) * xs(i_t), [0, ys(i_t)],'color','k','linestyle','--');
    
    
    subplot(1,2,2);
    h2 = plot(xs(i_t), ys(i_t), 'o', 'markerfacecolor',ones(1,3) * 0.3,'markeredgecolor','k','markersize',10);
    txt2 = text(0, 0, sprintf('$$t = %.2fs$$', t(i_t)),'HorizontalAlignment','center','fontsize',20,'interpreter','latex');
    h2_1 = plot(0, ys(i_t), 'o', 'markerfacecolor','r','markeredgecolor','k','markersize',10);
    h2_2 = line([0, xs(i_t)], ones(1,2) * ys(i_t),'color','k','linestyle','--');
    
    writeVideo(newVid, getframe(gcf));
    
    drawnow;
    if i_t< length(t)
        delete(h1)
        delete(h2)
        delete(h1_1)
        delete(h2_1)
        delete(h1_2);
        delete(h2_2);
        
        delete(txt1)
        delete(txt2)
    end
end
close(newVid);

%% pic3
newVid = VideoWriter('pic3','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:4;

figure('color','w','position',[680, 286, 1017, 692]);
xs = cos(2*pi*0.25*t);
ys = sin(2*pi*0.25*t);

subplot(2,2,1);
plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
hold on;
axis square
grid on;
set(gca,'visible','off')
line([0, 0], [-1, 1], 'color','k','linestyle','--')
line([-1, 1], [0, 0], 'color','k','linestyle','--')

subplot(2,2,2);
set(gca,'visible','off');
xlim([-0.5, 4]);
ylim([-1.2, 1.2]);
mArrow2(0, -1, 0, 1, {'color','k'});
mArrow2(-0.5, 0, 4, 0, {'color','k'});
text(4.5, -0.1,'time(s)','HorizontalAlignment','center')
text(0, 1.15, 'y(t)', 'HorizontalAlignment','center');
hold on;

subplot(2,2,3);
axis square
set(gca,'visible','off');
xlim([-1.2, 1.2]);
ylim([-5, 0.5]);
mArrow2(-1, 0, 1, 0, {'color','k'});
mArrow2(0, 0.5, 0, -5, {'color','k'});
text(1.15, -0.1,'x(t)','HorizontalAlignment','center')
text(0, -5.5, 'time(s)', 'HorizontalAlignment','center');
hold on;

addpath('..\');
for i_t = 1:length(t)
    subplot(2,2,1);
    h1 = plot(xs(i_t), ys(i_t), 'o', 'markerfacecolor',ones(1,3) * 0.3,'markeredgecolor','k','markersize',10);
    txt1 = text(0, -1.2, sprintf('$$t = %.2fs$$', t(i_t)),'HorizontalAlignment','center','fontsize',15,'interpreter','latex');
    h1_1 = plot(xs(i_t), 0, 'o', 'markerfacecolor','r','markeredgecolor','k','markersize',10);
    h1_2 = plot(0, ys(i_t), 'o', 'markerfacecolor','b','markeredgecolor','k','markersize',10);
    h1_3 = line(ones(1,2) * xs(i_t), [0, ys(i_t)],'color','k','linestyle','--');
    h1_4 = line([0, xs(i_t)], ones(1,2) * ys(i_t),'color','k','linestyle','--');

    subplot(2,2,2);
    h2_1 = plot(t(1:i_t), ys(1:i_t),'b--');
    h2_2 = plot(t(i_t), ys(i_t),'o','markerfacecolor','b','markeredgecolor','k','markersize',10);
    
    subplot(2,2,3);
    h3_1 = plot(xs(1:i_t),-t(1:i_t), 'r--');
    h3_2 = plot(xs(i_t),-t(i_t),'o','markerfacecolor','r','markeredgecolor','k','markersize',10);
    
    writeVideo(newVid, getframe(gcf));

    drawnow;
    if i_t< length(t)
        delete(h1)
        delete(h1_1)
        delete(h1_2);
        delete(h1_3);
        delete(h1_4);
        delete(txt1);
        
        delete(h2_1);
        delete(h2_2);
        
        delete(h3_1);
        delete(h3_2);
    end
end
close(newVid);
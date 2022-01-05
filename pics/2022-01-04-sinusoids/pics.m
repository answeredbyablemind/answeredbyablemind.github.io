clear; close all; clc;

%% pic1 원 위의 회전
newVid = VideoWriter('pic1','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:10;

figure('color','w');
xs = cos(2*pi*0.5*t);
ys = sin(2*pi*0.5*t);

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
t = 0:1/fs:10;

figure('color','w','position',[667, 421, 936, 420]);
xs = cos(2*pi*0.5*t);
ys = sin(2*pi*0.5*t);

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

%% pic2 원 위의 회전 + x, y 축 위에 정사영 된 것도 표현
newVid = VideoWriter('pic2','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:10;

figure('color','w','position',[667, 421, 936, 420]);
xs = cos(2*pi*0.5*t);
ys = sin(2*pi*0.5*t);

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
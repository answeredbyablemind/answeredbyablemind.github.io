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
line([-1, 1], [0, 0],'color','k','linestyle','--')

subplot(1,2,2);
plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
hold on;
axis square
grid on;
set(gca,'visible','off')
line([0, 0], [-1, 1], 'color','k','linestyle','--')

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

figure('color','w','position',[680, 286, 1018, 692]);
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

%%
t = 0:1/fs:4;
figure('position',[680, 675, 860, 300]);
h(1) = plot(t, cos(2*pi*0.25*t),'r','linewidth',2);
hold on;
h(2) = plot(t, sin(2*pi*0.25*t),'b','linewidth',2);
grid on;
xlabel('time(s)');
legend(h, {'cosine wave','sine wave'},'location','best'); clear h
ylabel('x(t), y(t)');
set(gca,'fontsize',12);
set(gca,'fontname','나눔고딕');


%% pic5: 서로 다른 세 개의 반지름을 갖는 원
newVid = VideoWriter('pic5','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:4;

figure('color','w','position',[680, 686, 1018, 292]);
xs = cos(2*pi*0.25*t);
ys = sin(2*pi*0.25*t);


rs = [0.5, 1, 2];
for i_rs = 1:length(rs)
    subplot(1,3,i_rs);
    plot(rs(i_rs)*cos(linspace(0, 2*pi, 100)), rs(i_rs)*sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
    hold on;
    axis square
    grid on;
    set(gca,'visible','off')
    xlim([-2, 2])
    ylim([-2, 2])
    line([0, rs(i_rs)], [0, 0],'color','k','linewidth',1,'linestyle','--')
    text(0, -rs(i_rs) - 0.2,  ['r = ', num2str(rs(i_rs))],'HorizontalAlignment','center','fontsize', 15);
end

msize = [10, 15, 20];
for i_t = 1:length(t)

    for i_rs = 1:length(rs)
        subplot(1,3,i_rs);
        h(i_rs) = plot(rs(i_rs)*xs(i_t), rs(i_rs)*ys(i_t),'o','markerfacecolor','r','markeredgecolor','k','markersize', msize(i_rs));
        hold on;
        axis square
        grid on;
        set(gca,'visible','off')
        xlim([-2, 2])
        ylim([-2, 2])
    end
    
    writeVideo(newVid, getframe(gcf));

    drawnow;
    if i_t< length(t)
        delete(h)
    end
end
close(newVid);

%% pic 7 서로 다른 주파수를 갖는 원 세개

newVid = VideoWriter('pic7','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

fs = newVid.FrameRate;
t = 0:1/fs:4;

figure('color','w','position',[680, 686, 1018, 292]);
freqs = [0.25, 0.5, 1];
xs = [cos(2*pi*freqs(1)*t); cos(2*pi*freqs(2)*t); cos(2*pi*freqs(3)*t)];
ys = [sin(2*pi*freqs(1)*t); sin(2*pi*freqs(2)*t); sin(2*pi*freqs(3)*t)];
for i_fs = 1:length(freqs)
    subplot(1,3,i_fs);
    plot(cos(linspace(0, 2*pi, 100)), sin(linspace(0, 2*pi, 100)),'k','linewidth',2);
    hold on;
    axis square
    grid on;
    set(gca,'visible','off')
    xlim([-2, 2])
    ylim([-2, 2])
    text(0, - 1.2,  ['f = ', num2str(freqs(i_fs)),'Hz'],'HorizontalAlignment','center','fontsize', 15);
end

for i_t = 1:length(t)

    for i_fs = 1:length(freqs)
        subplot(1,3,i_fs);
        h(i_fs) = plot(xs(i_fs,i_t), ys(i_fs,i_t),'o','markerfacecolor','r','markeredgecolor','k','markersize', 10);
        hold on;
        axis square
        grid on;
        set(gca,'visible','off')
        xlim([-2, 2])
        ylim([-2, 2])
    end
    
    writeVideo(newVid, getframe(gcf));

    drawnow;
    if i_t< length(t)
        delete(h)
    end
end
close(newVid);

%% pic 8

figure('position',[680, 707, 970, 270]);
set(gca,'visible','off')
tt = linspace(0, 2*pi, 100);
mArrow2(-0.5, 0, 8, 0,{'color','k'})
hold on;
mArrow2(0, -1, 0, 1,{'color','k'})
xlim([-0.5, 8])

plot(tt, sin(tt), 'k','linewidth',2);
plot(tt + pi/4, sin(tt),'k--','linewidth',2);
set(gca,'xtick', [0, pi/4, pi/2, pi])
%% pic9


newVid = VideoWriter('pic9','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);
fs = newVid.FrameRate;

t = 0:1/fs:4;

phis = [pi/6, pi-pi/3];

figure('color','w','position',[680, 411, 1030, 560]);

subplot(2,3,1);
set(gca,'visible','off')
hold on;
tt = linspace(0, 2*pi, 100);
plot(cos(tt), sin(tt), 'k', 'linewidth',2);
xlim([-1, 1])
ylim([-1, 1])

axis square
line([-1, 1], [0, 0],'color','k','linestyle','--')
line([0, 0], [-1, 1],'color','k','linestyle','--')
text(0, -1.2, '$$\phi=\pi/6$$','interpreter','latex','HorizontalAlignment','center','fontsize',20)

subplot(2,3,2:3);
set(gca,'visible','off')
xlim([-0.2, 4.2])
ylim([-1, 1])
hold on;

mArrow2(0, -1, 0, 1, {'color','k'});
mArrow2(-0.5, 0, 4, 0, {'color','k'});

subplot(2,3,4);
set(gca,'visible','off')
hold on;
tt = linspace(0, 2*pi, 100);
plot(cos(tt), sin(tt), 'k', 'linewidth',2);
xlim([-1, 1])
ylim([-1, 1])


axis square
line([-1, 1], [0, 0],'color','k','linestyle','--')
line([0, 0], [-1, 1],'color','k','linestyle','--')
text(0, -1.2, '$$\phi=2\pi/3$$','interpreter','latex','HorizontalAlignment','center','fontsize',20)

subplot(2,3,5:6);
set(gca,'visible','off')
xlim([-0.2, 4.2])
ylim([-1, 1])
hold on;
mArrow2(0, -1, 0, 1, {'color','k'});
mArrow2(-0.5, 0, 4, 0, {'color','k'});

xs = [cos(2*pi*0.25*t+phis(1)); cos(2*pi*0.25*t+phis(2))];
ys = [sin(2*pi*0.25*t+phis(1)); sin(2*pi*0.25*t+phis(2))];

for i_t = 1:length(t)
    for i_phi = 1:length(phis)
        subplot(2,3,1+3*(i_phi-1));
        
        h(i_phi) = plot(xs(i_phi,i_t), ys(i_phi,i_t),'o','markerfacecolor','r','markeredgecolor','k','markersize', 10);
        hold on;
        axis square
        grid on;
        set(gca,'visible','off')
        
        if i_phi == 1
            subplot(2,3, 2:3)
        elseif i_phi == 2
            subplot(2,3, 5:6)
        end
        
        h2(i_phi) = plot(t(i_t), ys(i_phi, i_t),'o','markerfacecolor','r','markeredgecolor','k','markersize',10);
        h3(i_phi) = plot(t(1:i_t), ys(i_phi, 1:i_t),'k--');
        
        
    end
    
    if i_t == 1 || i_t == length(t)
        for iii = 1:59
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    writeVideo(newVid, getframe(gcf));

    drawnow;
    if i_t< length(t)
        delete(h);
        delete(h2);
        delete(h3);
    end
end

close(newVid);


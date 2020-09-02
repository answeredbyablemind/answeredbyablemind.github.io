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

newVid = VideoWriter('pic2', 'MPEG-4'); % New
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

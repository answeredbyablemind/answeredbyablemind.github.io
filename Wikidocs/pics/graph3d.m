close all;
figure('color','w');
% (4, 5, 2), (2, 4, 3), (4, 2, 4)
x = [4, 2, 4];
y = [5, 4, 2];
z = [2, 3, 4];
stem3(x, y, z, 'ko--')
hold on;
plot3(x, y, z,'k','linewidth',2)
text(4+0.2, 5+0.2, 2, '(4, 5, 2)')
text(2-0.2, 4+0.2, 3, '(2, 4, 3)')
text(4+0.2, 2+0.2, 4, '(4, 2, 4)')

grid on;
xlim([1, 5])
ylim([1, 6])
xticks(1:5);
yticks(1:6)
xlabel('x-axis');
ylabel('y-axis')
zlabel('z-axis')

newVid = VideoWriter('pic_xyz.mp4', 'MPEG-4'); % New
newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

for i = 0:0.5:359
    view(-37.5 + i, 30)

    drawnow;
    writeVideo(newVid, getframe(gcf)) % 0.5초씩 그리기

end


for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)
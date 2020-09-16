clear; close all; clc;

n_iter = 10000;
accept = 0;
reject = 0;
figure('position',[680, 558, 453, 420],'color','w')

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

for i_iter = 1:n_iter
    x = rand(1) * 2 -1;
    y = rand(1) * 2 -1;
    
    if (x^2 + y^2) <= 1
        accept = accept + 1;
        c = 'r';
    else
        reject = reject + 1;
        c = 'b';
    end
    plot(x, y,'.', 'color',c);
    hold on;
    
    t = text(0, -0.77557, sprintf('추정 넓이: %.4f',4 * accept / i_iter),'fontsize',15,'fontweight','bold','BackgroundColor','w');
    
    if rem(i_iter, 100) == 0
        xlim([-1, 1])
        ylim([-1, 1])
        writeVideo(newVid, getframe(gcf))
        drawnow;
    end
    
    if i_iter < n_iter
        delete(t);
    end
end

for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end


close(newVid)



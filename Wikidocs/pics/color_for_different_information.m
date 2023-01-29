close all;
figure('color','w');
peaks(50);
cbar = colorbar;
h = findobj('type', 'surf');

x = h.XData;
y = h.YData;
z = h.ZData;

h.CData = sqrt(x.^2 + y.^2);

title(cbar, 'dist from origin')

[ez_default, al_default] = view;

al_vec = [linspace(30, 90, 100), linspace(90, 30, 100)];

newVid = VideoWriter('pic_color_dif_info.mp4', 'MPEG-4'); % New
newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

for i_al = 1:length(al_vec)
    view(ez_default, al_vec(i_al));
    drawnow;
    writeVideo(newVid, getframe(gcf)) % 0.5초씩 그리기

    if i_al == 100
        for j = 1:60
            writeVideo(newVid, getframe(gcf));
        end
    end
end
close(newVid)
clear; close all; clc;

addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
%% 2차원 벡터공간 span animation

figure;
hold on;

set(gca,'Color',[120, 120, 120]/255)
xlabel('$$x$$', 'interpreter','latex');
ylabel('$$y$$', 'interpreter','latex');
grid on;

xlim([-4, 4])
ylim([-4, 4])
[X, Y]= meshgrid(-3:3, -3:3);

x = flipud(X(:));
y = flipud(Y(:));

my_color = flipud(parula(length(x)));

newVid = VideoWriter('pic4', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);

for i = 1:length(x)
    if ~(x(i) == 0 && y(i) == 0)
        hObj = Annotate(gca, 'arrow', [0, x(i)], [0, y(i)]);
        hObj.Primitive.Color = my_color(i, :);
        hObj.Primitive.LineWidth = 2;
        
        writeVideo(newVid, getframe(gcf))
        drawnow
    end
end

close(newVid)

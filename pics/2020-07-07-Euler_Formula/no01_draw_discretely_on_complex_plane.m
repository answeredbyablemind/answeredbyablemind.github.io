clear; close all; clc;

%% 다양한 n에 대하여

fun_plot_Euler_Discretely(1); saveas(gcf,'euler_n_1.png')
fun_plot_Euler_Discretely(2); saveas(gcf,'euler_n_2.png')
fun_plot_Euler_Discretely(3); saveas(gcf,'euler_n_3.png')
fun_plot_Euler_Discretely(10); saveas(gcf,'euler_n_10.png')

close all;
%% n을 변화시켜가면서 gif로 만들기

clear v
v = VideoWriter('various_n_Euler_discretely.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

n = 20;
figure;

for i = 1:n
    
    fun_plot_Euler_Discretely(i,'newFigure',false)
    t = text(0.5, 1.1853, ['n = ',num2str(i)]);
    set(t, 'fontsize',15)
    pause(0.5)
    
    F(i)=getframe(gcf);
    
    if i<n
        cla
    end
    
end

for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)
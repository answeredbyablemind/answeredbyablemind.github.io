clear; close all; clc;
rng(1)
data = [58, 69, 64, 55, 51, 41, 51, 71, 42];

%% ¾Ö´Ï¸ÞÀÌ¼Ç ¸¸µé±â!

figure('color','w');
hold on;
xlim([-25, 25])
ylim([0, 20])
set(gca,'fontsize',12)
set(gca,'fontname','³ª´®°íµñ')
grid on;
text(-19.758, 19.504, '½ÇÇè±º°ú ´ëÁ¶±º','fontsize',12, 'fontname','³ª´®°íµñ')
str = sprintf('\\color{%s} %d %d %d %d \\color{%s} %d %d %d %d %d', 'red', data(1:4), 'blue', data(5:9));
text(-24.826, 18.058, str, 'fontsize',13, 'fontname','³ª´®°íµñ')

text(4.122, 19.504, '°¢ ±×·ì Æò±Õ°ª°ú Â÷ÀÌ','fontsize',12, 'fontname','³ª´®°íµñ')
str = sprintf('\\color{%s} %0.2f \\color{black} - \\color{%s} %0.2f \\color{black} = %0.2f', 'red', mean(data(1:4)), 'blue', mean(data(5:9)), mean(data(1:4))-mean(data(5:9)));
text(3, 18.058, str, 'fontsize',13, 'fontname','³ª´®°íµñ')

plot((mean(data(1:4))-mean(data(5:9)))*ones(1,2), [0, 15], 'color', [0.929, 0.694, 0.125],'linewidth',3);
plot((mean(data(1:4))-mean(data(5:9))), 15, '*','color',[0.929, 0.694, 0.125],'markersize',10,'linewidth',3);

xpos_data = [-22.9838709677419,-20.1036866359447,-17.5691244239631,-14.6889400921659,-11.6935483870968,-8.92857142857143,-6.27880184331797,-3.51382488479263,-0.518433179723498];
ypos_data = 17.5;

histdata2show = [];
xlabel('±×·ì º° Æò±Õ Â÷ÀÌ')
ylabel('bin count')

newVid = VideoWriter('perm_vid','MPEG-4');

newVid.FrameRate = 5;
newVid.Quality = 100;
open(newVid);

for i = 1:100
    rand_order = randperm(length(data));
    
    mn1 = mean(data(rand_order(1:4)));
    mn2 = mean(data(rand_order(5:end)));
    
    my_txt(1) = text(-16.76, 14, sprintf('%0.2f',mn1),'fontsize',12, 'HorizontalAlignment', 'center', 'fontname','³ª´®°íµñ');
    my_txt(2) = text(-13.5, 14, '-','fontsize',12, 'HorizontalAlignment', 'center', 'fontname','³ª´®°íµñ');
    my_txt(3) = text(-10.2, 14, sprintf('%0.2f',mn2),'fontsize',12, 'HorizontalAlignment', 'center', 'fontname','³ª´®°íµñ');
    my_txt(4) = text(-6.7, 14, '=','fontsize',12, 'HorizontalAlignment', 'center', 'fontname','³ª´®°íµñ');
    my_txt(5) = text(-3.5, 14, sprintf('%0.2f', mn1-mn2),'fontsize',12, 'HorizontalAlignment', 'center', 'fontname','³ª´®°íµñ');

    for j = 1:4
        my_lines(j) = plot([xpos_data(rand_order(j)), -16.76], [ypos_data, 14.5],'k-'); 
    end
    
    for j = 5:9
        my_lines(j) = plot([xpos_data(rand_order(j)), -10.2], [ypos_data, 14.5],'k--'); 
    end
    
    histdata2show = [histdata2show (mn1-mn2)];
    
    my_hist = histogram(histdata2show, length(histdata2show),'FaceColor',lines(1), 'binwidth',1);
    my_lines(10) = plot((mn1-mn2)*ones(1,2), [0, 13],'r');
    my_lines(11) = plot(mn1-mn2, 13, 'r*');
    
    my_pval = sum(histdata2show > (mean(data(1:4))-mean(data(5:9)))) / length(histdata2show);
    my_txt(6) = text(11.8088, 14, sprintf('p-value = %0.2f', my_pval),'fontsize',12, 'fontname','³ª´®°íµñ');
    writeVideo(newVid, getframe(gcf));
    if i<5
        writeVideo(newVid, getframe(gcf));
        writeVideo(newVid, getframe(gcf));
        writeVideo(newVid, getframe(gcf));
        writeVideo(newVid, getframe(gcf));
        writeVideo(newVid, getframe(gcf));
    end

    drawnow;
    
    delete(my_txt)
    delete(my_lines)
    
    if i < 100
        delete(my_hist)
    else
        my_txt(6) = text(11.8088, 14, sprintf('p-value = %0.2f', my_pval),'fontsize',12, 'fontname','³ª´®°íµñ');
        text(-9, 10, '¡é ¡é', 'color',lines(1),'fontsize',20, 'fontname','³ª´®°íµñ','fontweight','bold')
        text(-17.96, 12, 'Permutation ºÐÆ÷', 'color',lines(1),'fontsize',20, 'fontname','³ª´®°íµñ','fontweight','bold')
    end
    
end
close(newVid)
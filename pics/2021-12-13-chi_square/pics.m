clear; close all; clc;
xx = linspace(-3,3,100);
yy = normpdf(xx, 0, 1);

figure;
% subplot(2,1,1);
plot(xx, yy)
set(gca,'visible','off')
% subplot(2,1,2);
% rng(1)
% plot(randn(1), 0, 'ro');
% xlim([-3, 3])

%%
figure;
newVid = VideoWriter('pic2','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);
rng(1);
my_list = randn(1,1000);
my_list = my_list.^2;

for i = round(linspace(1,1000,100))
    histogram(my_list(1:i));
    xlim([0, 12])
    xlabel('x');
    ylabel('frequency');
    title('자유도가 1인 카이제곱 분포 시뮬레이션');
    grid on;
    YLIM = ylim;
    text(8, YLIM(2) * 0.9, ['반복 횟수 = ',num2str(i)], 'fontsize', 12);
    writeVideo(newVid, getframe(gcf));
    if i == 1000
        for j = 1:20
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    drawnow;
    if i< 1000
        cla
    end
end
close(newVid);

%% Chi-square 분포와 비교
figure;
hist_val = histogram(my_list,'Normalization','pdf'); 

hold on;
xx = linspace(0, 12, 100);
yy = pdf('chi2', xx, 1);
% yy = yy./max(yy) * max(hist_val.Values);
plot(xx, yy,'linewidth',2)
xlabel('x');
ylabel('Normalized Frequency');
grid on;
title('자유도가 1인 카이제곱 분포와의 비교');

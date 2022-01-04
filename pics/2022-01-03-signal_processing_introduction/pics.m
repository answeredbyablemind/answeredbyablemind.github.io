load gong.mat
audiowrite('pic1_sound.wav', y, Fs);
t = 0:1/Fs:length(y)/Fs-1/Fs;
% sound(y, Fs)

figure('position',[146, 472, 1920, 1080],'color','w');
plot(t, y)
grid on;
hold on;
xlabel('time (s)');
ylabel('amplitude');

axis tight

newVid = VideoWriter('pic1','MPEG-4');

newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);
YLIMs = ylim;
% 1초를 이동하는데 몇 개의 sample이 필요할까?
% 8192 개의 샘플이 필요하겠지
interval = round(8192/newVid.FrameRate);
for i_t = [1:interval:length(t), length(t)]
    h = line(t(i_t) * ones(1,2), YLIMs, 'color','r','linewidth',2);
    writeVideo(newVid, getframe(gcf));
    
    drawnow;
    if i_t< length(t)
        delete(h)
    end
end
close(newVid);

%% continuous time signal sampling

fs1 = 1000;
t1 = 0:1/fs1:2-1/fs1;
x1 = sin(2*pi*1*t1);

fs2 = 10;
t2 = 0:1/fs2:2-1/fs2;
x2 = sin(2*pi*1*t2);

figure('position',[680, 482, 880, 496]);
subplot(2,1,1);
plot(t1, x1,'linewidth',2);
xlabel('continuous time, t(sec)');
grid on;
ylabel('continuous x(t)');

subplot(2,1,2);
stem(0:length(t2)-1,x2,'--','filled');
xlabel('discrete time index, n');
grid on;
ylabel('discrete x[n]');
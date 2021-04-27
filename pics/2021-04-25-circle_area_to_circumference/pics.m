clear; close all; clc;

%% 

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 100;
newVid.Quality = 100;
open(newVid);

dtheta = 1/50;
theta = -pi/2:dtheta:3/2*pi;
r = 0.5;

figure('color','w','position',[1001, 559, 1167, 420])

clear h
for i = 1:length(theta)
    hor_dest = r * (theta(i) + pi/2); % horizontal destination: r*theta = 호의 길이
    h(1) = line([0, hor_dest], [0, 0], 'color','k','linewidth',2);
    hold on;
    x = r * cos(theta(1:end-i+1)) + hor_dest;
    y = r * sin(theta(1:end-i+1))+0.5;
    
    h(2) = plot(x, y,'k','linewidth',2);
    xlim([-1, 4])
    ylim([-0.5, 1.5])
    grid on;
        writeVideo(newVid, getframe(gcf))

    drawnow;
    
    if i < length(theta)
        delete(h)
    end
end

for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)
%% 

newVid = VideoWriter('pic2', 'MPEG-4'); % New
newVid.FrameRate = 3;
newVid.Quality = 100;
open(newVid);

rs = linspace(0, 1, 10);
theta = linspace(0, 2*pi, 1000);

figure('position',[1001, 457, 582, 522],'color','w'); axis square;
plot(1 * cos(theta), 1* sin(theta),'k','linewidth',2);
set(gca,'visible','off')
hold on;
% my_color = bone(length(rs));

stt = ones(1,3) *0.9;
edd = [93, 169, 77]/255;

my_color = [transpose(linspace(stt(1), edd(1), length(rs))), transpose(linspace(stt(2), edd(2), length(rs))), transpose(linspace(stt(3), edd(3), length(rs)))];

for i_r = 1:length(rs)
    r = rs(i_r);
    plot(r * cos(theta), r* sin(theta),'linewidth',2,'color',my_color(i_r,:),'linewidth',5)
    plot(1 * cos(theta), 1* sin(theta),'k','linewidth',2);
            writeVideo(newVid, getframe(gcf))

    pause(4/length(rs));
end

for i = 1:4 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)

%% 


newVid = VideoWriter('pic3', 'MPEG-4'); % New
newVid.FrameRate = 3;
newVid.Quality = 100;
open(newVid);

theta = linspace(0, 2*pi, 1000);

figure('position',[1001, 457, 582, 522],'color','w'); axis square;
plot(1 * cos(theta), 1* sin(theta),'k','linewidth',2);
set(gca,'visible','off')
hold on;
% my_color = bone(length(rs));

stt = ones(1,3) *0.9;
edd = [93, 169, 77]/255;

k_rs = 10:10:100;
for i_rs = 1:length(k_rs)
    rs = linspace(0, 1, k_rs(i_rs));
    my_color = [transpose(linspace(stt(1), edd(1), length(rs))), transpose(linspace(stt(2), edd(2), length(rs))), transpose(linspace(stt(3), edd(3), length(rs)))];
    
    for i_r = 1:length(rs)
        r = rs(i_r);
        plot(r * cos(theta), r* sin(theta),'linewidth',2,'color',my_color(i_r,:))
        plot(1 * cos(theta), 1* sin(theta),'k','linewidth',2);
    end
                writeVideo(newVid, getframe(gcf))

    pause(4/length(rs));
    
    if i_rs < length(k_rs)
        cla;
    end
end


for i = 1:4 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)


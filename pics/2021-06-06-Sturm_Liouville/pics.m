clear; close all; clc;

%% tan(x)=-x인 지점을 찾아야 함.

fun = @(x) tan(x)+x;
my_roots = find_roots(fun, 100);

%%
figure;
fplot(@(x) tan(x), [0, 30],'linewidth',2)
hold on;
fplot(@(x) -x, [0, 30],'color','k')
ylim([-30, 20])
plot(my_roots, -my_roots,'o','markerfacecolor','r','markeredgecolor','k')
grid on;
xlabel('x');
ylabel('y = tan(x) & y = -x');
title('tan(x)=-x의 solution 찾기');
set(gca,'fontname','나눔고딕');


%% solution 그려보기


newVid = VideoWriter('pic2', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w');
hold on;
xx = linspace(0,1,20);
h(1) = plot(xx, 0.82761 * sin(sqrt(2)*xx)-xx/2,'ro','linewidth',2);

xx = linspace(0, 1, 100);
my_sol = zeros(1, length(xx));
for i = 1:10
    my_sol = my_sol + sin(my_roots(i))*sin(my_roots(i)*xx) / (my_roots(i)^2 * (my_roots(i)^2 - 2) * (1+cos(my_roots(i))^2));
    %     my_sol = my_sol + sin(my_roots(i)) * sin(my_roots(i) * xx) / (my_roots(i)^2*(1+cos(my_roots(i))^2)); % f(x)
    h(2) = plot(xx, 4 * my_sol, 'k','linewidth',2);
    h_legend = legend(h ,'True Solution','고유함수 solution','location','none','Units','normalized');
    set(h_legend, 'Position',[0.59696, 0.14548, 0.25714, 0.086905])
    title(['n = ',num2str(i)]);
    
    for ii = 1:10
        writeVideo(newVid, getframe(gcf)) % 0.5초씩 그리기
    end
    
    if i < 10
        delete(h(2));
    end
end


for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)

%% f(x) 그려보기


newVid = VideoWriter('pic3', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w');
hold on;
xx = linspace(0,1,20);
h(1) = plot(xx, xx,'ro','linewidth',2);

xx = linspace(0, 1, 100);
my_sol = zeros(1, length(xx));
for i = 1:length(my_roots)
%     my_sol = my_sol + sin(my_roots(i))*sin(my_roots(i)*xx) / (my_roots(i)^2 * (my_roots(i)^2 - 2) * (1+cos(my_roots(i))^2));
    my_sol = my_sol + sin(my_roots(i)) * sin(my_roots(i) * xx) / (my_roots(i)^2*(1+cos(my_roots(i))^2)); % f(x)
    h(2) = plot(xx, 4 * my_sol, 'k','linewidth',2);
    h_legend = legend(h ,'True f(x)','고유함수 f(x)','location','none','Units','normalized');
    set(h_legend, 'Position',[0.59696, 0.14548, 0.25714, 0.086905])
    title(['n = ',num2str(i)]);
    
    if i < 10
        for ii = 1:5
            writeVideo(newVid, getframe(gcf))
        end
    else
        if rem(i,2) == 0
            for ii = 1:2
                writeVideo(newVid, getframe(gcf))
            end
        end
    end
    
    if i < length(my_roots)
        delete(h(2));
    end
end


for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)

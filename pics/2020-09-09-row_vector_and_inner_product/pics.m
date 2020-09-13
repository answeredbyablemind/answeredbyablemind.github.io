clear; close all; clc;
addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
addpath('C:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
%% y = x^2

figure('color','w','position',[680, 317, 500, 413]);
hold on;
set(gca,'Visible','off')
xlim([-3, 3])
ylim([-1, 5])

Annotate(gca,'arrow', [-3, 3], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1, 5]);

for i = -2:2
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = 0:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(2.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.3, 4.8105, '$$y$$','interpreter','latex','fontsize',12);

xx = linspace(-2, 2, 100);
plot(xx, xx.^2, 'color',[0.85, 0.325, 0.098],'linewidth',2)

text(2, 4.3, '$$y=x^2$$','interpreter','latex','fontsize',12,'HorizontalAlignment','Center')

line([2, 2], [0, 4],'color','k','linestyle','--')
line([-2, -2], [0, 4],'color','k','linestyle','--')
line([-2, 2],[4, 4],'color','k','linestyle','--')
%% row vector operation 시각화
figure('color','w','position',[680, 300, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-3, 3])
ylim([-3, 3])

Annotate(gca,'arrow', [-3, 3], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-3, 3]);

for i = -3:2
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -3:2
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(2.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.3, 2.8105, '$$y$$','interpreter','latex','fontsize',12);

% 기저벡터 그리기

h = Annotate(gca,'arrow', [0, 1], [0, 0]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;
text(0.35, -0.25,'$$\hat{i}$$','interpreter','latex','fontsize',12,'color','r','FontWeight','bold');

h = Annotate(gca,'arrow', [0, 0], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;
text(-0.25, 0.6,'$$\hat{j}$$','interpreter','latex','fontsize',12,'color','r','FontWeight','bold');

% line들 그려주기
xx = linspace(-6, 6, 100);

for i = -3:4
    plot(xx, -2 * xx + i,'k--');
    % 2x+y = 1
    % 2x = 1- y
    % x = (1-y)/2
    
    text((i-2.5)/2  + 0.1, 2.5, num2str(i),'color',[1, 0, 0],'FontWeight','Bold');
end

xlim([-3, 3])
ylim([-3, 3])

%% 등고선에 걸치는 여러 벡터 그려주기
ontos = [-3, -1, 0, 1, 3, 4];
my_color = lines(length(ontos));
figure('color','w','position',[680, 300, 1000, 680]);
ii=1;
for i_onto = 1:length(ontos)
    subplot(2,3, ii);
    hold on;
    set(gca,'Visible','off')
    xlim([-3, 3])
    ylim([-3, 3])
    
    Annotate(gca,'arrow', [-3, 3], [0, 0]);
    Annotate(gca,'arrow', [0, 0], [-3, 3]);
    
    for i = -3:2
        if i~=0
            line([i ,i], [-0.1, 0.1],'color','k')
            text(i, -0.3, num2str(i),'HorizontalAlignment','center');
        end
    end
    
    for i = -3:2
        if i~= 0
            line([-0.1, 0.1], [i ,i], 'color','k')
            text(-0.3, i, num2str(i),'HorizontalAlignment','center');
        end
    end
    
    % xlabel on original axis
    text(2.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
    text(-0.3, 2.8105, '$$y$$','interpreter','latex','fontsize',12);
    
    % line들 그려주기
    xx = linspace(-6, 6, 100);

    for i = -3:4
        plot(xx, -2 * xx + i,'k--');
        
        text((i-2.5)/2  + 0.1, 2.5, num2str(i),'color',[1, 0, 0],'FontWeight','Bold');
    
    end
    onto = ontos(i_onto);
    
    x2see = linspace(-3, 3, 10);
    y2see = -2 * x2see + onto;
    
    for i2see = 1:length(x2see)
        if abs(x2see(i2see)) <= 3 && abs(y2see(i2see)) <= 3
            h = Annotate(gca,'arrow',[0, x2see(i2see)],[0, y2see(i2see)]);
            %         h.Primitive.Color = [1, 0, 0];
            h.Primitive.Color = my_color(i_onto,:);
            h.Primitive.LineWidth= 2;
        end
    end
    
    % title 써주기
    text(0, 3.5, ['출력값이 ',num2str(onto),'인 벡터들'],'HorizontalAlignment','center')
    
    ii=ii+1;
end

%% row vector 함수 시각화에서 scaling

newVid = VideoWriter('pic3', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);

figure('color','w','position',[680, 500, 480, 480]);
hold on;
set(gca,'Visible','off')
xlim([-3, 3])
ylim([-3, 3])

Annotate(gca,'arrow', [-3, 3], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-3, 3]);

for i = -3:2
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -3:2
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(2.9228, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.3, 2.8105, '$$y$$','interpreter','latex','fontsize',12);

% 기저벡터 그리기

h = Annotate(gca,'arrow', [0, 1], [0, 0]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;
text(0.35, -0.25,'$$\hat{i}$$','interpreter','latex','fontsize',12,'color','r','FontWeight','bold');

h = Annotate(gca,'arrow', [0, 0], [0, 1]);
h.Primitive.Color = [1, 0, 0];
h.Primitive.LineWidth = 2;
text(-0.25, 0.6,'$$\hat{j}$$','interpreter','latex','fontsize',12,'color','r','FontWeight','bold');

% line들 그려주기
xx = linspace(-6, 6, 100);

for k = linspace(0, 2*pi, 100)
    sp = sin(k)+1;
    ii= 1;
    clear h
    for i = -3*sp:sp:4*sp
        h(ii) = plot(xx, -2 * xx + i,'k--');
        ii =ii +1;
    end
    
    xlim([-3, 3])
    ylim([-3, 3])
    t = text(-3, -3, ['scaling: ',sprintf('%.2f',sp)],'fontsize',15);
    
    writeVideo(newVid, getframe(gcf))
    drawnow;
    

    if k < 2* pi
        delete(h);
        delete(t);
    end
end
close(newVid)
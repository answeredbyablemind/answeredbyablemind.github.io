function plotXY(x1,x2,y1,y2,h_newfig)

if h_newfig
    figure;
    set(gcf,'position',[500,100,1000,650])
    set(gcf,'color','w');
end
set(gca,'visible','off')
hold on;
quiver(x1,0,x2,0,0,'color','k','MaxHeadSize',1)
quiver(0,y1,0,y2,0,'color','k','MaxHeadSize',1)
xlim([x1 x2])
ylim([y1 y2])

XLIMs = xlim;
YLIMs = ylim;

for i = (x1+1):(x2-1)
    line([i i],[-1,1] * (YLIMs(2)-YLIMs(1)) * 0.01,'color','k')
    line([-1,1] * (XLIMs(2)-XLIMs(1)) * 0.01,[i i],'color','k')
    if i<=0
        t= text(i-0.2, -0.3,num2str(i));
    else
        t= text(i-0.05, -0.3,num2str(i));
    end
    t.FontSize=15;
    
    if i<0
        t = text(-0.4, i,num2str(i));
    elseif i>0
        t = text(-0.3, i,num2str(i));
    end
    t.FontSize = 15;
end

t = text(x2*0.9,0.3,'$$x$$','interpreter','latex');
t.FontSize = 15;
t = text(0.2,y2*0.9,'$$y$$','Interpreter','latex');
t.FontSize = 15;
axis square

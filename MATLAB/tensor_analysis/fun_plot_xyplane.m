function fun_plot_xyplane(varargin)
p = inputParser;
addParameter(p, 'newFigure', false)
addParameter(p, 'x_interval', [-3, 3])
addParameter(p, 'y_interval', [-3, 3])
parse(p, varargin{:})

h_newFigure = p.Results.newFigure;
XLIMs = p.Results.x_interval;
YLIMs = p.Results.y_interval;

%% 
if h_newFigure
    figure('color','w','position',[680, 300, 480, 480]);
end
hold on;
set(gca,'Visible','off')
xlim([XLIMs(1)-1, XLIMs(2)+1])
ylim([YLIMs(1)-1, YLIMs(2)+1])

Annotate(gca,'arrow', [XLIMs(1)-1, XLIMs(2)+1], [0, 0]);
Annotate(gca,'arrow', [0, 0], [YLIMs(1)-1, YLIMs(2)+1]);

for i = (XLIMs(1)):XLIMs(2)
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = YLIMs(1):YLIMs(2)
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

% xlabel on original axis
text(XLIMs(2)+1-0.0772, -0.3, '$$x$$','interpreter','latex','fontsize',12);
text(-0.3, YLIMs(2)+1-0.1895, '$$y$$','interpreter','latex','fontsize',12);
end


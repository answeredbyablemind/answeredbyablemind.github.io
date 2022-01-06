function plotXY(x1, x2, y1, y2, varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('newFigure', true);
params.addParameter('fontsize', 12);
params.addParameter('complex_plane', false);
params.addParameter('plot_polar',false);

params.parse(varargin{:});
%Extract values from the inputParser
h_newfig = params.Results.newFigure;
fontsize = params.Results.fontsize;
h_complex_plane = params.Results.complex_plane;
h_plot_polar = params.Results.plot_polar;

% fontsize= 20;
if h_newfig
    figure;
    set(gcf,'position',[500,100,1000,650])
    set(gcf,'color','w');
end

if h_plot_polar
    hold on;
    rs = 0:0.5:x2;
    theta = linspace(0, 2*pi, 1000);
    for i_r = 1:length(rs)
        plot(rs(i_r) * cos(theta), rs(i_r) * sin(theta),'color', ones(1,3) * 0.8)
    end
    
    thetas = 0:pi/6:(2*pi-pi/6);
    for i_theta = 1:length(thetas)
        plot([0, rs(end) * cos(thetas(i_theta))], [0, rs(end) * sin(thetas(i_theta))],'color',ones(1,3) * 0.8);
        text((rs(end) + 0.3) * cos(thetas(i_theta)), (rs(end) + 0.1) * sin(thetas(i_theta)), [num2str(0 + 30 * (i_theta - 1)),'¡Æ'],...
            'HorizontalAlignment','center');
    end
end


mArrow2(x1,0,x2,0,{'color','k'});
mArrow2(0,y1,0,y2,{'color','k'});
xlim([x1,x2])
ylim([y1,y2])
set(gca,'visible','off');

% (x1+1):10:(x2-1)
for i = unique(round([linspace(x1*0.9, x2*0.9,7),0]))
    line([i i],[-(y2-y1)*0.005 (y2-y1)*0.005],'color','k')
    line([-(x2-x1)*0.005 (x2-x1)*0.005],[i i],'color','k')
    
    % xticks
    if i<=0
        t= text(i-(y2-y1)*0.03, -(x2-x1)*0.025,num2str(round(i)));
    else
        t= text(i-(y2-y1)*0.02, -(x2-x1)*0.025,num2str(round(i)));
    end
    t.FontSize=fontsize;
    
    % yticks
    if i<0
        t = text((y2-y1)*0.01, i, num2str(round(i)));
    elseif i>0
        t = text((y2-y1)*0.01, i, num2str(round(i)));
    end
    t.FontSize = fontsize;
end

if ~h_complex_plane
    t = text(x2*0.97,(y2-y1)*0.03,'$$x$$','Interpreter','latex');
    t.FontSize = fontsize;
    t = text(-(x2-x1)*0.03,y2*1,'$$y$$','Interpreter','latex');
    t.FontSize = fontsize;
else
    t = text(x2*0.97,(y2-y1)*0.03,'½Ç¼ö Ãà','fontname','³ª´®°íµñ');
    t.FontSize = fontsize;
    t = text((x2-x1)*0.03 ,y2*1,'Çã¼ö Ãà','fontname','³ª´®°íµñ');
    t.FontSize = fontsize;
end

axis square

end

function [ h ] = mArrow2(x1,y1,x2,y2,props)

h = annotation('arrow');
set(h,'parent', gca, ...
    'position', [x1,y1,x2-x1,y2-y1], ...
    'HeadLength', 10, 'HeadWidth', 10, 'HeadStyle', 'cback1', ...
    props{:} );
end

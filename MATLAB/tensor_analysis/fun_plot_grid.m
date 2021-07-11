function fun_plot_grid(vec1, vec2, varargin)
% 기저 벡터 vec1과 vec2의 방향과 크기에 따라 grid를 그려주는 함수

p = inputParser;
addParameter(p, 'newFigure', false)
addParameter(p, 'x_interval', [-3, 3])
addParameter(p, 'y_interval', [-3, 3])
parse(p, varargin{:})

h_newFigure = p.Results.newFigure;
XLIMs = p.Results.x_interval;
YLIMs = p.Results.y_interval;

%% row vector가 들어온 경우 column vector로 수정
if size(vec1,1) < size(vec1,2)
    vec1 = vec1';
end

if size(vec2,1) < size(vec2,2)
    vec2 = vec2';
end

%% figure

if h_newFigure
    figure('color','w','position',[680, 300, 480, 480]);
end

hold on;
set(gca,'Visible','off')
xlim([XLIMs(1)-1, XLIMs(2)+1])
ylim([YLIMs(1)-1, YLIMs(2)+1])

%% new basis로 axis 그려주기

real_xlim = xlim;
real_ylim = ylim;

ratio = 1;

if (XLIMs(1)-1) * vec1(2)/vec1(1) < real_ylim(1)
    ratio = ((XLIMs(1)-1) * vec1(2)/vec1(1)) / real_ylim(1);
end

Annotate(gca,'arrow', ...
    [XLIMs(1)-1, XLIMs(2)+1]/ratio, ...
    [((XLIMs(1)-1) * vec1(2)/vec1(1))/ratio, ...
     ((XLIMs(2)+1) * vec1(2)/vec1(1))/ratio]);

stt = vec2 * (YLIMs(1)-1);
edd = vec2 * (YLIMs(2)+1);


ratio = 1;
if stt(1) < real_xlim(1)
    ratio = stt(1)/real_xlim(1);
elseif stt(1) > real_xlim(2)
    ratio = stt(1)/rea_xlim(2);
end

if stt(2) < real_ylim(1)
    ratio = stt(2) / real_ylim(1);
elseif stt(2) > real_ylim(2)
    ratio = stt(2) / real_ylim(2);
end

stt = stt/ratio;

ratio = 1;
if edd(1) < real_xlim(1)
    ratio = edd(1)/real_xlim(1);
elseif edd(1) > real_xlim(2)
    ratio = edd(1)/rea_xlim(2);
end

if edd(2) < real_ylim(1)
    ratio = edd(2) / real_ylim(1);
elseif edd(2) > real_ylim(2)
    ratio = edd(2) / real_ylim(2);
end

edd = edd/ratio;

    

Annotate(gca,'arrow',[stt(1),edd(1)], [stt(2), edd(2)])

% x 축의 변형에 대해
for i = (XLIMs(1)):XLIMs(2)
    if i~=0
        x1 = i * vec1 + vec2 * 0.1;
        x2 = i * vec1 - vec2 * 0.1;
        line([x1(1), x2(1)], [x1(2), x2(2)],'color','k','linewidth',1)
        x3 = i * vec1 - vec2 * 0.3;
        text(x3(1), x3(2), num2str(i),'HorizontalAlignment','center');
    end
end

for i = YLIMs(1):YLIMs(2)
    if i~= 0
        x1 = i * vec2 + vec1 * 0.05;
        x2 = i * vec2 - vec1 * 0.05;

        line([x1(1), x2(1)], [x1(2), x2(2)],'color','k','linewidth',1)
        x3 = i * vec2 - vec1 * 0.2;
        text(x3(1), x3(2), num2str(i),'HorizontalAlignment','center');    
    end
end

% xlabel on original axis

label1 = vec1*(XLIMs(2)-1.2)-vec2*0.5;
text(label1(1), label1(2), '$$x''$$','interpreter','latex','fontsize',12);
label2 = vec2*(YLIMs(2)+1)-vec1*0.2;
text(label2(1), label2(2), '$$y''$$','interpreter','latex','fontsize',12);

%% grid 그려주기
A = [vec1, vec2];

xx = XLIMs(1)-100:XLIMs(2)+100;
yy = YLIMs(1)-100:YLIMs(2)+100;
pts_vertical = [];
for i = 1:length(xx)
    pts_vertical = [pts_vertical, [[xx(i); yy(1)],[xx(i); yy(end)]]];
end

pts_horizontal = [];
for i = 1:length(yy)
    pts_horizontal = [pts_horizontal, [[xx(1); yy(i)],[xx(end); yy(i)]]];
end

new_pts_vertical = A * pts_vertical;
new_pts_horizontal = A * pts_horizontal;

for i = 1:size(new_pts_vertical, 2)/2
    pts1 = new_pts_vertical(:, 2*i-1);
    pts2 = new_pts_vertical(:, 2*i); 
    line([pts1(1), pts2(1)], [pts1(2), pts2(2)],'color',0.5*ones(1,3), 'linestyle','--')
end

for i = 1:size(new_pts_horizontal, 2)/2
    pts1 = new_pts_horizontal(:, 2*i-1);
    pts2 = new_pts_horizontal(:, 2*i); 
    line([pts1(1), pts2(1)], [pts1(2), pts2(2)],'color',0.5*ones(1,3), 'linestyle','--')
end
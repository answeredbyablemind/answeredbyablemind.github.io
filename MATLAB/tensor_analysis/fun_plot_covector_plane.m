function fun_plot_covector_plane(vec)
% vec: this vector should be described in a standard basis system

% p = inputParser;
% addParameter(p, 'newFigure', false)
% addParameter(p, 'x_interval', [-3, 3])
% addParameter(p, 'y_interval', [-3, 3])
%
% parse(p, varargin{:})
% h_newFigure = p.Results.newFigure;
% XLIMs = p.Results.x_interval;
% YLIMs = p.Results.y_interval;

% plotting lines
XLIMs = get(gca,'xlim');
% YLIMs = get(gca,'xlim');
xx = linspace(XLIMs(1)-2, XLIMs(2)+2, 100);

for i = -10:10
    plot(xx, -1 * vec(1)/vec(2) * xx + i,'--','color',ones(1,3) * 0.5);
    hold on;
end


%% plot small arrows to represent the direction of covector planes
fun_for_SA = @(x) -1*vec(1)/vec(2)*x; % SA stands for Small Arrow
% Finding x-coordinate at the point where the circle with radius = 0.7 and
% y = -vec(1)/vec(2) x

x_SA = [-1, 1] * sqrt(0.7/(1+vec(1)^2/vec(2)^2));
y_SA = fun_for_SA(x_SA);

for i = 1:2
    mArrow2(x_SA(i), y_SA(i), x_SA(i)+0.2, y_SA(i) + 0.2 * vec(2)/vec(1), ...
        {'HeadLength', 3,'linewidth',2, 'color','r'});
end


end
function fun_plot_Euler_Discretely(n, varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('newFigure', true);

params.parse(varargin{:});
%Extract values from the inputParser
newFig = params.Results.newFigure;

plotXY(-0.2,1.5,-0.2,1.5,newFig,15)
hold on;

prev_coord = [1, 0];
for k = 1:n
    new_coord = [real((1+1i/n)^k), imag((1+1i/n)^k)];
    
    line([0, new_coord(1)], [0, new_coord(2)],'linestyle','-','color','k')
    plot(new_coord(1), new_coord(2), 'o','markerfacecolor','k','markeredgecolor','none')
    line([prev_coord(1), new_coord(1)], [prev_coord(2), new_coord(2)],'linestyle','-','color','k')
    
    prev_coord = new_coord;
end

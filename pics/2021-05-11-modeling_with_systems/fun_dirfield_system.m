function fun_dirfield_system(func_dxdt, func_dydt,xval,yval, varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('t', false); % nonhomogenous outforcing을 위한 용도
params.addParameter('f', false); % nonhomogenous outforcing을 위한 용도
params.addParameter('g', false); % nonhomogenous outforcing을 위한 용도

params.parse(varargin{:});

t = params.Results.t;
f = params.Results.f;
g = params.Results.g;

flg_animate = false;

if any(t)
    flg_animate = true;
    if f == false
       f = zeros(size(g));
    end
    if g == false
        g = zeros(size(f));
    end
    
end

if nargin == 3
    yval = xval;
end

[xm,ym]=meshgrid(xval,yval);

dx = xval(2) - xval(1);
dy = yval(2) - yval(1);


if ~flg_animate
    xp=feval(func_dxdt,xm,ym);
    yp=feval(func_dydt,xm,ym);
    
    s = sqrt(xp.^2+yp.^2); % 모든 quiver는 방향만 나타내면 되므로 크기로 정규화 하겟음.
    
    quiver(xval,yval,xp./s,yp./s, 0.5,'color',0.5 * ones(1,3));
    axis tight;
else
    
    for i_t = 1:length(t)
        xp=feval(func_dxdt,xm,ym) + f(i_t);
        yp=feval(func_dydt,xm,ym) + g(i_t);
        
        s = sqrt(xp.^2+yp.^2); % 모든 quiver는 방향만 나타내면 되므로 크기로 정규화 하겟음.
        
        quiver(xval,yval,xp./s,yp./s, 0.5,'color',0.5 * ones(1,3));
        axis tight;
        hold on;
        XLIMs = xlim;
        YLIMs = ylim;
        
        text((XLIMs(2) - XLIMs(1)) * 0.1 + XLIMs(1), (YLIMs(2) - YLIMs(1)) * 0.9 + YLIMs(1),['t=',sprintf('%.2f',t(i_t))],'BackgroundColor','w','fontsize',15);
        
        pause(0.1)
        if i_t < length(t)
            cla;
        end
    end
    
end


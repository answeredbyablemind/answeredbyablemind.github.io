function fun_dirfield_system(func_dxdt, func_dydt,xval,yval)

if nargin == 3
    yval = xval;
end


[xm,ym]=meshgrid(xval,yval);

dx = xval(2) - xval(1);
dy = yval(2) - yval(1);

xp=feval(func_dxdt,xm,ym);
yp=feval(func_dydt,xm,ym);

% sx = 1./max(1/dx,abs(xp)./dx)*0.05;
% sy = 1./max(1/dy,abs(yp)./dy)*0.05;

h = ishold;

s = sqrt(xp.^2+yp.^2); % 모든 quiver는 방향만 나타내면 되므로 크기로 정규화 하겟음.

quiver(xval,yval,xp./s,yp./s, 0.5,'color',0.5 * ones(1,3));

% hold on;

% quiver(xval,yval,-sx.*xp,-sy.*yp,'color',0.5 * ones(1,3));

if h
    
    hold on
    
else
    
    hold off
    
end

axis tight;
function fun_dirfield(func,tval,yval)

[tm,ym]=meshgrid(tval,yval);

dt = tval(2) - tval(1);

dy = yval(2) - yval(1);

yp=feval(func,tm,ym);

s = 1./max(1/dt,abs(yp)./dy)*0.35;

h = ishold;

quiver(tval,yval,s,s.*yp,0,'.','color',0.5 * ones(1,3));

hold on;

quiver(tval,yval,-s,-s.*yp,0,'.','color',0.5 * ones(1,3));

if h
    
    hold on
    
else
    
    hold off
    
end

axis tight;
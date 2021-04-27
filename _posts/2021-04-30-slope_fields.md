---
title: 방향장(direction field)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210429
tags: 미분방정식
---
<center>
  <iframe style="border-width:2px; border-color:black; border-style:solid;-webkit-transform:scale(0.7);-moz-transform-scale(0.7);-webkit-transform-origin:0 0;" width = "1200" height = "750" frameborder = "0" src="https://homepages.bluffton.edu/~nesterd/apps/slopefields.html"></iframe>
  <br>
  slope and direction fields / Bluffton University
  <br>
  <br>
</center>

```{MATLAB}
function dirfield(func,tval,yval)

[tm,ym]=meshgrid(tval,yval);

dt = tval(2) - tval(1);

dy = yval(2) - yval(1);

yp=feval(func,tm,ym);

s = 1./max(1/dt,abs(yp)./dy)*0.35;

h = ishold;

quiver(tval,yval,s,s.*yp,0,'.r');

hold on;

quiver(tval,yval,-s,-s.*yp,0,'.r');

if h

hold on

else  

hold off

end

axis tight;

% 출처: https://blog.naver.com/horgan/40004234698
```
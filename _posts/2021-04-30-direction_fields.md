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
  <iframe style="border-width:2px; border-color:black; border-style:solid;" width = "1200" height = "750" frameborder = "0" src="https://homepages.bluffton.edu/~nesterd/apps/slopefields.html"></iframe>
  <br>
  slope and direction fields / Bluffton University
  <br>
  <br>
</center>

# Prerequisites

미분방정식의 방향장에 대해서 이해하기 위해선 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [오일러 방법](https://angeloyeo.github.io/2021/04/29/Euler_method.html)

# 초기값 문제

이전 [오일러 방법](https://angeloyeo.github.io/2021/04/29/Euler_method.html) 편에서는 미분방정식이 함수값과 함수의 변화에 대한 관계를 설명해주고 있다고 언급한적이 있다.

그러다보니, 현재 함수값과 그 주변 함수값의 관계에 대해 알 수 있으므로, 어떤 한 점에서부터 바로 다음 정의역 값의 함수값을 추정해낼 수 있음을 알 수 있었다.

이렇게 매우 원시적인 미분방정식에 대한 해석을 이용한 것이 오일러 방법으로, 오일러 방법을 이용하면 주어진 미분방정식으로부터 함수값과 그 주변 함수값을 추정하여 솔루션을 찾아줄 수 있었다.

그러면, 지금까지 언급한 '현재 함수값'이란 것은 무엇일까?

생각해보면 여기서 언급되는 '현재 함수값'은 $(x, y)$ 평면 상의 어떤 점이어도 괜찮다. 내가 보고 있는 값이 무엇이든간에 상관없이 미분방정식의 solution을 생각할 수 있기 때문이다.

그리고, 미분방정식에 들어있는 '주변과의 관계'는 기울기로 표현될 수 있다. 미분계수의 기하학적의미가 기울기이기 때문이다.


# 방향장 MATLAB 코드

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
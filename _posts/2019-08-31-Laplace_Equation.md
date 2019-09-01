---
title: 라플라스 방정식의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190831
tags: 다변수미적분
---
<style>
  @media screen and (max-width:500px){
    iframe {
        width: 100vw; 
        height: 110vw;
        background:white;  
    }
  }

  @media screen and (min-width:500px){
    iframe {
        width: 60vw; 
        height: 53vw;
        background:white;  
    }
  }
</style>

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-31_Laplace_Equation/pic1_i_am_still.png">
  <br>
  그림1. 위 짤방의 24, 25, 26번 방정식이 각각 라플라스, 파동, 열방정식이다.
</p>

라플라스 방정식은 수식으로 쓰면 다음과 같다.

$$\frac{\partial^2 u}{\partial x^2} +\frac{\partial ^2 u}{\partial y^2} = 0$$

이 수식을 보면 열방정식, 파동방정식과 주요하게 차이는 부분을 확인할 수 있다.

바로 시간 term이 없다는 것이다.

라플라스 방정식은 특정 상태의 공간에 대한 표현이며, 구체적으로는 어떤 물리 현상의 steady state situation을 표현하는 방정식이다.

여기서 '어떤 물리 현상'이란 아래와 같은 것들을 포함한다.

* steady state temperature
* steady state stress
* steady state potential distribution
* steady state flow 
* ...

이번 article에서는 이 중 steady state temperature의 관점에서 Laplace 방정식의 의미에 대해 알아보고자 한다.

# 라플라스 방정식의 intuition

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-31_Laplace_Equation/pic2.png">
  <br>
  그림2. 라플라스 방정식이 적용되는 물리현상: steady state temperature
</p>

라플라스 방정식이 적용될 수 있는 물리현상 중 하나로 steady staet temperature 문제를 생각해보자. 이 문제는 그림 2에서 보여주고 있는 내용과 같이 특정 공간에서 boundary의 온도에 대한 condition을 정한 다음, 오-랜 시간이 지났을 때 그 공간 내부의 온도 분포가 어떻게 되는지를 알아보는 문제라고 할 수 있다.

라플라스 방정식은 이 문제에 대해 다음과 같은 관점에서 문제를 바라본다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-31_Laplace_Equation/pic3.png">
  <br>
  그림3. 라플라스 방정식이 해당 문제를 바라보는 관점
</p>

즉, boundary의 온도가 모두 결정되어 있을 때, boundary에 있지 않는 분자(?)는 어떤 온도를 갖게 될 것인가? 하는 문제인 것이다.

라플라스 방정식에 따르면, 이 5번 분자는 상하좌우 주변에 있는 분자들의 온도값의 평균을 취하게 된다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-31_Laplace_Equation/pic4.png">
  <br>
  그림4. 라플라스 방정식이 해당 문제를 바라보는 관점
</p>

그렇다면, 라플라스 방정식은 공간에 대한 2차 미분계수로 구성되어 있는데, 2차 미분 계수와 주변 값과의 평균이 어떤 관계를 갖고 있는 것인지 알아보도록 하자.

# 2차 미분 계수의 또 다른 의미: 주변 평균값

열방정식 / 파동 방정식 편에서 2차 미분 계수는 '볼록'하거나 '오목'한 정도를 나타낸다고 했다. 하지만 조금 더 포괄적으로는 '주변 값과의 관계'라는 의미로 생각하는게 2차 미분 계수의 의미를 이해하는데 더 도움이 될 수 있을 것 같다.

우리는 테일러 급수를 이용해서 2차 미분 계수의 의미가 '주변 값의 평균값'이라는 의미도 갖는 다는 것을 확인해보고자 한다.

## 테일러급수

※ 급하신 분들은 식 (13), 식 (14)만 확인하고 넘어가셔도 괜찮습니다 ^^~

미적분학(calculus)에서 테일러 급수(Taylor series)는 도함수들의 한 점에서의 값으로 계산된 항의 무한합으로 해석함수를 나타내는 방법이다.

<p align = "center">
  <img width = "200" src = "https://upload.wikimedia.org/wikipedia/commons/6/62/Exp_series.gif">
  <br>
  그림5. 테일러 급수를 이용해 x = 0 에서 y=e^x를 근사화하는 과정.
  <br>
  출처: Taylor Series, Wikipedia
</p>

그림 5는 $x = 0$ 인 지점에서 $y = e^x$를 근사화하는 과정을 나타낸 것이다.

$y=e^x$는 테일러 급수를 이용하면 다음과 같이 근사할 수 있다.

$$f(x) = e^x = \frac{x^0}{0!} + \frac{x^1}{1!} + \frac{x^2}{2!}+ \frac{x^3}{3!} + \cdots = \sum_{n=0}^{\infty}x^n$$

핵심적인 것은 원래의 함수는 초월함수이지만, 이것을 다항함수로 표현할 수 있다는 것이다.

테일러 급수의 정의는 아래와 같다.


| DEFINITION 1. 테일러 급수 |
| --------- |
|<center>매끄러운 함수 $f: \Bbb{R}\rightarrow \Bbb{R}$ 및 실수 $a \in \Bbb{R}$에 대해 $f$의 테일러 급수는 다음과 같다. <br><br>$$T_f(x) = \sum_{n=0}^{\infty}\frac{f^{(n)}(a)}{n!}(x-a)^n \notag$$ <br><br>$$=f(a) + f'(a)(x-a) + \frac{1}{2}f''(a)(x-a)^2 + \frac{1}{6}f'''(a)(x-a)^3 +\cdots $$</center>|

DEFINITION 1에서 확인한 테일러 급수의 정의를 이용해서 $f(x)$를 $x_0$이라는 점에서 approximate 해본다고 생각해보자. 

$$f(X) = f(x_0) + f'(x_0)(x-x_0) + \frac{1}{2}f''(x_0)(x-x_0)^2+\frac{1}{6}f'''(x_0)(x-x_0)^3+\cdots$$

여기서 3차 이상의 다항식을 포함하는 항을 통틀어 $R_3(x)$라고 이름 붙이자. 즉,

$$식(4) = f(x_0)+f'(x_0)(x-x_0)+\frac{1}{2}f''(x_0)(x-x_0)^2 + R_3(x)$$

그렇다면, 충분히 작은 양의 실수 $\Delta x$에 대해서,

$f(x)$의 $x_0+\Delta x$라는 점에서의 함수 값은 $f(x+\Delta x)$이다.

이는 식 (5)에서 $x$에 $x_0+\Delta x$를 대입함으로써 얻을 수 있다.

$$f(x_0+\Delta x) = f(x_0) + f'(x_0)(x_0+\Delta x - x_0) + \frac{1}{2}f''(x_0)(x_0+\Delta x - x_0)^2 +R_3(x_0+\Delta x)$$

마찬가지 방식으로 식 (5)에 $x$ 대신에 $x-\Delta x$를 대입하면,

$$f(x_0-\Delta x) = f(x_0) + f'(x_0)(x_0-\Delta x - x_0) + \frac{1}{2}f''(x_0)(x_0-\Delta x - x_0)^2 +R_3(x_0-\Delta x)$$

가 된다.

여기서, 식 (6)과 식 (7)을 더하면 다음과 같은 결과를 얻을 수 있다.

$$f(x_0+\Delta x) = f(x_0) + f'(x_0)(x_0+\Delta x - x_0) + \frac{1}{2}f''(x_0)(x_0+\Delta x - x_0)^2 +R_3(x_0+\Delta x) \notag$$

$$+\notag$$

$$f(x_0-\Delta x) = f(x_0) + f'(x_0)(x_0-\Delta x - x_0) + \frac{1}{2}f''(x_0)(x_0-\Delta x - x_0)^2 +R_3(x_0-\Delta x)\notag$$

$$\Rightarrow f(x_0+\Delta x) + f(x_0-\Delta x) = 2f(x_0) + f''(x_0)(\Delta x)^2 + R_3(x_0+\Delta x) + R_3(x_0-\Delta x)$$

우리는 $\Delta x$가 충분히 작다고 가정하기 때문에 식 (8)에서 $R_3(x_0+\Delta x) + R_3(x_0-\Delta x)$은 error term이라고 생각하고 error를 무시해보자.

그러면 식 (8)은 다음과 같이 생각할 수 있다.

$$f(x_0+\Delta x)+ f(x_0-\Delta) \approx 2f(x_0) + f''(x_0)(\Delta x)^2$$

식 (9)에서 우항의 $2f(x_0)$을 좌항으로 옮겨주면,

$$f(x_0 + \Delta x) - 2f(x_0) + f(x_0-\Delta x) \approx f''(x_0)(\Delta x)^2$$

즉,

$$식(10) \Rightarrow \frac{f(x_0 + \Delta x) - 2f(x_0) + f(x_0-\Delta x)}{(\Delta x)^2} \approx f''(x_0)$$

식 (11)에 대해서, $x_0$ 대신 임의의 $x$에 대하여 다음이 성립합을 확인할 수 있다.

$$f''(x) = \frac{(x + \Delta x) - 2f(x) + f(x-\Delta x)}{(\Delta x)^2}$$

만약 $f(x)$가 아니라 다변수 함수 $u(x,y)$였다고 하면 다음도 성립하게 된다.

$$\frac{\partial^2 u}{\partial x^2}\approx \frac{u(x+\Delta x, y)-2u(x,y)+\u(x-\Delta x, y)}{(\Delta x)^2}$$

$$\frac{\partial^2 u}{\partial y^2}\approx \frac{u(x, y +\Delta y)-2u(x,y)+\u(x, y-\Delta y)}{(\Delta y)^2}$$

## 다시 라플라스 방정식으로!

다시, 우리가 의미를 파악하고자 하는 Laplace 방정식은 다음과 같다.

$$\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} = 0$$

여기에 앞서 파악한 식 (13), 식(14)의 2차 미분 계수의 approximation을 대입해보자.

$$\frac{u(x+\Delta x, y)-2u(x,y)+\u(x-\Delta x, y)}{(\Delta x)^2} + \frac{u(x, y +\Delta y)-2u(x,y)+\u(x, y-\Delta y)}{(\Delta y)^2} = 0$$

계산의 편의를 위해 $\Delta x = \Delta y$라고 두자. 그러면 위의 식 (16)은 다음과 같아진다.

$$u(x+\Delta x,y) - 2u(x,y) + u(x-\Delta x, y) + u(x, y+\Delta y) - 2u(x,y) + u(x, y-\Delta y) = 0$$

식 (17)을 정리하면,

$$4u(x,y) = u(x+\Delta x, y) + u(x-\Delta x, y) + u(x, y+\Delta y) + u(x,y-\Delta y)$$

즉,

$$u(x,y) = \frac{1}{4}\left\{
  u(x+\Delta x, y) + u(x-\Delta x, y) + u(x, y+\Delta y) + u(x, y-\Delta y)
  \right\}$$

식 (19)가 말하는 것은 무엇인가? 즉, $u(x,y)$라는 포인트의 온도는 주변 4점의 온도의 평균이라는 것이다. (여기서 주변 4점과는 $\Delta x = \Delta y$라는 간격을 두었음.)

# MATLAB 시뮬레이션

그림 2에서 보였던 예제를 MATLAB에서 시뮬레이션을 돌리면 다음과 같은 결과를 얻을 수 있다.

여기서 주의할 점은 라플라스 방정식은 initial condition에 해당되는 것은 없다는 것인데, 해당 MATLAB 시뮬레이션에서는 iterative한 방법으로 solution을 구하다보니 시간에 따른 변화가 있는 것 처럼 보이지만, 실제로 라플라스 방정식이 말해주는 solution은 해당 시뮬레이션의 마지막 장면에서 보여주는 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-31_Laplace_Equation/pic6.gif">
  <br>
  그림6. 그림 2의 예제에 대한 라플라스 방정식의 solution
</p>


<iframe width="560" height="315" src="https://www.youtube.com/embed/UbhIJOJ_vDA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
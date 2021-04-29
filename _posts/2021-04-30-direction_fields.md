---
title: 방향장(direction field)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210430
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

즉, 미분 방정식을 이용하면 모든 $(x, y)$ 값에서 기울기를 그려줄 수 있다.

우리가 오일러 방법 편에서 그렸던 미분방정식인 

$$\frac{dy}{dx}=x$$

에 대해 모든 점에서 기울기를 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-30-direction_fields/pic1.png">
  <br>
  그림 1. dy/dx = x에 대한 기울기장과 솔루션 중 하나인 y = 1/2 * x^2
</p>

여기서 빨간색으로 그려진 막대기가 각 $(x, y)$ 좌표에서의 기울기를 뜻한다.

또 그림 1에서 보라색으로 칠해진 라인은 식 (1)의 솔루션 중 하나인 $y=1/2 x^2$을 의미한다.

여기서 생각해봐야 할 것은 그림 1의 보라색 라인은 $y(0) = 0$이라는 초기값에 따라 결정된 line이다.

만약 초기값이 다르다면 아래의 그림과 같이 다른 솔루션을 결과값으로 내줄 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-30-direction_fields/pic2.png">
  <br>
  그림 2. 다양한 초기값에 대한 dy/dx = x에 대한 솔루션
</p>

# 해의 존재성과 유일성

기울기장을 그러놓고, 그 점에 주어진 기울기값으로 다음 포인트의 함수값을 예상해 나가다보면 이런 의문이 들 수 있다.

우리가 어떤 시작 포인트를 정해준다면 그 뒤로 얻어지는 함수값들은 유일하게 존재할까?

눈으로 보기에 그럴 것 처럼 보인다. 왜냐면 미분 방정식에서는 지금 포인트에서의 함수값과 다음번 포인트에서의 함수값 간의 관계에 대해 얘기해주고 있는데,

바로 옆 포인트와의 관계는 해당 값에서 미분계수가 정해질 수 있다면 유일하게 정해지기 때문이다.


이에 대한 좀 더 엄밀한 정리는 피카르-린델뢰프 정리라는 것인데, 위에서 풀어쓴 말을 조금 더 수학적으로 표현한 것으로

$f(x,y)$ 및 $\partial f/\partial y$가 $xy$ 평면의 점 $(x_0,y_0)$에 중점을 둔 폐 직사각형의 영역 내의 모든 점 $(x,y)$에서 연속이면

초기값 문제 $y'=f(x,y); y(x_0) = y_0$가 구간 $(x_0-h, x_0+h)\text{ where } h>0$에서 유일한 해를 갖는다.


여기서 함수값이 연속이라는 것은 함수값과 극한값이 모두 존재하고 같을 때를 말하므로, 아래와 같은 조건에서는 해가 존재하지 않을 수도 있다는 것을 의미한다.

$$xy' = y$$

여기서 $y(0)=0$ 인 조건에 대항하는 해는 존재하지 않는다.

$y'=y/x$이고 $x=0$일 때 미분계수가 정의될 수 없기 때문이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-30-direction_fields/pic3.png">
  <br>
  그림 3. xy'=y에 대한 방향장과 $y(0)=0$ 조건에서의 solution
</p>
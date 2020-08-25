---
title: 열방정식, 파동방정식의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190829
tags: 미적분학
---

# 열방정식 (heat equation)

위키피디아에 따르면 열 방정식(heat equation)은 열 따위의 성질이 시간에 따라 전도되는 과정을 나타내는 2차 편미분 방정식이라고 한다.

일단 '2차 편미분 방정식'이라는 복잡한 말은 배제하자('2차'라는 말이 들어간 것은 순전히 미분을 두 번 했다는 뜻이다.). 일단 여기서 중요한 키워드는 '시간'에 따른 '전도'라고 할 수 있을 것 같다. 시간은 말 그대로 시간인데, '전도'는 공간에 대한 퍼짐이다.

여기서 힌트를 얻을 수 있는 것은, 열 방정식에는 하나 이상의 변수가 관여한다는 것이다. 열 방정식은 '열(heat)'을 출력으로 하고, 시간과 공간을 입력으로하는 함수라고 알 수 있다.

보통 '공간'이라고 하면 3차원 공간을 생각하게 되는데, 우리는 1차원 공간에 시간을 더한 함수에 대해 생각해보도록 하자.

## 열방정식의 intuition

열방정식에 대해 이해하기 위해 아래의 그림 1과 같이 쇠막대기를 어느정도 달궈뒀다고 생각해보자.

<p align = "center">
  <img width = "600" 
  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic1_steel_rod.png">
  <br>
  그림 1. 쇠막대기의 중간 지점을 어느정도 시간동안 불로 지져뒀다고 생각해보자.
</p>

그러면, 막대기의 길이에 따른 온도[^1]를 $u(x)$라 하면, $u(x)$의 분포는 대략적으로 아래와 같을 것이다. 

[^1]: 물리학적으로 정확히는 '열(heat)'이지만 설명의 편의를 위해 '온도'로 서술하고자 한다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic2_u_x.png">
  <br>
  그림 2. 쇠막대기의 길이에 따른 온도의 분포를 나타낸 것.
</p>

즉, 달궈놓은 곳은 온도가 올라갔을 것이고, 달구지 않은 곳은 온도가 그렇게 올라가진 않았을 것이다.

그림 2의 상황에서 시작해서 외부에서 온도의 변화를 더 이상 주지 않고 내버려두게 되면 그 뒤의 상황은 어떤식으로 진행될까?

기본적으로는 온도가 높은 곳은 온도가 떨어질 것이고, 온도가 낮은 곳은 온도가 올라간다고 생각할 수 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic3_as_time.png">
  <br>
  그림 3. 시간이 지나게 되면서 생길 변화. 빨간색 화살표는 온도가 오르는 것을, 파란색 화살표는 온도가 내려가는 것을 나타냄.
</p>

그런데, 그림 3을 보면서 생각해보면 꼭 그렇지만은 않다는 것을 알 수 있는데, 빨간색 화살표로 표시된 곳은 쇠막대기의 끝지점(x= 0 또는 x= L)에 비해서는 온도가 높지만,

그 주변(파란색 화살표로 포시된 부분)의 온도가 상대적으로 더 높기 때문에 온도가 오히려 올라가게 된다.

이러한 잘 표현해보자면 가장 중요한 포인트는 다음과 같다.

**주변 공간과의 상대적인 온도의 차이로 인해 온도가 변하게 된다.**

**즉, 주변 온도가 높으면 온도는 올라가게 되고, 주변 온도가 낮으면 온도는 낮아진다.**

또, 주변 온도가 높을 수록 온도는 빨리 올라가게 될 것이고, 주변 온도가 낮을 수록 온도가 빨리 내려가게 될 것이다.

이것을 수학적으로는 어떻게 표현할 수 있을까?

'빨리'는 속도에 관련된 것이고, '주변 값과의 관계'는 볼록, 오목이라는 개념을 도입해 생각할 수 있다. 여기서 '볼록', '오목'은 2차 미분 계수로 표현할 수 있다.

## 2차 미분계수와 '볼록', '오목'

고등학교 시시절 변곡점(point of inflection)이라는 용어를 들어본 적이 있을 것이다. 변곡점은 2차 미분계수가 0이 되는 지점으로, 위로 볼록인 상태에서 아래로 오목인 상태로 변하거나 반대로 상태가 변하는 그 시점을 말한다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic4_inflection.png">
  <br>
  그림 4. 변곡점은 볼록>오목 혹은 오목>볼록으로 변하는 시점을 의미한다
</p>

다시 말해 수학적으로 '위로 볼록'은

$$f''(x) < 0$$

으로, '아래로 오목'은 

$$f''(x) > 0$$

으로 쓸 수 있다는 사실을 기억하도록 하자.

## 열방정식의 의미

다시 열 방정식의 의미를 생각해보면, 주변 온도가 높을 수록 온도는 빨리 올라가게 될 것이고, 주변 온도가 낮을 수록 온도가 빨리 내려가게 되는 것이라고 했다.

우리의 온도 분포 $u$는 시간과 공간의 함수이므로,

$$u = f(x,t)$$

라고 쓸 수 있다.

온도 분포의 시간에 따른 변화(속도)는 

$$\frac{\partial u}{\partial t}\text{ 혹은 } u_t$$

라고 쓸 수 있다.

또, 주변 온도가 높거나 낮은 정도는 2차 미분계수를 이용해

$$\frac{\partial^2u}{\partial x^2}\text{ 혹은 }u_{xx}$$

라고 쓸 수 있다.

온도의 변화 속도는 주변의 온도가 높거나 낮은 정도에 비례한다고 할 수 있으므로,

$$u_t \propto u_{xx}$$

비례 상수 $k$를 이용해 표현하면,

$$u_t = k u_{xx}$$

이며, 이것이 1차원 공간에서의 열 방정식이다.

## MATLAB demo 1: 쇠막대기 예제

그림 5는 지금까지 얘기되었던 쇠막대기의 온도 변화를 시뮬레이션 한 것이다.

볼록/오목한 정도가 심할 수록 온도가 빨리 변하는 것을 확인할 수 있다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic5_candle_example.gif">
  <br>
  그림 5. 쇠막대기의 온도 변화를 시뮬레이션 한 것
</p>

아래의 3D 그림은 쇠막대기의 온도 변화 $u(x, t)$를 3차원 공간 상에 도시한 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/heat_3D_result.gif">
</p>

## MATLAB demo 2: 쇠판대기 예제

지금까지는 1차원 공간에서의 열방정식에 대해서 얘기가 되었는데, 이번 예시에서는 2차원 공간의 열방정식의 예제를 시뮬레이션 해보았다.

상정한 상황은 2차원 쇠 판대기를 1초 동안 라이터로 지진 뒤 열을 더이상 가하지 않게 되었을 때 쇠 판대기에서 열이 어떻게 퍼지는지를 시뮬레이션 한 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic6_steel_plate_example.gif">
  <br>
  그림 6. 쇠판대기의 온도 변화를 시뮬레이션 한 것
</p>

역시나 주변에 비해 온도가 높은 곳은 온도가 빨리 떨어지는 것을 확인할 수 있다.

# 파동방정식 (wave equation)

파동방정식은 음파, 전자기파, 수면파 등을 다루기 위해 사용되는 2차 편미분 방정식이다. 여기서 말하는 파동방정식은 슈뢰딩거의 파동방정식과는 다른 것이다. 

열방정식이 갖는 의미를 이해했다면 파동방정식의 의미를 이해하는 것은 매우 간단해진다.

## 파동 방정식의 intuition

열 방정식이 볼록한 정도와 속도의 관계였다면 파동 방정식은 볼록한 정도와 '힘'의 관계이다. 즉, 볼록할 수록 더 힘을 받는다.

수식으로 표현하면 다음과 같다.

$$\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}$$

또는

$$u_{tt} = c^2 u_{xx}$$

여기서 $c^2$는 양의 상수이다.

즉 좌변은 '가속도'에 관한 항이고 우변은 '볼록한 정도'에 관한 항이다.

즉, 1차원 공간에 놓여있는 로프에 대해서 파동의 형태와 가해지는 힘을 표시하면 다음과 같다.

<p align = "center">
  <img src = "https://i.stack.imgur.com/6IR0J.gif">
  <br>
  그림 7. 파동의 볼록한 정도에 따라 받는 '힘'이 시시각각 변한다.
  <br>
  출처: Meaning of Vector Wave Equation, StackExchange
</p>

## 시뮬레이션: 1차원 공간 상의 파동

파동방정식의 함수 역시 열방정식의 함수처럼 2차원 입력을 갖는 함수로 생각할 수 있다.

즉, 시간과 공간(여기서는 로프를 따라가는 x축)에 대한 함수로 나타낼 수 있으며, 

그림 7과 같은 파동의 움직임은 아래와 같이 3차원 공간에서 표현할 수 있다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/wave_3D_result.gif">
</p>

## 시뮬레이션: 2차원 공간 상의 물결파

아래의 MATLAB 시뮬레이션은 2차원 공간에서의 물결파를 시뮬레이션 해본 것이다. [^1]

[^1]: 해당 시뮬레이션은 Haroon Stephen 교수님의 Youtube 영상을 보고 만들었음. https://www.youtube.com/watch?v=O6fqBxuM-g8

가정한 상황은 중앙 지점에서 wave의 source가 주기적으로 나온다는 것이고, 주변으로 어떻게 wave가 퍼지는지를 확인해본 것이다.

또, 이 공간은 벽으로 막혀있어서 wave가 반사되어 돌아오게 된다고 boundary condition을 설정했다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-29_Heat_Wave_Equation/pic8_wave_equation_2d.gif">
  <br>
  그림 8. 2차원 공간 상에서의 파동 시뮬레이션
</p>


※ 시뮬레이션에 사용된 MATLAB 코드는 공돌이의 수학정리노트 Github Repo에서 받으실 수 있습니다.

$\Rightarrow$ [공돌이의 수학정리노트 Github Repo](https://github.com/angeloyeo/gongdols/tree/master/%EB%AF%B8%EC%A0%81%EB%B6%84%ED%95%99)

<center>

<iframe width="560" height="315" src="https://www.youtube.com/embed/YNAI3hAcVKQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>



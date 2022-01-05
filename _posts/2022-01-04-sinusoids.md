---
title: 정현파 기초
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220104
tags: 신호처리
---

# Prerequisites

이번 포스팅을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [각도법과 호도법의 의미](https://angeloyeo.github.io/2019/06/04/2-1-angle_rad.html)

# 원의 회전으로 부터 출발하는 정현파

정현파(sinusoidal wave)는 사인파(sine wave), 코사인파(cosine wave)를 총칭하는 말이다. 

아마, 중학교 시절 삼각비에 대해서 배우고 고등학교 때 삼각함수에 대해 배운 것을 기억할 것이다.

거기서 삼각함수에 사인파, 코사인파가 포함되어 있다. 

지금 생각해보면 고등학교 시절에는 워낙에 어려운 미분/적분을 삼각함수에 적용하고 계산하는 일을 하다보니 막상 정현파의 본질은 잊어버리고 파형의 생김새와 계산 방법만이 머릿속에서 떠돌게 되었던 것 같다.

정현파의 본질은 원 위의 회전에 관한 것이다. 그리고, 시간에 따른 회전을 기술한 것이다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-04-sinusoids/pic1.mp4">
  </video>
  <br>
  그림 1. 4초 주기로 원 위의 점이 회전하고 있다.
</p>

원은 2차원 평면 상에 위치한다. 그런데, 그래프 상에 시간에 따른 회전을 기술(記述)하려다보니 2차원 평면의 두 개 차원 중 하나의 차원은 포기할 수 밖에 없었을 것이다.

가장 쉬운 방법은 회전하는 원의 $x$축 혹은 $y$축 위의 변화만을 시간에 따라 기술하는 것이다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-04-sinusoids/pic2.mp4">
  </video>
  <br>
  그림 2. 4초 주기로 원 위의 점의 x 축 y 축 위의 변화만을 관찰하는 과정
</p>

위 그림에서 볼 수 있는 시간에 따른 $x$ 축 혹은 $y$ 축 위의 움직임을 아래와 같이 표현하는 것이 아이디어라고 할 수 있다. 시간 축을 새로 설정하자는 것이다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-04-sinusoids/pic3.mp4">
  </video>
  <br>
  그림 3. 원 위의 회전에 맞춰 x 축 y 축의 시간 변화를 각각 그래프로 표현하면 정현파를 얻을 수 있다.
</p>

이렇게 해서 얻게 되는 파형은 두 개이고 $x$ 축의 시간 변화 그래프는 코사인 파라고 부르고 $y$ 축의 시간 변화 그래프는 사인파라고 부른다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-04-sinusoids/pic4.png">
  <br>
  그림 4. 주기가 4초인 코사인파와 사인파
</p>

# 정현파의 3가지 특성값

우리는 앞서 원의 회전으로부터 정현파를 생각할 수 있다는 것을 알아보았다.

이 사실을 기반으로 원의 회전에 관한 몇 가지 변형을 줄 수 있다는 것을 상상해볼 수 있다.

일단 원의 반지름을 수정해볼 수 있을 것이고, 또 회전 속도를 조절 해볼 수도 있을 것이다.

거기에, 회전하기 시작하는 곳의 위치도 바꿔볼 수 있다.

이 세 가지는 각각 정현파의 진폭(amplitude), 주파수(frequency), 위상 변이(phase shift)라고 불린다.

코사인파를 기준으로 쓰면 다음과 같이 진폭, 주파수, 위상 변이가 표현된다.

$$x(t)=A\cos(2\pi f_0 t+\phi) = A\cos(\omega_0 t + \phi)$$

여기서 $A$는 진폭, $f_0$는 주파수, $\phi$는 위상 변위를 뜻하며 $\omega_0$는 라디안 주파수를 의미한다.

이것에 대해서 조금 더 자세히 알아보도록 하자.

## 진폭 (amplitude)

진폭은 크게 어려운 개념이 아니다. 정현파의 진폭은 회전하는 원의 반지름의 길이와 같다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-04-sinusoids/pic5.mp4">
  </video>
  <br>
  그림 5. 서로 다른 크기의 반지름을 갖는 원의 회전
</p>

기본적으로 코사인 함수 $cos(\theta)$는 +1과 -1 사이에서 진동하므로 $A\cos(\theta)$는 $-A$에서 $+A$ 사이에서 진동한다.

다만, 정현파를 그릴 때, 가로축을 시간, 세로축을 amplitude라고 많이들 적는데, 그것은 올바른 표현은 아니라는 점은 짚고 넘어갔으면 좋을 것 같다.

[//]:# (가로축 시간, 세로축 amplitude라고 적은 뒤 정현파 하나 그려주고 잘못된 예시라는 것을 표현해줄 것)


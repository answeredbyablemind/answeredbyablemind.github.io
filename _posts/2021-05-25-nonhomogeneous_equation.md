---
title: 비제차 미분방정식의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210525
tags: 미분방정식
---

# Prerequisites

비제차 미분방정식의 의미에 대해 더 잘 알기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html)
* [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)

# 1차 비제차 미분방정식

1차 선형 미분방정식의 형태는 다음과 같았다.

$$\frac{dx}{dt}+p(t)x = q(t)$$

만약 여기서 $q(t)=0$인 경우를 우리는 제차 혹은 동차 미분방정식(homogeneous DE)이라고 부르고, $q(t)\neq 0$인 경우를 비제차 혹은 비동차 미분방정식(nonhomogeneous DE)이라고 부른다.

(여기서 DE는 Differential Equation을 줄인 말이다. 또, 이 article에서는 한국어 표현 중에서는 제차, 비제차의 용어를 사용할 것이다.)

제차 미분방정식과 비제차 미분방정식에 대해 배울 때 솔루션을 구하는 방법에 대해서만 너무 몰두하다보면 비제차 미분방정식이 갖는 의미에 대해서는 정작 공부하지 못할 수가 있다.

비제차 미분방정식은 변화율이 시간에 따라 바뀐다는(time-dependent) 관점에서 제차미분방정식과 다른 점을 보이는 것이다. 

물론 정의역을 항상 시간으로 둘 필요는 없기 때문에 꼭 비제차 미분방정식이 time-dependent한 slope를 가진다고 말할 수만은 없지만, 가장 쉽게 비제차미분방정식의 의미에 다가갈 수 있는 방법은 <u>**비제차 미분방정식에서는 slope가 time-dependent하다다는 것을 인지하는 것**</u>이다.

예를 들어, 아래와 같은 미분방정식은 제차 미분방정식이다.

$$\frac{dx}{dt} = x$$

그런데, 어떤 미분방정식은 $x(t)$의 변화율이 시간에 따라 변할 수 있기 때문에 아래와 같은 형식으로도 표현될 수 있다.

$$\frac{dx}{dt} = x+e^{t/2}$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-25-nonhomogeneous_equation/pic1.png">
  <br>
  그림 1. 식 (1), 식 (2)의 제차 미분방정식과 비제차 미분방정식의 방향장 비교
</p>


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-25-nonhomogeneous_equation/pic2.png">
  <br>
  그림 2. 
</p>

# 연립 비제차 미분방정식

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-25-nonhomogeneous_equation/pic3.mp4">
  </video>
  <br>
  그림 3.
</p>

# General solution = homogeneous + particular solution 인 이유
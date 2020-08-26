---
title: 미소곡면의 법선벡터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200820
tags: 미적분학
---

이번 article에서는 벡터장의 면적분을 이해하기 위해 필수적인 미소 곡면의 법선 벡터에 대해서 알아보고자 한다.

이를 위해서 우리는 곡면의 수학적 표현에 대해 이해하고자 한다.

# 매개변수 하나로 표현하는 곡선의 방정식

매개변수 방정식은 일반적으로 다음과 같이 표현할 수 있다.

매개변수 $t$에 대하여,

$$r(t) = \begin{bmatrix}x(t)\\y(t)\end{bmatrix}=x(t)\hat{i}+y(t)\hat{j}$$

고등학교 수학 시간에 배우기는 하지만 매개변수를 이용해 표현하는 직선(혹은 곡선)의 방정식은 한 눈에 이해하기가 어려웠던 것 같다.

그 이유는 우리가 보통 그리는 함수들은 입력과 출력을 한 평면에 모두 나타내게 되므로 (보통 입력을 $x$축에, 출력을 $y$축에 표현한다.) 입력이 변할 때 출력이 어떻게 변하는지 한눈에 알 수 있었기 때문이다.

그러나, 매개변수를 이용해 표현한 방정식은 그 결과만을 볼 때 함수의 출력만을 관찰하게 되기 때문에 그 결과물을 한눈에 이해하기 힘들다.

따라서 매개 변수를 이용해 표현한 직선(혹은 곡선)의 방정식을 조금이나마 쉽게 이해해보려면 입력의 변화와 출력의 변화를 한꺼번에 나타낼 수 있어야 할 것이다.

실생활에서 사용되고 있는 매개 변수를 이용해 표현한 직선의 방정식은 바로 스크롤이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-20-normal_vector/pic1.gif">
  <br>
  그림 1. 스크롤의 위치를 이용해 현재 보여줄 페이지의 위치를 현재 화면에 매핑해 표현해주고 있다.
</p>

그림 1에서처럼 스크롤을 이동하게 되면 현재 스크롤의 위치에 맞게 매핑된 보고싶은 위치의 화면이 출력되게 된다.

즉, 스크롤은 여기서 매개 변수의 정의역에 해당하며 현재 보이는 화면의 위치가 치역에 해당된다고 할 수 있다.

이와 같이 매개변수의 정의역과 함수의 결과값인 치역을 한번에 나타내는 방식으로 조금 더 복잡한 함수를 표현해보자.

아래의 applet은 매개 변수 $t$를 이용해 표현한 함수 $r(t)$이다.

$$r(t) = \begin{bmatrix} t\cdot \cos(2\pi t) \\ t\cdot \sin(2\pi t)\end{bmatrix}$$

<center>
  <iframe width = "350" height = "350" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-20-normal_vector/parametric_curve/"></iframe>
  <br>
  t로 매개된 곡선의 매개변수 방정식
</center>

위 applet을 보면 $t = 0$일 때 부터 $t = 3$일 때 까지의 변화가 슬라이더 상에 표현되고, 그 결과들이 각 $t$의 변화에 따라 매핑되는 것을 알 수 있다.

## 매개 변수를 이용해 표현한 곡선의 접선

또한, 매개변수를 이용해 표현한 곡선은 다른 함수들처럼 미분계수를 구할 수도 있다.

아래는 $t$의 변화에 따른 접선 벡터의 변화를 표시한 것이다. 

<center>
  <iframe width = "350" height = "350" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-20-normal_vector/parametric_curve_and_its_derivative/"></iframe>
  <br>
  t로 매개된 곡선의 매개변수 방정식의 접선 벡터
</center>

매개 변수의 접선 벡터를 수식으로 표현하면 다음과 같은데,

$$r'(t) = \begin{bmatrix} \partial x / \partial t \\ \partial y/\partial t\end{bmatrix}$$

이 말인 즉슨, 매개 변수 $t$가 약간 변할 때 $x(t)$와 $y(t)$는 각각 얼마나 변하는가를 말하고 있다.


# 매개 변수 두 개를 이용해 표현하는 곡면의 방정식

그렇다면, 곡면의 방정식을 표현하기 위해선 어떻게 해야할까?

일반적으로 곡면의 방정식은 매개변수가 두 개 필요하다.

매개변수를 이용한 곡면의 방정식은 일반적으로 다음과 같이 쓸 수 있다.

$$r(u, v) = \begin{bmatrix}x(u,v) \\ y(u,v) \\ z(u,v) \end{bmatrix} = x(u,v)\hat{i} + y(u,v)\hat{j} + z(u,v)\hat{k}$$

곡선에 대해 이해할 때와 마찬가지로 정의역과 치역을 각각 따로 놓고 곡면을 표현해보면 아래 그림과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-20-normal_vector/pic2.png">
  <br>
  그림 2. 스크롤의 위치를 이용해 현재 보여줄 페이지의 위치를 현재 화면에 매핑해 표현해주고 있다.
</p>
## 매개 변수를 이용해 표현한 곡면의 접평면과 법선벡터


<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/tCBegKMJY7s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
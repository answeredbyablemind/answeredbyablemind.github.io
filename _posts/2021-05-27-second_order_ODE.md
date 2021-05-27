---
title: 2계 선형 미분방정식의 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210527
tags: 미분방정식
---

※ 본 포스팅의 내용은 Thomas Judson의 [The ordinary differential equations project](http://faculty.sfasu.edu/judsontw/ode/)에서 많은 부분을 차용하였음을 밝힙니다.

# Prerequisitess

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [연립 미분방정식 모델링](https://angeloyeo.github.io/2021/05/11/modeling_with_systems.html)
* [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)

# 2계 제차 선형 미분방정식

2계 선형 미분방정식이란 아래와 같이 미분계수의 최고 미분횟수가 2회인 미분방정식을 의미한다.

$$a(t)\frac{d^2x}{dt^2} + b(t)\frac{dx}{dt} + c(t)x(t) = g(t) % 식 (1)$$

이번 시간에는 특별히 $a(t)$, $b(t)$, $c(t)$가 모두 상수이고 $g(t)=0$인 2계 제차 선형 미분방정식에 대해 다루고자 한다.

다시 말해 우리가 다루고자 하는 미분방정식의 꼴은 아래와 같다.

$$a\frac{d^2x}{dt^2}+b\frac{dx}{dt}+cx(t) = 0 % 식 (2)$$

여기서 $a$는 0이 아니어야 한다.

# 2계 제차 선형 미분방정식의 해법

## 선형 연립방정식으로의 전환

우리는 사실 2계 제차 선형 미분방정식의 해법에 대해 다룬 적이 있다. 

[연립 미분방정식 모델링](https://angeloyeo.github.io/2021/05/11/modeling_with_systems.html) 편에서 damped harmonic oscillation을 다룰 때 이 해법을 언급한 적이 있다. 

2계 제차 선형 미분방정식의 해법은 1차 미분계수 $dx/dt$를 새로운 변수로 놓고 풀어주는 것이 핵심이다.

식 (2)와 같은 2계 제차 선형 미분방정식에 대해서 우리는 다음과 같이 생각할 수 있다.

만약, 

$$y=\frac{dx}{dt} % 식 (3)$$

와 같은 새로운 변수를 생각한다면,

$$\frac{dy}{dt}=\frac{d}{dt}\left(\frac{dx}{dt}\right)=\frac{d^2x}{dt^2} % 식 (4)$$

이므로,

식 (2)는 다음과 같이 쓸 수도 있을 것이다.

$$a\frac{dy}{dt}+by+cx = 0 % 식 (5)$$

$$\Rightarrow \frac{dy}{dt}=-\frac{b}{a}y-\frac{c}{a}x % 식 (6)$$

다시 한번 $x$와 $y$에 대한 연립방정식으로 이 과정을 풀어서 생각하면 다음과 같다.

$$\begin{cases}\dfrac{dx}{dt}=y \\\\ \dfrac{dy}{dt}=-\dfrac{c}{a}x-\dfrac{b}{a}y\end{cases} % 식 (7)$$

그러므로 식 (2)의 2계 제차 선형 미분방정식은 다음과 같이 행렬의 꼴로 항상 나타낼 수 있다.

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix} = \begin{bmatrix}0 & 1 \\ -c/a & -b/a\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix} % 식 (8)$$

여러번 강조하는 것 같지만 식 (8)에서 $a$는 0이 아니어야 한다.

여기서 알 수 있게 되는 것은 식 (8)을 풀게 됨으로써 2계 제차 선형 미분방정식의 solution을 얻어낼 수 있다는 것이다.

## 선형 연립방정식의 해를 구하는 것의 의미

선형 연립방정식으로 만들어 2계 제차 미분방정식의 해를 구할 수 있다는 것은 [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)편 에서 보았던 것 처럼 식 (8)에 있는 행렬의 고윳값, 고유벡터를 이용하는 것이 solution을 구하는 연결고리가 된다는 점을 시사하기도 한다.

식 (8)과 같은 선형 연립 미분방정식의 해(solution)들은 고유벡터를 중심으로 변화가 일어나게 된다.

왜냐하면 고유벡터는 그 정의 상 행렬을 적용해도 상수배만큼의 변화만 벡터에 적용되기 때문에 마치 움직이지 않는 축과 같이 작용하기 때문이다.

또, 고윳값은 해당 고유벡터를 따르는 변화의 크기와 방향에 대해서 얘기해주고 있다고 언급한 바 있다.

[미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 언급했던 것 처럼 자연상수 $e$는 성장량과 관련된 지표이며,

$e^{kt}$는 결국 시간에 따른 성장량을 나타내게 된다. 고윳값은 여기서 $k$에 해당하는 값인데, 이 $k$가 음수이면 성장이 줄어드는 방향으로 진행된다는 것이고 $k$가 양수이면 성장이 커지는 방향으로 진행된다는 것을 말해준다.

또, $k$는 값이 크면 클 수록 더 빠르게 성장하거나 감퇴한다는 것을 말해준다는 점 또한 고려하자.




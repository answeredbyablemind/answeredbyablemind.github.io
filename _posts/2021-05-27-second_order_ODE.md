---
title: 2계 선형 미분방정식의 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210527
tags: 미분방정식
---

# Prerequisitess

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
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

이미 이 내용에 대해서는 [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html) 편에서 한번 다룬 적 있지만, 그래도, 조금 다른 문장들로 구성해 짚고 넘어가보도록 하자.

---

우리의 미분방정식의 해는 초기 조건에서 설정된 값에서부터 값이 변해간다. 이 때, 연립 미분방정식에 제시된 조건에 따라 다음 번 포인트를 찾아갈 수 있게 되는 것이다.

다시 말해 '$xy$ 평면 상에서 어느 방향으로 성장시켜줄 것인가?'가 식 (8)과 강튼 연립 미분방정식으로 제시된다. 그리고, 그 성장에 관한 레시피는 행렬로 표현되어 있다.

한편, 선형 연립 미분방정식의 해(solution)들은 고유벡터를 중심으로 변화가 일어나게 된다.

왜냐하면 고유벡터는 행렬을 통한 선형변환이 상수배 만큼만 일어나는 벡터로 정의하기 때문에 고유벡터와 평행한 벡터들은 선형변환을 통해 변환될 때 방향이 바뀌지 않고 크기만 바뀐다.

그러다 보니 고유벡터들을 길게 늘어뜨린 직선들이 해(solution)의 시간 변화에 대한 중심 축으로 작동한다.

또, 고윳값은 대응되는 고유벡터를 따르는 변화의 크기와 방향에 대해서 얘기해주고 있다.

다시 말해 임의의 행렬이 고유벡터 방향으로 선형변환 될 때에는 변환 후의 벡터가 크기만 바뀌고 방향이 바뀌지 않는데, 그 때의 변화 크기가 고윳값이 되는 것이다.

만약 고윳값의 부호가 양수이면 그 고윳값에 대응되는 고유벡터를 따라 변할 때는 원점에서 멀어지는 방향으로 성장한다. 또, 만약 고윳값의 부호가 음수이면 그 고윳값에 대응되는 고유벡터를 따라 변화하는 방향은 원점으로 가까워지는 방향이다.

그리고 고윳값의 크기는 대응되는 고유벡터들을 따라 얼마나 빨리 성장시켜 줄 것인가를 기술하고 있는 값이라고 볼 수 있다.

---

요약하자면, 임의의 포인트에서 다음번 포인트로 변화해 가는 과정을 두 가지 관점으로 해석해볼 수 있다.

1. 연립 미분방정식에서 주어진 레시피대로 움직인다는 것.
2. 매 회 성장은 고유벡터를 중심으로 일어난다. 그리고 각각의 고유벡터를 따라 움직이는 속도(성장의 빠르기와 원점으로 향해가는지의 여부)는 고윳값으로 결정된다는 것.

이 내용을 정리해서 생각해볼 수 있는 그림은 아래와 같다.

아래 그림은 아래와 같은 연립 미분방정식에 대한 위상 평면과 특정 초기조건으로부터 구한 solution curve의 추정 곡선이다.

$$\begin{cases}\dfrac{dx}{dt} = y \\\\ \dfrac{dy}{dt}=x\end{cases}$$

$$\text{초기조건: }(x,y) = (2, -1)$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic6.png">
  <br> 그림 1. 어떤 연립 미분방정식에 대해, 해의 초기값으로부터 시간에 따른 성장은 고유벡터를 따라 고윳값 만큼 매번 일어난다.
</p>

한편, [미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 언급했던 것 처럼 자연상수 $e$는 성장량과 관련된 지표이다.

그래서 $e^{kt}$는 시간 $t$ 에 따른 성장량을 나타내게 된다. 이렇게 써놓고 보면 $e^{kt}$라는 식에서 $k$는 성장률 혹은 성장 속도이다.

식 (8)의 행렬로부터 얻게 되는 고윳값은 여기서 $k$에 해당한다. 이 $k$가 음수이면 성장이 줄어드는 방향으로 진행된다는 것이고 $k$가 양수이면 성장이 커지는 방향으로 진행된다는 것을 말해준다.

또, $k$는 값이 크면 클 수록 더 빠르게 성장하거나 감퇴한다는 것을 말해준다는 점 또한 고려하자.

---

이 내용들을 모두 종합하면, 아래와 같은 연립 제차 미분방정식에 대하여,

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix} = \begin{bmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix} = A\begin{bmatrix}x \\ y\end{bmatrix}$$

행렬 $A$의 고유벡터를 $\vec v_1$, $\vec v_2$이라 하고 이에 해당되는 고윳값을 $\lambda_1$, $\lambda_2$라고 하면 일반해는

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1\begin{bmatrix}| \\ \vec{v}_1 \\ |\end{bmatrix}e^{\lambda_1 t}+c_2\begin{bmatrix}| \\ \vec{v}_2 \\ |\end{bmatrix}e^{\lambda_2 t}$$

이다. 여기서 $c_1$, $c_2$는 상수이다.
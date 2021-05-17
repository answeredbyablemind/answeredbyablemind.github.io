---
title: 위상 평면(phase plane)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210512
tags: 미분방정식
---

# 위상 평면 소개

2원 1차 미분방정식이나 2차 미분방정식을 해석할 때 위상평면을 이용한 해석은 미분방정식의 해의 특성을 파악하는데 굉장히 중요한 역할을 한다.

아래와 같은 2원 1차 미분방정식에서 

$$\begin{cases}
  \dfrac{dx}{dt} = f(x, y) \\\\
  \dfrac{dy}{dt} = g(x, y)
\end{cases} % 식 (1)$$

위상 평면은 2차원(혹은 3차원) 실수 평면에서 모든 점 $(x, y)$에 대한 기울기를 평면에 표현할 수 있다는 사실을 바탕으로 그릴 수 있다.

다시 말해, $(x, y)$에서의 기울기 $dy/dx$는

$$\frac{dy}{dx}=\frac{dy/dt}{dx/dt}$$

와 같이 계산할 수 있다는 점을 감안하면 모든 $(x, y)$에서 기울기를 계산해 그려줄 수 있다.

가장 기본적인 2원 1차 미분방정식은 다음과 같은 것인데,

$$\begin{cases}
  \dfrac{dx}{dt} = x \\\\
  \dfrac{dy}{dt} = y
\end{cases} % 식 (2)$$

식 (2)의 phase plane을 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic1.png">
  <br>
  그림 1. 식 (2)의 phase plane. 화살표는 단위행렬의 고유벡터, 두꺼운 검은선은 고유벡터 방향으로의 원점을 통과하는 직선을 나타낸 것임.
</p>

또 다른 2원 1차 미분방정식은 다음과 같은 것도 있을 수 있다.

$$\begin{cases}
  \dfrac{dx}{dt} = y \\\\
  \dfrac{dy}{dt} = x
\end{cases} % 식 (3)$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic2.png">
  <br>
  그림 2. 식 (3)의 phase plane. 화살표는 단위행렬의 고유벡터, 두꺼운 검은선은 고유벡터 방향으로의 원점을 통과하는 직선을 나타낸 것임.
</p>

## 위상 평면을 (손으로) 그리는 (대략적인) 방법

그림 1과 그림 2의 위상 평면이 식 (2)와 식 (3)으로부터 어떻게 얻어졌을까?

당연히 컴퓨터로 그린 것이지만, 우리는 대략적인 원리는 파악하고 있어야 위상평면에 대해서 더 잘 이해할 수 있다.

기본적으로 식 (1)와 같은 연립 미분방정식이 있다고 생각해보자.

임의의 점 $(x,y)$에 대해 식 (1)을 통해 $dx/dt$와 $dy/dt$를 계산할 수 있다.

여기서 $dt$를 적절한 크기의 $\Delta t$로 바꿔 생각하면 적절한 크기의 $\Delta x$와 $\Delta y$를 계산할 수 있다.

가령, 식 (3)을 예로 들어보면 (2, -1)이라는 점에서는 $dx/dt = -1$, $dy/dt = 2$ 가 된다.

만약 $\Delta t = 0.1$이라고 잡는다면 $\Delta x = dx/dt * \Delta t = -0.1$, $\Delta y = dy/dt * \delta t = 0.2$이므로,

(2, -1)이라는 점에서는 (2, -1)과 (2-0.1, -1+0.2)=(1.9, -0.8)라는 점들을 화살표로 이어주면 된다.


# 위상평면과 행렬

식 (1)~(3)을 통해 볼 수 있는 것은 식 (1)의 $f(x,y)$ 혹은 $g(x,y)$를 어떻게 정하는가에 따라서 위상 평면의 모양이 결정된다는 점이다.

여기서 생각해볼 수 있는 점은 $f(x,y)$와 $g(x,y)$은 $x, y$에 대한 식이고 이것을 조합할 수 있는 좋은 방법 중 하나는 행렬을 이용하는 것이다.

다시 말해 우리는 식 (1)을 아래와 같은 행렬을 이용한 연립방정식으로 볼 수도 있다는 점이다.

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} = \begin{bmatrix}a_{11} && a_{12} \\ a_{21} && a_{22}\end{bmatrix} \begin{bmatrix}x\\y\end{bmatrix}=A \begin{bmatrix}x\\y\end{bmatrix} % 식(4)$$

여기서 $\bold{x} = \begin{bmatrix}x\\y\end{bmatrix}$라고 하면

$$\frac{d}{dt}\bold{x}=A\bold{x} % 식 (5)$$

와 같은 관계로 식 (1)을 다시 써볼 수도 있을 것이다.

그렇다면 위의 식 (4) 혹은 식 (5)에서 행렬이 갖는 의미는 무엇일까?

우리는 식 (5)를 조금 더 분해해 생각해봄으로써 행렬이 가져다주는 의미에 대해 생각해볼 수 있다.

식 (5)의 좌변은 미분계수가 들어있는데, 미분은 결국 변화율에 관한 내용이다. 다시 말해, 지금 시점($t$)의 값과 바로 다음 시점($t+dt$)의 값의 차이에 관한 설명이라는 뜻이다.

또, 식 (5)의 우변에는 행렬이 들어있고, 이 행렬은 우변의 $\bold{x}=\begin{bmatrix}x\\y\end{bmatrix}$를 어떻게 [선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html) 시켜줄 것인가에 대한 얘기가 들어있다.

즉, 식 (5)가 말해주는 것은 임의의 $\bold{x}$에 대해 지금 시점 $t$와 바로 다음 시점 $t+dt$에서의 벡터 값 변화에 대한 것이다.

[//]:# (그림 3 넣을 곳. 식 (5)에 대한 해석.)



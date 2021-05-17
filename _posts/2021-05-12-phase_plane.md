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

## 위상 평면을 손으로 그리는 방법

그림 1과 그림 2의 위상 평면이 식 (2)와 식 (3)으로부터 어떻게 얻어졌을까?

당연히 컴퓨터로 그린 것이지만, 우리는 대략적인 원리는 파악하고 있어야 위상평면에 대해서 더 잘 이해할 수 있다.

기본적으로 식 (1)와 같은 연립 미분방정식이 있다고 생각해보자.

임의의 점 $(x,y)$에 대해 식 (1)을 통해 $dx/dt$와 $dy/dt$를 계산할 수 있다.

여기서 $dt$를 적절한 크기의 $\Delta t$로 바꿔 생각하면 적절한 크기의 $\Delta x$와 $\Delta y$를 계산할 수 있다.

가령, 식 (3)을 예로 들어보면 (2, -1)이라는 점에서는 $dx/dt = -1$, $dy/dt = 2$ 가 된다.

이제부터는 화살표를 그려야 한다. 화살표가 의미하는 것은 해당 좌표에서 미분계수가 말해주는 방향이다.

미분계수 $dx/dt$나 $dy/dt$는 모두 $\Delta x / \Delta t$나 $\Delta y / \Delta t$에 대한 극한값으로 정의된다.

따라서, 화살표를 그리는 기준이 되는 $\Delta t$ 값을 정해보자. 이 값만 주어진다면 $\Delta x$와 $\Delta y$를 얻어낼 수 있을 것이다.

만약 $\Delta t = 0.1$이라고 잡는다면 $\Delta x = dx/dt * \Delta t = -0.1$, $\Delta y = dy/dt * \delta t = 0.2$이므로,

(2, -1)이라는 점에서는 (2, -1)으로부터 $(2+\Delta x, -1+ \Delta y)=(1.9, -0.8)$점으로 화살표를 이어주면 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic3.png">
  <br>
  그림 3. 식 (3)의 위상 평면을 그리는 과정 중 (2, -1)이라는 점에서 해당되는 벡터를 그린 결과물
</p>

이와 같은 방법으로 모든 좌표에서 화살표를 그려주면 위상평면이 그려지는 것이다.

(물론 손으로 그리는 방법은 매우 시간 소모가 많이 되므로 컴퓨터로 그리길 추천한다.)

# 위상평면과 행렬

식 (1)~(3)을 통해 볼 수 있는 것은 식 (1)의 $f(x,y)$ 혹은 $g(x,y)$를 어떻게 정하는가에 따라서 위상 평면의 모양이 결정된다는 점이다.

여기서 생각해볼 수 있는 점은 $f(x,y)$와 $g(x,y)$은 $x, y$에 대한 식이고 이것을 조합할 수 있는 좋은 방법 중 하나는 행렬을 이용하는 것이다.

다시 말해 우리는 식 (1)을 아래와 같은 행렬을 이용한 연립방정식으로 볼 수도 있다는 점이다.

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} = \begin{bmatrix}a_{11} && a_{12} \\ a_{21} && a_{22}\end{bmatrix} \begin{bmatrix}x\\y\end{bmatrix}=A \begin{bmatrix}x\\y\end{bmatrix} % 식(4)$$

여기서 $\vec{x} = \begin{bmatrix} x, y \end{bmatrix}^T$라고 하면

$$\frac{d}{dt}\vec{x}=A\vec{x} % 식 (5)$$

와 같은 관계로 식 (1)을 다시 써볼 수도 있을 것이다.

## 고유값, 고유벡터의 의미

위에서 언급했던 내용에 따라 손으로 위상 평면 상의 기울기 벡터를 하나라도 그려봤다면, 위상 평면의 행렬이 작동하는 방식은 선형 변환이라기 보다는 계산을 위한 계수를 넣어둔 것에 더 가깝다는 것을 알 수 있을 것이다.

여기서 위상평면의 행렬은 어떤 추가적인 의미를 갖는다고 할 수 있을까?


## 행렬이 작동하는 변환 시각화

식 (5)에서 행렬 $A$가 단위행렬일 때와 임의의 주어진 행렬일 때를 비교하면 어떤 식으로 계산이 이루어지게 되어 지금의 위상평면을 획득하게 되었는지를 시각화 할 수 있을 것이다.

또한 이 과정에서 위상 평면을 분석할 때 행렬 $A$의 고유값, 고유벡터의 역할에 대해 좀 더 시각적으로 이해할 수 있게 된다.

### positive & negative real eigenvalues

$$\begin{bmatrix}1 && 2 \\ 3 && 2 \end{bmatrix}$$

고유값:

$$ \lambda = -1, 4$$

고유벡터:

$$\begin{bmatrix} -0.707 \\ 0.707 \end{bmatrix}, \begin{bmatrix}-0.555 \\ -0.832\end{bmatrix}$$

<p align = "center">
  <video width = "560" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_case1.mp4">
  </video>
  <br>
  그림 4. 양수, 음수인 고유값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### two positive eigenvalues

$$\begin{bmatrix}2 && 0 \\ 0 && 3 \end{bmatrix}$$

고유값:

$$ \lambda = 2, 3$$

고유벡터:

$$\begin{bmatrix} 1 \\ 0 \end{bmatrix}, \begin{bmatrix} 0 \\ 1\end{bmatrix}$$

<p align = "center">
  <video width = "560" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_case2.mp4">
  </video>
  <br>
  그림 5. 두 양수 고유값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>


### two negative eigenvalues

$$\begin{bmatrix}-2 && 0 \\ 0 && -3 \end{bmatrix}$$

고유값:

$$ \lambda = -3, -2$$

고유벡터:

$$\begin{bmatrix} 0 \\ 1 \end{bmatrix}, \begin{bmatrix} 1 \\ 0\end{bmatrix}$$

<p align = "center">
  <video width = "560" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_case3.mp4">
  </video>
  <br>
  그림 6. 두 음수 고유값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### complex eigenvalues

$$\begin{bmatrix}-3 && 1 \\ -2 && -1 \end{bmatrix}$$

고유값:

$$ \lambda = -2+i, -2-i$$

고유벡터:

$$\begin{bmatrix} 0.408 - 0.408i \\ 0.817 \end{bmatrix}, \begin{bmatrix} 0.408+0.408i \\ 0.817 \end{bmatrix}$$

<p align = "center">
  <video width = "560" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_case4.mp4">
  </video>
  <br>
  그림 6. 두 복소 고유값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### repeated eigenvalues

$$\begin{bmatrix}-1 && 1 \\ 0 && -1 \end{bmatrix}$$

고유값:

$$ \lambda = -1\text{(중근)}$$

고유벡터:

$$\begin{bmatrix} 1 \\ 0 \end{bmatrix}, \begin{bmatrix} -1 \\ 0 \end{bmatrix}$$

<p align = "center">
  <video width = "560" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_case5.mp4">
  </video>
  <br>
  그림 7. 두 중근 고유값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

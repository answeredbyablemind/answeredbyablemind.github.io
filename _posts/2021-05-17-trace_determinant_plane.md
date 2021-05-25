---
title: trace-determinant plane
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210517
tags: 미분방정식
---


<p align = "center">
  <iframe width= "101%" height = "650" src = "https://mathlets.org/javascript/build/linPhasePorMatrix.html" frameborder = "0"></iframe>
  <br>
  Trace-Determinant plane 상의 점들에 매칭되는 phase plane
  <br>
  출처: MIT Mathlets, 
  <a href = "https://mathlets.org/mathlets/linear-phase-portraits-matrix-entry/">https://mathlets.org/mathlets/linear-phase-portraits-matrix-entry/</a>
</p>

# Prerequisites

해당 내용에 대해 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [위상 평면 (phase plane)](https://angeloyeo.github.io/2021/05/12/phase_plane.html)

# 위상 평면 내용 복습

[위상 평면 (phase plane)](https://angeloyeo.github.io/2021/05/12/phase_plane.html) 편에서 선형 연립 미분방정식은 아래와 같이 행렬을 이용해 표현할 수 있음을 확인하였다.

$$\begin{bmatrix}dx/dt \\ dy/dt\end{bmatrix} = \begin{bmatrix}a && b \\ c && d \end{bmatrix}\begin{bmatrix}x \\ y \end{bmatrix} % 식 (1)$$

그리고 위 식의 행렬로부터 고윳값과 고유벡터를 계산해보고 고윳값, 고유벡터의 값에 따른 phase plane의 형태 변화에 대해 알아보았다.

확인한 바에 따르면 고윳값이 모두 실수일 때는, 고유벡터들이 새로운 변화의 축인 것 처럼 작동하였다.

만약, 고윳값이 양수인 경우 해당되는 고유벡터를 따라 시간이 지날 수록 함수값이 원점으로부터 멀어지게 되었다. 

또, 고윳값이 음수인 경우 해당되는 고유벡터를 따라 시간이 지날 수록 함수값은 원점에 가까워지게 되었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic1.png">
  <br>
  그림 1. 실수 고윳값을 가지는 경우. 양수 고윳값에 대응되는 고유벡터를 따라 함수값은 원점으로부터 멀어지고, 음수 고윳값에 대응되는 고유벡터를 따라 함수값은 원점을 향해 간다.
</p>

한편, 고윳값이 복소수인 경우에는 phase plane이 원점을 따라 회전하는 것 같은 형태를 띄게 되었다. 

이 때, 복소 고윳값의 실수부가 1보다 작으면 원점을 향해서 수렴하게 되었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic2.png">
  <br>
  그림 2. 복소 고윳값을 가지는 경우. 복소 고윳값의 실수부가 1보다 작으면 원점을 향해 수렴해가며 회전한다.
</p>

한편, 고윳값이 복소수인데 실수부가 1보다 크면 phase plane의 형태가 원점을 벗어나는 회전을 하는 것을 알 수 있었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic3.png">
  <br>
  그림 3. 복소 고윳값을 가지는 경우. 복소 고윳값의 실수부가 1보다 크면 원점으로부터 멀어져가며 회전한다.
</p>

또, 고윳값이 겹치는 경우도 있다. 중근 고윳값을 가지는 경우라고 표현한다. 중근 고윳값을 가지는 경우에는 고유벡터도 구별할 수 없게 되어 직선 하나만으로 수렴/발산 하는 형태의 phase plane이 그려진다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic4.png">
  <br>
  그림 4. 중근 고윳값을 가지는 경우. 중근 고윳값을 가지는 경우 고유벡터도 겹치게 되면서 직선 하나만 고유벡터로 확인되게 된다.
</p>

# 특성방정식 (characteristic equation)

위에서 확인한 바와 같이 phase plane의 형태를 분석하기 위해서는 고윳값에 대해 분석해야 한다.

고윳값을 계산하는 방법은 행렬의 특성방정식을 분석하는 것이다.

고윳값, 고유벡터의 정의로부터 특성방정식을 다시 얻어내보자면 다음과 같다.

임의의 행렬 $A$와 고윳값 $\lambda$, 고유벡터 $v$에 대해서 다음을 만족해야 한다.

$$A\vec{v} = \lambda \vec{v} % 식 (2)$$

위 식에서 우변은 다음과 같이 고쳐 쓸 수도 있다.

$$\lambda \vec{v} = \lambda \vec{v} I % 식 (3)$$

여기서 $I$는 단위 행렬(identity matrix)이다.

즉, 고윳값, 고유벡터에 대한 식은 다음과 같이 이항해서 쓸 수도 있다.

$$A\vec{v} - \lambda \vec{v} I = 0 % 식 (4)$$

$$\Rightarrow (A-\lambda I)\vec{v} = 0 % 식 (5)$$

만약 $A$ 행렬이 아래와 같은 $2\times 2$행렬이라면,

$$A = \begin{bmatrix}a && b \\c && d\end{bmatrix} % 식 (6)$$

식 (5)는 다음과 같이 바뀔 것이다.

$$\text{식 (5)}\Rightarrow \begin{bmatrix}a-\lambda && b \\ c && d-\lambda\end{bmatrix}\vec{v} = 0 % 식 (7)$$

여기서 $\vec{v}$는 영벡터(zero vector)라면 고유벡터를 찾을 이유가 없는 trivial solution을 얻게 되는 것이므로,

trivial solution이 아닌 의미있는 solution을 얻기위해선 식 (7)의 좌변에 있는 행렬이 역행렬을 가지지 않아야 한다.

따라서 아래의 조건을 만족할 때 고유벡터 $\vec{v}$가 trivial solution이 아니게 된다고 할 수 있다.

$$det\left(\begin{bmatrix}a-\lambda && b \\ c && d-\lambda\end{bmatrix}\right) = 0 % 식 (8)$$

행렬식의 정의에 따라 이 식을 조금 더 풀어보면,

$$\Rightarrow (a-\lambda)(d-\lambda)-bc = 0  % 식 (9)$$

$$\Rightarrow \lambda ^2 - (a+d)\lambda + ad-bc = 0 % 식 (10)$$

와 같다. 이 방정식을 특성방정식이라고 부른다.

이 특성방정식의 해를 구하면 고윳값을 얻게 되는 것이다.

## Trace & Determinant

식 (10)에서 $a+d$를 $T$라고 치환하고 $ad-bc$를 $D$라고 치환하자.

$a+d$는 원래의 식 (6) 행렬 $A$의 대각합(trace)를 의미하고 $ad-bc$는 식 (6) 행렬 $A$의 행렬식(determinant)를 의미한다.

$a+d$를 $T$라고 치환하고 $ad-bc$를 $D$라고 치환한 뒤 식 (10)에 근의 공식을 적용하면 아래와 같이 특성방정식의 해(solution)인 고윳값을 계산할 수 있다.

$$\lambda_{1, 2} = \frac{T\pm\sqrt{T^2-4D}}{2} % 식 (11)$$

앞서 phase plane에 대해 복습할 때 고윳값을 어떻게 구별했던가?

두 고윳값이 모두 실수인 경우, 복소수인경우, 중근인 경우로 크게 구별했다.

따라서, 우리는 식 (11)의 제곱근 안에 있는 $T^2-4D$의 부호를 확인함으로써 두 고윳값이 실수인지, 복소수인지, 중근을 갖는지 확인할 수 있게 된다.

다시 말해,

* $T^2-4D > 0$ 이면 두 고윳값은 모두 실수이다.
* $T^2-4D < 0$ 이면 두 고윳값은 모두 복소수이다.
* $T^2-4D = 0$ 이면 중근 고윳값을 갖는다.

와 같이 정리할 수 있다.

## Trace-Determinant Plane

우리는 여기서 한발 더 나아가 trace와 determinant 값을 변수로 하는 평면을 생각해낼 수도 있다.

가령, $x$축이 trace 값, $y$축이 determinant 값을 나타내는 평면을 생각한다고 하면

$D=\frac{1}{4}T^2$이라는 곡선을 기준으로 고윳값의 실수, 복소수, 중근 여부를 판별할 수 있게 된다.
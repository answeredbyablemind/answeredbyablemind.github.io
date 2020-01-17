---
title: 가우스 적분
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200117
tags: 확률통계
---

가우스 적분은 다음과 같이 가우스 함수에 대한 실수 전체 범위에 대한 적분으로, 그 값은 다음과 같다.

$$\int_{-\infty}^{\infty}\exp\left(-x^2\right)dx=\sqrt \pi$$

# 가우스 적분 계산 과정

우선 아래와 같이 가우스 적분의 값을 $I$라고 두자.

$$I = \int_{-\infty}^{\infty}\exp\left(-x^2\right)dx$$

그러면 $I$를 제곱한 $I^2$은 다음과 같이 생각할 수 있다.

$$I^2 = \int_{-\infty}^{\infty}exp\left(-x^2\right)dx
    \int_{-\infty}^{\infty}exp\left(-y^2\right)dy$$

$$=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}exp\left(-x^2\right)exp\left(-y^2\right)dxdy$$

$$=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}exp\left(-(x^2+y^2\right))dxdy$$

여기서 아래와 같이 직교좌표계를 극좌표계로 변경해보자.

$$\begin{cases}
x = r\cos\theta \\
y = r\sin\theta
\end{cases}$$

## 직교좌표계 ⇒ 극좌표계: 적분 범위의 수정

적분범위는 다음과 같이 바뀌게 된다.

$$\begin{cases}
-\infty<x<\infty \\
-\infty<y<\infty
\end{cases} \Rightarrow 

\begin{cases}
0<r<\infty \\
0<\theta<2\pi
\end{cases}$$

식 (7)과 같이 적분 범위가 바뀌는 이유는 식 (7)의 왼쪽 $x, y$의 범위가 말하는 것은 실수 전체 범위이므로,

극좌표계에서 실수 전체 범위를 커버하기 위해선 반지름($r$)은 $0$부터 $\infty$까지 변하면서 각도는 $0$에서 $2\pi$까지 한 바퀴를 다 돌면서 커버하면 되기 때문이다.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-17-Gaussian_Integral/pic1.png"> <br>
  그림 1. 직교좌표계와 극좌표계의 비교
</p>

## 직교좌표계 ⇒ 극좌표계: 미소 면적의 수정

식 (5)에 있는 미소 면적($dxdy$)는 아래와 같이 바뀌게 된다.

$$ dxdy \Rightarrow r\space drd\theta$$

$dr$ 은 $r$방향으로 변하는 미소변위로 생각할 수 있고 $d\theta$는 각도가 약간 변한 것이다. 그래서 $rd\theta$는 호의 길이의 미소변위로 생각해줄 수 있게 되는 것이고, 결과적으로 이 둘을 곱하면 미소면적 $r\space dr d\theta$가 된다.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-17-Gaussian_Integral/pic2.png"> <br>
  그림 2. 극좌표계의 미소 면적
</p>

## 계속 적분을 수행해보자.

위의 두 과정을 생각하면 식(5)의 적분값은 다음과 같이 적어줄 수 있다.

$$식(5) = \int_{\theta = 0}^{2\pi}\int_{r=0}^{\infty}\exp\left(-r^2\right)rdrd\theta$$

위 식은 아래와 같이도 쓸 수 있다.

$$=\int_{\theta = 0}^{2\pi}d\theta\int_{r=0}^{\infty}\exp\left(-r^2\right)rdr$$

$$=2\pi\int_{r=0}^{\infty}\exp\left(-r^2\right)rdr$$

여기서 $u = -r^2$로 치환해주자.

그러면,

$$du = -2rdr$$

$$rdr = -\frac{1}{2}du$$

이므로, 식 (11)은 다음과 같이 바꿔 쓸 수 있다.

$$식(11) = 2\pi\int_{u=0}^{-\infty}-\frac{1}{2}\exp(u)du$$

$$=2\pi\cdot\left(-\frac{1}{2}\right)\cdot\left[\exp(u)\right]_{0}^{-\infty}$$

$$=2\pi\cdot\left(-\frac{1}{2}\right)\cdot(-1) = \pi$$


위 결과는 $I^2$과 같으며, $I$의 값은 항상 양수이므로,

$$I=\int_{-\infty}^{\infty}\exp\left(-x^2\right)dx=\sqrt \pi$$

임을 알 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/iLW-CgzA-NU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

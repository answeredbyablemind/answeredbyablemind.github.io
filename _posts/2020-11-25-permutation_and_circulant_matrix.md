---
title: 치환행렬과 순환행렬을 이용한 신호 표현
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201125
tags: 선형대수
---

# Prerequisites

본 포스트를 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [이산 시간 컨볼루션](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)

# 치환행렬을 이용한 신호의 분해

## cyclic permutation matrix 소개

치환행렬은 행의 순서를 바꿔주는 행렬이다.

다만, 우리가 이번 post에서 이용할 치환행렬은 cyclic permutation을 수행해주는 행렬이다. 

다시 말해, 어떤 벡터 $x$에 대해서,

$$\vec{x} = \begin{bmatrix}x_1\\x_2\\ \vdots \\ x_n\end{bmatrix}$$

cyclic permutation을 수행해준다는 것은 다음과 같은 연산이 수행된다는 것을 말한다. permutation 행렬을 $P$라고 할 때,

$$P\vec{x} = \begin{bmatrix}x_n\\x_1\\ x_2 \\ \vdots \\ x_{n-1}\end{bmatrix}$$

이러한 연산을 수행해주기 위해서는 다음과 같이 cyclic permutation 행렬이 정의되어야 한다.

$$P = \begin{bmatrix}
  0 & 0 & \cdots & 0 & 1 \\ 
  1 & 0 &\cdots & 0 & 0 \\
  0 & \ddots &\ddots & \vdots & \vdots \\
  \vdots & \ddots & \ddots & 0 & 0 \\
  0 & \cdots & 0 & 1 & 0
\end{bmatrix}$$

[//]:# (식 3)

즉, 대각성분 바로 아래의 성분들(준대각선)의 값이 1이고 행렬의 가장 우상단의 값이 1이 되어야 한다.

cyclic permutation 행렬의 재밌는 점은 $P$를 두 번 적용시켜주면 행이 두 번 shift 된다는 점이다.

다시 말해,

$$P\cdot P\vec{x} = P^2\vec{x} = \begin{bmatrix}x_{n-1}\\x_n\\ x_1 \\ \vdots \\ x_{n-2}\end{bmatrix}$$

이다.

거기다가, $P^2$을 직접 써보면 다음과 같을 것이다.

$$P^2 = \begin{bmatrix}
  0 & 0 & \cdots & 1 & 0 \\ 
  0 & 0 &\cdots & 0 & 1 \\
  1 & \ddots &\ddots & \vdots & \vdots \\
  \vdots & \ddots & \ddots & 0 & 0 \\
  0 & \cdots & 1 & 0 & 0
\end{bmatrix}$$

[//]:# (식 5)

행을 $n$ 번 shift 시켜주기 위해선 $P$ 행렬을 $n$ 번 곱해줄 수 있다.

## 신호(벡터)의 분해

신호(벡터)의 분해를 생각하기 위해 신호의 분해의 기초가 되는 discrete unit sample function을 생각해보자. discrete unit sample function의 기호는 $\delta$로 쓰도록 하자.

$$\delta =\begin{bmatrix}1\\0\\ \vdots \\ 0\end{bmatrix}$$

식 (1)과 같은 임의의 벡터 $x$는 discrete unit sample function $\delta$와 cyclic permutation matrix $P$를 이용해 다음과 같이 쓸 수 있다.

$$\begin{bmatrix}x_1\\x_2\\ \vdots \\ x_n\end{bmatrix}

= x_1 \begin{bmatrix}1\\0\\ \vdots \\ 0\end{bmatrix} + x_2 \begin{bmatrix}0\\1\\ \vdots \\ 0\end{bmatrix} + \cdots + x_n \begin{bmatrix}0\\0\\ \vdots \\ 1\end{bmatrix}$$

[//]:# (식 7)

$$ = x_1 \delta + x_2 P\delta + x_3P^2\delta+\cdots x_n P^{n-1}\delta$$

[//]:# (식 8)

여기서 $\delta = I\delta$라고도 쓸 수 있으므로,

$$식 (8) \Rightarrow = x_1 I \delta + x_2 P\delta + x_3P^2\delta+\cdots x_n P^{n-1}\delta$$

[//]:# (식 9)

$$ = \left(x_1 I + x_2 P + x_3P^2+\cdots x_n P^{n-1}\right)\delta$$

[//]:# (식 10)

이다.

여기서 $P$, $P^2$ 등의 행렬을 직접 써서 다시 식 (10)을 써보면,

$$\begin{bmatrix}x_1\\x_2\\ \vdots \\ x_n\end{bmatrix} =  \begin{bmatrix}
  x_1 & x_n & \cdots & x_3 & x_2 \\ 
  x_2 & x_1 &\cdots & x_4 & x_3 \\
  x_3 & \ddots &\ddots & \vdots & \vdots \\
  \vdots & \ddots & \ddots & x_1 & x_n \\
  x_n & \cdots & x_3 & x_2 & x_1
\end{bmatrix} \begin{bmatrix}1\\0\\ \vdots \\ 0\end{bmatrix}$$

[//]:# (식 11)

과 같이 쓸 수 있음을 알 수 있다.




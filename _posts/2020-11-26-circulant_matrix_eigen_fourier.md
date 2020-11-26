---
title: 순환행렬의 고유벡터, 그리고 푸리에 행렬
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201126
tags: 선형대수
---



# Prerequisites

본 포스트를 잘 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [선형대수와 푸리에 변환](https://angeloyeo.github.io/2020/11/08/linear_algebra_and_Fourier_transform.html)
* [순환행렬과 컨볼루션](https://angeloyeo.github.io/2020/11/25/permutation_and_circulant_matrix.html)

# 치환행렬의 고윳값, 고유벡터

순환행렬의 고윳값, 고유벡터는 치환행렬의 고윳값, 고유벡터와 밀접한 관련이 있다.

따라서, 우리는 치환행렬의 고윳값, 고유벡터를 먼저 계산해보도록 하자.

우리가 사용하는 치환행렬은 치환행렬은 [순환행렬과 컨볼루션](https://angeloyeo.github.io/2020/11/25/permutation_and_circulant_matrix.html) 편에서 보았던 것과 마찬가지로 아래와 같이 cyclic permutation을 수행해주는 행렬이다.

$$P = \begin{bmatrix}
  0 & 0 & \cdots & 0 & 1 \\ 
  1 & 0 &\cdots & 0 & 0 \\
  0 & \ddots &\ddots & \vdots & \vdots \\
  \vdots & \ddots & \ddots & 0 & 0 \\
  0 & \cdots & 0 & 1 & 0
\end{bmatrix}$$

일반적인 $n\times n$ 크기의 행렬 $P$에 대해서 고윳값을 구하는 것은 어려울 수 있기 때문에 $4\times 4$ 크기의 치환 행렬 $P_4$의 고윳값, 고유벡터를 계산해보자.

먼저 $P_4$의 고윳값을 계산하기 위해 특성방정식을 써보면 다음과 같을 것이다.

$$det(P_4-\lambda I) = 0$$

$$=det\left(\begin{bmatrix}0 & 0 & 0 & 1 \\ 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0\end{bmatrix}-\lambda I\right)$$

$$=det\left(\begin{bmatrix}-\lambda & 0 & 0 & 1 \\ 1 & -\lambda & 0 & 0 \\ 0 & 1 & -\lambda & 0 \\ 0 & 0 & 1 & -\lambda\end{bmatrix}\right)$$

# 순환행렬의 고유벡터

$$ C=  \begin{bmatrix}
  x_0 & x_{n-1} & \cdots & x_2 & x_1 \\ 
  x_1 & x_1 &\cdots & x_3 & x_2 \\
  x_2 & \ddots &\ddots & \vdots & \vdots \\
  \vdots & \ddots & \ddots & x_0 & x_{n-1} \\
  x_{n-1} & \cdots & x_2 & x_1 & x_0
\end{bmatrix} = \left(\sum_{i=0}^{n-1}x_i P^{i}\right)$$

순환 행렬의 고유벡터는 치환 행렬의 고유벡터와 같다.

$P$의 고윳값 $\lambda$와, 고유벡터 $v$는 다음의 식을 만족한다.

$$Pv=\lambda v$$

순환행렬 $C$의 고유벡터를 마찬가지로 $v$라고 하면 순환행렬의 고윳값 $\xi$에 대해 다음의 식을 만족해야 한다.

$$Cv=\xi v$$

순환행렬과 치환행렬의 관계에 따라 위 식은 다음과 같이 쓸 수 있다.

$$Cv = x_0 I v + x_1 P^1 v + \cdots + x_{n-1}P^{n-1}v$$

$$=x_0 \lambda^0 v + x_1 \lambda^1 v + \cdots + x_{n-1}\lambda^{n-1}v$$

$$=\left(\sum_{i=0}^{n-1}x_i\lambda^i\right)v = \xi v$$

즉, 순환행렬의 고유벡터와 치환행렬의 고유벡터는 같다.

## 기저의 변환에 기반한 푸리에 행렬의 이해

$$\vec{x} = \begin{bmatrix}x_0\\x_1\\ \vdots \\ x_{n-1}\end{bmatrix}$$

$$\begin{bmatrix}x_0\\x_1\\ \vdots \\ x_{n-1}\end{bmatrix}

= x_0 \begin{bmatrix}1\\0\\ \vdots \\ 0\end{bmatrix} + x_1 \begin{bmatrix}0\\1\\ \vdots \\ 0\end{bmatrix} + \cdots + x_{n-1} \begin{bmatrix}0\\0\\ \vdots \\ 1\end{bmatrix}$$

$$\vec{x} = C\delta=\left(\sum_{i=0}^{n-1}x_i P^{i}\right)\delta$$

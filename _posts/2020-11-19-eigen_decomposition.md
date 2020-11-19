---
title: 고윳값 분해(eigen-decomposition)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201119
tags: 선형대수
---

※ 시각화와 이해의 편의를 도모하기 위해 벡터와 행렬이 정의되는 체(field)는 실수(real number)로 한정함.

# Prerequisites

해당 post를 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)

# 배경 지식

## 행렬은 벡터들의 모음

$n$개의 $n$차원 벡터 $a_i\in \Bbb{R}^n \text{ for } i = 1, 2, \cdots, n$이 있다고 생각해보자.

그러면 우리는 이 $n$개의 벡터들을 모아 $n\times n$ 차원의 행렬을 구성할 수 있다.

$$A = \begin{bmatrix} | & | & \text{ } & | \\ a_1 & a_2 & \cdots & a_n \\ | & | & \text{ } & | \end{bmatrix}\in \Bbb{R}^{n\times n}$$

[//]:# (식 1)

## 행렬의 각 열의 상수를 인수분해 하는 방법

어떤 $n\times n$ 차원 행렬 $A$가 다음과 같이 구성되어 있다고 생각해보자.

$$A = \begin{bmatrix} 
   | &  | & \text{ } &  | \\ 
  \lambda_1 a_1 & \lambda_2 a_2 & \cdots & \lambda_n a_n \\ 
   | &  | & \text{ } &  | \end{bmatrix}\in \Bbb{R}^{n\times n}$$

[//]:# (식 2)

여기서 $\lambda_i \text{ for } i = 1, 2, \cdots, n$ 은 임의의 실수이다.

그렇다면 식 (2)의 행렬 $A$는 다음과 같이 인수분해 할 수 있다.

$$A = \begin{bmatrix} | & | & \text{ } & | \\ a_1 & a_2 & \cdots & a_n \\ | & | & \text{ } & | \end{bmatrix}
\begin{bmatrix}\lambda_1 & 0 & \cdots & 0 \\ 0 & \lambda_2 & 0 & 0 \\ \text{ } & \text{ } & \ddots & \text{ } \\ 0 & 0 & \cdots & \lambda_n\end{bmatrix}$$

[//]:# (식 3)

이것을 확인하기 위해 위 식에서 $A^T$를 생각해보면,

임의의 행렬 $X$, $Y$에 대해 $(XY)^T = Y^TX^T$ 이므로,

$$A^T = \begin{bmatrix}\lambda_1 & 0 & \cdots & 0 \\ 0 & \lambda_2 & 0 & 0 \\ \text{ } & \text{ } & \ddots & \text{ } \\ 0 & 0 & \cdots & \lambda_n\end{bmatrix} 
\begin{bmatrix} - &a_1 & - \\ - & a_2 & - \\ & \vdots & \\ - & a_n & -\end{bmatrix}=\begin{bmatrix} - &\lambda_1 a_1 & - \\ - & \lambda_2 a_2 & - \\ & \vdots & \\ - & \lambda_n a_n & -\end{bmatrix}$$

[//]:# (식 4)

임을 알 수 있다. 따라서, 식 (3)이 옳다는 것을 알 수 있다.

# 고윳값 분해

임의의 $n\times n$ 행렬 $A$에 대해,

$$Ax=\lambda x$$

여러개의 고윳값과 고유벡터를 얻었다고 해보자.



# 대칭 행렬의 고윳값 분해
---
title: 고윳값 분해(eigen-value decomposition)
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

$n$개의 $n$차원 벡터 $a_i\in \Bbb{R}^{n \times 1} \text{ for } i = 1, 2, \cdots, n$이 있다고 생각해보자.

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

임의의 $n\times n$ 행렬 $A$에 대해 여러개의 고윳값과 고유벡터를 얻었다고 해보자.

다시 말해, 아래의 식을 만족하는 고윳값과 고유벡터 $n$개 씩을 획득할 수 있다.

$$Av_i = \lambda_i v_i\text{ for } i = 1, 2, \cdots, n$$

[//]:# (식 5)

그러면 우리는 고유벡터들을 모아둔 행렬 $V\in\Bbb{R}^{n\times n}$를 아래와 같이 생각할 수 있다.

$$V = \begin{bmatrix} 
   | &  | & \text{ } &  | \\ 
   v_1 & v_2 & \cdots & v_n \\ 
   | &  | & \text{ } &  | \end{bmatrix}$$

[//]:# (식 6)

이 때, 행렬 $A$와 행렬 $V$의 관계를 식 (5)를 이용해 한꺼번에 표현하면 다음과 같다.

$$AV =  \begin{bmatrix} 
   | &  | & \text{ } &  | \\ 
  \lambda_1 v_1 & \lambda_2 v_2 & \cdots & \lambda_n v_n \\ 
   | &  | & \text{ } &  | \end{bmatrix}
$$

[//]:# (식 7)

또 고윳값들을 대각성분에 모아둔 행렬 $\Lambda \in \Bbb{R} ^{n \times n}$을 아래와 같이 생각해본다면,

$$\Lambda = \begin{bmatrix}\lambda_1 & 0 & \cdots & 0 \\ 0 & \lambda_2 & 0 & 0 \\ \text{ } & \text{ } & \ddots & \text{ } \\ 0 & 0 & \cdots & \lambda_n\end{bmatrix}$$

[//]:# (식 8)

식 (2)와 식 (3)에서 본 관계를 이용해 식 (7)을 아래와 같이 쓸 수 있다.

$$식 (7) \Rightarrow AV = V\Lambda$$

[//]:# (식 9)

만약 모든 고유벡터들이 선형독립이라면 식 (9)로부터 아래와 같이 행렬 $A$를 쓸 수 있다.

$$A = V\Lambda V^{-1}$$

[//]:# (식 10)

# 대칭 행렬의 고윳값 분해

대칭 행렬은 아래와 같은 성질을 만족하는 행렬이다.

$$A=A^T$$

만약, 행렬 $A$가 식 (10)에서와 같이 고윳값 분해할 수 있다면 아래의 내용이 성립한다.

$$A = V\Lambda V^{-1} = A^T = (V\Lambda V^{-1})^T = (V^{-1})^T\Lambda^TV^T$$

여기서, $\Lambda$는 대각행렬이므로 $\Lambda^T = \Lambda$이고, $(V^{-1})^T = (V^T)^{-1}$이므로 식 (12)는 다음과 같이 쓸 수도 있다.

$$V\Lambda V^{-1} = (V^T)^{-1}\Lambda V^T$$

따라서, 대칭 행렬의 고유벡터를 모아둔 행렬 $V$는 직교행렬이다. 다시 말해 다음이 성립한다.

$$V^T = V^{-1}$$

이고,

$$VV^T = V^TV = I$$

이다.

따라서, 대칭행렬은 아래와 같이 고윳값 분해할 수 있다.

$$A= V\Lambda V^T$$

일반적으로 대칭행렬의 고윳값을 모아둔 행렬은 $V$ 대신에 $Q$로 종종 쓴다.

즉, $A$가 대칭행렬인 경우

$$A = Q\Lambda Q^T$$

로 행렬을 분해할 수 있다.
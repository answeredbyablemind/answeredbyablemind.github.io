---
title: 그람-슈미트 과정(Gram-Schmidt process)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201123
tags: 선형대수
---

※ 시각화와 이해의 편의를 도모하기 위해 벡터와 행렬이 정의되는 체(field)는 실수(real number)로 한정함.

# Prerequisites

본 post를 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html)

# 배경 지식

## 직교 행렬

직교 행렬은 앞서 [고윳값 분해(EVD)](https://angeloyeo.github.io/2020/11/19/eigen_decomposition.html) 편에서 대각행렬의 고윳값 분해를 다룰 때 잠깐 언급된 적이 있었다.

직교 행렬은 다음과 같이 모든 열벡터의 크기는 1이면서 서로 다른 열벡터 간의 내적이 0인 행렬을 말한다.

다시 말해, 아래와 같은 행렬 $Q$에 대해서,

$$ Q = \begin{bmatrix}| & \text{ } & | \\ q_1 & \cdots & q_n \\ | & \text{ } & | \end{bmatrix}$$

[//]: (식 1)

다음이 성립하여야 한다.

$$Q^TQ = \begin{bmatrix}- & q_1^T & - \\ \text{ } & \vdots & \text{ } \\ - & q_n^T & -\end{bmatrix}\begin{bmatrix}| & \text{ } & | \\ q_1 & \cdots & q_n \\ | & \text{ } & | \end{bmatrix} 

= \begin{bmatrix}1 & \cdots & 0 \\ \vdots & \ddots & \vdots \\ 0 & \cdots & 1 \end{bmatrix}$$

[//]: (식 2)

조금 잘 생각해보면 $Q$의 모든 열의 크기는 1이기 때문에 $Q$의 모든 열들은 소로 "orthonormal" 함에도 불구하고,

orthonormal matrix라고 부르지는 않고 orthogonal matrix(직교 행렬)이라고 부른다.

또 여기서 만약 $Q$가 정방 행렬(square matrix)이면

$$Q^T = Q^{-1}$$

[//]: (식 3)

이다.

## projection 행렬

앞서 [선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html) 편에서는 $Ax=b$라는 식으로 표현된 선형연립방정식을 풀 때, 식의 개수가 변수의 개수보다 많은 경우(즉 $A$의 행의 개수가 열의 개수보다 많을 때) 해를 구하는 방법에 대해 알아보았다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic5.png">
<br>
그림 1. 행렬 $A$의 열공간과 그 공간에 속하지 않는 벡터 $b$, 그리고, 벡터 $b$를 열공간에 정사영하여 얻은 벡터 $p$
</p>

[선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html) 편에서는 그림 1의 $p$ 벡터 보다는 행렬 $A$와 벡터 $e$의 관계에 대해 관심을 가졌지만, 이번에는 벡터 $p$에 좀 더 관심을 가져보자.

행렬 $A$의 행의 개수가 열의 개수보다 많은 경우 우리는 최적의 해를 다음과 같이 찾을 수 있었다.

$$\hat{x} = (A^T A)^{-1}A^Tb$$

[//]: (식 4)

이 최적의 해 $\hat{x}$는 행렬 $A$의 열벡터들을 이용해 정사영 벡터 $p$를 계산할 수 있게 해주는 열벡터들의 조합비율이었다.

다시 말해,

$$\vec{p} = A\hat{x}$$

[//]: (식 5)

이며, 식 (4)를 식 (5)에 대입하면

$$\vec{p} = A\hat{x} = A(A^TA)^{-1}A^Tb$$

[//]: (식 6)

라고도 쓸 수 있게 된다.

다시 말해, 식 (6)에 따르면 벡터 $b$가 벡터 $p$로 변환된 것이며, 벡터 $b$ 앞에 곱해진 행렬의 역할은 벡터 $b$를 벡터 $p$로 선형변환 시켜준 것임을 알 수 있다. 이 때의 선형변환은 행렬 $A$의 열공간으로의 projection이다.

일반적으로, 임의의 벡터 $\vec{b}$를 $A$의 열공간으로 투영(projection)해주는 행렬은

$$proj_A = A(A^TA)^{-1}A^T = A\frac{A^T}{A^TA}$$

이다.

# Gram-Schmidt 과정

# QR 분해
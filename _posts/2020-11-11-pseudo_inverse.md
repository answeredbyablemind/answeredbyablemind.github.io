---
title: 의사역행렬의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201111
tags: 선형대수
---

※ 의사역행렬의 정확한 이름은 무어-펜로즈 유사역행렬인 것으로 보이나 일반적으로 많이 쓰는 이름인 의사역행렬(pseudo inverse)를 이용하도록 하겠습니다.

※ 의사역행렬은 복소수-체의 범위에서 정의가능하나 이번 post에서는 실수-체 범위에서 설명하도록 하겠습니다. (시각화 목적 및 계산의 헷갈림 방지)

※ 의사역행렬은 기본적으로 [선형회귀의 선형대수학적 접근](https://angeloyeo.github.io/2020/08/24/linear_regression.html#%EC%84%A0%ED%98%95%EB%8C%80%EC%88%98%ED%95%99%EC%9D%98-%EA%B4%80%EC%A0%90%EC%97%90%EC%84%9C-%EB%B3%B8-%ED%9A%8C%EA%B7%80%EB%B6%84%EC%84%9D)에서 본 내용과 완전히 같은 approach를 가지고 접근합니다.

# Prerequisites

해당 포스트를 이해하기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html): 특히, 쌍대공간의 개념
* [특이값 분해(SVD)](https://angeloyeo.github.io/2019/08/01/SVD.html)

# 의사역행렬의 정의

우선 가장 심플하게 의사역행렬의 정의부터 알아보도록 하자.

의사역행렬은 임의의 행렬 $A\in\Bbb{R}^{m\times n}$에 대해서 

1) $m \gt n$이고 모든 열벡터가 선형 독립인 경우

$$A^+ = (A^TA)^{-1}A^T$$

[//]:# (식 1)

이 때 $A^TA$는 가역행렬이어야 한다.

이 경우 $A^+A=I$가 성립하므로 $A^+$는 좌측 역행렬(left inverse)이라고 부른다.

2) $m \lt n$이고 모든 행벡터가 선형 독립인 경우

$$A^{+} = A^T(AA^T)^{-1}$$

[//]:# (식 2)

이 때 $AA^T$는 가역행렬이어야 한다.

이 경우 $AA^+=I$가 성립하므로 $A^+$는 우측 역행렬(right inverse)이라고 부른다.

위의 1)과 2)를 보았을 때 임의의 크기의 행렬 $A$에 대해 특정 조건만을 만족한다면 어떤 크기의 행렬이라도 [역행렬](https://angeloyeo.github.io/2019/08/06/determinant.html)의 기능과 유사한 기능을 하는 행렬을 구할 수 있다는 것을 알 수 있다.

보통 데이터를 분석할 때는 1)과 2) 중 1)의 경우에 더 많이 직면하게 된다. 그것은 1)의 상황이 데이터 수가 feature 수 보다 많은 상황을 나타내기 때문이다. 이번 포스트에서도 1)의 경우인 '좌측 역행렬'이 가지는 의미에 대해서 조금 더 깊게 탐구해보고자 한다.

# 의사역행렬의 수식적 의미

그렇다면, 의사역행렬이 가지는 근본적인 수식적 의미는 무엇일까?

가령, 다음과 같은 연립방정식이 주어졌다고 생각해보자.

$$Ax = b$$

[//]:# (식 3)

$$\Rightarrow 
  \begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 0 && 1\end{bmatrix}
  \begin{bmatrix}x_1 \\ x_2 \end{bmatrix}
  =
  \begin{bmatrix}0 \\ 1 \\ 3 \end{bmatrix}$$

[//]:# (식 4)

기본적으로 의사역행렬이 하고자 하는 일은 임의의 행렬 $A\in\Bbb{R}^{m\times n}\text{ where } m\gt n$에 대해 적절한 행렬 $A^{+}\in\Bbb{R}^{n\times m}\text{ where } m\gt n$을 얻음으로써 위의 주어진 문제를 해결하고자 하는 것이다.

식 (3)에서 $A^{+}\in\Bbb{R}^{n\times m}\text{ where } m\gt n$을 양변의 좌측에 곱해보자. 그러면,

$$식 (3) \Rightarrow A^+Ax=A^+b$$

이며, 우리가 알고있는 식 (1)의 left inverse의 공식을 이용해 $A^+$을 계산해보면,

$$A^+ = (A^TA)^{-1}A^T=\begin{bmatrix}-1 && 0.5 && 0.5 \\ 0 && 0.5 && 0.5\end{bmatrix}$$

이므로 식 (5)를 직접 계산해보면 아래와 같이 $x_1$과 $x_2$의 값을 계산할 수 있게 된다.

$$식(5)\Rightarrow \begin{bmatrix}-1 & 0.5 & 0.5 \\ 0 & 0.5 & 0.5\end{bmatrix}\begin{bmatrix}-1 & 1 \\ 0 & 1\\ 0 & 1\end{bmatrix}\begin{bmatrix}x_1 \\ x_2\end{bmatrix}=\begin{bmatrix}-1 & 0.5 & 0.5 \\ 0 & 0.5 & 0.5\end{bmatrix}\begin{bmatrix}0 \\ 1 \\ 3 \end{bmatrix}$$

$$\Rightarrow \begin{bmatrix}x_1 \\ x_2\end{bmatrix} = \begin{bmatrix}2\\2\end{bmatrix}$$


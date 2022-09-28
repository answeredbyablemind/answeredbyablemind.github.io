---
title: 마할라노비스 거리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220928
tags: 선형대수학 통계학
---

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2022-09-28-Mahalanobis_distance/" width="650" height = "520" frameborder="0"></iframe></p>

# Prerequisites

본 포스트를 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html)

# Euclidean distance

$n$ 차원 공간에서 두 벡터 

$$a = \begin{bmatrix}a_1 \\ a_2 \\ \vdots \\a_n \end{bmatrix},  b = \begin{bmatrix}b_1\\b_2\\ \vdots \\b_n \end{bmatrix}$$ 

간의 거리를 계산할 때 사용하는 공식은 보통 다음과 같다.

$$d_E(a,b) = \sqrt{(a_1-b_1)^2+(a_2-b_2)^2+\cdots+(a_n-b_n)^2}$$

$$=\sqrt{\sum_{i=1}^{n}(a_i-b_i)^2}$$

두 벡터 간의 거리는 다음과 같이 쓸 수도 있다.

$$\Rightarrow \sqrt{(\vec{a}-\vec{b})^T(\vec{a}-\vec{b})}$$

이와 같이 거리를 재는 방법을 유클리드 거리(Euclidean distance)라고 한다.

# Mahalanobis distance

아래와 같은 분포를 생각해보자.

[그림 1 넣을 자리]

여기서 임의의 점 $x$로부터 분포의 평균값 $\mu$ 까지의 유클리드 거리를 계산하려면 어떤 식을 사용해야 할까?

$$d_E = \sqrt{(x-\mu)^T(x-\mu)}$$

특정 분포와 이 분포를 설명하는 공분산 $\Sigma$에 대해 임의의 벡터 $x$로부터 분포의 평균값까지의 마할라노비스(Mahalanobis) 거리는 다음과 같이 정의한다.

$$d_M = \sqrt{(x-\mu)^T\Sigma^{-1}(x-\mu)}$$
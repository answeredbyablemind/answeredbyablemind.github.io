---
title: 4개의 주요 부분 공간의 관계
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201117
tags: 선형대수
---

맨 앞부분: The big picture of Linear Algebra 그림 넣을 것.

# 함수(function)의 가장 근본적인 정의

함수는 집합 간의 mapping.

함수의 정의

==> 집합 X, Y에 대해 각각을 정의역, 공역이라고 부르자.

또, graph $f$는 곱집합 $X\times Y$의 부분집합이며, 이를 $f$의 그래프라고 하자.

이 때, 임의의 $x\in X$에 대하여, $(x,y)\in\text{ graph } f$인 $y\in Y$가 유일하게 존재한다면, 이러한 $y$를 $f(x)$라고 쓴다.


함수가 하는 일은 정의역(domain) 에서 치역(range)으로의 사상.

그림으로 보면,

[//]:# (그림으로 그릴 것)

여기서 정의역과 치역, 공역은 각각 ~색, ~색, ~색으로 표시하였다.


즉, 선형변환을 함수로 생각할 수 있다고 하면 함수의 근본적인 의미인 정의역->치역의 사상(mapping)에 대해 생각해볼 수 있을 것이며, 선형변환의 정의역, 공역, 치역이 각각 어떤 것인지 생각해볼 수 있게 된다.

그것이 바로 네 개의 주요 부분공간이 의미하는 바이다.

# 부분공간(subspace)이란?

# null space의 시각화

null space는 치역 중 0으로 가는 solution들을 모두 모아둔 것.

행렬 $A$의 null space를 시각화 할 것.

가령,

$$A = \begin{bmatrix}2 && 1 \\ 1 && 2\end{bmatrix}$$

# $m\times n$ 행렬이 하는 일

$$f: \Bbb{R}^n \rightarrow \Bbb{R}^m$$

선형 변환의 정의역은 row space와 null space의 합집합이다.

선형 변환의 치역은 column space이다. 공역에서 치역을 뺀 것이 left nullspace이다.

즉, 공역은 column space + left null space이다.

Fundamental theorem of linear algebra가 말하는 것: 행렬이 함수라면 그 함수의 근본적 의미인 집합 간의 관계를 어떻게 정의할 것인가?

벡터 공간은 기본적으로 벡터들의 '집합'이다. 그리고, 그 집합에는 추가적으로 상수배와 덧셈 연산이 정의되어 있다.

즉, Fundamental theorem of linear algebra는 벡터 공간 간의 관계를 정의한다.

임의의 행렬 $A\in\Bbb{R}^{m\times n}$라는 함수가 보여주는 벡터 공간 상의 관계는 무엇인가?

# 참고 자료

* [What is the relationship between the null space and the column space?](https://math.stackexchange.com/questions/456025/what-is-the-relationship-between-the-null-space-and-the-column-space)
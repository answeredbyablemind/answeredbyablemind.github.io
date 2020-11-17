---
title: 4개의 주요 부분 공간의 관계
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201117
tags: 선형대수
---

※ 시각화와 이해의 편의를 도모하기 위해 벡터와 행렬이 정의되는 체(field)는 실수(real number)로 한정함.

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

정의 적어주고, 2차원 평면 상에서 1차원 직선으로 구성된 subspace 시각화 할 것.

부분 공간은 부분 집합의 개념을 그대로 가져온 것. 다만, 부분 공간도 벡터 공간이기 때문에 벡터 공간의 성질을 만족해야 함.

여기서 column space와 row space에 대한 내용 한번 더 언급할 것.

# null space의 시각화

null space도 부분공간이라는 점 강조할 것.

null space는 선형 변환 후의 값이 0이 되는 solution들을 모두 모아둔 것.

행렬 $A$의 null space를 시각화 할 것.


# Fundamental theorem of linear algebra

Fundamental theorem of linear algebra가 말하는 것: 행렬이 함수라면 그 함수의 근본적 의미인 집합 간의 관계를 어떻게 정의할 것인가?

벡터 공간은 기본적으로 벡터들의 '집합'이다. 그리고, 그 집합에는 추가적으로 상수배와 덧셈 연산이 정의되어 있다.

즉, Fundamental theorem of linear algebra는 벡터 공간 간의 관계를 정의한다.

임의의 행렬 $A\in\Bbb{R}^{m\times n}$라는 함수가 보여주는 벡터 공간 상의 관계는 무엇인가?

$$f: \Bbb{R}^n \rightarrow \Bbb{R}^m$$

이 post에서는 시각화를 통해 이해의 편의를 도모하고자 singular인 $2\times 2$ 행렬을 이용함.

우리가 이용하고자 하는 행렬 $A$는 다음과 같다.

$$A = \begin{bmatrix}2 && 1 \\ 4 && 2\end{bmatrix}$$

## 입력(정의역): row space + null space = $\Bbb{R}^n$

선형 변환의 정의역은 row space와 null space의 합집합이다.

$n$ 차원 실수 공간 상의 어떤 벡터라도 row space와 null space 상의 벡터들의 선형조합으로 표현할 수 있다.

## 출력(치역): 모든 것이 column space로

[행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html) 편에서 행렬과 벡터의 곱은 열벡터의 선형결합으로 ...

애니메이션 만들 것.

## 공역: m 차원 실수 공간

선형 변환의 치역은 column space이다. 공역에서 치역을 뺀 것이 left nullspace이다.

즉, 공역은 column space + left null space이다.

# 참고 자료

* [What is the relationship between the null space and the column space?](https://math.stackexchange.com/questions/456025/what-is-the-relationship-between-the-null-space-and-the-column-space)
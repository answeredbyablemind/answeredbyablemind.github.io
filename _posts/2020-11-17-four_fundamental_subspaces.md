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

<p align = "center">
  <img width = "600" src = "https://openlab.citytech.cuny.edu/gangulimat2580spring2013-/files/2013/05/foursubspaces.jpg">
  <br>
  Fundamental Matrix Subspaces / Introduction to Linear Algebra(Gilbert Strang, 1993)
</p>

# 행렬은 선형변환이다

선형대수학과 관련해서 지금까지 다루어 왔던 많은 논의들은 "[행렬은 선형변환이다](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)"라는 내용을 기반으로 하여 구성되었다.

잠깐 복습하자면, 행렬은 벡터를 변환시켜 다른 벡터를 출력해준다[^1].

<p align = "center">
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic1.png">
<br>
그림 1. 행렬은 벡터를 변환시켜주는 연산자이다.
</p>

조금 다른 말로 하자면, 행렬이라는 것은 벡터를 입력 받아 벡터를 출력해주는 함수임을 말하고 있다.

그렇다면, 우리가 여기서 질문해볼 수 있는 것은 정말 선형 변환이 함수라면 함수의 근본적인 정의를 만족할 수 있는 것일까? 라는 점이다.

다시 말해, 입력과 출력이 있다고 해서 다 함수라고 말할 수는 없는 것 처럼 우리가 말하는 **'선형 변환'이 함수라고 엄밀하게 부를 수 있는 것일까** 하는 점이다.

# 함수(function)의 가장 근본적인 정의

함수는 집합 간의 mapping으로 정의된다.

엄밀한 함수에 대한 정의를 알아보면 다음과 같다.

| DEFINITION 1. 함수|
| --------- |
| 집합 $X$, $Y$에 대해 각각을 정의역 공역이라고 부르자. 또, graph $f$는 곱집합 $X\times Y$의 부분집합이며, 이를 $f$의 그래프라고 하자.<br> 이 때, 임의의 $x\in X$에 대하여, $(x,y)\in\text{ graph } f$인 $y\in Y$가 유일하게 존재한다면, 이러한 $y$를 $f(x)$라고 쓴다.|

DEFINITION 1만 보면 조금 어렵게 들릴 수 있기 때문에 그림으로 표현하면 다음과 같다.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Codomain2.SVG/1280px-Codomain2.SVG.png">
  <br>
  그림 2. 함수는 정의역의 각 원소를 정확히 하나의 공역 원소에 대응시킨다.
  <br>
  여기서 함수 $f$의 정의역 $X$, 공역 $Y$, 치역 $f(X)$이다.
</p>

그림 2에서 함수 $f$의 정의역 $X$, 공역 $Y$, 치역 $f(X)$이며 각각 빨간색, 파란색, 노란색으로 표시하였다.

즉, 우리가 선형변환을 함수로 생각할 수 있다고 한다면, 엄밀하게는 함수의 근본적인 의미인 정의역->치역의 사상(mapping)에 대해 생각해볼 수 있어야 한다.

그렇다면 선형변환에서 말하는 정의역, 공역, 치역은 각각 어떤 것일까?

그것이 바로 네 개의 주요 부분공간(row space, null space, column space, left null space)이 의미하는 바이다.

# 부분공간(subspace)이란?

[벡터 공간](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#3-%EB%B2%A1%ED%84%B0%EB%9E%80-%EB%B2%A1%ED%84%B0-%EA%B3%B5%EA%B0%84%EC%9D%98-%EC%9B%90%EC%86%8C)은 기본적으로 벡터를 원소로 하는 집합(set)이다.

이 때, 벡터 공간에서는 단순히 원소만을 모아둔 것을 넘어 두 가지 연산(상수배와 덧셈)이 정의되어야 한다는 점이 단순 집합의 개념에서 조금 더 확장된 것이라는 점 또한 알아보았다.

부분 공간이라는 것은 부분 집합의 개념을 벡터 공간에 접목시킨 것으로 볼 수 있다.

즉, 집합에서 부분 집합이 있는 것 처럼 벡터 공간에서도 벡터 공간의 기본 구조를 그대로 유지하는 작은 벡터 공간, 즉 부분 공간이 있다.

가령, 2차원 실수 공간에서 부분 공간을 하나 생각해보자면 원점을 지나는 직선 상에 있는 모든 벡터들의 집합은 1차원 부분 공간을 이룬다.

<p align = "center">
  <img src = "http://www.ktword.co.kr/img_data/4775_1.jpg">
  <br>
  그림 3. 2차원 실수 공간 내의 1차원 부분공간
  <br>
  출처: [정보통신기술용어해설, Subspace, Vector Subspace](http://www.ktword.co.kr/abbr_view.php?m_temp1=4775&id=585&nav=2&m_search=S)
</p>

이런 관점에서 보았을 때, 우리에게 주어진 임의의 행렬 $A$의 모든 행 혹은 모든 열들의 선형결합으로 구성된(즉, span) 벡터공간은 부분 공간이며 각각을 행공간(row space), 열공간(column space)이라고 부른다.

예를 들어 행렬 A가 아래와 같이 주어져있다고 해보자.

$$A = \begin{bmatrix}2 && 1 \\ 4 && 2\end{bmatrix}$$

그러면, 행공간은 벡터 $\begin{bmatrix} 2 & 1 \end{bmatrix}$와 $\begin{bmatrix} 4 & 2 \end{bmatrix}$의 선형 결합으로 이루어진 선 상에 있는 모든 벡터들의 집합이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic4.png">
  <br>
  그림 4. 행렬 A의 행벡터들의 선형결합으로 구성되는 행공간
</p>

또, 열공간은 벡터 $\begin{bmatrix} 2 & 4 \end{bmatrix}^T$와 $\begin{bmatrix} 1 & 2 \end{bmatrix}^T$의 선형 결합으로 이루어진 선 상에 있는 모든 벡터들의 집합이다.



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
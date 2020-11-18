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
  <br>
  출처: <a href = "https://ko.wikipedia.org/wiki/%ED%95%A8%EC%88%98">위키피디아, 함수</a>
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
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic3.png">
  <br>
  그림 3. 2차원 실수 공간 내의 1차원 부분공간
</p>

## 행공간과 열공간

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

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic5.png">
  <br>
  그림 5. 행렬 A의 열벡터들의 선형결합으로 구성되는 열공간
</p>

## 영공간(null space)

행렬 A에서 즉각적으로 인지하긴 어렵지만 영공간(null space)라는 부분 공간도 존재한다.

영공간은 아래와 같은 조건을 만족하는 $\vec{x}$들의 집합이다.

$$A\vec{x} = 0$$

즉, $A$라는 선형 변환 후에 모두 0을 출력하게 만들어주는 입력 벡터 $x$들인 것이다.

그러면, 우선 $A$라는 선형변환이 어떻게 작동하는지 시각적으로 생각해보자.

$$A = \begin{bmatrix} 2 & 1 \\ 4 & 2 \end{bmatrix} $$

<p align="center">
  <iframe  src="https://angeloyeo.github.io/p5/2020-11-17-four_fundamental_subspaces/linear_transformation_of_A/" width="325" height = "260" frameborder="0"></iframe>
  <br>
  애니메이션 1. 행렬 A의 선형 변환  
</p>

위 애니메이션에서 눈여겨볼 점은 2차원 벡터 공간상에 있던 모든 점들(즉, 벡터들)이 열공간으로 이동한다는 점이다.

그림 5에서 보았던 열공간과 위 애니메이션에 있는 선형 변환 후의 결과를 비교해보자.

그렇다면, 여기서 선형 변환 후에 (0, 0)이라는 점으로 이동하는 벡터들을 모두 잡아낼 수 있을까?

거의 대부분의 점들이 열공간 상으로 이동하는데, 어떤 점들은 열공간 중 (0,0)이라는 점으로 이동할 것이다.

그 점들(즉, 벡터들)의 집합이 바로 영공간(null space)이다.

아래의 애니메이션에서는 영공간을 노란색 선으로 표시하였다.

<p align="center">
  <iframe  src="https://angeloyeo.github.io/p5/2020-11-17-four_fundamental_subspaces/visualizing_null_space_of_A/" width="325" height = "260" frameborder="0"></iframe>
  <br>
  애니메이션 2. 행렬 A의 선형변환과 영공간(노란색 선)의 선형변환
</p>

재밌는 점은 행공간과 영공간은 서로 직교하는 공간이라는 점이다.

바로 위 애니메이션에서 찾은 노란색 벡터 공간(즉, 원점을 통과하는 직선)과 행공간을 함께 도시해보면 서로 직교한다는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic6.png">
  <br>
  그림 6. 행렬 A의 행공간과 영공간은 서로 직교한다
</p>

# Fundamental theorem of linear algebra

<p align = "center">
  <b>
  ※ Fundamental theorem of linear algebra가 말하는 것:
  <br> 행렬이 함수라면 그 함수의 근본적 의미인 집합 간의 관계를 어떻게 정의할 것인가? ※
  </b>
</p>

Fundamental Theorem of Linear Algebra는 이 포스트에서 지금까지 설명한 주요 부분 공간들의 관계를 정립하는 것이며,

이 관계를 함수의 관점에서 어떻게 볼 것인가를 설명하고 있는 것이다.

조금 더 자세하게는 정의역과 공역 집합을 벡터 공간으로 봤을 때, $m\times n$ 차원의 행렬이라면 $n$차원 벡터 공간이 정의역이 되고 $m$차원 벡터 공간이 공역이 되는 것이다.

즉, 만약에 $A\in \Bbb{R}^{m\times n}$이라면 이 행렬은 다음과 같은 함수이다.

$$f: \Bbb{R}^n \rightarrow \Bbb{R}^m$$

## 입력(정의역): row space + null space = $\Bbb{R}^n$

선형 변환의 정의역은 row space와 null space의 합집합이다.

$n$ 차원 실수 공간 상의 어떤 벡터라도 row space와 null space 상의 벡터들의 선형조합으로 표현할 수 있다.

무슨 말일까? 가령 $2\times 2$ 차원의 행렬, 우리가 지금까지 다뤄왔던 행렬 $A=[2, 1;4, 2]$에 대해 생각해보자면,

가령 (2,3)이라는 벡터는 행공간 위의 점(벡터)도 아니고, 영공간 위의 점(벡터)도 아니다.

다만, 행공간과 영공간이 서로 직교한다는 사실을 이용해 (2,3)이라는 벡터를 행공간과 영공간의 기저들의 선형결합으로서 표현할 수 있게 되는 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic7.png">
  <br>
  그림 7. 정의역에 포함되는 벡터는 행공간과 영공간을 모두 이용하면 표현할 수 있다.
</p>

## 출력(치역): 모든 것이 column space로

애니메이션 2에서 보았던 것 처럼 모든 정의역에 있는 벡터들은 열공간위의 점으로 변환되게 된다.

그 이유는 [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html) 편에서 보았던 것 처럼 행렬과 벡터의 곱은 열벡터의 선형결합으로 표현될 수 있기 때문이다.

또 다른 해석은 정의역의 벡터들은 모두 행공간의 기저와 영공간의 기저의 선형결합으로 구성되는데, 영공간의 기저로 표현되었던 벡터의 원소들은 모두 선형 변환 후 그 크기가 0으로 줄어들기 때문에 선형 변환 후에 모든 벡터들이 열공간 위에 위치하게 되는 것이다.

## 공역: m 차원 실수 공간

선형 변환의 치역은 column space이다. 공역에서 치역을 뺀 것이 left nullspace이다.

선형변환이라는 함수에서 공역은 column space + left null space이며, column space와 left nullspace는 서로 직교한다.

left nullspace는 선형 변환 과정에서 시각화 할 수는 없지만 열공간과 서로 직교하므로 다음과 같이 표현할 수는 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-17-four_fundamental_subspaces/pic8.png">
  <br>
  그림 8. 공역은 column space와 left nullspace로 구성되어 있으며 두 부분 공간은 서로 직교한다.
</p>

# 참고 자료

* [Introduction to Linear Algebra, Gilbert Strang](https://math.mit.edu/~gs/linearalgebra/)

---
title: 선형회귀
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200824
tags: 선형대수 머신러닝
---


<center>
  <iframe width = "660" height = "350" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-24-linear_regression/"></iframe>
  <br>
  Gradient descent로 풀어내는 Linear Regression.
  <br>
  Linear Regression이 말하는 것: 수많은 점들을 최대한 잘 설명할 수 있는 trend line을 그으려면 어떻게 해야할까?
</center>


# Linear regression의 문제의식

# 선형대수학의 관점에서 본 회귀분석

※ 최적화 문제 관련 내용으로 궁금한 사람은 $\lt$선형대수학의 관점에서 본 회귀분석 $\gt$ 파트를 건너뛰어도 무관함.

## 선형연립방정식을 이용한 solution 찾기

중학교 시절 연립방정식에 대해 배운 적 있을 것이다.

연립방정식은 2개 이상의 미지수를 포함하는 방정식의 조를 말하는데, 보통 중, 고등학교 과정에서는 이원 일차 연립방정식을 푸는 경우가 많았던 것 같다.

보통의 연립 방정식의 꼴은 아래와 같이 쓸 수 있겠다.

$$
  \begin{cases}
    ax + by = p \\
    cx + dy = q
  \end{cases}
$$

우리는 이번에 미지수의 개수보다 데이터가 훨씬 많은 경우에 대해 적절한 solution을 찾는 과정을 통해 linear regression에 대해 생각해보고자 한다.

가령, 다음과 같이 세 개의 데이터 포인트가 주어져 있다고 하자.

$$(-1, 0),\text{ }(0, 1),\text{ }(0, 3)$$

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic1.png">
  <br>
  그림 1. 주어진 세 개의 데이터 포인트
</p>

만약 이 세 점에 대해 $f(x) = mx+b$와 같은 모델을 통해 이 세 개의 데이터 포인트를 얻었다고 가정하면 아래와 같이 세 개의 방정식으로 구성된 연립방정식을 세울 수 있다.

$$f(-1) = -m + b = 0$$

$$f(0) = 0 + b = 1$$

$$f(0) = 0 + b = 3$$

이것을 행렬과 벡터를 이용해 표시하면 다음과 같다.

$$(Ax = b) \Rightarrow\begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 0 && 1\end{bmatrix}\begin{bmatrix}m \\ b\end{bmatrix} = \begin{bmatrix}0\\1 \\ 3 \end{bmatrix}$$

이 행렬을 푸는 문제를 기하학적인 관점에서 생각해보면 그림 1과 같이 세 개의 데이터 포인트가 주어졌을 때 이 데이터 포인트들을 모두 통과하는 직선을 구하는 문제와 같다. 

2차원 평면 상에 어떻게 선을 놓더라도 이 세 점을 동시에 통과하는 직선을 구할 수는 없다.

다시 말해, 이 문제는 풀릴 수 없다. 해가 존재하지 않기 때문이다.

## 선형대수학적으로 연립방정식을 보는 관점

선형대수학의 관점에서 연립방정식을 푼다는 것은 아래와 같은 행렬을 푸는 것과도 같이 생각할 수 있는데,

$$A\vec{x} = \vec{b}$$

여기서 벡터와 행렬을 모두 열벡터로 표현하고, $\vec{x}$의 두 요소를 나눠 쓰면 아래와 같다.

$$\Rightarrow \begin{bmatrix} | & | \\ \vec{a}_1 & \vec{a}_2 \\ | & | \end{bmatrix}\begin{bmatrix}x_1 \\ x_2\end{bmatrix} = \begin{bmatrix}\text{ } | \text{ } \\ \text{ } \vec{b} \text{ }\\\text{ } | \text{ }\end{bmatrix}$$

그러면, 위 식은 아래와 같이 생각할 수 있다.

$$\Rightarrow x_1\begin{bmatrix} | \\ \vec{a}_1 \\ | \end{bmatrix} + x_2\begin{bmatrix} | \\ \vec{a}_2 \\ | \end{bmatrix} = \begin{bmatrix}\text{ } | \text{ } \\ \text{ } \vec{b} \text{ }\\\text{ } | \text{ }\end{bmatrix}$$

즉, 열벡터 $\vec{a}_1$와 $\vec{a}_2$를 어떻게 조합하면 $\vec{b}$를 얻어낼 것인가?라는 물음에 적절한 조합 비율인 $x_1$과 $x_2$를 답변해주는 것과 같은 이야기인 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic3.png">
  <br>
  그림 3. A의 열(column)을 이루는 열벡터($\vec{a}_1$, $\vec{a}_2$)의 span인 A의 열공간 $col(A)$에 포함되어 있는 $\vec{b}$를 구하려면 $\vec{a}_1$와 $\vec{a}_2$를 얼마만큼 조합해주어야 할까?
</p>

## 최적의 해를 찾기

꿩대신 닭이라고 했던가. 정답을 못찾으면 최대한 정답에 가까운 것이라도 찾아야 한다.

해가 행렬 A의 column space안에 존재하지 않는 경우 column space안에 있는 정답에 가장 가까운 해를 찾는 과정이라고 할 수 있다.

위 문제에선 $[-1, 0, 0]^T$와 $[1, 1, 1]^T$의 두 벡터를 어떻게 선형 조합 하더라도 $[0, 1, 3]^T$를 표현할 수 없다고 생각할 수 있다.


<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic2.mp4">
  </video>
  <br>
  그림 2. $[-1, 0, 0]^T$ (파란색)와 $[1, 1, 1]^T$ (주황색) 두 벡터의 span으로 표현되는 column space(평면)과<br>이 column space에 포함되지 않는 벡터 $[0, 1, 3]^T$ (보라색)
</p>


<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic4.png">
  <br>
  그림 4. A의 열(column)을 이루는 열벡터($\vec{a}_1$, $\vec{a}_2$)의 span인 A의 열공간 $col(A)$와 열공간에 포함되지 않는 $\vec{b}$
</p>

# 최적화 문제 관점에서 본 회귀분석

※ 선형대수학 관련 내용으로 궁금한 사람은 $\lt$최적화 문제 관점에서 본 회귀분석$\gt$ 파트를 건너뛰어도 무관함.

## Gradient Descent를 이용한 최소 비용함수 계산

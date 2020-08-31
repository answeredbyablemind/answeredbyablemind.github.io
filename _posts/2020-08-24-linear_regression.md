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
  <iframe width = "660" height = "400" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-24-linear_regression/"></iframe>
  <br>
  Gradient descent로 풀어내는 Linear Regression.
  <br>
  Linear Regression이 말하는 것: 수많은 점들을 최대한 잘 설명할 수 있는 trend line을 그으려면 어떻게 해야할까?
</center>


# Linear regression의 문제의식

# 선형대수학의 관점에서 본 회귀분석

※ 최적화 문제 관련 내용으로 궁금한 사람은 $\lt$선형대수학의 관점에서 본 회귀분석 $\gt$ 파트를 건너뛰어도 무관함.

선형연립방정식에 대해서 이야기 할 것.

주어진 데이터에 대해 선형 연립방정식을 만들 수 있다.

가령, 다음과 같이 네 개의 데이터 포인트가 주어져 있다고 하자.

$$(-1, 0), (0, 1), (1, 2), (2, 1)$$

--- x, y 평면에서 데이터 포인트들의 좌표를 표시한 그림 넣을 곳---

만약 이 네 점에 대해 $f(x) = mx+b$와 같은 system을 통해 이 네 개의 데이터 포인트를 얻었다고 가정하면  아래와 같이 네 개의 방정식으로 구성된 연립방정식을 세울 수 있다.

$$f(-1) = -m + b = 0$$

$$f(0) = 0 + b = 1$$

$$f(1) = m + b = 2$$

$$f(2) = 2m + b = 1$$

이것을 행렬과 벡터를 이용해 표시하면 다음과 같다.

$$\begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 1 && 1 \\ 2 && 1\end{bmatrix}\begin{bmatrix}m \\ b\end{bmatrix} = \begin{bmatrix}0\\1 \\ 2\\1 \end{bmatrix}$$

이 행렬을 푸는 문제를 기하학적인 관점에서 생각해보면 그림 X와 같이 네 개의 데이터 포인트가 주어졌을 때 이 데이터 포인트들을 모두 통과하는 직선을 구하는 문제와 같다. 

다시 말해, 이 문제는 풀릴 수 없다. 해가 존재하지 않기 때문이다.



# 최적화 문제 관점에서 본 회귀분석

※ 선형대수학 관련 내용으로 궁금한 사람은 $\lt$최적화 문제 관점에서 본 회귀분석$\gt$ 파트를 건너뛰어도 무관함.

## Gradient Descent를 이용한 최소 비용함수 계산

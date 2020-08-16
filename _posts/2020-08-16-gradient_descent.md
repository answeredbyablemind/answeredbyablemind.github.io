---
title: 경사하강법(gradient descent)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200816
tags: 미적분학 머신러닝 선형대수
---

<center>
  <iframe width = "350" height = "350" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-16-gradient_descent/"></iframe>
  <br>
  Gradient Descent 방법은 1차 미분계수를 이용해 함수의 최소값을 찾아가는 iterative한 방법이다.
  <br>
  Step size를 조정해가며 최소값을 찾아가는 과정을 관찰해보자.
</center>

# gradient descent의 정의

## gradient descent 방법의 직관적 의미

gradient descent 방법은 steepest descent 방법이라고도 불리는데, 함수 값이 낮아지는 방향으로 독립 변수 값을 변형시켜가면서 최종적으로는 최소 함수 값을 갖도록 하는 독립 변수 값을 찾는 방법이다.

steepest descent 방법은 다음과 같이 많이 비유되기도 한다.

> 앞이 보이지 않는 안개가 낀 산을 내려올 때는 모든 방향으로 산을 더듬어가며 산의 높이가 가장 낮아지는 방향으로 한 발씩 내딛어갈 수 있다.

## gradient descent

최적화하고자 하는 함수 $f(x)$에 대해 다음과 같이 

$$x_{i+1} = x_i - \alpha \frac{df}{dx}(x_i)$$

이를 다변수함수에 대해 확장하면 다음과 같이 쓸 수 있다.

$$x_{i+1} = x_i - \alpha \nabla f(x_i)$$

# step size

## 적절한 크기의 step size

# gradient descent 수식 유도

# local minima 문제

# Gradient Method implementation

## MATLAB

## Python
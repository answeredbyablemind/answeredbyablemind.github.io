---
title: 경계값 문제
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210528
tags: 미분방정식
---

# Prerequisites

경계값 문제에 대한 포스팅을 잘 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html)
* [미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [2계 선형미분방정식의 해법](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html)
  
# Motivation

로켓을 발사한다고 생각해보자.

Boundary Value Problem은 Boundary Condition에 따라 Solution에 미치는 영향이 큼.

# 초기값 문제와 경계값 문제의 비교

$$\frac{dy}{dt}=\frac{d^2x}{dt^2} = 4\frac{dx}{dt}-3x(t) % 식 (15)$$

$$\Rightarrow \begin{bmatrix}dx/dt \\ dy/dt\end{bmatrix} = \begin{bmatrix}0 & 1 \\ -3 & 4\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix} % 식 (17)$$

$$\text{1) 초기 조건: }x(0) = 2,\quad x'(0) = 2$$

$$\text{2) 경계 조건: }x(1) = 2,\quad x(3) = 7$$




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

# 경계값 문제란?

# 

## 초기값 문제와 경계값 문제의 비교

$$\frac{d^2x}{dt^2}-4\frac{dx}{dt}+3x(t) = 0$$

$$\Rightarrow \begin{bmatrix}dx/dt \\ dy/dt\end{bmatrix} = \begin{bmatrix}0 & 1 \\ -3 & 4\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix}$$

$$\text{1) 초기 조건: }x(0) = 2,\quad x'(0) = 2$$

$$\text{2) 경계 조건: }x(1) = 2,\quad x(3) = 7$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic1.png">
  <br>
  그림 1. 초기값 문제와 경계값 문제의 비교
</p>

초기값 문제보다 경계값 문제가 더 어렵게 보인다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic2.png">
  <br>
  그림 2. 주어진 경계값 문제에 대한 solution curve
</p>

## 경계값 문제의 해 유도(analytic solution)


$$\begin{bmatrix}x(t) \\ y(t) \end{bmatrix} = c_1\begin{bmatrix}1 \\ 1\end{bmatrix}e^t + c_2 \begin{bmatrix}1 \\3 \end{bmatrix}e^{3t}$$


$$\text{at }t=1\text{, }x(1)=c_1e^3 + c_2 e=2$$

$$\text{at }t=3\text{, }x(3)=c_1e^{3\cdot 3} + c_2 e^3=7$$

$$\begin{bmatrix}e^3 & e\\ e^9 & e^3\end{bmatrix}\begin{bmatrix}c_1 \\ c_2\end{bmatrix} = \begin{bmatrix}2 \\7\end{bmatrix}$$

$$\Rightarrow c_1 = -0.0010\text{, } c_2 = 0.7430$$


$$\begin{cases}x(t) = -0.001e^{3t}+0.7430e^{t} \\ y(t) = -0.003e^{3t}+0.7430e^{t}\end{cases}$$

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic3.png">
  <br>
  그림 3. 주어진 경계값 문제에 대한 solution curve
</p>




# 경계값 문제 해의 유일성

경계값 문제는 유일해를 꼭 보장한다고 보긴 어렵다. 유일해에 대한 일반화된 이론이 없다. 개별 케이스들에 대한 문제는 많이 연구되고 있다.

유일해가 보장되는 경계값 문제를 well-posed BVP라고 하고 그렇지 않은 경우를 ill-posed BVP라고 부른다 (Hadamard).




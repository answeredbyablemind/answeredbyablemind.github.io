---
title: 선형 연산자와 함수 공간
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210531
tags: 미분방정식
---

# 미분방정식을 보는 또 다른 관점

지금까지 미분방정식을 해석하는 여러가지 관점에 대해 알아보았다.

[미분방정식을 이용한 현상 모델링](https://angeloyeo.github.io/2021/05/01/modeling_with_differential_equation.html)편에서는 미분계수가 포함된 방정식을 미분방정식이라고 보았다.

또, [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html) 편에서는 좌표 $(x,y)$에 매핑된 기울기로 미분방정식을 기하학적으로 해석했으며,

[미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서는 미분방정식이란 연속성장의 관점에서 시시각각 변화율이 바뀌는 시스템의 관점에서 미분방정식을 해석하였다.

위의 세 가지 해석은 미분방정식을 수치적으로나 해석적(analytic)으로나 매우 유용한 관점이었으며, 1계 미분방정식 뿐만 아니라 그 이상의 degree의 미분방정식의 해 특성을 파악하는데에도 중요한 역할을 하는 주춧돌이었다.

---

지금부터는 미분방정식을 보는 또 다른 관점으로 바라보고자 한다. 여기서는 선형대수학에서 사용되던 벡터, 행렬의 개념을 함수에 도입할 것이다.

이제부터는 함수를 일종의 벡터로 취급할 수 있다는 것을 알 수 있게 되며, 선형대수학에서 행렬에 해당하는 연산이 '선형 연산자(linear operator)'라는 이름으로 개념이 확장된다.

또, 벡터들의 집합인 벡터 공간을 함수들의 집합인 함수 공간으로 개념을 확장시켜 사용할 것이다.

이런 논리가 아주 자세하게 학문으로 정립된 것이 '함수해석학'인데 이번 글에서는 기본적인 내용만 간단히 짚고 넘어가고자 한다.

# functions as vectors

## 함수의 내적

## 행렬과 벡터의 곱 -> 연산자와 함수의 관계

# Ax=b in the world of functions

$$Lu=f$$

## Solvability

Fredholm's alternative theorem 정리하기.

left nullspace와 column space가 직교하는 것이 solvability condition


# 함수에 적용되는 행렬? 선형 연산자

가장 기본적인 선형 연산자: 미분, 적분

선형 연산자들의 선형 결합 또한 선형 연산자이다.

선형 연산자는 항상 boundary condition과 함께 정의되어야 한다.

## transpose of matrices --> adjoint of operators

$$Lu = \frac{d}{dx}u$$

$$L^{\dagger}v=-\frac{d}{dx}v$$

$$Lu = a(x)\frac{d^2u}{dx^2}+b(x)\frac{du}{dx}+c(x)u$$

formal adjoint $L^{\dagger}v$는

$$L^{\dagger}v=(av)_{xx}-(bv)_x+cv$$

## eigenvalue and eigenfunctions

## eigenfunction expansion
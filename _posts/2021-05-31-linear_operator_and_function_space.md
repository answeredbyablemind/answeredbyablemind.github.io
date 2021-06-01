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

# Prerequisites

이번 포스팅을 이해하기 위해선 아래의 내용에 대해 자세히 알고 오시는 것을 추천드립니다.

* [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)

# functions as vectors

이전 포스팅 중 선형대수학의 기초 부분인 [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)에서는 세 가지 관점으로 벡터를 생각했다.

그 중 가장 수학적인 벡터의 정의로써 벡터랑 벡터 공간의 원소라는 정의를 내세운 바 있다.

또, 이 정의가 중요한 이유는 '이런 방식으로 벡터를 정의하는 것은 이러한 특성을 가진 것들은 모두 벡터로 취급해서 다룰 수 있다는 점을 강조한다'라고 말했다.

다시 말해, 벡터의 특성을 가지는 개념을 발견한다면, 선형대수학에서 적용해볼 수 있었던 테크닉들과 개념들을 확장해 적용해볼 수 있게 되는 것이다.

조금 더 구체적으로 말하자면 어떤 수학적 object(가령, 벡터, 행렬, 함수, 등등...)가 벡터이기 위해선 다음의 두 가지 연산에 대해 닫혀있어야 한다.

* 벡터의 상수배
* 벡터의 합

너무 단순한가?

마치 쿠팡에서 로켓와우 멤버십 가입비 2900원만내면 쿠팡에서 제공하는 모든 로켓배송 서비스를 누릴 수 있는 것 처럼, 어떤 수학적 object가 위의 두 개의 법칙만 잘 만족하는 것이라고 확인된다면 '벡터'라는 멤버십을 받게 되는 것이다.

그리고 이에 따라 선형대수학에서 열심히 일궈놓은 개념들과 테크닉들을 적용받을 수 있게 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic1.png">
  <br>
  그림 1. 쿠팡에서 로켓와우 멤버십에 가입해 누릴 수 있는 혜택들 (출처: 쿠팡)
</p>

엄밀한 증명은 아니지만 간단하게만 생각해봐도 함수는 벡터로 볼 수 있는 자격을 갖췄다.

아래는 함수의 상수배와 함수끼리의 합을 표현한 것이다. 

$$(c\cdot f)(x) = c\cdot f(x)$$

$$(f+g)(x) = f(x)+g(x)$$

다시 말해 어떤 함수 $f(x)$에 임의의 상수 $c$를 곱하더라도 여전히 $cf(x)$는 함수이고,

어떤 함수 $f(x)$와 $g(x)$를 더하더라도 $f(x)+g(x)$ 역시 함수다.

<p align = "center">
  <img src = "https://upload.wikimedia.org/wikipedia/commons/d/d7/Example_for_addition_of_functions.svg">
  <br>
  그림 2. 두 함수의 합
  <br>
  <a href = "https://en.wikipedia.org/wiki/Function_space"> 그림 출처: Fucntion space, Wikipeda </a>
</p>

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
---
title: 오일러-코시 미분방정식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210607
tags: 미분방정식
---

# Prerequisites 

이 포스팅의 내용에 대해 잘 알기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html)

# 오일러-코시 미분방정식 소개

$n$계 오일러 코시 미분방정식은 아래와 같은 형태를 띄는 미분방정식을 말한다.

$$a_nx^ny^{(n)}(x)+a_{n-1}x^{n-1}y^{(n-1)}(x)+\cdots+a_0y(x)=f(x)$$

2계 오일러-코시 미분방정식은 다음과 같을 것이다.

$$a_2x^2y''+a_1xy'+a_0y=f(x)$$

2계 오일러-코시 미분방정식을 보면 이 미분방정식은 선형 미분방정식이지만 미분계수 앞에 붙은 값들이 상수가 아니기 때문에 일반적으로 사용하는 2계 선형미분방정식의 해법을 바로 적용하기는 어려운 면이 있다.

## 연산자의 선형성 확인

오일러 코시 미분방정식이 선형 미분방정식인 것을 확인해보기 위해선 아래의 절차를 거치면 된다.

오일러 코시 미분방정식의 미분연산자는

$$L=a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0$$

이므로,

$$L(c_1y_1 + c_2y_2)=c_1L(y_1)+c_2L(y_2)$$

임을 확인해보자.

$$L(c_1y_1+c_2y_2)=\left(a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0\right)(c_1y_1+c_2y_2)$$

$$=c_1\left(a_2x^2\frac{d^2y_1}{dx^2}+a_1x\frac{dy_1}{dx}+a_0y_1\right)+c_2\left(a_2x^2\frac{d^2y_2}{dx^2}+a_1x\frac{dy_2}{dx}+a_0y_2\right)$$

$$=c_1L(y_1)+c_2L(y_2)$$

따라서 오일러-코시 미분방정식은 선형미분방정식이다.

## 해를 구하는 방법

오일러-코시 미분방정식을 풀 때 가장 문제가 되는 것은 식 $x^n$ 항이다.

이 항을 없애버리기 위해 다음과 같이 치환해서 문제를 풀어보자.

$$t=\ln(x)$$

$$y(x)=\phi(\ln(x))=\phi(t)$$

그러면 미분계수는 다음과 같이 치환 가능하다.

$$\frac{dy}{dx}=\frac{d\phi}{dx}=\frac{d\phi}{dt}\cdot\frac{dt}{dx}=\frac{d\phi}{dt}\cdot\frac{1}{x}$$

$$\frac{d^2y}{dx^2}=\frac{d}{dx}\left(\frac{d\phi}{dt}\cdot\frac{1}{x}\right)$$

$$=\frac{d}{dx}\frac{d\phi}{dt}\frac{1}{x}+\frac{d\phi}{dt}\cdot\frac{d}{dx}\left(\frac{1}{x}\right)$$

$$=\frac{d}{dt}\frac{d\phi}{dx}\frac{1}{x}+\frac{d\phi}{dt}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d}{dt}\left(\frac{d\phi}{dt}\frac{1}{x}\right)\frac{1}{x}+\frac{d\phi}{dt}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d^2\phi}{dt^2}\cdot\frac{1}{x^2}-\frac{d\phi}{dt}\frac{1}{x^2}$$

$$=\frac{1}{x^2}\left(\frac{d^2\phi}{dt^2}-\frac{d\phi}{dt}\right)$$

따라서, 원래의 식 (2)는 다음과 같이 바뀐다.

$$식(2)\Rightarrow a_2x^2\frac{1}{x^2}\left(\frac{d^2\phi}{dt^2}-\frac{d\phi}{dt}\right)+a_1x\frac{1}{x}\frac{d\phi}{dt}+a_0\phi(t)=f(e^t)$$

$$= a_2\left(\frac{d^2\phi}{dt^2}-\frac{d\phi}{dt}\right)+a_1\frac{d\phi}{dt}+a_0\phi(t)=f(e^t)$$

$$=a_2\frac{d^2\phi}{dt^2}+(a_1-a_2)\frac{d\phi}{dt}+a_0\phi(t)=f(e^t)$$
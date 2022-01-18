---
title: 푸리에 급수(Fourier Series)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019062341
tags: 푸리에 신호처리
---

<p align="center"><iframe width = "700" height = "450" frameborder = "0" src="https://angeloyeo.github.io/p5/Fourier_Series_Practice/"></iframe><br>푸리에 급수가 말하는 것: 임의의 주기함수는 <b>삼각함수의 합</b>으로 표현될 수 있다.</p>

# Prerequisites

이번 포스팅을 더 잘 이해하기 위해서는 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [신호 공간(signal space)](https://angeloyeo.github.io/2022/01/12/signal_space.html)

# Orthogonal Functions

Fourier Analysis의 Formulae를 공부할 때, 가장 쉽게 간과하는 부분이 바로 푸리에 급수의 공식 유도 방법이다. 푸리에 급수의 공식은 가장 먼저 함수의 Orthogonality에서부터 출발해야 한다. 함수의 Orthogonality에 대한 개념은, 수학에서는 함수를 벡터처럼 다룰 수도 있다는 것에서 부터 출발한다. 즉, 수학적인 의미에서 함수 역시 마찬가지로 Inner Product를 정의할 수 있다.

구간 $[a, b]$ 에서 두 함수의 내적은 다음과 같이 정의된다.

$$(f_1, f_2) = \int_a^b{f_1(x) f^*_2(x) dx}$$ 

여기서 '*' 표시는 켤레복소수 연산이다.

Inner Product의 정의로부터 Orthogonal function의 정의를 얻을 수 있다. Vector Analysis에 있어서 vector가 orthogonal 하다는 것은 두 벡터의 Inner product의 결과 값이 0이라는 것을 의미한다. 마찬가지로 두 함수의 inner product의 값이 0일 때 두 함수는 orthogonal 하다고 할 수 있다.

다음이 성립할 경우 구간 $[a, b]$ 에서 두 함수는 직교한다고 한다. 

$$(f_1, f_2) = \int_a^b{f_1(x) f^*_2(x) dx = 0}$$

함수의 orthogonality에 대해서 짚고 꼭 넘어가야 할 정의는 orthogonal set에 대한 정의이다.

구간 $[a, b]$ 에서 다음을 만족한다면 실수 함수 {}의 집합은 직교 집합(orthogonal set)이다. 

$$(\phi_m, \phi_n) = \int_a^b{\phi_m(x)\phi^*_n(x) dx} = 0, \space for \space m \neq n$$

여기서 $\phi_n$, $n=0,1,2,\cdots$ 을 *기저함수(basis function)* 라고 부른다.|

그렇다면 이 orthogonal Set은 왜 중요한 것일까? 그것은 구간 $[a, b]$ 에서 정의된 함수 $y=f(x)$ 는 같은 구간 $[a,b]$ 에서 정의된 기저 함수와 상수 $c_n, \space$ $n=0,1,2,\cdots$ 를 이용하여 선형적으로 분해할 수 있기 때문이다. 즉,

$$ f(x) = c_0\phi_0(x) + c_1\phi_1(x) + \cdots + c_n\phi_n(x) + \cdots $$

또는

$$f(x) = \sum_{n=0}^{\infty}{c_n\phi_n(x)}$$

와 같이 선형적으로 분해할 수 있다.

# Continuous Time Fourier Series

## 1) Continuous Time Fourier Series의 정의

Continuous Time Fourier Series의 정의는 아래와 같다.


x(t)=x(t+T)를 만족하는 어떠한 신호 x(t)도 다음과 같이 쓸 수 있다.

$$x(t) = \sum_{k=-\infty}^{\infty}{a_k \exp\left(j \frac{2\pi k}{T} t\right)}$$

$$a_k =  \frac{1}{T} \int_{-T/2}^{T/2}{x(t) \exp\left(-j \frac{2\pi k}{T}t\right)dt}$$

orthogonality를 통해 얻게 되는 $x(t)$ 의 식이 갖고 있는 의미에 집중하자.

## 2) CTFS 증명

먼저, 다시 한번 CTFS의 식, x(t)를 살펴보자.

$$x(t) = \sum_{k=-\infty}^{\infty}{a_k \exp \left(j \frac{2\pi k}{T} t\right)}$$

위 식에서 알 수 있는 사실은 어떠한 주기함수 x(t)는 특정한 함수의 집합

$$\{\phi_k(t) | \phi_k(t) = \exp \left(j \frac{2\pi k}{T} t\right), \space k=\cdots,-2,-1,0,1,2,\cdots \space on [0, T]\}$$

에 의해서 decompose되었다는 것이다. 그렇다면, $x(t)$ 의 식의 수학적 타당성에 대해서는 집합 {$\phi_k(t)$} 가 an orthogonal set이라는 것을 증명하면 입증되는 것이라고 할 수 있다.

* * *

아래의 집합의 직교성에 관한 증명

$$\{ \phi_k(t) | \phi_k(t) = \exp\left(j \frac{2\pi k}{T} t\right), \space k =\cdots, -2,-,1, 0, 1, 2, \cdots, \}$$

Proof)

정수 k와 p에 대하여,

$$\int_{0}^{T}{\phi_k(t)\phi^*_p(t) dt} \notag$$

$$= \int_{0}^{T}{ \exp\left( j \frac{2\pi k}{T} t \right) \exp\left( -j \frac{2\pi p}{T} t \right)}dt \notag$$

$$ = \int_{0}^{T}{\exp \left(j \frac{2\pi(k-p)}{T}t\right) dt }$$

(1) $k=p$ 일 때,

$$ eq (12)  = \int_{0}^{T}{1 dt}= T$$

(2) $k\neq p$ 일 때,

$$ eq(12) = \frac{T}{j 2\pi (k-p)} \left| \exp\left( j \frac{2\pi(k-p)}{T} t \right)\right| ^{T}_{0} \notag$$

$$=\frac{T}{j 2\pi (k-p)}\left(\exp \left( j2\pi(k-p)\right) -1\right)$$

여기서, k와 p는 서로 다른 정수이므로, k-p도 정수이다.

$$\therefore \frac{T}{j2\pi (k-p)} \left(\exp(j2\pi(k-p)) -1\right) =0$$

그러므로 집합

$$\{\phi_k(t) | \phi_k(t) = \exp\left(j\frac{2\pi k}{T}t\right),\space k = \cdots, -2, -1, 0, 1, 2, \cdots \}$$

 은 직교 집합이다.

***

즉, $\{\phi_k(t)\}$ 가 an orthogonal set이기 때문에 같은 구간 $[0,T]$ 에서 정의되는 함수 $x(t)$ 는 $\{ \phi_k(t) \}$ 를 통해서 decompose될 수 있다. 그러므로, 식

$$x(t) = \sum_{k=-\infty}^{\infty}{a_k \exp\left(j \frac{2\pi k}{T} t \right)}$$

는 수학적으로 타당하다고 할 수 있다.

또한 상수 $a_k$ 를 구하는 방법에 대해서 생각해보아야 한다. 상수 $a_k$ 는 함수의 orthogonality의 성질을 이용해야
유도해낼 수 있다.


계수 $a_k$ 의 결정에 관한 증명

Proof) PROOF 1로 부터, $x(t)$ 는 다음과 같이 나타낼 수 있다.

$$x(t) = \sum_{k=-\infty}^{\infty}{a_k \exp\left(j \frac{2\pi k}{T} t \right)}$$

양변에 $\phi^{*}_p (t)=exp(-j\frac{2\pi p}{T}t)$ 를 곱하고 적분을 취해주면 다음과 같은 식을 얻는다.

$$\int_{0}^{T}{x(t)\phi^*_p(t) dt } = \int_{0}^{T}{\sum_{k=-\infty}^{\infty}{a_k exp\left(j \frac{2\pi k}{T} t\right) exp\left(-j \frac{2\pi p}{T} t\right)} dt } \notag$$

$$= \sum_{k=-\infty}^{\infty}a_k\int_{0}^{T}exp\left(j \frac{2\pi(k-p)}{T}t\right)dt$$


이 때, 정수 k와 p에 대하여 두 가지 경우가 있을 수 있다.

case 1. $k\neq p$ 일 때,

$$ \Rightarrow \sum_{k=-\infty}^{\infty}a_k\int_{0}^{T}\exp\left(j \frac{2\pi (k-p)}{T} t \right) dt \notag$$

$$= \sum_{k=-\infty}^{\infty}a_k\left(\frac{T}{j 2\pi(k-p)}\right)\left| \exp\left(j \frac{2\pi(k-p)}{T} t\right) \right|_{0}^{T}\notag$$

$$= \sum_{k=-\infty}^{\infty} a_k\left( \frac{T}{j 2\pi (k-p)} \right)
\{\exp(
j 2\pi (k-p))-exp(0)
\} \notag$$

여기서 $k-p$ 는 0이 아닌 정수이고 0이 아닌 정수 $x$에 대하여  $exp(j 2\pi x) =exp(0)$  이므로,

$$= \sum_{k=-\infty}^{\infty} a_k\left( \frac{T}{j 2\pi (k-p)} \right)\times{0} = 0$$

case 2. $k=p$ 일 때,

$$\Rightarrow \sum_{k=-\infty}^{\infty} a_k \int_{0}^{T} \exp \left(j \frac{2\pi  (k-p)}{T} t \right) dt \notag$$

여기서 $k=p$ 인 경우만을 확인하므로,

$$= a_p\int_{0}^{T} \exp(0) dt = a_p \int_{0}^{T} 1 dt =a_p \times T$$

$$\therefore a_k = \frac{1}{T}\int_{0}^{T}x(t) \exp\left(-j \frac{2\pi k}{T}t\right)dt$$

***

다시 한번 말하지만, 위의 증명의 기초적인 아이디어는 orthogonality를 이용한다는 것이다.

## CTFS에서 kernel function은 왜 exponential인가?

위의 내용에서 확인한 바는 다음과 같다. $T$ 를 주기로 하는 주기함수 $x(t)$ 에 대해서

$$x(t) = \sum_{k=-\infty}^{\infty} a_k exp\left(j \frac{2\pi k}{T}t\right)$$

<center> where </center>

$$a_k = \frac{1}{T}\int_{0}^{T} x(t)\exp\left(-j \frac{2\pi k}{T} t\right) dt$$

은 수학적으로 타당한 것이다.

그렇다면 신호처리에 있어서 Fourier의 이론은 왜 중요한 것인가? 그것은 CTFS라고 불리는 위의 Fourier Series의 kernel function인

$$\phi_k(t) = \exp\left(j \frac{2\pi k}{T}t\right)$$

에 있다.간단히 설명하자면, CTFS는 주기함수를 또 다른 주기 함수인 sinusoidal function을 통해서 나타낼 수 있다는 것을 증명했기 때문이다. 특히, 기초적이고 수학적으로 다루기 쉬운 sinusoidal function을 통해서 모든 주기함수를 decompose할 수 있다는 점에서 CTFS는 중요한 것이다.

$\phi_k(t) = exp(j\frac{2\pi k}{T}t)$ 가 sinusoidal function과 연관되어 있다는 사실은 Euler Equation($e^{i\theta}=cos\theta+i sin\theta$)을 통해서 알 수 있다.

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/7JRwjCpKewQ" frameborder="0" allowfullscreen></iframe></center>



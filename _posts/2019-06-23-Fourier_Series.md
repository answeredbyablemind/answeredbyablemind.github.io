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
* [미분방정식을 이용한 오일러 공식 유도](https://angeloyeo.github.io/2020/09/22/Euler_Formula_Differential_Equation.html)
* [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)

# 기저 신호 (basis signal)

## 기저 신호의 선택과 스펙트럼 표현

좌표 평면 상에 존재하는 $(3,4)$라는 벡터는 두 개의 서로 다른 기저벡터의 선형결합으로 표현될 수 있다는 것을 간략화하여 표기한 것과 같다.

$$(3,4) \Longleftrightarrow 3 \hat{i}+4\hat{j}$$

이전 포스팅 중 [신호 공간(signal space)](https://angeloyeo.github.io/2022/01/12/signal_space.html) 편에서는 신호가 일종의 벡터로 생각될 수 있다고 언급했다.

임의의 벡터가 기저벡터들의 선형 결합으로 표현할 수 있는 것 처럼 임의의 신호는 기저 신호(basis signals)의 선형결합으로 표현될 수 있다.

임의의 연속 신호 $x(t)$에 대해 기저 신호가 $\lbrace \psi_i(t)\rbrace$라고 하면 다음과 같이 기저 신호들의 선형 결합으로 표현할 수 있다.

$$x(t)=\sum_i c_i \psi_i(t)$$

생각해보면 우리가 적절히 얻어낸 $\lbrace \psi_i(t)\rbrace$를 알고만 있다면 $c_i$를 구하는 것 만으로 $x(t)$를 표현할 수 있게 되는 것이다.

예를 들어 임의의 연속 신호 $x(t)$와 기저 신호 집합 $\lbrace \psi_i(t)\rbrace$에 대해 $i=1$일 때 $c_1=1$이고 $c_2=3$이라고 하자. 그 외의 $c_i=0$이라고 해보자.

그러면 이 신호는 다음과 같이 $c$ 축 위에 기저 신호의 성분량만을 표시해주면 충분하다.

이 처럼 기저 신호의 성분량만을 이용해 원 신호를 표현해주는 방법을 스펙트럼 표현이라고 부른다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-23-Fourier_Series/pic1.png">
  <br>
  그림 1. 임의의 연속 신호 $x(t)$에 대한 스펙트럼 표현
</p>

---

신호 처리에 있어서 적절한 기저 신호는 어떤 특성을 만족해야 할까? 특별히 정해진 규칙은 없지만 한 참고문헌[^1]에서는 아래와 같이 특성을 제시하고 있다.

[^1]: 디지털 신호 처리, 이철희, 한빛아카데미

1. 형태가 단순하고, 신호의 표현을 구하기 쉬워야 한다.
2. 다양하고 폭넓은 신호들을 표현할 수 있어야 한다.
3. 표현된 신호에 대한 시스템의 응답을 편리하게 표기할 수 있어야 한다.
4. 한 주파수에 대해 오직 하나의 기본 신호만 존재(일대일 대응)해야 한다.

그리고 이러한 네 가지 특성을 가장 잘 만족하는 기저함수 중 하나가 삼각함수[^2]이다.

[^2]: 단, 기저 함수가 삼각 함수에만 국한 되는 것이 아니라는 점을 꼭 언급하고 싶다. 여러가지 기저 함수를 사용할 수 있다. 가령 신호가 사각파 펄스라면 여러 너비와 delay의 사각파 기저를 가지고 신호를 표현하는 것이 더 쉬울 수 있다. 아울러, [연산자 이론을 더 깊게 공부해보면](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html) 삼각함수는 기저 신호로 사용할 수 있는 어마어마하게 다양한 신호 중 하나라는 것을 금방 알 수 있을 것이다.


그런데, 삼각 함수는 주기 함수이기 때문에 삼각 함수를 기저 신호로 하여 선형결합해 신호를 표현하기 위해선 표현해주고자 하는 신호가 주기함수여야 한다.

푸리에의 결과에 따르면 주기 신호는 같은 주기를 갖는 정현파와 이 정현파의 정수배의 주파수를 갖는 정현파의 합으로 표현할 수 있기 때문에[^3], 주기가 $T$인 임의의 연속 신호 $x(t)$를 다음과 같이 정현파의 선형결합으로 표현할 수 있다.

[^3]: 2차 미분 연산자 대한 고유함수 전개에서 얻게 되는 trivial solution을 방지하기 위한 조건이다. 좀 더 자세한 내용은 [고유함수 전개 편의 예시 문제](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html#%EC%98%88%EC%A0%9C-%EB%AC%B8%EC%A0%9C)를 참고.

$$x(t)=a_0+\sum_{k=1}^\infty a_k\cos\left(\frac{2\pi k t}{T}\right)+\sum_{k=1}^{\infty} b_k \sin\left(\frac{2\pi k t}{T}\right)$$

여기서 수식의 형태를 단순화 시키고(위의 조건 중 1번) 시스템 응답을 편리하게 표기하기 위해(위의 조건 중 3번) 실수 정현파가 아니라 복소 정현파를 사용하자[^4].

[^4]: 당연히 실수 정현파를 이용한 푸리에 급수도 이용할 수 있으나 수식의 전개과정이 번거로운게 많다.

복소 정현파는 다음과 같이 오일러 공식을 가지고 얻게 된다.

$$\exp(j\theta) = \cos(\theta) + j \sin(\theta)$$

여기서 $j=\sqrt{-1}$이다.

그러므로,

$$\cos(\theta) = \frac{\exp(j\theta)+\exp(-j\theta)}{2}$$

$$\sin(\theta) = \frac{\exp(j\theta)-\exp(-j\theta)}{2j}$$

와 같다는 것을 알 수 있기 때문에 $x(t)$를 다시 써보면 다음과 같다.

$$x(t)=a_0+\sum_{k=1}^\infty a_k\cos\left(\frac{2\pi k t}{T}\right)+\sum_{k=1}^{\infty} b_k \sin\left(\frac{2\pi k t}{T}\right)$$

$$=a_0+\sum_{k=1}^{\infty}\left(
  a_k\frac{\exp\left(j 2\pi k t/T\right)+\exp\left(-j2\pi k t/T\right)}{2}
  + b_k\frac{\exp\left(j 2\pi k t/T\right)-\exp\left(-j 2\pi k t/T\right)}{2j}
  \right)$$

$$=a_0+\sum_{k=1}^{\infty}\left(
  \frac{a_k-jb_k}{2}\exp\left(j\frac{2\pi k t}{T}\right)+\frac{a_k+jb_k}{2}\exp\left(-j\frac{2\pi kt}{T}\right)
  \right)$$

$$=\sum_{k=-\infty}^{\infty}c_k\exp\left(j\frac{2\pi k t}{T}\right)$$

여기서 $c_k$는 $a_0, a_k, b_k$와 다음과 같은 관계를 갖는다고 볼 수 있다.

$$c_k = \begin{cases}\frac{1}{2}(a_k-jb_k),&& k >0 \\ a_0, && k = 0\\ \frac{1}{2}(a_k+jb_k), && k < 0 \end{cases}$$

## 기저 신호로써의 삼각함수

특별히 삼각함수가 기저 신호로써 유용한 이유는 서로 다른 주파수의 삼각 함수 끼리는 직교하는 성질을 보여 신호의 표현을 구하기 쉬워지기 때문이다.

여기서 신호가 직교한다는 것은 신호 간의 내적이 0임을 의미하는데, 구간 $(a, b)$에서 정의된 임의의 신호 $x(t)$와 $z(t)$에 대해 다음이 성립하면 두 신호는 직교한다고 표현한다.

$$\lt x(t), z(t) \gt = \int_{a}^{b}x(t)z^*(t) dt= 0$$

가령, 구간 $(a, b)$에서 정의된 서로 다른 주파수를 갖는 

























(아래는 구버전이며 편집 중)

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

여기서 $\phi_n$, $n=0,1,2,\cdots$ 을 *기저함수(basis function)* 라고 부른다.

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

$$\int_{0}^{T}{x(t)\phi^*_p(t) dt } = \int_{0}^{T}{\sum_{k=-\infty}^{\infty}{a_k \exp\left(j \frac{2\pi k}{T} t\right) \exp\left(-j \frac{2\pi p}{T} t\right)} dt } \notag$$

$$= \sum_{k=-\infty}^{\infty}a_k\int_{0}^{T}\exp\left(j \frac{2\pi(k-p)}{T}t\right)dt$$


이 때, 정수 k와 p에 대하여 두 가지 경우가 있을 수 있다.

case 1. $k\neq p$ 일 때,

$$ \Rightarrow \sum_{k=-\infty}^{\infty}a_k\int_{0}^{T}\exp\left(j \frac{2\pi (k-p)}{T} t \right) dt \notag$$

$$= \sum_{k=-\infty}^{\infty}a_k\left(\frac{T}{j 2\pi(k-p)}\right)\left| \exp\left(j \frac{2\pi(k-p)}{T} t\right) \right|_{0}^{T}\notag$$

$$= \sum_{k=-\infty}^{\infty} a_k\left( \frac{T}{j 2\pi (k-p)} \right)
\{\exp(
j 2\pi (k-p))-\exp(0)
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

$$x(t) = \sum_{k=-\infty}^{\infty} a_k \exp\left(j \frac{2\pi k}{T}t\right)$$

<center> where </center>

$$a_k = \frac{1}{T}\int_{0}^{T} x(t)\exp\left(-j \frac{2\pi k}{T} t\right) dt$$

은 수학적으로 타당한 것이다.

그렇다면 신호처리에 있어서 Fourier의 이론은 왜 중요한 것인가? 그것은 CTFS라고 불리는 위의 Fourier Series의 kernel function인

$$\phi_k(t) = \exp\left(j \frac{2\pi k}{T}t\right)$$

에 있다.간단히 설명하자면, CTFS는 주기함수를 또 다른 주기 함수인 sinusoidal function을 통해서 나타낼 수 있다는 것을 증명했기 때문이다. 특히, 기초적이고 수학적으로 다루기 쉬운 sinusoidal function을 통해서 모든 주기함수를 decompose할 수 있다는 점에서 CTFS는 중요한 것이다.

$\phi_k(t) = exp(j\frac{2\pi k}{T}t)$ 가 sinusoidal function과 연관되어 있다는 사실은 Euler Equation($e^{i\theta}=cos\theta+i sin\theta$)을 통해서 알 수 있다.

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/7JRwjCpKewQ" frameborder="0" allowfullscreen></iframe></center>



# 참고 문헌

* 디지털 신호 처리, 이철희, 한빛아카데미

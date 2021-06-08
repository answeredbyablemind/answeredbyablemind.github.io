---
title: 스트룸-리우빌 이론
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210606
tags: 미분방정식
---

이번 포스팅은 [University of Washington의 Nathan Kutz 교수님 강의](https://www.youtube.com/watch?v=12d15vI52b8)를 참고하여 작성한 것임을 미리 밝힙니다.

# Prerequisites

이번 포스팅의 내용에 대해 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [1계 선형 미분방정식의 해법](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)
* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)
* [고유함수 전개](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html)


# 스트룸 리우빌 이론 소개

스트룸 리우빌 이론[^1]은 2계 선형미분방정식의 해를 얻고 이 해의 특성을 이해하기 위한 이론이다.

[^1]: 이름이 심지어 정리(theorem)가 아닌 '이론(theory)'이다. 이 이론을 따르는 수 많은 적용 사례들이 있음을 시사한다.

특히, 2계 선형미분방정식을 연산자(operator)의 관점에서 봄으로써 해를 구하고자 하는 시도에서 출발한다. 이 이론이 의미있는 이유는 아무리 복잡한 2계 미분방정식이더라도 스트룸 리우빌 이론의 관점에서 문제를 보면 그 문제들을 다르게 해석해볼 수 있기 때문이다.

선형 연산자 $L$에 대해 아래와 같은 꼴을 띄는 방정식은 스트룸 리우빌 이론으로 해석할 수 있다.

$$Lu=\mu r(x)u+f(x)$$

여기에 아래와 같은 경계 조건이 주어져야 한다. 여기서 $\alpha, \beta$ 값들은 적절한 상수이다.

$$\alpha_1 u(a)+\beta_1 \frac{du(a)}{dx}=0$$

$$\alpha_2 u(b)+\beta_2 \frac{du(b)}{dx}=0$$

조금 더 구체적으로 선형 연산자 $L$은 아래와 같이 주어지는 것이며 이 연산자를 스트룸 리우빌 연산자(Sturm-Liouville Operator)라고 부르자.

$$Lu = -\frac{d}{dx}\left[p(x)\frac{du}{dx}\right]+q(x)u$$

여기서 $p(x), q(x), r(x)$가 $x\in[a,b]$의 구간에서 $0$보다 큰 함수여야 한다.

## 2계 선형미분방정식과의 관계

스트룸 리우빌 연산자와 스트룸 리우빌 이론을 적용 시키기 위한 방정식의 꼴은 매우 생소해보인다.

하지만, 이 연산자를 적용해 방정식을 풀면 일반적인 2계 선형미분방정식을 다른 방법으로 적은 것이라는 것을 알 수 있다.

$$Lu=\mu r(x) u+f(x)$$

$$\Rightarrow -\frac{d}{dx}\left[p(x)\frac{du}{dx}\right]+q(x)u=\mu r(x)u+f(x)$$

$$\Rightarrow -\frac{dp}{dx}\frac{du}{dx}-p(x)\frac{d^2u}{dx^2}+(q(x)-\mu r(x))u=f(x)$$

여기서 순서만 약간 정리해주면,

$$\Rightarrow -p(x)u''-\frac{dp}{dx}u'+(q(x)-\mu r(x))u=f(x)$$

와 같다는 것을 알 수 있으며, 이것은 일반적인 2계 선형 미분방정식의 꼴임을 쉽게 알 수 있다.

즉, 스트룸 리우빌 문제는 일반적인 2계 선형미분방정식 중 $p(x),q(x),r(x)$가 0보다 큰 함수여야 한다는 조건과 특정한 경계 조건을 만족하는 2계 미분방정식의 해를 구해내기 위해 정립된 이론으로 생각할 수 있는 것이다.

다만, 원래의 스트룸 리우빌 이론의 방정식 꼴을 띄게 이론을 구축한 이유는 많은 문제가 스트룸 리우빌 이론의 방정식과 같은 형태로 방정식이 주어지기 때문이다.

## S-L 연산자는 self-adjoint 연산자이다.

생소한 개념들이 계속해서 등장하고 있을 것으로 생각된다.

self-adjoint란 것은 또 무엇일까?

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서 확인했던 것과 같이 adjoint 라는 것은 선형대수학에서 행렬의 transpose에 대응되는 개념이라고 언급한 바 있다.

일단 adjoint에 대해 잠깐 복습해보자.

$x\in [a, b]$에 대해 정의된 함수 $f(x)$, $g(x)$의 내적을 아래와 같이 정의하자. 

$$\langle f, g\rangle = \int_{a}^{b}\overline{f(x)}g(x)dx$$

여기서 $\overline{f(x)}$ 표기는 $f(x)$ 함수에 대해 complex conjugate을 취해둔 것이다.

그러면 어떤 선형연산자 $L$에 대한 adjoint $L^\dagger$는 다음과 같은 성질을 만족해야 한다.

$$\langle Lf, g \rangle=\langle f, L^\dagger g\rangle$$

자, 그러면 self-adjont란 $L^\dagger =L$인 연산자를 말한다.

이러한 연산자들은 마치 선형대수학에서 대칭 행렬(symmetric matrix) 혹은 에르미트 행렬(Hermitian matrix)에 대응되는 개념이다.

S-L 연산자가 self adjoint 연산자임을 확인해보자.

$$\langle Lf, g\rangle=\int_{a}^{b}\left(-\frac{d}{dx}\left[p(x)\overline{f '}\right]+q(x)\overline f\right)g \ dx$$

$$=\int_{a}^{b}-\frac{d}{dx}\left[p(x)\overline{f'}\right]g +q(x)\overline f g \ dx$$

부분 적분을 이용하면

$$\Rightarrow -\left[p(x)\overline{f'}g\right]_{a}^{b}+\int_{a}^{b}\left(p(x)\overline{f'}g' + q(x)\overline f g \right)dx$$

또, 마찬가지로,

$$\langle f, Lg\rangle=\int_{a}^{b}\overline f\left(-\frac{d}{dx}\left[p(x)g'\right]+q(x)g\right)dx$$

마찬가지로 부분적분을 이용해,

$$=-\left[\overline{f} p(x)g'\right]_{a}^{b}+\int_{a}^{b}\left(\overline{f'}p(x)g'+\overline f q(x)g \right)dx$$

이다.

이 때, $\langle Lf, g\rangle=\langle f, Lg\rangle$ 인지 여부를 확인해보자.

$$\langle Lf, g\rangle-\langle f, Lg\rangle = \left(-\left[p(x)\overline{f'}g\right]_{a}^{b}+\int_{a}^{b}\left(p(x)\overline{f'}g' + q(x)\overline f g \right)dx\right)-\left(-\left[\overline{f} p(x)g'\right]_{a}^{b}+\int_{a}^{b}\left(\overline{f'}p(x)g'+\overline f q(x)g \right)dx\right)$$

$$=-\left[p(x)\overline{f'}g\right]_{a}^{b}+\left[\overline{f} p(x)g'\right]_{a}^{b}$$

$$=-\left[p(x)\overline{f'}g-p(x)\overline{f}g'\right]_{a}^{b}$$

$$=-(p(b)\overline{f'(b)}g(b)-p(b)\overline{f(b)}g'(b)-p(a)\overline{f'(a)}g(a)+p(a)\overline{f(a)}g'(a))$$

여기서 $f$와 $g$ 모두 S-L 이론의 경계조건을 만족하는 함수로 생각한 것이므로 위의 값은 0이 됨을 알 수 있다.

가령, 함수 $f$는 다음 조건을 만족하는 함수여야 한다.

$$\alpha_1 f(a)+\beta_1 \frac{df(a)}{dx}=0$$

$$\alpha_2 f(b)+\beta_2 \frac{df(b)}{dx}=0$$

그리고 위의 식에서 왼쪽 네 개의 항만을 떼오면 아래와 같이 식을 바꿔볼 수 있다.

$$p(b)\overline{f'(b)}g(b)-p(b)\overline{f(b)}g'(b)\Rightarrow \beta_2\overline{f'(b)}+\alpha_2\overline{f(b)}$$

$p(b)g(b)$나 $p(b)g'(b)$는 적절한 값 $\beta_2$, $\alpha_2$라고 생각할 수 있기 때문이다. $\beta_2$, $\alpha_2$가 어떤 값이든 간에 경계조건은 만족해야 하므로 원래의 위 식은 0이다. 따라서, $\langle Lf, g\rangle-\langle f, Lg\rangle = 0$임을 알 수 있다.


## S-L 이론의 고윳값 문제

$$Lu_n=\lambda_nr(x) u_n$$

# 
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

# 푸리에 급수의 유도 과정

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

이처럼 기저 신호의 성분량만을 이용해 원 신호를 표현해주는 방법을 스펙트럼 표현이라고 부른다.

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

여기서 수식의 형태를 단순화 시키고[^4](위의 조건 중 1번) 시스템 응답을 편리하게 표기하기 위해[^5](위의 조건 중 3번) 실수 정현파가 아니라 복소 정현파를 사용하자.

[^4]: 당연히 실수 정현파를 이용한 푸리에 급수도 이용할 수 있으나 수식의 전개과정이 번거로운게 많다.

[^5]: 선형 시스템에 대해서는 복소 정현파가 고유함수이기 떄문에 복소 정현파를 사용하는게 시스템 응답을 편리하게 표시할 수 있다.

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

결론적으로 우리는 복소 삼각함수를 이용해 임의의 연속 신호 $x(t)$를 표현할 수 있다.

## 복소 정현파의 직교성

특별히 삼각함수가 기저 신호로써 유용한 이유는 서로 다른 주파수의 삼각 함수 끼리는 직교하는 성질을 보여 신호의 표현을 구하기 쉬워지기 때문이다.

여기서 신호가 직교한다는 것은 신호 간의 내적이 0임을 의미하는데, 구간 $(a, b)$에서 정의된 임의의 신호 $x(t)$와 $z(t)$에 대해 다음이 성립하면 두 신호는 직교한다고 표현한다.

$$\lt x(t), z(t) \gt = \int_{a}^{b}x(t)z^*(t) dt= 0$$

가령, 구간 $(0, T)$에서 정의된 복소 정현파 두 개의 내적을 생각해보자.

$$\lt \exp\left(j\frac{2\pi k t}{T}\right), \exp\left(j\frac{2\pi p t}{T}\right)\gt$$

$$=\int_{0}^{T}\exp\left(j\frac{2\pi k t}{T}\right)\exp\left(-j\frac{2\pi p t}{T}\right)dt$$

$$=\int_{0}^{T}\exp\left(j\frac{2\pi (k-p) t}{T}\right)dt$$

여기서 $k=p$ 인 경우에는

$$\Rightarrow \int_{0}^{T}\exp(0)dt = T$$

반면 $k\neq p$인 경우에는 $q=k-p$로 치환하여

$$\Rightarrow \int_{0}^{T}\exp\left(j\frac{2\pi q t}{T}\right)dt $$

$$ = \frac{T}{j2\pi q}\left|\exp\left(j\frac{2\pi q t}{T}\right)\right|_{0}^{T}=\frac{T}{j2\pi q}(\exp(j2\pi q) - 0) = \frac{T}{j2\pi q}(0-0) = 0$$

이므로 서로 다른 주파수를 갖는 복소 정현파끼리는 서로 직교한다는 사실을 알 수 있으며, 같은 주파수를 갖는 복소 정현파끼리는 내적한 결과가 $T$와 같다는 것을 알 수 있다.

## 계수 $c_k$의 계산

한편 식 (10)에서부터,

$$x(t)=\sum_{k=-\infty}^{\infty }c_k \exp\left(j\frac{2\pi k t}{T}\right)$$

임을 알 수 있다.

이 때, $c_k$를 구하기 위해 다음과 같은 내적을 취해보면,

$$\lt x(t), \exp\left(j\frac{2\pi p t}{T}\right)\gt$$

$$=\int_{0}^{T}x(t)\exp\left(-j\frac{2\pi p t}{T}\right)dt$$

$$=\int_{0}^{T}\sum_{k=-\infty}^{\infty}c_k\exp\left(j\frac{2\pi kt}{T}\right)\exp\left(-j\frac{2\pi pt}{T}\right)$$

$$=\int_{0}^{T}\sum_{k=-\infty}^{\infty}c_k\exp\left(j\frac{2\pi (k-p)t}{T}\right)$$

식 (16)과 식 (18)의 결과를 생각해보면

$$\Rightarrow c_k T$$

이다.

따라서, 계수 $c_k$는 다음과 같이 계산할 수 있다.

$$c_k =\frac{1}{T}\int_{0}^{T}x(t)\exp\left(-j\frac{2\pi k t}{T}\right)dt$$

## 요약

푸리에 급수에 대해 요약하면 다음과 같이 두 개의 수식으로 쓸 수 있다.

구간 $(0, T)$에서 정의된 $T$를 주기로하는 연속 신호 $x(t)$에 대해,

$$x(t)=\sum_{k=-\infty}^{\infty}c_k\exp\left(j \frac{2\pi k t}{T}\right)$$

$$c_k = \frac{1}{T}\int_{0}^{T}x(t)\exp\left(-j\frac{2\pi k t}{T}\right)dt$$

# 예제

## 문제 1. 다음의 사각 펄스의 푸리에 급수를 계산하시오.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-23-Fourier_Series/pic2.png">
  <br>
  그림 2. 문제 1의 사각 펄스 주기 신호
</p>

위 그림을 보면 적분 주기를 $(-T/2, T/2)$로 두고 적분하면 한 주기에 대해 적분하면서도 함수가 끊기지 않고 적분할 수 있다는 것을 알 수 있다.

따라서, 푸리에 급수의 $c_k$는 다음과 같이 계산할 수 있다.

$$c_k = \frac{1}{T}\int_{-\tau}^{\tau}A\exp\left(-j\frac{2\pi k t}{T}\right)dt=\frac{A}{T}\left(-\frac{T}{j2\pi k}\right)\left|\exp\left(-j\frac{2\pi k t}{T}\right)\right|_{-\tau}^{\tau}$$

$$=\frac{A}{T}\frac{T}{(-j2\pi k)}\left\lbrace\cos\left(\frac{2\pi k\tau}{T}\right)-j\sin\left(\frac{2\pi k\tau}{T}\right)-\cos\left(\frac{2\pi k\tau}{T}\right)-j\sin\left(\frac{2\pi k\tau}{T}\right)\right\rbrace$$

$$=\frac{A}{T}\frac{T}{2\pi k}2\sin\left(\frac{2\pi k \tau}{T}\right)$$

여기서 사인함수를 sinc 함수로 맞춰주기 위해서 아래와 같이 두 번째 분수의 분자분모에 $\tau$를 곱하자.

$$=\frac{A}{T}\frac{T\tau}{2\pi k\tau}2\sin\left(\frac{2\pi k \tau}{T}\right)$$

$$=\frac{2A\tau}{T}\text{sinc}\left(\frac{2k\tau}{T}\right)$$

여기서 sinc 함수는 다음과 같은 함수이다.

$$\text{sinc}(x)=\frac{\sin(\pi x)}{\pi x}$$

sinc 함수의 형태는 다음과 같다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-23-Fourier_Series/pic_sinc.png">
  <br>
  그림 3. 사각 펄스 주기 신호의 푸리에 계수(스펙트럼), $T = 3, \tau = 0.5, A = 2$ 인 경우
</p>

계수를 구했으니 원래의 신호 $x(t)$를 다음과 같이도 표현할 수 있음을 알 수 있다.

$$x(t) = \sum_{k=-\infty}^{\infty}c_k\exp\left(\frac{2\pi k t}{T}\right)=\frac{2A\tau}{T}\text{sinc}\left(\frac{2k\tau}{T}\right)\exp\left(\frac{2\pi k t}{T}\right)$$

위의 형태는 $k=0$일 때부터 $k=\pm 1$, $k=\pm 2$ 일 때 하나씩 더해가면서 얻게 되는 급수의 형태이다.

이를 컴퓨터를 이용해 그려보면 $k$가 변해감에 따라 원래의 그림 2의 사각 펄스 신호와 같은 형태를 띄게 되는 것을 알 수 있다.

<p align = "center">
  <video width = "500" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-23-Fourier_Series/Problem_1.mp4">
  </video>
  <br>
  그림 4. 푸리에 급수의 합을 계속해서 더해가면 원래의 펄스 주기 신호와 유사해진다.
</p>

한편, $c_k$를 $k$의 변화에 따라 그리면 다음과 같다. sinc 함수의 형태를 그대로 띄게 되며, 띄엄 띄엄 샘플되어 있는 형태를 볼 수 있다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-23-Fourier_Series/pic3.png">
  <br>
  그림 5. 사각 펄스 주기 신호의 푸리에 계수(스펙트럼), $T = 3, \tau = 0.5, A = 2$ 인 경우
</p>

# 참고 문헌

* 디지털 신호 처리, 이철희, 한빛아카데미

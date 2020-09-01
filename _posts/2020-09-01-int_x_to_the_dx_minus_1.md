---
title: $\int x^{dx}-1=$?
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200901
tags: 미적분학
---

※ 이 포스팅은 Quora의 글 중 [What is $\int x^{dx}-1$?](https://www.quora.com/What-is-int-x-dx-1)의 Oden Petersen의 답변을 재구성한 것입니다.

$$\int x^{dx}-1$$

이 수식을 보자마자 "장난치는건가?" 싶은 생각이 들었다.

전혀 익숙한 형태의 수식이 아닐 뿐더러 보통 적분을 계산할 때는 $dx$를 적분 맨 뒤에 써다 주는 것이 관례적이라고 생각했기 때문일지도 모른다.

하지만, 리만 적분의 본래 의미를 생각해본다면 이 적분 값은 정당한 결과를 가져온 다는 것을 알 수 있을 것이다.

본 포스팅을 작성하는 이유는 적분 기호들의 원래적 의미에 다시 한번 집중해서 그 본질적 의미를 탐구했으면 한다는 Oden Petersen의 가르침을 공유하기 위함이다.

또한, 이 문제를 풀면서 적분의 본래적 의미 뿐만 아니라 미분 계수의 의미와 부분적분에 대해서도 생각해야 하기 때문에 미적분학의 기초를 다시끔 생각해볼 수 있게 하는 충실한 예시가 될 수 있을 것으로 생각한다.

# 리만 적분의 본래적 의미

리만 적분은 임의의 함수 아래의 면적을 계산하는데 사용된다.

아래의 그림 1에서 처럼 임의의 함수 $f(x)$와 $a\lt x \lt b$로 둘러싸인 영역의 면적을 계산하는데 리만 적분이 사용될 수 있다.

아래의 그림 1의 면적을 계산한다고 하면 이런 식으로 수식으로 표현할 수 있다.

$$\int_a^b f(x) dx$$

우리는 인테그랄 기호 $\int$와 미소변위 $dx$를 그저 기호로만 생각할 뿐 본래 의미에 대해 간과하는 경우가 종종 있다.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/f/f2/Integral_as_region_under_curve.svg">
  <br>
  그림 1. 함수 $f(x)$에 대해 $a\lt x\lt b$의 구간에 대한 면적 $S$
  <br>
  출처: <a href = "https://en.wikipedia.org/wiki/Riemann_integral" target="_blank"> 위키피디아, 리만 적분</a>
</p>

하지만, 리만 적분의 본래적 의미는 무엇인가?

리만 적분은 정의역 구간을 작은 구간으로 잘게 나눠 각각의 작은 구간 위의 넓이를 직사각형의 넓이를 통해 근사하는 것이다.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/2/28/Riemann_integral_regular.gif">
  <br>
  그림 2. 리만 적분은 특정 구간 내에서 규칙적으로 구간을 분할하여 사각형의 면적 합을 계산하는 과정이라고 할 수 있다. <br> 맨 위의 숫자는 함수의 적분으로 수렴되는 사각형의 총 면적을 나타냄.
  <br>
  출처: <a href = "https://en.wikipedia.org/wiki/Riemann_integral" target="_blank"> 위키피디아, 리만 적분</a>
</p>

즉, 리만 적분의 원래 의미를 수식으로 쓰면 아래와 같다.

$$\int_a^b f(x)dx = \lim_{\Delta x \rightarrow 0}\sum_{x\in(a, b)} f(x) \Delta x$$

즉, 적분기호 $\int$는 본래 $\sum$에서 부터 나왔으며 $dx$는 매우 작아지는 직사각형의 밑변의 길이 $\Delta x$를 의미하는 것이다.


# 본격적인 풀이

이제, 리만 적분의 의미를 생각하면서 아래의 식을 풀어가보도록 하자.

$$\int x^{dx}-1 $$

위 식에서 $dx/dx$를 분자 분모에 곱해도 이 식의 결과는 영향을 받지 않는다.

$$\Rightarrow \int\frac{x^{dx} - 1}{dx}dx$$

여기서 $(x^{dx} - 1)/dx$에 대해 따로 떼어 놓고 생각해보자.

$dx$는 무한히 작아지는 값이므로 아래와 같이 쓸 수 있다.

$$\frac{x^{dx}-1}{dx}$$

$$ = \lim_{n\rightarrow 0}\frac{x^n - 1}{n}$$


$$=\lim_{n\rightarrow 0}\frac{x^n-x^0}{n-0}$$

여기서 $f(n) = x^n$ 이라고 생각하면 다음과 같은 형태로 바꿔 생각할 수 있다.

$$\Rightarrow\lim_{n\rightarrow 0}\frac{f(n)-f(0)}{n-0}$$

즉, 이 식은 $f(n) = x^n$의 $n$에 대한 미분계수를 의미하며, 특히 $n=0$일 때의 미분 계수 값을 묻고 있는 것이다. ($x$에 대한 미분계수를 말하는 것이 아님에 주의하자.)

다시 말해 수식으로 쓰자면 아래와 같이 쓸 수 있는 것이다.

$$\Rightarrow \frac{d}{dn}x^n\big|_{n = 0}$$

지수함수에 대한 미분을 생각하면,

$$\Rightarrow x^n\ln(x)\big|_{n=0}$$

$$=\ln(x)$$

즉, 원래의 식은

$$\int x^{dx}-1 = \int \ln(x)dx$$

이다.

여기서는 부분적분을 이용하면 위 부정적분을 계산할 수 있다.

부분적분의 공식은 아래와 같다.

$$\int f(x)g'(x)dx = f(x)g(x) - \int f'(x)g(x)dx$$

여기서 $f(x) = \ln(x)$, $g'(x) = 1$로 놓으면, $f'(x) = 1/x$이고, $g(x) = x$이다.

따라서, 

$$\Rightarrow x\ln(x)-\int 1 dx$$

$$=x \ln(x)-x + C$$

인 것을 알 수 있다. (여기서 $C$는 적분 상수)
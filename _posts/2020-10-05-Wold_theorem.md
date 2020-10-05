---
title: Wold's theorem
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201005
tags: 신호처리
---

※ Wold's theorem은 위너-킨친 정리의 Discrete Time Signal 버전이라고 할 수 있다.

# 1. Discrete Time Random Signal의 Power Spectrum Density (PSD)

※ 해당 내용은 [Richard Shiavi의 Introduction to applied statistical signal analysis, 3e.](https://www.amazon.com/Introduction-Applied-Statistical-Signal-Analysis/dp/0120885816)pp.203 - 205 의 내용을 옮겨 적은 것임.

Wide-sense stationary random signal의 푸리에 변환을 생각할 때의 가장 큰 문제점은 푸리에 변환이 존재하지 않는다는 것이다. 다시 말해 $X(f)$가 존재하기 위해서는 신호의 에너지가 유한해야 한다. 다시 말해 아래와 같은 식을 만족해야 한다는 뜻이다. 

$$energy = T\sum_{n=-\infty}^{\infty}x(n)^2 \lt \infty$$

$x(n)$은 최소한 wide-sense stationary 하므로 모든 sample function의 energy는 양의 무한대로 발산하게 된다(Priestly, 1981)[^1]. 실제로 평균 에너지 역시 양의 무한대로 발산하게 된다.

[^1]: 해당 내용에 대한 조금 더 구체적인 설명은 [위너-킨친 정리](https://angeloyeo.github.io/2020/10/04/Wiener_Khinchin.html)의 내용을 참고


$$E\lbrace energy\rbrace = T\sum_{n=-\infty}^{\infty}E \lbrace x(n)^2\rbrace = \infty$$

그런데, 평균 energy 대신에 평균 power는 유한한 양이므로 frequency transformation의 정의에 기반이 될 값으로 사용될 수 있을 것이다. 평균 파워는 다음과 같이 정의된다.

$$E\lbrace power\rbrace = \lim_{N\rightarrow \infty}\sum_{n=-N}^{N}\frac{T E\lbrace x(n)^2\rbrace}{(2N+1)T} = E\lbrace x(n)^2\rbrace \lt \infty$$

여기서, 주파수 변수를 위 식에 포함 시키기 위해 아래와 같이 $x_p(n)$을 정의하자.

$$x_p(n) = \begin{cases}x(n) && |n|\leq N \\ 0 && |n| \gt N \end{cases}$$

여기서 Parseval's theorem에 따라 다음이 성립한다.

$$T\sum_{n=-\infty}^{\infty}x_p(n)^2 = \int_{-1/2T}^{1/2T}X_p(f)X^*_p(f) df$$

$x_p(n)$의 sequence는 유한하기 때문에 위의 summation limits 는 $-N$에서 $N$까지로 변경될 수 있다. 따라서 다음이 성립한다.

$$E\lbrace power\rbrace = \lim_{N\rightarrow \infty}E\left\lbrace \sum_{n=-N}^{N}\frac{T x_p(n)^2}{(2N+1)T}\right\rbrace$$

$$= \lim_{N\rightarrow \infty}E\left\lbrace \frac{\int_{-1/2T}^{1/2T}X_p(f)X^*_p(f) df}{(2N+1)T}\right\rbrace$$

$$=\int_{-1/2T}^{1/2T}\lim_{N\rightarrow \infty}E\left\lbrace \frac{X_p(f)X^*_p(f)}{(2N+1)T}\right\rbrace df$$

여기서 피적분함수를 power spectral density (PSD)라고 한다.

$$S(f) = \lim_{N\rightarrow \infty} E\left\lbrace \frac{X_p(f) X^*_p(f)}{(2N+1)T}\right\rbrace$$

# 2. Wold's Theorem의 증명

Wold's theorem의 결과는 다음과 같다.

$$S(f) = T\sum_{k=-\infty}^{\infty}R(k) \exp(-j2\pi fkT)$$

위의 S(f)의 정의를 이용해 이를 증명해보도록 하자.


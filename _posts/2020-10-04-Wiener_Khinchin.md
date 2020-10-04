---
title: 위너-킨친 정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201004
tags: 신호처리
---

# 1. Random Process와 Fourier Transform

[Continuous Time Fourier Transform](https://angeloyeo.github.io/2019/07/07/CTFT.html)(이하 CTFT)는 다음과 같이 정의된다.

$$G(\omega) = \int_{-\infty}^{\infty}g(t)\exp(-j\omega t)dt$$

where $\exp(-j\omega t) = \cos\omega t + j \sin \omega t$

이 때, Fourier Transform $G(\omega)$가 존재할 수 있는 조건은 Dirichlet Condition이라고 불리며, 그 조건은 다음과 같다.

1) $g(t)$ is absolutely integrable, that is,

$$\int_{-\infty}^{\infty}|g(t)|dt \lt \infty$$

2) $g(t)$ has only a finite number of discontinuouties in any finite interval

3) $g(t)$ has only finite number of maxima and minima within any finite interval

이 때, 우리가 궁금한 것은 왜 wide sense stationary 한 random process $X(t)$는 Fourier Transform이 될 수 없는지이다. 이 문제는 random process의 Fourier Transform은 왜 Dirichlet Condition을 만족할 수 없는지에 대한 문제로 귀결될 수 있다. 이 문제에 대한 핵심은 Dirichlet Condition 1번에 있다.

일반적으로 Stationary random process는 시간에 따라 random process $X(t)$의 pdf가 변하지 않는 것을 조건으로 하고 있다. 그 말은, random process $X(t)$의 realization 역시 시간 $t$에 따라 변하지 않는다는 것을 나타내며, $-\infty\lt x \lt \infty$에 대해서 $x(t)$는 언제나 유한한 값을 가질 수 있다는 것을 의미한다. 그러므로, Dirichlet condition 1은 위반 될 수 있으며, 일반적으로 random process $X(t)$의 Fourier Transform은 항상 존재하는 것은 아니다. 

간단한 예를 들자면 다음과 같다. 다음과 같은 random process $X(t)$를 생각해보자.

random process $X(t)$의 random variable의 realization은 0 또는 1인데, $P(X=0) = 0.1$ 이고 $P(X=1) = 0.9$인 random variable이 있다고 하자. 

그렇다면 random process 는 $-\infty\lt t \lt \infty$에 대해서 매우 낮은 확률로 $x(t) = 1 \text{ for }-\infty\lt t \lt \infty$일 수 있다. 그러면, 

$$\int_{-\infty}^{\infty}1 dt = \infty$$

이다. 이렇듯 간단한 예를 통해서도 random process의 Fourier Transform이 항상 존재하는 것은 아니라는 사실을 알 수 있다.

# 2. Power Spectral Density of a WSS process

※ WSS: Wide Sense Stationary

그렇다면, 위와 같은 문제를 해결해줄 수 있는 가장 간단한 방법은 무엇일까?

그것은 random process $X(t)$의 $t$축에 boundary를 지정해주는 것이다. 즉,

$$X_T(t) = \begin{cases} 

X(t) && \text{ for }-T\lt t \lt T \\

0 && \text{otherwise}

\end{cases}$$

와 같이 $X_T(t)$를 놓고 생각해보는 것이다. 그 이후에, $T\rightarrow \infty$라고 만들면 Power Spectrum을 추정할 수 있게 되는 것이다. Power Spectral Density of a Wide Sense Stationary process의 증명과정은 다음과 같다.

$X_T(t)$의 푸리에 변환은 다음과 같을 것이다.

$$X_T(\omega) = \int_{-T}^{T}X_t(t)\exp(-j\omega t) dt$$


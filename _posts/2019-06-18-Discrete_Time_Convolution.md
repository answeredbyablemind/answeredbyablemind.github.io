---
title: DiscreteTime  Convolution
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019061832
tags: 신호처리
---

아래의 과정은 모두 LTI system에서 생각하는 것임을 명기한다.

# 1. Discrete Time Convoltuion의 유도과정

## 1.1 DT domain에서의 convolution

개인적인 생각으론 convolution의 개념은 Digital Signal에서 출발하지 않았을까 싶다. Digital Signal에서 convolution의 개념을 파악해보는 것이 더 쉽다. 즉, 임의의 DT signal $x[n]$ 은 다음과 같다고 할 수 있다.

$$
x[n]=\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots
$$

또는 이렇게도 볼 수 있겠다.

$$
x[n]=\cdots + x[n+2]\delta[-2]+x[n+1]\delta[-1]+x[n]\delta[0]+x[n-1]\delta[1]+x[n-2]\delta[2]+\cdots
$$
 
식 (1)과 (2)를 통해서 알 수 있는 것은 무엇인가? 그것은 $x[n]$ 이라는 임의의 함수를 $\delta [n-k]$ 라는 함수를 이용해서 분해해 생각해 볼 수 있다는 것이었다. 즉, $x[n]$ 은 다음과 같이 써도 무방할 것이다.

$$
x[n]= \sum_{k=-\infty}^{\infty}x[k]\delta[n-k] = \sum_{k=-\infty}^{\infty}x[n-k]\delta[k]
$$

한편, 식 (3)을 XY 좌표 평면에서 생각해보자. impulse train $( p[n]=\sum_{k=-\infty}^{\infty}{\delta [n-k]} )$ 을 생각해볼 때, 식 (3)은 각각의 impulse에 $x[k]$ 라는 weight factor를 곱해주어 더해진 것이라고도 생각해 볼 수 있다. 그것은 $k$가 정수일 때, $x[k]$ 는 일정한 값을 가지는 상수이기 때문이다.


## 1.2 Impulse response와 convolution의 관계

또 한편, 입력 $x[n]$ 과 출력 $y[n]$ 의 관계를 다음과 같이 생각해보자.

출력 $y[n]$ 을 입력 $x[n]$ 의 어떠한 변환이라고 생각한다면, $y[n]=O_n \left(x[n] \right)$ 이라고 생각할 수 있다.

여기서 $O_n(x[n])$ 의 subletter n은 $O_n(x[n])$ 이 $n$ 에 관한 변환이라는 의미이다.

즉, system이라는 관점에서 보았을 때는 변환 $O_n(f[n] )$ 은 system이라고 볼 수 있겠지만, 우리는 단순히 수학적인 관점에서 이 $O_n( f[n])$ 을 생각해보도록 하자.


현재 고려하는 시스템은 LTI 시스템이기 때문에 다음이 성립한다.

$$
O_n\left( \sum_{k=-\infty}^{\infty}c_kx_k[n]\right) = \sum_{k=-\infty}^{\infty}{c_kO_n(x_k[n])}=\sum_{k=-\infty}^{\infty}{c_ky_k[n]} $$

$$(\because Linear System) \notag$$

$$
O_n \left(x[n-k] \right)=y[n-k]
$$

$$(\because Time-Invariant\space system) \notag$$


그렇다면, 다시 한번 식 (1)의 양변에 모두 변환 $O$를 취할 수 있기 때문에 다음이 성립한다.

$$O_n(x[n])=y[n] \notag$$

$$
=O_n\left(\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots \right) \notag
$$

$$
=O_n\left( \sum_{k=-\infty}^{\infty}{x[k]\delta[n-k]}\right)
$$

이 때, $x[k]$ 는 상수이고 $n$ 에 대한 함수가 아니기 때문에, linearity의 성질에 의해서 식 (6)은 다음과 같다.

$$
eq(6) = \sum_{k=-\infty}^{\infty}{\left(x[k]O_n\left(\delta[n-k]\right) \right)}
$$

라고 할 수 있다. 이 때, $h[n]=O_n\left(\delta[n]\right)$ 라는 정의와 Time-Invariant의 성질에 의해서

$$
 \sum_{k=-\infty}^{\infty}{\left(x[k]O_n\left(\delta[n-k]\right) \right)} = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}

$$

라는 수식을 만족할 수 있다.

다시 한번, 위 식은 $y[n]$ 과 같으므로,

$$y[n] = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}$$

라고 할 수 있으며 이것이 discrete time convolution의 정의이다.


또, 식 (3)에 의해서,

$$
y[n]= \sum_{k=-\infty}^{\infty}{x[k]h[n-k]} = \sum_{k=-\infty}^{\infty}{x[n-k]h[k]}
$$

라고 할 수 있으며 이 성질이 소위 말하는 Discrete Time Convolution에서 교환법칙이다.


<center><iframe width="420" height="315" src="https://www.youtube.com/embed/Yy4xhWPei4I" frameborder="0" allowfullscreen></iframe></center>

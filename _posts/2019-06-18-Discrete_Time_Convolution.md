---
title: 이산 컨볼루션과 LTI 시스템
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019061832
tags: 신호처리
---

# Unit impulse function

이산 컨볼루션을 생각 해보기에 앞서 단순하지만 아주 중요한 함수 하나를 생각해보자.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic1.png">
  <br>
  그림 1. 단위 임펄스(unit impulse) 함수
</p>

위 그림과 같이 정의된 함수를 단위 임펄스(unit impulse) 함수라고 부른다. 단위 임펄스 함수의 정의는 다음과 같다.

$$\delta[n]=\begin{cases}1, &\text{if } n=0 \\ 0, & \text{otherwise}\end{cases}$$

단위 임펄스 함수는 수에서 1과 같은 역할을 한다. 또, 벡터에서는 단위 기저벡터와 같은 역할을 한다.

무슨 말인지 조금만 생각해보자.

$\delta[n]$ 대신에 $\delta[n-2]$을 생각해보자.

$\delta[n-2]$는 $n=2$일 때 1의 값을 가지고 나머지 경우는 모두 0이다. 즉, $\delta[n]$이 오른쪽으로 2만큼 shift 한 것이다.

# 콘볼루션 합의 유도

이 개념을 조금만 더 확장해보면 임펄스를 이용해 임의의 신호를 분해해 표현할 수 있게 된다. 아래의 임의의 이산 신호 $x[n]$을 보자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic2.png">
  <br>
  그림 2. 임의의 이산 신호 $x[n]$
</p>

이 이산신호는 $\delta[n]$ 및 이것을 좌우로 shift한 함수들을 이용해 다음과 같이 표현할 수 있다.

[//]:# (식 (2))

$$x[n]=\sum_{k=-\infty}^{\infty}x[k]\delta[n-k]$$

[//]:# (식 (3))

$$=\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots$$

즉, $x[n]$ 이라는 임의의 함수를 $\delta [n-k]$ 라는 함수를 이용해서 분해할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic3.png">
  <br>
  그림 3. 임의의 이산함수 $x[n]$를 단위 임펄스 함수를 이용해 분해한 결과
</p>

식 (3)은 $x[n]$을 단위 임펄스 함수로 분해한 것으로 볼 수도 있고, 상수가 곱해진 신호열의 합으로 볼 수도 있다.

여기서 상수는 $x[k]$를 의미한다. $x[k]$는 $k$번째 함수값이라는 의미이기 때문에 더 이상 함수가 아닌 상수이다.

---

또 한편, 입력 $x[n]$ 과 출력 $y[n]$ 의 관계를 다음과 같이 생각해보자.

출력 $y[n]$ 을 입력 $x[n]$ 의 어떠한 변환이라고 생각한다면, $y[n]=T \left(x[n] \right)$ 이라고 생각할 수 있다.

현재 고려하는 시스템은 LTI 시스템이기 때문에 다음이 성립한다.

$$ T\left( \sum_{k=-\infty}^{\infty}c_kx_k[n]\right) = \sum_{k=-\infty}^{\infty}{c_kT(x_k[n])}=\sum_{k=-\infty}^{\infty}{c_ky_k[n]} $$

$$(\because Linear System) \notag$$

$$T \left(x[n-k] \right)=y[n-k]$$

$$(\because Time-Invariant\space system) \notag$$


그렇다면, 다시 한번 식 (3)의 양변에 모두 변환 $T$를 취할 수 있기 때문에 다음이 성립한다.

$$y[n] =T(x[n])\notag$$

$$=T\left(\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots \right)$$

$$=T\left( \sum_{k=-\infty}^{\infty}{x[k]\delta[n-k]}\right)$$

이 때, $x[k]$ 는 상수이고 $n$ 에 대한 함수가 아니기 때문에, linearity의 성질에 의해서 위 식은 다음과 같다.

$$\Rightarrow \sum_{k=-\infty}^{\infty}{\left(x[k]T\left(\delta[n-k]\right) \right)}$$

라고 할 수 있다. 이 때, $h[n]=T\left(\delta[n]\right)$ 라는 정의와 Time-Invariant의 성질에 의해서

$$ \sum_{k=-\infty}^{\infty}{\left(x[k]T\left(\delta[n-k]\right) \right)} = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}$$

라는 수식을 만족할 수 있다.

다시 한번, 위 식은 $y[n]$ 과 같으므로,

$$y[n] = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}$$

라고 할 수 있다.

다시 말해 모든 LTI 시스템은 입력과 임펄스 응답($h[n]$)의 콘볼루션 합으로 표현할 수 있음을 알 수 있다.

---
title: 이산 컨볼루션과 LTI 시스템
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019061832
tags: 신호처리
---

# Prerequisites

이번 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [선형 시불변(LTI) 시스템](https://angeloyeo.github.io/2022/01/11/LTI_system.html)

# Unit impulse function

이번 포스팅에서는 이산 컨볼루션에 대해 주로 알아보고자 한다. 그런데, 이산 컨볼루션을 생각 해보기에 앞서 단순하지만 아주 중요한 함수 하나를 생각해보자.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic1.png">
  <br>
  그림 1. 단위 임펄스(unit impulse) 함수
</p>

위 그림과 같이 정의된 함수를 단위 임펄스(unit impulse) 함수라고 부른다. 단위 임펄스 함수의 정의는 다음과 같다.

$$\delta[n]=\begin{cases}1, &\text{if } n=0 \\ 0, & \text{otherwise}\end{cases}$$

단위 임펄스 함수는 수에서 1과 같은 역할을 한다. 또, 벡터에서는 단위 기저벡터와 같은 역할을 한다.

# 이산 컨볼루션

## 이산 컨볼루션의 유도

단위 임펄스는 좌, 우로 평행이동이 가능하다. 가령, $\delta[n-2]$는 $\delta[n]$을 오른족으로 2만큼 shift 시킨 것이다.

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

식 (3)은 다음과 같이 기호로 표기하기도 한다.

$$\Rightarrow x[n] * \delta[n]$$

이 때, $*$ 연산을 컨볼루션 합이라고 부르기도 한다.

일반적으로 임의의 이산 함수 $x[n]$과 $h[n]$에 대해 두 함수의 컨볼루션 합은 다음과 같다.

$$x[n] * h[n] = \sum_{k=-\infty}^{\infty}x[k]h[n-k]$$

## LTI 시스템과 컨볼루션 합

입력 $x[n]$ 과 출력 $y[n]$ 의 관계를 다음과 같이 생각해보자. 출력 $y[n]$ 을 입력 $x[n]$ 의 어떠한 변환이라고 생각한다면, $y[n]=T \left(x[n] \right)$ 이라고 생각할 수 있다.

만약, 현재 고려하는 시스템이 LTI 시스템이라고 한다면 선형성에 의해 다음이 성립한다.

$$ T\left( \sum_{k=-\infty}^{\infty}c_kx_k[n]\right) = \sum_{k=-\infty}^{\infty}{c_kT(x_k[n])}=\sum_{k=-\infty}^{\infty}{c_ky_k[n]} $$

또, 시변성에 의해 다음이 성립한다.

$$T \left(x[n-k] \right)=y[n-k]$$


그렇다면, 다시 한번 식 (3)을 이용하여 아래의 식을 좀 더 전개해보자.

$$y[n] =T(x[n])\notag$$

$$=T\left(\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots \right)$$

$$=T\left( \sum_{k=-\infty}^{\infty}{x[k]\delta[n-k]}\right)$$

이 때, $x[k]$ 는 $n$에 대해서는 함수가 아닌 상수이기 때문에 linearity의 성질에 의해서 위 식은 다음과 같다.

$$\Rightarrow \sum_{k=-\infty}^{\infty}{\left(x[k]T\left(\delta[n-k]\right) \right)}$$

라고 할 수 있다. 이 때, $h[n]=T\left(\delta[n]\right)$ 라고 하자.

그러면 Time-Invariant의 성질에 의해서

$$ \Rightarrow \sum_{k=-\infty}^{\infty}{\left(x[k]T\left(\delta[n-k]\right) \right)} = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}$$

라는 수식을 만족할 수 있다.

다시 한번, 위 식은 $y[n]$ 과 같으므로,

$$y[n] = \sum_{k=-\infty}^{\infty}{x[k]h[n-k]}$$

라고 할 수 있다.

여기서 $h[n] = T\left(\delta[n]\right)$는 $\delta[n]$을 입력으로 했을 때의 변환이므로 해당 시스템에 대해 임펄스 입력을 줬을 때의 응답이다. 이를 임펄스 응답이라고 부른다.

다시 말해 다루고자 하는 시스템이 LTI 시스템이라면 입력과 임펄스 응답($h[n]$)의 이산 컨볼루션으로 시스템의 입출력 관계를 표현할 수 있다.

# 예제

## 문제 1.

아래와 같은 입출력 관계를 갖는 이동 평균 시스템에 대하여,

$$y[n]=\frac{1}{2}\left(x[n]+x[n-1]\right)$$

### 1) 이 시스템이 LTI 시스템인지 판별하시오.

우선 선형성부터 판별해보자.

시스템을 $\mathcal{T}(\cdot)$이라고 이름 붙이도록 하자.

그러면, 아래가 성립한다면 선형 시스템이다.

$$\mathcal{T}(\alpha x_1[n]+\beta x_2[n])=\alpha\mathcal{T}(x_1[n])+\beta\mathcal{T}(x_2[n])$$

좌변은 아래와 같고,

$$\mathcal{T}(\alpha x_1[n]+\beta x_2[n])=\frac{1}{2}\left\lbrace\alpha x_1[n]+\beta x_2[n] +\alpha x_1[n-1] + \beta x_2[n-1]\right\rbrace$$

우변은 아래와 같다.

$$\alpha\mathcal{T}(x_1[n])+\beta\mathcal{T}(x_2[n]) = \alpha \left(\frac{1}{2}(x_1[n]+x_1[n-1]\right)+\beta \left(\frac{1}{2}(x_2[n]+x_2[n-1]\right)$$

따라서, 좌변과 우변이 일치하므로 이 시스템은 선형 시스템이다.

이번엔 시불변성을 판별해보자. 아래가 성립한다면 시불변 시스템이다.

$$\mathcal{T}(x[n-k]) = y[n-k]$$

여기서 좌변은 아래와 같다.

$$\mathcal{T}(x[n-k]) = \frac{1}{2}\left(x[n-k]+x[n-k-1]\right)$$

또, 우변은 아래와 같으며 좌변과 동일하다.

$$y[n-k]=\frac{1}{2}\left(x[n-k]+x[n-k-1]\right)$$

그러므로 이 시스템은 시불변 시스템이기도 하다.

정리하면 이 시스템은 선형 시불변 시스템이다.

### 2) 이 시스템의 임펄스 응답을 계산하시오.

임펄스 응답 $h[n]$은 입력이 $x[n]=\delta[n]$인 경우의 응답을 말한다. 따라서, 임펄스 응답은 아래와 같다.

$$h[n]=\frac{1}{2}(\delta[n]+\delta[n-1])=\begin{cases} 0.5 & n = 0, 1 \\ 0 & \text{otherwise} \end{cases}$$

### 3) 특정 입력에 대한 출력을 계산하시오.

입력이 아래와 같다고 했을 때 출력을 계산하시오.

$$x[n]=\begin{cases} 1 & n = 0, 1, 2 \\ 0 & \text{otherwise} \end{cases}$$

LTI 시스템에선 입출력 관계를 입력과 임펄스 응답의 컨볼루션으로 계산할 수 있다.

따라서 출력값은 다음과 같다.

$$y[n]=h[n] * x[n]$$

$$=\sum_{k=-\infty}^\infty h[n-k]x[k]$$

따라서, 모든 가능한 n에 대해 고민해보자면 $y[n]$은 다음과 같다.

$n=-1$일 때 $y[-1]=\cdots + x[-1]h[0]+x[0]h[-1]+x[1]h[-2]+x[2]h[-3]+\cdots = 0$

$n= 0$일 때 $y[0]=\cdots + x[-1]h[1]+x[0]h[0]+x[1]h[-1]+x[2]h[-2]+\cdots = 0.5$

$n= 1$일 때 $y[1]=\cdots + x[-1]h[2]+x[0]h[1]+x[1]h[0]+x[2]h[-1]+\cdots = 1$

$n= 2$일 때 $y[2]=\cdots + x[-1]h[3]+x[0]h[2]+x[1]h[1]+x[2]h[0]+\cdots = 1$

$n= 3$일 때 $y[3]=\cdots + x[-1]h[4]+x[0]h[3]+x[1]h[2]+x[2]h[1]+\cdots = 0.5$

$n= 4$일 때 $y[4]=\cdots + x[-1]h[5]+x[0]h[4]+x[1]h[3]+x[2]h[2]+\cdots = 0$

이 과정을 그림으로 표현하자면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic4.gif">
  <br>
  그림 4. 이산 컨볼루션을 통해 출력값을 계산하게 되는 과정
  <br>
  <a href = "https://dspfirst.gatech.edu/matlab/">사용 GUI: DSP First의 MATLAB GUI 중 Discrete Convolution Demo</a>
</p>

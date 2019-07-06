---
title: 연속시간 컨볼루션(Continuous Time Convolution)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190701
---
{% raw %}
<p align="center"><iframe width = "530" height = "385" frameborder = "0" src="https://angeloyeo.github.io/p5/CT_Convolution_2/p5/"></iframe></p>

<center> 연속 시간 컨볼루션이 말하는 것: 연속함수는 잘개 쪼개서 표현될 수 있다.</center>

> 본 post에서는 linear time invariant (LTI) 시스템을 상정함.
>
> 또한, 용어는 아래와 같이 사용하고자 함.
>
> 이산 신호: discrete time signal
>
> 연속 신호: continuous time signal

# 1. 이산 신호의 convolution이 가지는 의미 [복습]

이번 시간에는 연속 시간 도메인에서 컨볼루션에 대해 생각해보고자 한다. 우리가 수학을 배울 때 연속 시간 신호(즉, 실수 함수)에 대해 먼저 배우고 대학에 와서야 이산 신호에 대해 배우지만, 사실 이해를 돕기위해서는 이산 시간 도메인에서 개념을 먼저 생각해본 뒤 연속 시간 신호의 관점으로 확장시키는 것이 도움이 되는 경우가 많다.

 이산 시간에서 convolution이 의미하는 것은 **임의의 함수 $x[n]$ 를 델타 함수 $\delta [n]$ 를 이용해 분해해서 생각할 수 있다**는 것이었다. 식으로 쓰자면,


 $$
 x[n]=\cdots + x[-2]\delta[n+2]+x[-1]\delta[n+1]+x[0]\delta[n]+x[1]\delta[n-1]+x[2]\delta[n-2]+\cdots \notag
 $$

 $$
 = \sum_{k=-\infty}^{\infty}x[k]\delta[n-k] = \sum_{k=-\infty}^{\infty}x[n-k]\delta[k]
 $$

그러니까, 식 (1)은 조금 자세히 보면 함수 $x[n]$ 을 "함수 값 $\times \delta[n]$" 으로 나타낼 수 있다는 걸 알 수 있다. 그렇다면 연속 시간 신호도 함수값과 delta 함수를 이용하면 임의의 신호 $x(t)$ 를 분해할 수 있지 않을까?

이산 신호는 경우에 따라 연속 신호를 sampling한 것으로 볼 수 있다. 이산 신호의 컨볼루션 개념에서부터 연속 신호 컨볼루션의 개념을 이해하고자 한다면 그 연결고리는 sampling에서 찾을 수 있을 것이다. 따라서, 연속신호의 간단한 샘플링 방법에 대해 소개하고자 한다.

# 2. CT signal의 샘플링 방법: Sample and Hold

연속 신호 시간 신호를 sampling 하는 방법 중 가장 간단한 방법 중 하나는 **sample and hold**이다. Sample and hold는 아날로그 신호를 측정한 뒤 한 주기 동안 유지하는 방법이다. 특별히 이번 post에서는 0차 sample and hold에 대해서만 간략히 소개하고자 한다.

아래 그림에서 회색으로 표현된 신호는 원래 신호이며, 빨간색 선으로 나타낸 신호는 0차 sample and hold를 이용해 sampling한 신호이다.

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/1/15/Zeroorderhold.signal.svg
">
</p>



이번 post에서는 0차 sample and hold와 비슷한 방식으로 rect함수를 이용해


# 2. CT domain에서의 convolution

이제, CT signal도 $\delta(t)$의 개념이 들어왔기 때문에 어떠한 신호도 분해해서 볼 수 있다. 그렇기 때문에 DT Signal에서와 마찬가지로 LTI의 성질을 이용하면

<center><img src="http://bit.ly/1JXRATS"></center>


라는 사실을 알 수 있다.


<center> <iframe width="420" height="315" src="https://www.youtube.com/embed/HLYxnTV1N5k" frameborder="0" allowfullscreen></iframe> </center>

{% endraw %}

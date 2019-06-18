---
title: impulse response
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019061831
---

아래의 과정은 모두 LTI(Linear Time-Invariant) system에서 생각하는 것임을 명기한다.

# 1. 서론

Signals and Systems 시간에서 배우는 System의 특징 중 가장 중요한 특징 중 하나는 system의 causality이다. Causal 하다고 하는 것은, 신호의 입장에서 보았을 때 신호의 과거와 현재의 값만 갖고 작동하는 시스템을 칭하는 것이다.

그런데, 항상 causal system의 impulse response는 음의 $n$ 또는 $t$ 에 대해서 값이 0이어야 한다고 한다. 왜 과거와 현재의 값만 갖고 작동하는 시스템의 impulse response는 음의 $n$ 또는 $t$ 에 대해서 그 impulse response는 $0$ 이어야 한단 말인가?

# 2. 본론.

## 2-1. System의 input&output의 관계 식에 대하여.

먼저, 그 이유를 알기 위해서는 System의 input과 output이 impulse response를 통해서 어떻게 표현되는지 다시 한번 생각해 볼 필요가 있다.

그것은, input signal을 $x[n]$ 이라고 하고, output signal을 $y[n]$ 이라고 하며, 해당 시스템의 impulse response를 $h[n]$ 이라고 했을 때, $x[n], \space y[n], \space h[n]$ 의 관계는 convolution을 통해서 나타낼 수 있다.

$$
y[n] = x[n] \star h[n] = h[n] \star x[n]
$$

$$
= \sum_{k=-\infty}^{\infty} x[k] h[n-k] = \sum_{k=-\infty}^{\infty} x[n-k] h[k]
$$

라고 말이다.

## 2-2. 시스템이 과거와 현재의 시간의 input만을 가지려면?

위에 Convolution을 통해서 표현된 식을 다시 한번 풀어서 생각해보자.

$$
y[n] = \sum_{k=-\infty}^{\infty}h[k]\space x[n-k] = \notag
$$

$$
\cdots +h[-2]\space x[n+2]+h[-1]\space x[n+1] \notag
$$

$$
+ h[0]\space x[n] \notag
$$

$$
+h[1]\space x[n-1] + h[2]\space x[n-2]+\cdots
$$

이렇게 생각할 수 있지 않을까?

이 때 이 식은 세 줄로 나눠서 적은 것을 알 수 있다.

input의 입장에서 보았을 때, 현재값은 무엇인가? $x[n]$ 이다.

과거 값은 무엇인가? $x[n-1], x[n-2], \cdots$ 이다.

미래값은? $x[n+1], x[n+2], \cdots$ 이다.

그렇다면, 어떤 시스템이 현재값과 과거값만 가져야 하는 시스템이라면?

미래값에 해당하는 impulse response의 값은 모두 0이 되어야 할 것이다.


즉, $h[k]=0\space for \space k<0$ 은 이 system이 causal system이라는 것과 동치라고 할 수 있다.

# 3. 결론

우리는 discrete convolution을 풀어가면서 causal system의 impulse response를 생각해보았다.

또한, causal system의 impulse response이 갖는 조건에 대해 알아보았다. 여기서 causal system의 조건이

$$h[k]=0 \space for \space k<0$$

 이라는 사실을 원리적으로 확인해보았다.

<center>
<iframe width="420" height="315" src="https://www.youtube.com/embed/E-DkbBSsPVY" frameborder="0" allowfullscreen></iframe>
</center>

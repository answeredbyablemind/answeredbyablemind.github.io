---
title: 푸리에 시리즈(Fourier Seris)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2019062341
---

<p align="center"><iframe width = "600" height = "400" frameborder = "0" src="https://angeloyeo.github.io/p5/Fourier_Series_Practice/"></iframe></p>

\#2. Continuous Time Fourier Series
\##가. Orthogonal Functions
많은 학생들이 Fourier Analysis의 Formulae를 공부할 때, 가장 쉽게 간과하는 부분이 바로 푸리에 급수의 공식 유도 방법이다. 푸리에 급수의 공식은 가장 먼저 함수의 Orthogonality에서부터 출발해야 한다. 함수의 Orthogonality에 대한 개념은, 수학에서는 함수를 벡터처럼 다룰 수도 있다는 것에서 부터 출발한다. 즉, 수학적인 의미에서 함수 역시 마찬가지로 Inner Product를 정의할 수 있다.

* * *

> DEFINITION 1.
>
> 함수의 내적
>
> 구간 [a, b]에서 두 함수의 내적은 다음과 같이 정의된다.
>
> <center><img src="http://bit.ly/1JXP9kn"></center>

Inner Product의 정의로부터 Orthogonal function의 정의를 얻을 수 있다. Vector Analysis에 있어서 vector가 orthogonal 하다는 것은 두 벡터의 Inner product의 결과 값이 0이라는 것을 의미한다. 마찬가지로 두 함수의 inner product의 값이 0일 때 두 함수는 orthogonal 하다고 할 수 있다.

> DEFINITION 2.
>
> 직교 함수.
>
> 다음이 성립할 경우 구간 [a, b]에서 두 함수는 직교한다고 한다.
>
> <center><img src="http://bit.ly/1JXPcMM"></center>

주의해야 할 점이 하나있다면,  함수가 orthogonal하다는 것은 벡터 analysis에서와는 달리 기하학적으로 수직인 것과는 관련 있는 것이 아니라는 점이다.함수의 orthogonality에 대해서 짚고 꼭 넘어가야 할 정의는 orthogonal set에 대한 정의이다.

> DEFINITION 3. 직교 집합 (orthogonal set)
>
> 구간 [a, b]에서 다음을 만족한다면 실수 함수 {}의 집합은 직교 집합(orthogonal set)이다.
>
> <center><img src="http://bit.ly/1JXPfs5"></center>

 그렇다면 이 Orthogonal Set은 왜 중요한 것일까? 그것은 구간 [a, b]에서 정의된 함수 $y=f(x)$는 같은 구간 [a,b]에서 정의된 Orthogonal set을 이용하면 상수 , n=0,1,2,...와 linearly decompose될 수 있기 때문이다. 즉,

<center><img src="http://bit.ly/1OFg2Gt"></center>

또는

<center><img src="http://bit.ly/1OFg3dv"></center>

와 같이 linearly decompose될 수 있기 때문이다.

\##나. Continuous Time Fourier Series

### 1) Continuous Time Fourier Series의 정의 (그리고 약간의 잔소리)

Continuous Time Fourier Series의 정의는 아래와 같다.

* * *

DEFINITION4. Continuous Time Fourier Series

x(t)=x(t+T)를 만족하는 어떠한 신호 x(t)도 다음과 같이 쓸 수 있다.

<center><img src="http://bit.ly/1OFg6pv"></center>

<center><img src="http://bit.ly/1JXPh33"></center>

* * *

 개인적인 의견이지만, 푸리에 급수가 학생들에게 어렵게 느껴지는 이유는 이 때 부터라고 생각된다. 그 이유는 첫 번째로 푸리에 급수는 원래 “주장(claim)“이기 때문이다. 즉, 구간 [0,T]에서 정의된 어떠한 주기 T를 가지는 주기함수는 복소함수 $e^{j\\theta}$의 linear combination으로 분해될 수 있다는 주장이다. 일반적으로 대부분의 수학 공식은 그 바닥부터 차근차근 설명해준다. 천천히 기초부터 쌓아가기 때문에 조금 조금씩 이해해가면, 뒤돌아보면 꽤 어려운 개념까지도 올라올 수 있게 되는 것이다. 하지만, 푸리에 급수의 경우는 이야기가 약간 다르게 보인다. 그것은 다시 한번 푸리에 급수는 ”주장“에 불과하기 때문이다. (후에 주장이 사실이라는 것을 증명하도록 하겠지만). 하지만, 앞서 이 글의 첫 부분에서 설명했던 ‘적분변환’과 함수의 ’orthogonality’를 잘 생각해본다면 Fourier Series는 ‘적분변환’과 ‘함수의 Orthognonality를 이용한 주기 함수의 Decomposition’의 일종에 불과하다는 것을 알 수 있을 것이다.

 또한 푸리에 급수가 학생들에게 어렵게 느껴지는 두 번째 이유는 x(t)가 DEFINITION 4에서와 같이 decompose된다는 사실보다는 의 공식에 집중하기 때문이다. $a_k$에는 꼭 $\\frac{1}{T}$가 곱해진다던지, 적분구간의 범위가 –T/2에서 T/2라던지 하는 것들이다. 혹은 exponential의 power에 음수가 붙는다던지 하는 것들이다. 하지만, 우리가 진짜로 집중해야 하는 부분은 가 아니라 라는 것을 거듭 강조하고 싶다.

\###2) CTFS라고 불리는 주장에 대한 증명
먼저, 다시 한번 CTFS의 식, x(t)를 살펴보자.

<center><img src="http://bit.ly/1OFg6pv"></center>

위 식에서 알 수 있는 사실은 어떠한 주기함수 x(t)는 특정한 함수의 집합

<center><img src="http://bit.ly/1JXPlA2"></center>

에 의해서 decompose되었다는 것이다. 그렇다면, $x(t)$의 식의 수학적 타당성에 대해서는 집합 {$\\phi_k(t)$}가 an orthogonal set이라는 것을 증명하면 입증되는 것이라고 할 수 있다.

* * *

PROOF 1.

아래의 집합의 직교성에 관한 증명

<center><img src="http://bit.ly/1JXPpQm"></center>

Proof)

서로 다른 정수 k와 p에 대하여,

<center>
<img src="http://bit.ly/1OFgi8i">

<img src="http://bit.ly/1JXPrHY">

<img src="http://bit.ly/1OFgmF3">

</center>

(1) $k=p$ 일 때,

식 (1) <img src="http://bit.ly/1JXPtzp">

(2) $k\\neq p$ 일 때,

식 (1)= <img src="http://bit.ly/1OFgqok">

<img src="http://bit.ly/1JXPy6b">

여기서, k와 p는 서로 다른 정수이므로, k-p도 정수이다.

<center><img src="http://bit.ly/1JXPzqP"></center>

그러므로 집합 <img src="http://bit.ly/1JXPpQm"> 은 직교 집합이다.

<right>Q.E.D.</right>

* * *

즉, {$\\phi_k(t)$}가 an orthogonal set이기 때문에 같은 구간 [0,T]에서 정의되는 함수 x(t)는 {$\\phi_k(t)$}를 통해서 decompose될 수 있다. 그러므로, 식

<center><img src="http://bit.ly/1OFg6pv"></center>

는 수학적으로 타당한 주장이라고 할 수 있다.

또한 상수 $a_k$를 구하는 방법에 대해서 생각해보아야 한다. 상수 $a_k$는 함수의 orthogonality의 성질을 이용해야
유도해낼 수 있다.

* * *

PROOF 2. 계수 $a_k$의 결정에 관한 증명

Proof) PROOF 1로 부터, $x(t)$ 는 다음과 같이 나타낼 수 있다.

<center><img src="http://bit.ly/1OFg6pv"></center>

양변에 $\\phi^{\*}\_p (t)=exp(-j\\frac{2\\pi p}{T}t)$를 곱하고 적분을 취해주면 다음과 같은 식을 얻는다.

<center>

<img src="http://bit.ly/1OFhM2d">

<img src="http://bit.ly/1JXPF1w">

</center>

이 때, 정수 k와 p에 대하여 두 가지 경우가 있을 수 있다.

case 1. $k\\neq p$ 일 때,

<img src="http://bit.ly/1JXPHXj">

<img src="http://bit.ly/1JXPIdR">

<img src="http://bit.ly/1JXPJhO">

<img src="http://bit.ly/1OFgIeV">

case 2. $k=p$ 일 때,

<img src="http://bit.ly/1JXPHXj">

<img src="http://bit.ly/1OFgLao">

<img src="http://bit.ly/1JXPPpU">

$p=k$라고 할 수 있으므로,

<center>

<img src="http://bit.ly/1OFgPak">

</center>

Q.E.D.

* * *

다시 한번 말하지만, 위의 증명의 기초적인 아이디어는 orthogonality를 이용한다는 것이다.

\###3) CTFS에서 kernel function은 왜 exponential인가?

위의 내용에서 확인한 바는 다음과 같다. J. Fourier가 주장인 T를 주기로 하는 주기함수 x(t)에 대해서

<center>
<img src="http://bit.ly/1OFgWm6">

where

<img src="http://bit.ly/1OFgXGV">
</center>
은 수학적으로 타당한 것이다.

그렇다면 J. Fourier의 이론은 왜 중요한 것인가? 그것은 CTFS라고 불리는 위의 Fourier Series의 kernel function인

<center><img src="http://bit.ly/1OFh6Ku"></center>

에 있다.간단히 설명하자면, CTFS는 주기함수를 또 다른 주기 함수인 sinusoidal function을 통해서 나타낼 수 있다는 것을 증명했기 때문이다. 특히, 기초적이고 수학적으로 다루기 쉬운 sinusoidal function을 통해서 모든 주기함수를 decompose할 수 있다는 점에서 CTFS는 중요한 것이다.

<img src="http://bit.ly/1OFh6Ku">가 sinusoidal function과 연관되어 있다는 사실은 Euler Equation($e^{i\\theta}=cos\\theta+i sin\\theta$)을 통해서 알 수 있다.

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/7JRwjCpKewQ" frameborder="0" allowfullscreen></iframe></center>

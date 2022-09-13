---
title: 체르노프 유계(Chernoff Bound)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220913
tags: 통계학
---


## Lower-Tail Chernoff Bound

$X$가 $N$ 개의 독립적인 랜덤변수의 합이라고 하자. 이 때 이 랜덤 변수들은 베르누이 분포를 따르며 $p_i$의 확률로 1의 값을 갖는다.

$$X = \sum_{i=1}^{N}X_i$$

[//]:# (식 1)

이 때, 임의의 $\delta\in (0, 1)$에 대해 다음이 성립한다.

$$P(X \lt (1-\delta)E[X]) \lt e^{-E[X]\cdot \delta^2/2}$$

[//]:# (식 2)

여기서 $e$는 자연로그의 밑이다.

(증명)

우선 아래의 부등식이 성립한다는 것을 증명하자.

$$P(X \lt (1-\delta) E[X]) \lt \left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}$$

[//]:# (식 3)

이를 증명하기 위해 임의의 매개변수 $t>0$을 도입하자. 이 $t$를 이용해 우리는 $X$에 대한 식을 $e^{-tX}$에 대한 식으로 변환할 것이다. 이 방법은 적률생성함수(moment generating function)을 활용하는 원리와 유사하게 볼 수 있는데, 원래의 $X$ domain에서 풀기 어려운 문제를 매개변수 $t$ 도메인으로 옮겨 문제를 상대적으로 쉽게 풀기 위함이라고 볼 수도 있다.

식 (3)을 증명하기 위해 [마르코프 부등식](https://angeloyeo.github.io/2022/09/12/Markov_Chebyshev_Inequality.html)의 식을 $X$ 대신 $e^{-tX}$에 맞춰 수정하자. 원래의 마르코프 부등식은 아래와 같다.

$$P(X\lt \alpha) \leq \frac{E[X]}{\alpha}$$

[//]:# (식 4)

여기서 우변을 바꿔주면,

$$P(X\lt\alpha) \leq \frac{E[e^{-tX}]}{e^{-t\alpha}}$$

[//]:# (식 5)

가 된다.

식 (5)를 식 (2)의 좌변에 맞춰 적용하면 결과는 아래와 같다. 여기서 $\alpha = (1-\delta)E[X]$이므로,

$$\Rightarrow P(X\lt (1-\delta)E[X]) \leq \frac{E[e^{-tX}]}{e^{-t(1-\delta)E[X]}}$$

[//]:# (식 6)

이 성립한다. 또 $X$를 구성하고 있는 $X_i$ 들은 독립적으로 발생한 사건이다. 위 식의 우변의 분자를 보면,

$$E[e^{-tX}]=E[e^{-t\cdot\sum_{i}X_i}]=E[e^{-t(X_1+X_2+\cdots+X_N)}]\notag$$

$$=E[e^{-tX_1}\cdot e^{-tX_2}\cdot e^{-tX_3}\cdot \cdots \cdot e^{-t X_N}]$$

[//]:# (식 7)

과 같이 쓸 수 있는데,


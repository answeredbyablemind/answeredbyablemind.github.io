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

과 같이 쓸 수 있는데, 독립 랜덤 변수의 곱의 기댓값은 기댓값들의 곱이므로 위 식은 아래와 같이 고쳐쓸 수 있다.

$$\Rightarrow E[e^{-tX_1}\cdot e^{-tX_2}\cdots e^{-tX_N}]=\prod_{i=1}^{N}E[e^{-tX_i}]$$

[//]:# (식 8)

위 식의 $E[e^{-tX_i}]$를 자세히 보면 베르누이 분포를 따르는 시행 $X_i$에 대한 변환식 $e^{-tX_i}$의 기댓값임을 알 수 있다. $X_i$는 $(1-p_i)$ 혹은 $p_i$의 확률로 0 또는 1의 값을 가지므로 $X_i$의 기댓값은

$$E[X_i] = (1-p_i)\cdot 0 + p_i \cdot 1 = p_i$$

이며, $e^{-tX_i}$의 기댓값은 

$$E[e^{-tX_i}]=(1-p_i)e^{-t\cdot 0}+p_i e^{-t\cdot 1}\notag$$

$$=1-p_i + p_i e^{-t}=1+p_i(e^{-t}-1)\notag$$

$$ = 1+E[X_i](e^{-t}-1)$$

임을 알 수 있다. 또한 위 식의 마지막 결과물은 $\exp(E[X_i]\cdot(e^{-t}-1))$의 테일러 급수 두 항과 일치한다는 점을 고려하면 다음이 성립함을 알 수 있다.

$$E[e^{-tX_i}]=1+E[X_i](e^{-t}-1) \lt e^{E[X_i](e^{-t}-1)}$$

[//]:# (식 11)

식 (11)을 식 (8)에 다시 대입하면,

$$\prod_{i=1}^{N}E[e^{-tX_i}]\lt\prod_{i=1}^{N}e^{E[X_i](e^{-t}-1)}$$

이 성립하게 됨을 알 수 있는데, 위 식의 우변을 또 다시 쓰면,

$$\prod_{i=1}^{N}\exp(E[X_i](e^{-t}-1))=\exp\left(\sum_{i=1}^{N}E[X_i]\cdot (e^{-t}-1)\right)=\exp\left(E[X](e^{-t}-1)\right)$$

[//]:# (식 13)

이다. 따라서 식 (13)의 결과를 식 (6)에 대입하면 아래와 같은 식을 얻을 수 있다.

$$P(X<(1-\delta)E[X]) \leq \frac{\exp\left(E[X](e^{-t}-1)\right)}{\exp\left(\right)}$$

위 식은 어떤 $t>0$에 대해서라도 성립하는 식이다. 이제는 식 (14)가 최대한 tight한 boundary에 대해 성립할 수 있도록 식 (14)의 최소값을 내주는 $t=t^*$ 값을 찾자. 이 과정은 식 (14)를 미분하고 미분한 값이 $0$이 되는 $t^*$를 찾음으로써 해결할 수 있다. 이 과정은 생략하며 $t^*$는 다음과 같다는 것을 알 수 있다.

$$t^* = \ln\left(\frac{1}{1-\delta}\right)$$

[//]:# (식 15)

식 (15)를 식 (14)에 대입하면 식 (3)을 얻을 수 있게 된다. 식 (15)를 식 (14)에 대입하면,

$$\Rightarrow P(X<(1-\delta) E[X])\leq 
  \frac{\exp\left(E[X]\left(e^{-\ln\left(1/(1-\delta)\right)}-1\right)\right)}{\exp\left(-\ln(1/(1-\delta))(1-\delta)E[X]\right)}$$

여기서 우변만 보면 다음과 같다.

$$\text{(우변)}\Rightarrow \frac{E[X](1-\delta -1)}{\exp(-(1-\delta)E[X]\ln\left(1/(1-\delta)\right))}$$

$$=\frac{\exp(E[X](-\delta))}{\exp(\ln(1-\delta)^{(1-\delta E[X])})}=\frac{\exp(-\delta E[X])}{(1-\delta)^{(1-\delta)E[X]}}$$

$$=\left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}$$

한편, 

$$\ln(1-x)=-x-\frac{x^2}{2}-\frac{x^3}{3}\cdots = -\sum_{i=1}^{N}\frac{x^n}{n}$$

이므로,

$$(1-\delta)\ln(1-\delta)= - (1-\delta)\delta - (1-\delta)\frac{\delta^2}{2}\cdots \notag$$

$$-\delta+\delta^2-\frac{\delta^2}{2}+\frac{\delta^3}{2}\cdots$$

$$=-\delta+\delta^2/2+\cdots$$

과 같다. 따라서 

$$(1-\delta)\ln(1-\delta) \gt -\delta +\frac{\delta^2}{2}$$

가 성립하며 로그의 성질에 따라

$$(1-\delta)^{(1-\delta)}\gt\exp\left(-\delta + \frac{\delta^2}{2}\right)$$

가 성립함을 알 수 있다.

따라서, 식 (23)을 식(18)에 대입하면,

$$\left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}\lt \left(\frac{e^{-\delta}}{e^{(-\delta+\delta^2/2)}}\right)^{E[X]}$$

$$\Rightarrow \left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}\lt \left(e^{-\delta^2/2}\right)^{E[X]}$$

이다. 따라서, 이 결과를 식 (16)과 식 (19)에 대입하면,

$$\Rightarrow P(X\lt (1-\delta)E[X])\lt \exp(-E[X]\delta^2/2)$$

[//]:# (식 26)

이다.

(증명 끝)

## Upper-Tail Chernoff Bound

---
title: 베이즈 정리로 이해하는 칼만 필터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210407
tags: 통계학 신호처리
---

<center>
  <iframe width = "550" height = "550" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-07-Kalman_filter/"></iframe>
  <br>
  칼만필터를 이용한 마우스 움직임 Tracking. 만약 내 손이 심하게 떨고 있을 때, 칼만 필터는 떨지 않았을 경우의 마우스 궤적을 추정해주는데 쓰일 수 있다.
</center>

# Prerequisites

본 페이지에서 소개하는 칼만필터를 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [베이즈 정리의 의미](https://angeloyeo.github.io/2020/01/09/Bayes_rule.html)

# 베이즈 정리, 실재론, 그리고 칼만 필터

칼만 필터: 어제보다 나은 오늘의 나

# 베이즈 정리

기존의 앎($H$), 새로운 가르침($E$), 깨달음($H\|E$).

$$P(H|E) = \frac{P(E|H)P(H)}{P(E)}$$

공부라는 것이 기존에 알고 있던 것에 새로운 가르침이 내려오면 그것을 바탕으로 깨닫고 한발 더 나아갈 수 있다.

가르침에 100% 다가가지는 못할 수 있지만, 나의 앎은 점점 더 나은 상태로 도달할 것으로 믿을 수 있다.

# 신호 획득 과정 모델링

## 물자체와 현상

$$z_k = Hx_k + v_k$$

$x_k$는 물자체. 우리가 보지 못하는 것이 들어있을 수도 있다.

여기있는 어떤 것을 우리가 예측해야 할 수도 있다. 가령, Applet의 마우스의 속도는 우리가 보지 못하는 것일 수 있다.

$z_k$는 현상. 우리가 측정할 수 있는 것. 가령, 마우스의 위치는 측정할 수 있다.

$H$는 물자체를 현상으로 매개해주는 변환 과정을 행렬로 나타낸 것이라고 생각할 수 있다.

현재 마우스의 위치와 속도를 알면 다음번 마우스의 위치를 정확하게 계산할 수 있게 된다.

$v_k$는 측정 에러이며, 평균이 0인 가우시안 분포를 따른다고 가정함.

## 카르마(업보)의 연쇄

$$x_{k+1} = \Phi x_k + w_k$$

현재가 어떻게 미래에 영향을 미치는가?

혹은 현재는 어떻게 과거로부터 영향을 받는가?

# 칼만 필터에서의 Update과정

$$P(\hat{x}_k)=\frac{P(z_k|\hat{x}_k')P(\hat{x}_k')}{P(z_k)}$$

$$=\frac{P(z_k|\hat{x}_k')P(\hat{x}_k')}{\int P(z_k|\hat{x}_k')P(\hat{x}_k') d\hat{x}_k'}$$

$$=\frac{1}{Z}P(z_k|\hat{x}_k')P(\hat{x}_k')$$

---

$$\mathcal{N}(x, \mu_0, \sigma_0)\cdot\mathcal{N}(x, \mu_1, \sigma_1) = \mathcal{N}(x, \mu', \sigma')$$

$$\mu' = \mu_0 +\frac{\sigma_0^2(\mu_1-\mu_0)}{\sigma_0^2 + \sigma_1^2}$$

$$\sigma'^2=\sigma_0^2 -\frac{\sigma_0^4}{\sigma_0^2 + \sigma_1^2}$$

여기서 $\mu'$과 $\sigma'^2$에 공통적으로 포함된 부분을 아래와 같이 새로운 변수로 설정해보자.

$$k=\frac{\sigma_0^2}{\sigma_0^2 + \sigma_1^2}$$

그러면 $\mu'$에 관한 식은 아래와 같이 쓸 수 있다.

$$\mu' = \mu_0 + k(\mu_1 - \mu_0)$$

$$=(1-k)\mu_0 +k \mu_1$$

다시 말해 새로운 $\mu'$는 $\mu_0$와 $\mu_1$를 적절히 섞은 것으로 생각할 수 있으며, $k$가 클 수록 $\mu_1$의 값을 더 많이 섞어준다는 의미이다. (생각해보면 $k$는 최대 1일 것이다.)

다시 말해 $\sigma_0^2$가 크면 클 수록 $\mu'$는 $\mu_1$의 값을 더 많이 가져오고, $\sigma_0^2$가 작아지면 작아질 수록 $\mu'$는 $\mu_0$의 값을 더 많이 가져온다는 의미를 가진다.




# 참고 문헌

* [Tutorial: The Kalman Filter, Tony Lacey, MIT](http://web.mit.edu/kirtley/kirtley/binlustuff/literature/control/Kalman%20filter.pdf)
* [Understanding Kalman Filters, Melda Ulusoy, Mathworks](https://kr.mathworks.com/videos/series/understanding-kalman-filters.html)
* [Product and convolutions of Gaussian Probability Density Functions](http://www.lucamartino.altervista.org/2003-003.pdf)
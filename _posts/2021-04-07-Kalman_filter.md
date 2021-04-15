---
title: 칼만 필터
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

[//]:# (어떤 부분에 포커를 맞춰 설명할지 계속 고민해볼 것...)

[//]:# (비유를 너무 많이 이용하는 것 같아 불편함... 설명하다가도 생각 두 번 해야 하고...)

# Prerequisites

본 페이지에서 소개하는 칼만필터를 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [베이즈 정리의 의미](https://angeloyeo.github.io/2020/01/09/Bayes_rule.html)

# 칼만 필터가 해주는 일

다음번 위치가 어디가 될 지 예상해준다는 식의 내용 포함 필요.

공의 궤적에 대한 추정. 빨간색 원의 크기가 클 수록 다음 번 스텝에 대한 예측이 불확실하다는 것을 의미함.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/MxwVwCuBEDA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

# 정규 분포

칼만 필터는 불확실성을 정규분포를 이용해 표현함.

## 두 정규 분포의 곱(product)

[Products and Convolutions of Gaussian Probability Density Functions](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.583.3007&rep=rep1&type=pdf)

## 두 정규 분포의 합성곱(convolution)

The full result is that if $F$ is the gaussian distribution with mean $\mu$ and variance $\sigma^2$, and $G$ is the gaussian distribution with mean $\nu$ and variance $\tau^2$, then $F*G$ is the gaussian distribution with mean $\mu+\nu$ and variance $\sigma^2+\tau^2$
.

# 베이즈 정리: Update Rule

$$P(H|E) = \frac{P(E|H)P(H)}{P(E)}$$

# 위치 추정과 이동

## 정규분포를 이용한 불확실도의 표현

정규 분포의 parameter는 평균, 분산 두 가지로 구성되어 있다.

위치에 대한 불확실도와 이동에 대한 불확실도. 모두 가우시안으로 표현할 수 있음.

확률적인 위치 추정 = Gaussian 분포로 표현

## 이동 = Convolution

# Kalman filter의 작동 과정

## Predict the next position

## Additional Measure & Update


$$P(Hx)=\frac{P(z|H\hat{x})P(H\hat{x})}{P(z)}$$

$$=\frac{P(z|H\hat{x})P(H\hat{x})}{\int P(z|H\hat{x})P(H\hat{x}) dH\hat{x}}$$

$$=\frac{1}{Z}P(z|H\hat{x})P(H\hat{x})$$

여기서 $Z$는 measurement에 대한 확률값을 나타낸 것인데, 이 값의 역할은 Posterior, P(Hx)를 정규화해 줌으로써 전체 면적이 1이될 수 있도록 해주는 역할만을 수행해주는 것이다.

그런데, 만약 이 정규화 과정을 수행해주지 않았다고 P(Hx)에서 말해주는 평균값의 위치가 변할까? 그리고, 분산 값이 변할까? 전혀 그렇지 않을 것이다. 정규화 과정이 해주는 일은 확률 분포 함수의 높이만을 조정해주는 것이지 그 함수의 파라미터까지 수정하는 것은 아니기 때문이다.

따라서, 우리가 원하는 것이 Posterior의 파라미터만을 아는 것이라면 Prior와 Likelihood의 곱만을 이용해서 Posterior의 파라미터를 구하면 충분할 것이다.

칼만필터에서는 Prior, Likelihood, Posterior 모두 정규분포를 따른다고 가정한다.

그런데, 놀랍게도, 정규분포와 정규분포를 곱해주면 또 다른 정규분포가 얻어진다고 알려져 있다.

다음과 같이 평균, 분산이 각각 $(\mu_0, \sigma_0^2), (\mu_1, \sigma_1^2)$인 두 정규분포가 곱해져서 얻어지는 정규분포의 평균, 분산이 $(\mu_2, \sigma_2^2)$라고 하면 다음과 같은 관계로 표현할 수 있다.

$$\mathcal{N}(\mu_0, \sigma_0^2)\cdot\mathcal{N}(\mu_1, \sigma_1^2) = \mathcal{N}(\mu_2, \sigma_2^2)$$

<center>where</center>

$$\mu_2 = \mu_1 +\frac{\sigma_0^2(\mu_1-\mu_0)}{\sigma_0^2 + \sigma_1^2}$$

$$\sigma_2^2 = \sigma_0^2 -\frac{\sigma_0^4}{\sigma_0^2 + \sigma_1^2}$$

위 공식을 활용하여 우리가 풀고자하는 문제의 변수로 치환하면 다음과 같이 치환해야 한다.

* $\mu_0 \Rightarrow H\hat{x}$

* $\sigma_0^2 \Rightarrow H\sigma_{\hat{x}}^2$

* $\mu_1 \Rightarrow z$

* $\sigma_1^2 \Rightarrow \sigma_{z}^2$

* $\mu_2 \Rightarrow Hx$

* $\sigma_2^2 \Rightarrow H\sigma_{x}^2$

그러면 원래의 두 정규분포의 곱과 그의 결과에 대한 식을 다음과 같이 쓸 수 있다.

$$\mathcal{N}(r, H\hat{x}, H\sigma_{\hat{x}}^2)\cdot\mathcal{N}(r, z, \sigma_1^2) = \mathcal{N}(r, Hx, H\sigma_{x}^2)$$

$$Hx = H\hat{x} +\frac{H\sigma_{\hat{x}}^2(z-H\hat{x})}{H\sigma_{\hat{x}}^2 + \sigma_1^2}$$

$$H\sigma_{x}^2 = H\sigma_{\hat{x}}^2 -\frac{H^2\sigma_0^4}{H\sigma_{\hat{x}}^2 + \sigma_1^2}$$

여기서 $Hx$과 $H\sigma_{x}^2$에 공통적으로 포함된 부분을 아래와 같이 새로운 변수로 설정해보자.

$$k=\frac{\sigma_{\hat{x}}^2}{H\sigma_{\hat{x}}^2 + \sigma_{x}^2}$$

그러면 $Hx$에 관한 식은 아래와 같이 쓸 수 있다.

$$Hx = H\hat{x} + kH(z - H\hat{x})$$

여기서 양변을 $H$로 나눠주면,

$$\Rightarrow x = \hat{x} + k(z - H\hat{x})$$

$$=(1-k)H\hat{x} +k z$$

다시 말해 새로운 $x$는 $\hat{x}$와 $z$를 적절히 섞은 것으로 생각할 수 있으며, $k$가 클 수록 $z$의 값을 더 많이 섞어준다는 의미이다. (생각해보면 $k$는 최대 1일 것이다.)

다시 말해 $H\sigma_{\hat{x}}^2$가 크면 클 수록 $Hx$는 $z$의 값을 더 많이 가져오고, $H\sigma_{\hat{x}}^2$가 작아지면 작아질 수록 $Hx$는 $\mu_0$의 값을 더 많이 가져온다는 의미를 가진다.


$$H\sigma_{x}^2= H\sigma_{\hat{x}}^2 -\frac{H^2\sigma_{\hat{x}}^4}{H\sigma_{\hat{x}}^2 + \sigma_{x}^2}$$

$$=H\sigma_{\hat{x}}^2 -H^2k\sigma_{\hat{x}}^2$$

$$\Rightarrow \sigma'^2 = \sigma_{\hat{x}}^2 - kH\sigma_{\hat{x}}^2=(1-kH)\sigma_{\hat{x}}^2$$

즉, Posterior의 분산은 Prior 보다는 작아진다.

# 참고 문헌

* [Tutorial: The Kalman Filter, Tony Lacey, MIT](http://web.mit.edu/kirtley/kirtley/binlustuff/literature/control/Kalman%20filter.pdf)
* [Understanding Kalman Filters, Melda Ulusoy, Mathworks](https://kr.mathworks.com/videos/series/understanding-kalman-filters.html)
* [Product and convolutions of Gaussian Probability Density Functions](http://www.lucamartino.altervista.org/2003-003.pdf)
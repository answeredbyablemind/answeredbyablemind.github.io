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

# 정규 분포를 이용한 확률적 상태 서술과 상태의 변화

확률 분포를 이용하면 현재 위치를 확률적으로 서술할 수 있다.

가령 친구와 만나기로한 약속 장소로 서초역 3번 출구를 정했다고 하자. 그럼 이 친구는 서초역 3번 출구의 바로 앞에 있을 가능성이 굉장히 높다.

그런데, 혹시 그 앞 교회에 가 있을 가능성도 있고, 혹시 다른 출구로 나왔을 확률도 있고...

이런 식으로 생각하면 현재 친구가 위치 해 있을 수 있는 곳들에 대해 확률을 이용해 서술할 수 있다. 가령, 아래와 같이 표로 정리해볼 수 도 있을 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-07-Kalman_filter/table1.png">
  <br>
  표 1. 만나기로 한 친구가 위치해 있을 수 있는 장소들에 대한 확률 분포
</p>

우리가 보통 많이 사용하는 분포 중 하나는 정규 분포인데, 정규 분포를 이용해서 현재 위치를 서술한다고 생각해보자.

정규 분포의 모양은 아래와 같은 종 모양(bell curve)이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-07-Kalman_filter/pic1.png">
  <br>
  그림 1. 정규 분포의 형태
</p>

따라서, 그림 1은 정규 분포를 이용해서 현재 $x=0$에 있을 확률이 가장 높고, 그 주변으로 갈 수록 확률이 조금씩은 낮아지는 상태를 기술한 것으로 해석할 수 있다.

우리가 다루고자 하는 <u>**칼만필터는 정규 분포를 이용해 모든 상태와 동작을 서술한다.**</u>

또, 칼만 필터는 시간에 따른 <u>"상태의 변화"</u>에 대해 다루고 있기 때문에 우리는 정규 분포로 표현한 상태의 변화에 대해 미리 알아둘 필요가 있다.

상태의 변화는 곱(product)과 합성곱(convolution)이라는 연산을 통해 표현할 수 있다.

두 연산 과정에 대한 자세한 논의는 [Products and Convolutions of Gaussian Probability Density Functions](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.583.3007&rep=rep1&type=pdf)라는 논문에서 찾아볼 수 있으며, 증명도 아주 상세하게 되어 있기 때문에 자세한 과정이 궁금한 분들은 참고해볼 수도 있을 것 같다. 

우리는 이 두 연산 과정에 대한 결과만을 확인해서 사용할 것이다.

## 두 정규 분포의 곱(product)

첫 번째로 이용될 상태 변화 연산은 두 정규 분포의 곱(product)이다.

아래와 같이 두 개의 정규 분포가 있다고 해보자.

$$\mathcal{N}_1(x;\mu_1, \sigma_1^2) = \frac{1}{\sqrt{2\pi \sigma_1^2}}\exp\left(-\frac{(x-\mu_1)^2}{2\sigma_1^2}\right)$$

$$\mathcal{N}_2(x;\mu_2, \sigma_2^2) = \frac{1}{\sqrt{2\pi \sigma_2^2}}\exp\left(-\frac{(x-\mu_2)^2}{2\sigma_2^2}\right)$$

참고로, 앞으로는 정규 분포를 표현할 때는 $\mathcal{N}$이라는 기호를 이용하겠으며, $\mathcal{N}(x;\mu_1, \sigma_1^2)$라고 되어 있으면, 정의역이 $x$이고 파라미터는 $\mu_1, \sigma_1^2$와 같이 평균, 분산이 주어진 것이라는 의미로 사용하고자 한다.

위 두 정규 분포를 곱하면 어떤 결과가 얻어질까? 놀랍게도 정규 분포 두 개를 곱하면 결과는 정규 분포이다.

만약, 곱셈 결과로 얻어진 정규 분포를 

$$\mathcal{N}_{new}(x; \mu_{new}, \sigma_{new}^2)\notag$$

라고 하면 $\mu_{new}$와 $\sigma_{new}^2$은 다음과 같이 결정된다.

$$\mu_{new} = \frac{\mu_1\sigma_2^2 + \mu_2\sigma_1^2}{\sigma_1^2+\sigma_2^2}$$

$$\sigma_{new}^2 = \frac{1}{1/\sigma_1^2+1/\sigma_2^2}=\frac{\sigma_1^2\sigma_2^2}{\sigma_1^2 + \sigma_2^2}$$

그림으로 보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-07-Kalman_filter/pic2.png">
  <br>
  그림 2. 두 정규 분포의 곱(product)
</p>

## 두 정규 분포의 합성곱(convolution)

두 번째로 이용될 상태 변화 연산은 두 정규 분포의 합성곱(convolution)이다.

곱(product)에 대해 확인했을 때와 마찬가지로 아래와 같은 두 정규 분포에 대해서,

$$\mathcal{N}_1(x;\mu_1, \sigma_1^2)\text{ , }\mathcal{N}_2(x;\mu_2, \sigma_2^2)\notag$$

합성곱 결과는 다음과 같다.

$$\mathcal{N}_1 \circledast \mathcal{N}_2 = \mathcal{N}(x; \mu_1+\mu_2, \sigma_1^2 +\sigma_2^2)$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-07-Kalman_filter/pic3.png">
  <br>
  그림 3. 두 정규 분포의 합성곱(convolution)
</p>

# 위치 추정과 이동

## 정규 분포를 이용한 불확실도의 표현

정규 분포의 parameter는 평균, 분산 두 가지로 구성되어 있다.

위치에 대한 불확실도와 이동에 대한 불확실도. 모두 가우시안으로 표현할 수 있음.

확률적인 위치 추정 = Gaussian 분포로 표현

## 이동 = Convolution

# 베이즈 정리: Update Rule

$$P(H|E) = \frac{P(E|H)P(H)}{P(E)}$$

# Kalman filter의 작동 과정

## Predict the next position

## Additional Measure & Update


$$P(Hx)=\frac{P(z|H\hat{x})P(H\hat{x})}{P(z)}$$

$$=\frac{P(z|H\hat{x})P(H\hat{x})}{\int P(z|H\hat{x})P(H\hat{x}) dH\hat{x}}$$

$$=\frac{1}{Z}P(z|H\hat{x})P(H\hat{x})$$

여기서 $Z$는 measurement에 대한 확률값을 나타낸 것인데, 이 값의 역할은 Posterior, P(Hx)를 정규화해 줌으로써 전체 면적이 1이될 수 있도록 해주는 역할만을 수행해주는 것이다.

그런데, 만약 이 정규화 과정을 수행해주지 않았다고 P(Hx)에서 말해주는 평균값의 위치가 변할까? 그리고, 분산 값이 변할까? 전혀 그렇지 않을 것이다. 정규화 과정이 해주는 일은 확률 분포 함수의 높이만을 조정해주는 것이지 그 함수의 파라미터까지 수정하는 것은 아니기 때문이다.

따라서, 우리가 원하는 것이 Posterior의 파라미터만을 아는 것이라면 Prior와 Likelihood의 곱만을 이용해서 Posterior의 파라미터를 구하면 충분할 것이다.

칼만필터에서는 Prior, Likelihood, Posterior 모두 정규 분포를 따른다고 가정한다.

그런데, 놀랍게도, 정규 분포와 정규 분포를 곱해주면 또 다른 정규 분포가 얻어진다고 알려져 있다.

다음과 같이 평균, 분산이 각각 $(\mu_0, \sigma_0^2), (\mu_1, \sigma_1^2)$인 두 정규 분포가 곱해져서 얻어지는 정규 분포의 평균, 분산이 $(\mu_2, \sigma_2^2)$라고 하면 다음과 같은 관계로 표현할 수 있다.

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

그러면 원래의 두 정규 분포의 곱과 그의 결과에 대한 식을 다음과 같이 쓸 수 있다.

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
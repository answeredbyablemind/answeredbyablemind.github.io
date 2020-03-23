---
title: 표본 분산은 n 대신 n-1로 나눈다
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200323
tags: 통계학
---

# 표본 분산의 기댓값은 모분산이 되어야 한다.

통계학에서는 어떤 모수를 추정하기 위해 추정량을 사용한다.

대표적인 모수는 모평균, 모분산, 모비율이 있는데, 

이상적으로는 표본의 크기가 커질수록 표본으로 부터 계산하여 추정하는 값은 추정하고자 하는 모수와 같아지기를 바란다.

따라서, 이상적인 추정량은 그 추정량의 기대값이 모수와 같은 것이라고 할 수 있다.


대표적인 표본 통계량 중 하나인 표본 분산은 다음과 같이 정의된다.

$$s^2 = \frac{1}{n-1}\sum_{k=1}^n{\left(X_k-\bar{X}\right)^2}$$

여기서 n 대신 n-1로 나눠 표본 통계량을 정의한 것은 이렇게 모분산을 정의했을 때 비로소 표본 분산의 기대값이 모분산과 같아지기 때문이다.


## 증명: 표본분산의 기댓값 = 모분산의 값

표본의 크기가 n이고, 표본 평균은 $\bar{X}$, 표본 분산은 $s^2$인 표본을 추출한다고 하자.

이 때, 모평균의 값은 $m$이고, 모분산의 값은 $\sigma^2$이다.

이 때,

$$s^2 = \frac{1}{n-1}\sum_{k=1}^n{\left(X_k-\bar{X}\right)^2}$$

라고 했을 때, $E(s^2)=\sigma^2$인지 확인해보자.

$$E\left[s^2\right]=\frac{1}{n-1}E\left[\sum_{k=1}^n\left(X_k-\bar{X}\right)^2\right]$$

이 때, 내부의 summation에 대해서만 따로 생각해보자.

$$\sum_{k=1}^n\left(X_k-\bar{X}\right)^2 

= \sum_{k=1}^{n}\left((X_k-m) + (m-\bar{X})\right)^2$$

$$=\sum_{k=1}^{n}\left(
  (X_k-m)^2 + 2(X_k-m)(m-\bar{X})+(m-\bar{X})^2
  
  \right)$$


$$=\sum_{k=1}^{n}
  (X_k-m)^2 + 2(X_k-m)n(m-\bar{X})+n(m-\bar{X})^2
  $$

$$=\sum_{k=1}^{n}(X_k-m)^2-n(\bar{X}-m)^2$$

$$\therefore E\left[s^2\right]=
  \frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2\right]\notag$$

$$=\frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-m\right)^2-n\left(\bar{X}-m\right)^2\right]$$


라고 할 수 있다.

이 때,

$$E\left[\left(X_k-m\right)^2\right]=\sigma^2$$

이고,

$$E\left[\left(\bar{X}-m\right)^2\right]=V\left[\bar{X}\right]=\frac{\sigma^2}{n}$$

이다.

그러므로,

$$E\left[s^2\right]=\frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2\right]

= \frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-m\right)^2-n\left(\bar{X}-m\right)^2\right]$$

이다.

이 때, 기댓값 연산은 선형 연산이므로, 

$$=\frac{1}{n-1}\left[\sum_{k=1}^{n}E\left[(X_k-m)^2\right]-n(E\left[(\bar{X}-m\right)^2])\right]$$

$$=\frac{1}{n-1}\left(n\sigma^2-n\frac{\sigma^2}{n}\right)=\sigma^2$$

그러므로,

$$s^2=\frac{1}{n-1}\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2$$

이어야만 표본 분산의 기댓값이 모분산이라고 할 수 있다.



<center><iframe width="560" height="315" src="https://www.youtube.com/embed/UWh6fmb5btY" frameborder="0" allowfullscreen></iframe></center>


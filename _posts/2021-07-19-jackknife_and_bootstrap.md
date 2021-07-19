---
title: 잭나이프 & 부트스트랩 방법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210719
tags: 통계학
---

# Prerequisites

본 포스팅을 더 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)
* [표본 분산은 n 대신 n-1로 나눈다](https://angeloyeo.github.io/2020/03/23/sample_variance.html)
* [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)
* [신뢰 구간의 의미](https://angeloyeo.github.io/2021/01/05/confidence_interval.html)

# 추정량과 표준 오차

## 추정량의 의미

잭나이프와 부트스트랩 방법을 이해하기 위해선 추정량(estimator)이라는 것이 무엇인지에 대해 이해하는 것이 필수적이다.

추정량이란 표본들을 이용해 계산하는 함수라고 할 수 있다.

(도대체 어떤 놈이 번역했는지, 번역이 '량'으로 되어서 어떤 quantity를 의미하는 것만 같다. 이것 또한 잘못된 번역이 아닌가 싶다. 추정방법, 추정자 내지는 추정함수라고 번역하는 것이 더 옳아 보인다.)

가령 평균을 구하는 함수, 분산을 구하는 함수는 모두 추정량이다.

평균값은 다음과 같이 계산된다. $n$개의 샘플 $x_1, x_2, \cdots, x_n$에 대해,

$$m(X)=\frac{1}{n}\sum_{i=1}^{n}x_i$$

와 같다. $m(\cdot)$은 일종의 함수로써 $x_1, x_2, \cdots, x_n$을 입력으로 받아 정해진 계산을 수행한다.

이와 같은 맥락에서 임의의 추정량(estimator)을 정의할 수 있다.

내가 임의로 정한 추정량을 $\phi_n$이라고 해보자. 어차피 함수를 정의하는 것과 같은 맥락이기 때문에 어렵지 않게 아무거나 하나 정의해보자.

$$\phi_n(X)=\frac{3}{2}\sum_{i=1}^{n}\log(x_i)$$

또, 추정량은 출력값이 꼭 하나일 필요는 없다. 출력값이 두 개인 추정량도 존재한다. 이런 경우를 interval estimator라고 하고 신뢰구간 추정량이 대표적이다.

## 표준 오차의 의미

한편, [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html) 편에서는 평균값의 표준 오차에 대해 생각해보았다.

평균이라는 것은 여기서 표본 평균을 말하는데, 우리가 다루는 거의 대부분의 데이터들은 모집단에서 추출한 표본이다.

그리고 이용하는 추정량 또한 표본에 대해 적용하게 되는 것들이다. 

다시 한번 표본의 표준 오차에 대해 생각하는 이유를 생각해보면, 표본이란 모집단에서 일부 추출한 subset이기 때문이다.

다시, 조금 더 쉽게 예를 들어 아래와 같이 150명의 금성에 사는 외계인의 키를 조사한 분포를 생각해본다고 하자.

<p align = "center">
    <img src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic1.png">
    <br>
    그림 1. 상상속의 모집단인 금성 외계인 150명의 키 분포
</p>

여기서 임의로 6명의 금성 외계인을 뽑는다고 하면, 그 때 마다 표본의 분포는 달라질 것이고, 추정값(가령 평균, 표준편차)도 달라질 것이다.

아래의 그림 2에서는 표본 추출을 세 번 수행해 본 것이다.

<p align = "center">
    <img src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic3.png">
    <br>
    그림 2. 세 번 표본을 추출해보고 그 때 마다 얻게되는 표본 분포를 그린 것
</p>

우리가 궁금한 것은 임의의 추정량 $\phi_n$에 대해 추정량의 오차(즉, 추정값의 표준 편차)가 어떻게 계산 되는지에 관한 것이다.

다시 말해 $std(\phi_n)$이 어떻게 계산 되는지가 바로 이 추정량의 표준오차이다.

표본 평균의 표준 오차는 계산 방법이 이론적으로 잘 정립되어 있다.

그런데, 이론적으로 잘 확인되어 있지 않은 추정량이라도 표준 오차를 계산해줄 수 있는 신박한 방법이 없을까?

잭나이프 방법과 부트스트랩 방법은 이렇듯 추정량의 표준 오차를 계산해주는 방법이다.

이 때, 두 방법 모두 비모수적인 접근으로 추정량의 표준 오차를 계산해주며, resampling 방법에 기반한 방법이라는 점 또한 동일하기 때문에 한꺼번에 놓고 두 방법을 이해해보도록 하자.

# 잭나이프(jackknife) 방법

<p align = "center">
    <img width = "400" src = "https://thumbs.dreamstime.com/z/jackknife-vector-icon-jackknife-vector-outline-icon-illustration-white-background-135168267.jpg">
    <br>
    그림 1. 잭 나이프의 생김새
</p>

# 부트스트랩 방법

## 개요

## bootstrap p-value



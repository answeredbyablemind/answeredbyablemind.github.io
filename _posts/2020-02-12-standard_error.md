---
title: 표본과 표준 오차의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200212
tags: 통계학
---

# 모집단과 표본 집단

통계학을 공부하기 시작하면 가장 먼저 듣게 되는, 마치 고교 수학에서 <집합>과 같은 위치를 차지하고 있는 개념이 바로 모집단과 표본 집단에 관한 이야기이다.

고리타분한 이야기를 좋아하지는 않지만, 검정을 위한 통계학을 이해하기 위해선 모집단과 표본 집단에 대한 이해는 매우 필수적이다.

이 내용은 중요하기 때문에 한번 더 언급하겠다. 검정을 위한 통계학을 위해선 모집단과 표본 집단이 뽑히는 과정에 대해서 면밀히 이해해야한다!

이번 article에서는 "금성에 사는 외계인 150명"이라는 가상의 모집단을 상정하고, 표본을 추출하고, 표본 통계량을 계산해보면서 모집단과 표본 집단에 대해서 이해해보고자 한다.

## 모집단(population)

모집단은 정보를 얻고자 하는 관심 대상의 전체 집합을 일컫는다.

대부분의 경우 모집단은 우리가 정확하게 알 수는 없다고들 하는데, 모집단이란 가령 

대한민국 전국민의 키라던가, 전 세계인들의 체중 같은 것들이다.

모집단의 개념은 매우 추상적이기 때문에 이번 article에서는 상상의 모집단을 하나 만들어보도록 하자. 

금성에 외계인이 산다고 해보자. 그리고, 그 금성에는 정확히 150명의 외계인이 살고 있고,

신께서 아시기에 각 외계인의 키는 다음과 같은 분포를 갖고 있다고 해보자.

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic1.png">
    <br>
    그림 1. 상상속의 모집단인 금성 외계인 150명의 키 분포
</p>

### 모수(parameters)

사실 우리는 그림 1과 같은 집단의 분포를 정확하게 알 수 있으면 좋겠지만, 거기까지

바라는 것은 무리라고 생각하여 모집단의 분포를 묘사할 수 있을만한 특성치들을 

몇가지라도 알길 바란다[^1]. 그러면 정확하진 않더라도 얼추 비슷하게 모집단을 그려볼 수는 있는거니까.

[^1]: 모수 통계학(parametric statistics)에 한정

대표적인 모수는 다음과 같다.

* 평균
* 분산, 표준편차
* 분위수 (중위값, 1분위수, 4분위수 등...)
* 모비율

문제는 이 모수 마저도 알려져있지 않다는 것이다.

그렇다면, 모수라도 추정할 수 밖에 없는데, 

즉 우리가 당면한 문제는 다음과 같이 생각할 수 있다.

* 추정치의 특성은 어떤 것들이 있을까?
* 그리고, 어떻게 하면 잘 추정할 수 있을까? 
* 즉, 추정 오차는 수학적으로 어떻게 서술할 수 있고 추정 오차를 줄이려면 어떻게 해야할까?

## 표본 집단

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic2.png">
    <br>
    그림 2. 
</p>

### 표본을 추출하는 이유

### 표본 통계량과 표본 통계량 분포

<p align = "center">
    <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic3.png">
    <br>
    그림 3. 
</p>

# 추정치에 관하여

## 추정은 오차를 수반한다

# 표본 평균 수식적인 증명

# 주의: 표준 오차와 표준 편차는 다른 개념이다


# 참고문헌

* Primer of biostatistics 6th edition, Stanton A Glantz, McGraw-Hill Medical Publishing Division
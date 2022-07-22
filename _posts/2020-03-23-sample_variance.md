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

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq1.png"> </p>

여기서 n 대신 n-1로 나눠 표본 통계량을 정의한 것은 이렇게 모분산을 정의했을 때 비로소 표본 분산의 기대값이 모분산과 같아지기 때문이다.


## 증명: 표본분산의 기댓값 = 모분산의 값

표본의 크기가 n이고, 표본 평균은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq2.png">, 표본 분산은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq3.png">인 표본을 추출한다고 하자.

이 때, 모평균의 값은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq4.png">이고, 모분산의 값은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq5.png">이다.

이 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq6.png"> </p>

라고 했을 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq7.png">인지 확인해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq8.png"> </p>

이 때, 내부의 summation에 대해서만 따로 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq9.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq10.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq11.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq12.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq13.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq14.png"> </p>


라고 할 수 있다.

이 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq15.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq16.png"> </p>

이다.

그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq17.png"> </p>

이다.

이 때, 기댓값 연산은 선형 연산이므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq18.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq19.png"> </p>

그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-03-23-sample_variance/eq20.png"> </p>

이어야만 표본 분산의 기댓값이 모분산이라고 할 수 있다.



<center><iframe width="560" height="315" src="https://www.youtube.com/embed/UWh6fmb5btY" frameborder="0" allowfullscreen></iframe></center>

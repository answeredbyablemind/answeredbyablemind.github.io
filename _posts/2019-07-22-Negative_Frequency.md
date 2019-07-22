---
title: 음의 주파수
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190722
tags: 신호처리 푸리에
---


<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2019-07-22-preview_negative_frequency/" width="820" height = "420" frameborder="0"></iframe>
<br>
<b>음의 주파수가 의미하는 것: </b>
<br>
양의 주파수로 회전하는 벡터와 음의 주파수로 회전하는 벡터를 합쳐야만
<br>
비로소 복소평면에서 실수 신호 하나를 표현할 수 있다.
</p>

## FFT 결과를 얻게되면 우리가 보는 것

<p align = "center">
  <img width = "350" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/negative_frequency/pic1.png"
  </img>
  <br>
  그림 1. 10Hz 신호를 FFT 했을 때 얻게 되는 결과
</p>

## $\cos(\theta)$, $\sin(\theta)$를 표현하는 또 다른 방법

$$\cos(\theta) = \frac{e^{i\theta}+ e^{-i\theta}}{2}$$

$$\sin(\theta) = \frac{e^{i\theta} - e^{-i\theta}}{2i}$$


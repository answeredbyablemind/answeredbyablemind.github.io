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
  <img width = "350" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/negative_frequency/pic1.png">
  <br>
  그림 1. 10Hz 신호를 FFT 했을 때 얻게 되는 결과
</p>

핵심 질문은 두 가지

- 왜 음의 주파수인가? 음의 주파수의 physical meaning?
- 왜 사이즈는 절반이 되나?

--> 실수 신호를 변환해줬기 때문. 핵심은 오일러 공식과 정현파의 관계.

## $\cos(\theta)$, $\sin(\theta)$를 표현하는 또 다른 방법

$$\cos(\theta) = \frac{e^{i\theta}+ e^{-i\theta}}{2}$$

$$\sin(\theta) = \frac{e^{i\theta} - e^{-i\theta}}{2i}$$

<style>.bmc-button img{width: 27px !important;margin-bottom: 1px !important;box-shadow: none !important;border: none !important;vertical-align: middle !important;}.bmc-button{line-height: 36px !important;height:37px !important;text-decoration: none !important;display:inline-flex !important;color:#FFFFFF !important;background-color:#FF813F !important;border-radius: 3px !important;border: 1px solid transparent !important;padding: 1px 9px !important;font-size: 22px !important;letter-spacing:0.6px !important;box-shadow: 0px 1px 2px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;margin: 0 auto !important;font-family:'Cookie', cursive !important;-webkit-box-sizing: border-box !important;box-sizing: border-box !important;-o-transition: 0.3s all linear !important;-webkit-transition: 0.3s all linear !important;-moz-transition: 0.3s all linear !important;-ms-transition: 0.3s all linear !important;transition: 0.3s all linear !important;}.bmc-button:hover, .bmc-button:active, .bmc-button:focus {-webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;text-decoration: none !important;box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;opacity: 0.85 !important;color:#FFFFFF !important;}</style>
<p align = "center">

<link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet">

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/4zRA3QIyL">
  <img src="https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/BMC-btn-logo.svg" alt="Buy me a coffee">
  
</p>
<span style="margin-left:5px">Buy me a coffee</span></a>

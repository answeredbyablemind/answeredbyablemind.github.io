---
title: 마르코프 부등식과 체비쇼프 부등식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220912
tags: 통계학
---

마르코프 부등식은 음수가 아닌 랜덤 변수에 대해 성립하는 부등식이다. 마르코프 부등식의 정의부터 보면 다음과 같다.

$X$가 음수가 아닌 값을 가지는 랜덤 변수라고 했을때, $E[X]<\alpha$를 만족하는 임의의 상수 $\alpha$에 다음이 성립한다.

$$P(X\gt \alpha) \leq E[X]/\alpha$$

위 식의 의미를 간단히 살펴보자면 


<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-12-Markov_Chebyshev_Inequality/pic1.png">
  <br>
  그림 1
</p>

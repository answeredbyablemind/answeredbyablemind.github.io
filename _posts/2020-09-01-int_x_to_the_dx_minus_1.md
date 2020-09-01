---
title: $\int x^{dx}-1=$?
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200901
tags: 미적분학
---

※ 이 포스팅은 Quora의 글 중 [What is $\int x^{dx}-1$?](https://www.quora.com/What-is-int-x-dx-1) Oden Petersen의 답변을 재구성한 것입니다.

$$\int x^{dx}-1$$

이 수식을 보자마자 "이게 장난치는건가?" 싶은 생각이 들었다.

전혀 익숙한 형태의 수식이 아닐 뿐더러 보통 적분을 계산할 때는 $dx$를 적분 맨 뒤에 써다 주는 것이 관례적이라고 생각했기 때문일지도 모른다.

하지만, 리만 적분의 본래 의미를 생각해본다면 이 적분 값은 정당한 결과를 가져온 다는 것을 알 수 있을 것이다.

본 포스팅을 작성하는 이유는 적분 기호들의 원래적 의미에 다시 한번 집중해서 그 본질적 의미를 탐구했으면 한다는 Oden Petersen의 가르침을 공유하기 위함이다.

# 리만 적분의 본래적 의미

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/f/f2/Integral_as_region_under_curve.svg">
  <br>
  그림 1. 함수 $f(x)$에 대해 $a\lt x\lt b$의 구간에 대한 면적 $S$
  <br>
  출처: [위키피디아, 리만 적분](https://en.wikipedia.org/wiki/Riemann_integral)
</p>


<p align = "center">
  <img src = "https://en.wikipedia.org/wiki/Riemann_integral#/media/File:Riemann_integral_regular.gif">
  <br>
  그림 2. 리만 적분은 특정 구간 내에서 규칙적으로 구간을 분할하여 사각형의 면적 합을 계산하는 과정이라고 할 수 있다. <br> 맨 위의 숫자는 함수의 적분으로 수렴되는 사각형의 총 면적을 나타냄.
  <br>
  출처: [위키피디아, 리만 적분](https://en.wikipedia.org/wiki/Riemann_integral)
</p>
# 최종 정답

$$\int x^{dx}-1 = x ln(x) -x + C$$

여기서 $C$는 적분 상수
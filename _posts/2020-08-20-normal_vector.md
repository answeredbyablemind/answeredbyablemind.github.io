---
title: 미소곡면의 법선벡터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200820
tags: 미적분학
---

이번 article에서는 벡터장의 면적분을 이해하기 위해 필수적인 미소 곡면의 법선 벡터에 대해서 알아보고자 한다.

이를 위해서 우리는 곡면의 수학적 표현에 대해 이해하고자 한다.

# 매개변수 하나로 표현하는 곡선의 방정식

고등학교 수학시간에 배우기는 하지만 매개변수를 이용해 표현하는 직선(혹은 곡선)의 방정식은 한 눈에 이해하기가 어려웠던 것 같다.

그 이유는 우리가 보통 그리는 함수들은 입력과 출력을 한 평면에 모두 나타내게 되므로 (보통 입력을 $x$축에, 출력을 $y$축에 표현한다.) 입력이 변할 때 출력이 어떻게 변하는지 한눈에 알 수 있었기 때문이다.

그러나, 매개변수를 이용해 표현한 방정식은 그 결과만을 볼 때 함수의 출력만을 관찰하게 되기 때문에 그 결과물을 한눈에 이해하기 힘들다.

따라서 매개 변수를 이용해 표현한 직선(혹은 곡선)의 방정식을 조금이나마 쉽게 이해해보려면 입력의 변화와 출력의 변화를 한꺼번에 나타낼 수 있어야 할 것이다.

실생활에서 사용되고 있는 매개 변수를 이용해 표현한 직선의 방정식은 바로 스크롤이다.



아래의 applet은 매개 변수 $t$를 이용해 표현한 함수 $f(t)$이다.

$$f(t) = \begin{bmatrix} t\cdot \cos(2\pi t) \\ t\cdot \sin(2\pi t)\end{bmatrix}$$
<center>
  <iframe width = "350" height = "350" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-08-20-normal_vector/parametric_curve/"></iframe>
  <br>
  t로 매개된 곡선의 매개변수 방정식
</center>

# 매개 변수 두 개를 이용해 표현하는 곡면의 방정식

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/tCBegKMJY7s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
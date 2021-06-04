---
title: 미정계수법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210604
tags: 미분방정식
---

# Prerequisites

본 포스팅의 내용을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html)

# 미정계수법 소개

미정계수법(method of undetermined coefficients)은 비제차 상미분방정식을 푸는 방법 중 하나다.

일반적으로 상수 계수를 갖는 상미분 방정식을 풀 때 사용하면 잘 풀리는 방법으로 알려져 있다.

가령 아래와 같은 미분방정식을 생각해보자. (이 식은 [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편의 식 (9)와 같다.)

$$y''-4y'+3y=x$$

[비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 소개했던 내용을 잠깐 복습하면서 이 식을 보는 방법에 대해 다시 한번 소개하고자 한다.

1. 좌변에 있는 $y''-4y'+3y$는 외부에서 아무런 입력이 없을 때의 시스템(좀 더 자세히는 autonomous dynamical systems)의 상태를 의미하고 우변의 $x$는 독립변수의 변화에 따른 입력 함수 값을 의미한다.

2. 독립변수는 일반적으로 시간으로 생각하는 것이 편리한데, 이렇게 생각하면 시시각각 입력값이 변함으로써 시스템의 상태가 시시각각 변하게 되는 것을 의미한다.

3. 2의 내용에 따라 식 (1)의 해는 아무런 입력이 없을 때의 시스템으로부터 구하게 되는 해 (homogeneous )
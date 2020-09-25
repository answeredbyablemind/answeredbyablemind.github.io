---
title: Momentum을 이용한 최적화기법 - ADAM
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200926
tags: 머신러닝
---

본 포스팅은 [Andrew Ng 교수님의 강의](https://www.youtube.com/watch?v=JXQT_vxqwIs&ab_channel=Deeplearning.ai)를 정리한 것임을 밝힙니다.

# Prerequisites

본 포스팅에 대해 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [경사하강법(Gradient Descent)](https://angeloyeo.github.io/2020/08/16/gradient_descent.html)

# Gradient Descent의 문제

[//]:# (그림. Contour가 옆으로 퍼진 경우에 대해서)

[//]:# (그림. Contour가 옆으로 퍼진 경우의 Gradient Descent 진행 방향, Gradient의 방향은 항상 등고선에 수직임을 명시할 것.)

# Gradient Descent with Momentum

[Momentum 알고리즘]

Initialize $V_{dw(0)} = \vec 0$, $V_{db(0)} = \vec 0$

(여기서 $V_{dw(0)}$의 차원은 $W$의 차원과 같고, $V_{db(0)}$의 차원은 $b$의 차원과 같음.)

$t$ 번째 iteration에서:

$\quad$ 현재 batch에 대한 $dW$, $db$을 계산함. 

$\quad$ 그 뒤 아래의 term들을 계산함.

$\quad$ $V_{dw(t)} =\beta_1 V_{dw(t-1)} + (1-\beta_1)dW$

$\quad$ $V_{db(t)} = \beta_1 V_{db(t-1)} + (1-\beta_1)db$

$\quad$ Weight, bias 업데이트:

$\quad\quad$ $W := W - \alpha V_{dw(t)}$

$\quad\quad$ $b:= b - \alpha V_{db(t)}$


# RMSProp

[RMSProp 알고리즘]

On iteration t:

$\quad$ Compute $dW$, $db$ on current batch

$\quad$ $S_{dw(t)} =\beta_2 S_{dw(t-1)} + (1-\beta_2)dW^2$

$\quad$ $S_{db(t)} = \beta_2 S_{db(t-1)} + (1-\beta_2)db^2$

$\quad$ Weight, bias 업데이트:

$\quad\quad$ $W := W - \alpha \frac{dW}{\sqrt{S_{dw(t)}}}$

$\quad\quad$ $b:= b - \alpha \frac{db}{\sqrt{S_{db(t)}}}$

# ADAM(Adaptive Moment Estimation)


[ADAM 알고리즘]

Initialize $V_{dw(0)} = \vec 0$, $V_{db(0)} = \vec 0$, $S_{dw(0)} = \vec{0}$, $S_{db(0)} = \vec{0}$

(여기서 $V_{dw(0)}$와 $S_{dw(0)}$의 차원은 $W$의 차원과 같고, $V_{db(0)}$와 $S_{db(0)}$의 차원은 $b$의 차원과 같음.)

$t$ 번째 iteration에서:

$\quad$ 현재 batch에 대한 $dW$, $db$을 계산함. 

$\quad$ 그 뒤 아래의 term들을 계산함.

$\quad$ $V_{dw(t)} =\beta_1 V_{dw(t-1)} + (1-\beta_1)dW$

$\quad$ $V_{db(t)} = \beta_1 V_{db(t-1)} + (1-\beta_1)db$

$\quad$ $S_{dw(t)} =\beta_2 S_{dw(t-1)} + (1-\beta_2)dW^2$

$\quad$ $S_{db(t)} = \beta_2 S_{db(t-1)} + (1-\beta_2)db^2$

$\quad$ 아래와 같이 bias corretion 수행

$\quad$ $V_{dw(t)}^{corrected} = V_{dw(t)}/(1-\beta_1^t)$

$\quad$ $V_{db(t)}^{corrected} = V_{db(t)}/(1-\beta_1^t)$

$\quad$ $S_{dw(t)}^{corrected} = S_{dw(t)}/(1-\beta_2^t)$

$\quad$ $S_{db(t)}^{corrected} = S_{db(t)}/(1-\beta_2^t)$

$\quad$ Weight, bias 업데이트:

$\quad\quad$ $W := W - \alpha V_{dw(t)}^{corrected}/\sqrt{S_{dw(t)}^{corrected}}$

$\quad\quad$ $b:= b - \alpha V_{db(t)}^{corrected}/\sqrt{S_{db(t)}^{corrected}}$
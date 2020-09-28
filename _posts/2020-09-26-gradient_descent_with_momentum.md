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

Gradient descent를 이용해 비용함수(혹은 Error)를 최소화해주고자 하면 어떤 경우에는 수렴 속도가 굉장히 느릴 때가 있다.

이런 경우 step size(혹은 learning rate)을 키워주면 수렴 속도가 빨라지는 경우가 있지만, 어떤 경우는 종종 아래의 그림 1과 같이 비용함수의 형태 특성 상 특정 parameter에 대해 진동하면서 수렴하다보니 수렴 속도가 느려지는 경우가 있다. (아래 그림 1에서는 b라는 parameter에 대해 진동하면서 서서히 최솟값으로 수렴하고 있다.)

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/pic1.png">
  <br>
  그림 1. 비용함수 최소화 시 특정 parameter에 대해 진동하면서 수렴하는 경우
</p>

이렇듯 비용함수에 대한 진동이 발생하는 이유는 gradient의 개념 자체가 등고선에 수직한 방향으로 벡터가 만들어지기 때문이다.

그렇다면 이런 특성을 감안했을 때, 우리가 원하는 것을 다시 정리하자면 그림 1에서 세로 방향으로는 천천히 수렴하고 가로 방향으로는 빨리 수렴할 수 있도록 하는 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/pic2.png">
  <br>
  그림 2. 우리가 원하는 수렴 경로
</p>

# Gradient Descent with Momentum

Momentum의 개념을 도입한 Gradient Descent는 iteration에 따라 방향이 반대로 계속 바뀌어가는 형태의 경로를 거쳐왔을 때에는 해당 방향으로 update하는 변화량이 점차 작아지고, iteration에 따라 방향이 계속 유지되어가면 가속을 붙여주는 방식의 update method라고 할 수 있다.

이 method의 이름을 Momentum이라고 하고 pseudo-code를 통해 알고리즘을 우선 보도록 하자.

여기서는 모델의 파라미터가 $W$, $b$ 두 개라고 생각해보자.

또, subscript로 쓴 $(t)$는 $t$ 번째 iteration에서 계산한 것이라는 걸 말해준다고 하자.

<div class = "card">
  <div class = "card__content">

  <div class = "card__header">
    <h4>[Momentum 알고리즘]</h4>
  </div>

  <p>
  Initialize $V_{dw(0)} = \vec 0$, $V_{db(0)} = \vec 0$

  (여기서 $V_{dw(0)}$의 차원은 $W$의 차원과 같고, $V_{db(0)}$의 차원은 $b$의 차원과 같음.)

  $t$ 번째 iteration에서:

  $\quad$ 현재 batch에 대한 $dW_{(t)}$, $db_{(t)}$을 계산함. 

  $\quad$ 그 뒤 아래의 term들을 계산함.

  $$V_{dw(t)} =\beta_1 V_{dw(t-1)} + (1-\beta_1)dW_{(t)}$$

  [//]:# (식 1)

  $$V_{db(t)} = \beta_1 V_{db(t-1)} + (1-\beta_1)db_{(t)}$$

  [//]:# (식 2)

  $\quad$ Weight, bias 업데이트:

  $$W := W - \alpha V_{dw(t)}$$

  [//]:# (식 3)

  $$b:= b - \alpha V_{db(t)}$$

  [//]:# (식 4)

  </p>
  
  </div>
</div>

# RMSProp

[RMSProp 알고리즘]

On iteration t:

$\quad$ 현재 batch에 대한 $dW$, $db$을 계산함. 

$\quad$ 그 뒤 아래의 term들을 계산함.

$\quad$$\quad$ $S_{dw(t)} =\beta_2 S_{dw(t-1)} + (1-\beta_2)dW^2$

$\quad$$\quad$ $S_{db(t)} = \beta_2 S_{db(t-1)} + (1-\beta_2)db^2$

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

$\quad$$\quad$ $V_{dw(t)} =\beta_1 V_{dw(t-1)} + (1-\beta_1)dW$

$\quad$$\quad$ $V_{db(t)} = \beta_1 V_{db(t-1)} + (1-\beta_1)db$

$\quad$$\quad$ $S_{dw(t)} =\beta_2 S_{dw(t-1)} + (1-\beta_2)dW^2$

$\quad$$\quad$ $S_{db(t)} = \beta_2 S_{db(t-1)} + (1-\beta_2)db^2$

$\quad$ 아래와 같이 bias corretion 수행

$\quad$$\quad$ $V_{dw(t)}^{corrected} = V_{dw(t)}/(1-\beta_1^t)$

$\quad$$\quad$ $V_{db(t)}^{corrected} = V_{db(t)}/(1-\beta_1^t)$

$\quad$$\quad$ $S_{dw(t)}^{corrected} = S_{dw(t)}/(1-\beta_2^t)$

$\quad$$\quad$ $S_{db(t)}^{corrected} = S_{db(t)}/(1-\beta_2^t)$

$\quad$ Weight, bias 업데이트:

$\quad\quad$ $W := W - \alpha V_{dw(t)}^{corrected}/\sqrt{S_{dw(t)}^{corrected}}$

$\quad\quad$ $b:= b - \alpha V_{db(t)}^{corrected}/\sqrt{S_{db(t)}^{corrected}}$
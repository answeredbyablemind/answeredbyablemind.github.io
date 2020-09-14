---
title: 정규분포의 공식 유도
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200914
tags: 통계학
---

이번 포스트에서는 정규 분포(혹은 가우스 분포)의 공식을 유도해보고자 한다.

정규 분포의 공식은 꽤 복잡하기 때문에 아래의 그림과 같이 세 가지 파트로 나누어 유도해보도록 하자.

[//]: # (그림 1: 정규 분포의 유도 by parts)

# $e^{-x^2}$의 꼴의 유도

우선은 $f(x) \propto e^{-x^2}$의 꼴을 따른다는 과정을 유도해보고자 한다.

## 필요 가정

이를 위해 아래와 같이 중심을 직교좌표계의 원점에 일치시킨 원형 다트 판에 다트 던지기를 하는 과정을 상상해보자.

[//]: # (그림 2: 원형 다트판. 직교 좌표계의 원점에 중앙을 일치시킬 것)

필요한 가정

1. 다트판 상에서 점수를 등고선으로 나타낸다고 했을 때, 동일한 점수의 등고선 상에 맞춘 다트는 모두 점수가 같다.

즉, 확률밀도 함수는 회전에 독립적이다.

2. 다트를 던져서 사각형 안에 맞추는 상황을 가정했을 때, 목표로 하는 사각형의 넓이가 같다면 원점으로부터 사각형까지의 거리가 가까울수록그 사각형에 맞을 확률이 높다.

3. 사각형까지의 거리가 같을 때 사각형의 넓이가 넓을 수록 맞을 확률이 높다.

// 그림 3. ref 1에서의 Figure 1과 같은 그림을 그려서 가정 2, 3에 대한 부연 설명할 것.

## 유도 과정

앞서 언급한 세 가지의 가정을 생각하면서, 직교 좌표 상에 임의의 위치 $(x, y)$에서 너비가 $\Delta x$이고 높이가 $\Delta y$인 사각형 $A$에 다트가 맞을 기댓값을 생각해보자.

여기서 $x$축과 $y$축에서 다트가 안착할 확률에 대한 확률밀도 함수를 $f(x, y)$라고 하자.

이 때, $x$축과 $y$축에 다트가 안착할 확률은 서로 독립적이므로 $x$축과 $y$축에 대한 다트가 안착할 확률밀도함수는 각각 $f(x)$와 $f(y)$이다.

따라서, 사각형 $A$에 다트가 안착할 기댓값은 다음과 같다.

$$f(x)\Delta x f(y)\Delta y$$

한편, 위의 가정 중 회전에 관한 가정을 이용하기 위해 극좌표계를 이용해 같은 확률밀도를 서술해보자.

극좌표계에서 표현한 확률밀도함수를 $g(r,\theta)$라고 했을 때, 가정 1번에 따라 이 확률밀도함수는 회전에 독립적이므로 $g(r, \theta) = g(r)$이라고 써도 무관하다.

따라서, 사각형 A에 다트가 안착할 기댓값을 극좌표계를 이용해 서술하면 아래와 같다.

$$g(r)\Delta x\Delta y$$

이 때, 식 (1)과 식 (2)는 같은 값이므로,

$$f(x)\Delta x f(y) \Delta y = g(r) \Delta x \Delta y$$

이며, $\Delta x$와 $\Delta y$를 소거하면,

$$f(x)f(y) = g(r)$$

이다.

여기서 가정 1을 한번 더 이용해 식 (4)를 $\theta$에 대해 미분해주도록 하자.

그러면 확률밀도함수는 회전에 독립적이므로 회전에 대한 미분의 결과는 0이 되어야 한다.

$$\frac{df(x)}{d\theta}f(y) + f(x)\frac{df(y)}{d\theta}=\frac{g(r)}{d\theta} = 0$$

이 식은 아래와 같이 써주어도 무관하다.

$$\frac{df(x)}{dx}\frac{dx}{d\theta}f(y) + f(x)\frac{df(y)}{dy}\frac{dy}{d\theta}=\frac{g(r)}{d\theta} = 0$$

여기서 $x = r\cos(\theta)$, $y=r\sin(\theta)$이므로,

$$\frac{dx}{d\theta}=-r\sin(\theta)$$

$$\frac{dy}{d\theta}=r\cos(\theta)$$

이다.

따라서, 식 (7)과 식 (8)을 식 (6)에 대입해주면,

$$식(6) \Rightarrow \frac{df}{dx}(-r\sin(\theta))f(y) + f(x)\frac{df}{dy}(r\cos(\theta))$$

여기서 $r\sin(\theta)=y$이고, $r\cos(\theta)=x$이므로,

$$\Rightarrow \frac{df}{dx}(-y)f(y) + f(x)\frac{df}{dy}x = 0$$

여기서 첫번째 항을 우변으로 넘겨 정리해주면 아래와 같다.

이 때 시각적인 편의를 위해, $df/dx = f'(x)$, $df/dy = f'(y)$로 적어주자.

$$\Rightarrow f(x)f'(y)x = f(y)f'(x)y$$

이제 이 식은 상미분방정식임이 확실히 보이는데, 변수분리 방법으로 풀어주기 위해 좌변과 우변을 $x$와 $y$에 대한 식으로만 나타내보자.

$$\Rightarrow \frac{xf(x)}{f'(x)}=\frac{yf(y)}{f'(y)}$$

[//]: # (식 12)

식 (12)를 잘 보면 식 (12)가 의미하는 것은 양변에서 분자, 분모의 비율이 모두 일정하다는 것을 의미한다. 따라서 식 (12)의 양변의 값은 모두 어떤 상수 $C$와 같다고 할 수 있다.

$$식(12) \Rightarrow \frac{xf(x)}{f'(x)}=\frac{yf(y)}{f'(y)} = C$$

[//]: # (식 13)

이제 식 (13)에서 미분 방정식을 풀어주도록 하자. $x$나 $y$나 같은 결과를 내기 때문에 $x$에 대해서만 풀어주자.

$$\frac{xf(x)}{f'(x)}=C$$

여기서 좌변에 $x$만 남기도록 식을 한번 정리해주자.

$$x = C\frac{f'(x)}{f(x)}$$

여기서 양변을 적분해주면,

$$\frac{1}{2}x^2=C ln(f(x)) + C'$$

여기서 $C'$은 적분에 의해 생긴 또 다른 상수이다.

따라서 우리는 $f(x)$를 다음과 같이 쓸 수 있게 된다.

$$\therefore f(x) = A_0 exp(\frac{1}{2}cx^2)$$

[//]: # (식 17)

그런데, 가정 2번에 따르면 표적 중앙으로부터 거리가 가까울수록 맞을 확률이 높다고 하였기 때문에 식 (17)의 exponential term 내부의 값은 음수가 되어야 한다.

따라서, 식 (17)을 다음과 같이 서술하여 내부의 값이 음수임을 강조하도록 하자.

$$식(17) \Rightarrow f(x) = A_0 exp(\frac{1}{2}-kx^2)\text{ where }k>0$$

[//]: # (식 18)

# $1/\sigma\sqrt{2\pi}$의 유도



# exponential 내부의 식 유도

# reference

* The Normal Distribution: A derivation from basic principles, Dan Teague, The North Carolina School of Science and Mathematics
(https://www.alternatievewiskunde.nl/QED/normal.pdf)

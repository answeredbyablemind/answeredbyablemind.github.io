---
title: 마르코프 부등식과 체비셰프 부등식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220912
tags: 통계학
---

# 마르코프 부등식 (Markov Inequality)

마르코프 부등식은 음수가 아닌 랜덤 변수에 대해 성립하는 부등식이다. 마르코프 부등식의 정의부터 보면 다음과 같다.

$X$가 음수가 아닌 값을 가지는 랜덤 변수라고 했을때, $E[X]<\alpha$를 만족하는 임의의 상수 $\alpha$에 다음이 성립한다.

$$P(X\gt \alpha) \leq E[X]/\alpha$$

위 식의 의미를 간단히 살펴보기 위해 아래의 그림을 보도록 하자.


<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-12-Markov_Chebyshev_Inequality/pic1.png">
  <br>
  그림 1. 마르코프 부등식이 의미하는 것은 전체 데이터 분포에서 기댓값을 기준으로 랜덤변수 $x$가 어떤 극값 $\alpha$ 보다 클 확률에 관한 것이다.
</p>

그림 1을 보면 어떤 랜덤 변수 $X$에 대한 pdf가 그려져 있는 것을 알 수 있다. 여기서 $X$는 음수가 아닌 값이라는 점을 강조하고자 가로축 왼쪽에 0을 표시했다. 또, 기댓값은 임의로 분포 중앙으로 설정하였으며 $P(x\gt \alpha)$는 파란색 영역으로 표시되어 있다. 여기서 제약 사항 중 하나는 $\alpha$는 $E[X]$보다는 큰 값이여야 한다는 점이다. 즉, right tail에서 볼 수 있는 extreme value $\alpha$에 관한 부등식이라고 할 수 있다. 

정리하자면 마르코프 부등식은 음수가 아닌 랜덤 변수에 대해 기댓값을 기준으로 $X$가 극값 $\alpha$ 보다 클 확률에 관한 정리(theorem)라고 할 수 있다.

증명은 아주 간단하다. $X$에 관한 pdf가 $f_X(x)$라고 하면 이의 기댓값은 다음과 같다.

$$E[X]=\int_x x f_X(x)dx$$

위 적분에 대한 적분 범위를 $\alpha$를 기준으로 나눠 다음과 같이 쓸 수 있다.

$$\Rightarrow \int_{0\leq x \leq \alpha}xf_X(x)dx + \int_{x\gt \alpha}xf_X(x)dx$$

여기서 $x$의 값은 항상 음수가 아닌 값이므로 위 식의 왼쪽 항은 항상 양수이다. 따라서, 아래와 같은 관계가 성립한다.

$$\Rightarrow \int_{0\leq x \leq \alpha}xf_X(x)dx + \int_{x\gt \alpha}xf_X(x)dx \geq \int_{x\gt \alpha}xf_X(x)dx$$

또한, 위 식의 우변의 값에서 $x\gt \alpha$이므로 다음이 성립한다.

$$\Rightarrow \int_{x\gt \alpha}xf_X(x)dx\geq \int_{x\gt \alpha}\alpha f_X(x)dx % 식 (5)$$

따라서, 결론적으로 식 (2)와 식 (5)만을 가져오면,

$$\Rightarrow E[X]\geq \int_{x\gt\alpha} \alpha f_X(x)dx % 식 (6)$$

이며, pdf와 확률의 정의에 따라 위 식은 다음과 같이 쓸 수도 있다.

$$식(6)\Rightarrow E[x]\geq \alpha P(X\gt \alpha) % 식 (7)$$

여기서 위 식을 정리하면 식 (1)을 얻을 수 있다.

# 체비셰프 부등식 (Chebyshev Inequality)

체비셰프 부등식은 다음과 같다. 임의의 랜덤 변수 $X$와 임의의 상수 $\alpha$에 대하여 다음이 성립한다.

$$P(\left|X-E[X]\right|\gt\alpha)\leq Var[X]/\alpha^2$$

체비셰프 부등식은 마르코프 부등식과 다르게 $X$와 $\alpha$에 대한 제약 조건이 없으나 절대값 부호에서 볼 수 있듯이 양측 극값 $\alpha$에 대한 부등식이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-12-Markov_Chebyshev_Inequality/pic2.png">
  <br>
  그림 2. 체비셰프 부등식이 의미하는 것은 전체 데이터 분포에서 기댓값을 기준으로 랜덤변수 $x$가 어떤 양쪽 극값 $\alpha\pm E[X]$ 보다 크거나 같을 확률에 관한 것이다.
</p>
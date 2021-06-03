---
title: reduction of order
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210603
tags: 미분방정식
---

# Prerequisites

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [1계 선형 미분방정식의 해법](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)

# 일반 해의 기저 중 하나만 주어졌을 경우

$$x''+p(t)x'+q(t)x = 0$$

여기서 $x_1(t)$는 주어져있다고 하자.

$x_2(t) = h(t)x_1(t)$라는 꼴을 띈다고 가정하고 $h(t)$를 구할 수 있을지 알아보자.

그러면

$$x_2' = h'x_1 + hx'_1$$

$$x_2'' = h''x_1+h'x_1'+h'x_1' +hx_1''$$

$$=h''x_1+2h'x_1'+hx_1''$$

따라서 원래의 식에 $x_2'$와 $x_2''$를 대입하면,

$$x_2''+p(t)x_2'+q(t)x_2=0$$

$$\Rightarrow h''x_1+2h'x_1'+hx_1''+p(t)(h'x_1+hx_1')+q(t)hx_1=0$$

여기서 $h''$와 $h'$, $h$에 대하여 식을 묶어 보자.

$$\Rightarrow h''(x_1) + h'(2x_1'+p(t)x_1)+h(x_1''+p(t)x_1'+q(t)x_1)=0$$

여기서 $x_1(t)$는 원래 식의 해이므로 $(x_1''+p(t)x_1'+q(t)x_1)=0$임은 자명하다.

따라서,

$$\Rightarrow h''x_1 + h'(2x_1'+p(t)x_1) = 0$$

이다.

이 식을 다시 쓰면

$$x_1h''+(2x_1'+p(t)x_1)h'=0$$

이 되고, 양변을 $x_1$로 나눠주면,

$$\Rightarrow h'' + \left(2\frac{x_1'}{x_1}+p(t)\right)h'=0$$

과 같다.

이 식은 $h'$을 구하기 위한 [1계 선형 미분방정식](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)과 같으므로 1계 선형 미분방정식을 구할 때 사용했던 해법을 이용할 수 있게 된다.

즉, 해결을 위한 미분방정식의 order가 2차에서 1차로 내려갔다. (그래서 reduction of order technique이라고 부른다.)

여기서 integrating factor $\mu(t)$는

$$\mu(t) = \exp\left(\int2\frac{x_1'}{x_1}+p(t) dt\right)$$

이다.

이 식을 약간 변형하면,

$$\Rightarrow \exp\left(2\int \frac{x_1'}{x_1}dt\right)\exp\left(\int p(t) dt\right)$$

$$=\left(\exp\left(\int\frac{x_1'}{x_1}dt\right)\right)^2\exp\left(\int p(t)dt\right)$$

$$=\left\lbrace\exp(\ln (x_1)\right\rbrace^2\exp\left(\int p(t)dt\right)$$

$$=x_1^2\exp\left(\int p(t)dt\right)$$

과 같다.

그러면 [1계 선형 미분방정식](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html) 편에서 본 것 처럼 식 (10)의 양변에 $\mu(t)$를 곱해주면 다음과 같이 식을 변형할 수 있게 된다.

$$식(10)\Rightarrow h''x_1^2\exp\left(\int p(t)dt\right)+\left(2\frac{x_1'}{x_1}+p(t)\right)h'x_1^2\exp\left(\int p(t)dt\right) = 0$$

미분의 chain rule을 이용해 묶어주면 다음과 같이 쓸 수 있다.

$$\Rightarrow \frac{d}{dt}\left\lbrace h'x_1^2\exp\left(\int p(t)dt\right)\right\rbrace=0$$

따라서, $h'$는 다음과 같이 구할 수 있다. 위 식의 양변에 적분을 취해주면,

$$\Rightarrow h'x_1^2\exp\left(\int p(t)dt\right)=C_1$$

여기서 $C_1$은 적분상수이다.

$$\Rightarrow h'=\frac{C_1}{x_1^2}\exp\left(-\int p(t) dt\right)$$

그리고 최종적으로 $h$는 다음과 같다.

$$h(t) = \int \frac{C_1}{x_1^2}\exp\left(-\int p(t) dt\right) dt+C_2$$

여기서 $C_2$ 역시 적분상수이다.

그러면 $x_1(t)$가 식 (1)의 해로 주어졌을 경우 $x_2(t)$를 $h(t)x_1(t)$와 같은 형식으로 구할 수 있음을 알 수 있다.





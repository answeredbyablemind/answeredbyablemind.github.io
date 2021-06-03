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

$$=x_1^2$$








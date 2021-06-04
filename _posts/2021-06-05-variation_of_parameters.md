---
title: 매개변수 변환법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210605
tags: 미분방정식
---

# Prerequisites

이 포스팅을 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html)
* [론스키안(Wronskian)](https://angeloyeo.github.io/2019/10/10/Wronskian.html)
* 크래머 법칙(Cramer's Rule)
* [미정계수법](https://angeloyeo.github.io/2021/06/04/undetermined_coefficients.html)

# 매개변수 변환법 소개

매개변수 변환법은 비제차 미분방정식을 풀이하기 위해 고안된 방법이다.

미정계수법은 비제차 항이 다항 함수, 코사인, 사인함수, 지수함수인 경우에만 적용할 수 있었지만 매개변수 변환법은 그 활용도가 더 넓다고 할 수 있다.

아래와 같은 2계 비제차 미분방정식을 생각해보자.

$$y''+p(x)y'+q(x)y=r(x)$$

위와 같은 2계 비제차 미분방정식의 해는 다음과 같은데,

$$y(x) = y_h(x) + y_p(x)$$

$y_c(x)$의 기저 함수는 두 개이므로 조금 더 풀어쓰면 다음과 같다.

$$y(x)=c_1y_1(x)+c_2y_2(x)+y_p(x)$$

여기서 매개변수 변환법의 아이디어는 [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html) 편에서 본 것 처럼 $y_h$의 기저 $y_1$과 $y_2$를 이용해서 $y_p$를 구해낼 수는 없을까 라는 것이다.

다시 말해 아래와 같이

$$y_p(x) = u(x)y_1(x) + v(x)y_2(x)$$

와 같이 $y_p$를 설정하면 $y_1(x)$와 $y_2(x)$에 모두 독립적인 적절한 $y_p(x)$를 얻어낼 수 있을 것이라는 아이디어이다.

가장 중요한 것은 $y_p(x)$ 역시도 식(1)을 만족하는 solution이므로 $y_p$를 식 (1)에 대입해보자.

그러기 위해 1차 미분과 2차 미분을 구해보면,

$$y_p=uy_1+vy_2$$

$$y_p'=u'y_1+uy_1'+v'y_2+vy_2'$$

여기서 $y_p''$을 구하기 전에 아래와 같은 가정을 덧붙여보자.

$$u'y_1+v'y_2 = 0$$

이 가정은 매우 핵심적이다. 우리는 적절한 $u$, $v$를 찾는 것이 목적이기 때문에 이런 가정까지도 만족하는 $u$와 $v$를 찾기만 하면 되는 것이다. 이 가정은 뒤에 있을 Cramer's rule에 적용하기 위한 연립 방정식으로 연결된다.

이런 가정을 가지고 $y_p''$을 구하면,

$$y_p'' = u'y_1'+uy_1''+v'y_2'+vy_2''$$

임을 알 수 있다.

따라서, 원래의 미분방정식에 $y_p''$, $y_p'$, $y_p$를 대입하면,

$$y_p''+p(x)y_p'+q(x)y_p=r(x)$$

$$=\Big\lbrace u'y_1'+uy_1''+v'y_2'+vy_2''\Big\rbrace+p(x)\Big\lbrace (uy_1'+vy_2')\Big\rbrace + q(x)(uy_1+vy_2) = r(x)$$

이 식을 $u$와 $v$에 관해 다시 정리해주면,

$$\Rightarrow u\Big\lbrace y_1''+p(x)y_1'+q(x)y_1 \Big\rbrace
\\ \\
\quad\quad + v\Big\lbrace y_2''+p(x)y_2'+q(x)y_2 \Big\rbrace
\\ \\
\quad\quad\quad + u'y_1'+v'y_2' = r(x)
$$

이다. 여기서 중괄호($\lbrace\rbrace$) 안에 있는 방정식은 모두 제차미분방정식의 해를 가지고 써준 것이므로 0이다. 따라서 위의 식은 

$$\Rightarrow u'y_1'+v'y_2'=r(x)$$

와 같이 쓸 수 있다.


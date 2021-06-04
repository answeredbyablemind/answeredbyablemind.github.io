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

3. 2의 내용에 따라 식 (1)의 해는 아무런 입력이 없을 때의 시스템으로부터 구하게 되는 해 (homogeneous solution)와 시시각각 들어오는 입력으로부터 얻게되는 해 (particular solution)을 합친 것이다. 이것을 일반해라고 한다[^1].

[^1]: 미분방정식은 한국어 용어만 헷갈릴 뿐만 아니라 영어로 된 용어도 상당히 헷갈린다. homogeneous solution을 한국말로 동차해 혹은 제차해라고 부르고, particular solution을 특이해 혹은 특수해라고 부른다. 이 둘을 합친 것을 일반해 혹은 완전해라고 부른다. 그저 지나가는 일반인으로써 정립된 용어 체계가 얼른 나오길 기다려본다.

그러면 우리는 이렇게 생각할 수 있다. particular solution이 시시각각 식 (1) 우변의 $x$로부터 얻게 되는 변화에 관한 해(solution)라면, particular solution은 식 (1)의 우변의 식과 닮아있어야 한다는 점이다.


## 예제 문제 풀이

가령 식 (1)의 경우 particular solution의 꼴을 

$$Ax+B$$

와 같이 두고 문제를 풀어볼 수 있다.

[2계 선형미분방정식의 해법(2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 본 내용을 적용하면 식 (1)의 homogeneous solution은 다음과 같이 풀 수 있다.

식 (1)의 제차미분방정식 형태는 다음과 같다.

$$y''-4y'+3y = 0$$

여기서 $y=e^{\lambda x}$라고 가정하여 대입하면,

$$\lambda^2e^{\lambda x}-4\lambda e^{\lambda x}+3e^{\lambda x} = 0$$

$e^{\lambda x}$로 식을 묶어주면,

$$e^{\lambda x}(\lambda^2-4\lambda+3) = 0$$

$e^{\lambda x}$는 항상 양수이므로,

$$\lambda^2-4\lambda+3 = 0$$

이고 $\lambda$는

$$\lambda = 1 \quad \text{ or } \quad 3$$

이다.

따라서, homogeneous solution은

$$y_h = c_1e^x+c_2e^{3x}$$

이다.

그러면 우리가 homogeneous solution에 particular solution을 합친 것을 일반해라고 가정하였으므로 우리의 일반해는 아래와 같은 형태가 될 것이다.

$$y(x) = c_1e^x + c_2e^{3x}+Ax+B$$

이 식은 원래의 식 (1)의 미분방저식에 대입해도 성립해야 하므로,

$$y' = c_1e^x + 3c_2e^{3x}+A$$

$$y'' = c_1e^x + 9c_2e^{3x}$$

라는 관계를 이용해 원래 식 (1)에 대입하면,

$$식 (1)\Rightarrow (c_1e^x+9c_2e^{3x})-4\times (c_1e^x+3c_2e^{3x}+A)+3\times(c_1e^x + c_2e^{3x}+Ax+B)=x$$

$$=e^x(c_1-4c_1+3c_1)+e^{3x}(9c_2-12c_2+3c_2)+3Ax+(-4A+3B)=x$$

따라서 $3A = 1$ 이고 $-4A+3B = 0$ 이므로,

$$A=1/3, \quad B = 4/9$$

와 같다. 따라서, 식 (1)의 일반해는

$$y(x) = c_1e^x + c_2e^{3x}+\frac{1}{3}x+\frac{4}{9}$$

이다.

# 미정계수 테이블

식 (1)의 $x$와 같은 비제차 항은 여러가지 형태가 나올 수 있는데 보통 다항식, 삼각함수, 지수함수의 꼴로 나온다면 아래와 같이 미정계수를 정하여 풀면 좋다.



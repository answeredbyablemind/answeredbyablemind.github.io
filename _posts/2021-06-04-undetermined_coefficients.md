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

$$x''-4x'+3x=t$$

[비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 소개했던 내용을 잠깐 복습하면서 이 식을 보는 방법에 대해 다시 한번 소개하고자 한다.

1. 좌변에 있는 $x''-4x'+3x$는 외부에서 아무런 입력이 없을 때의 시스템(좀 더 자세히는 autonomous dynamical systems)의 상태를 의미하고 우변의 $t$는 독립변수의 변화에 따른 입력 함수 값을 의미한다.

2. 독립변수는 일반적으로 시간으로 생각하는 것이 편리한데, 이렇게 생각하면 시시각각 입력값이 변함으로써 시스템의 상태가 시시각각 변하게 되는 것을 의미한다.

3. 2의 내용에 따라 식 (1)의 해는 아무런 입력이 없을 때의 시스템으로부터 구하게 되는 해 (homogeneous solution)와 시시각각 들어오는 입력으로부터 얻게되는 해 (particular solution)을 합친 것이다. 이것을 일반해라고 한다[^1].

[^1]: 미분방정식은 한국어 용어만 헷갈릴 뿐만 아니라 영어로 된 용어도 상당히 헷갈린다. homogeneous solution을 한국말로 동차해 혹은 제차해라고 부르고, particular solution을 특이해 혹은 특수해라고 부른다. 이 둘을 합친 것을 일반해 혹은 완전해라고 부른다. 그저 지나가는 일반인으로써 정립된 용어 체계가 얼른 나오길 기다려본다.

그러면 우리는 이렇게 생각할 수 있다. particular solution이 시시각각 식 (1) 우변의 $t$로부터 얻게 되는 변화에 관한 해(solution)라면, particular solution은 식 (1)의 우변의 식과 닮아있어야 한다는 점이다.

# 미정계수 테이블

식 (1)의 $t$와 같은 비제차 항은 여러가지 형태가 나올 수 있는데 보통 다항식, 삼각함수, 지수함수의 꼴로 나온다면 아래와 같이 미정계수를 정해 particular solution을 가정하여 풀이를 시도해볼 수 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-04-undetermined_coefficients/pic1.png">
  <br>
  그림 1. 미정계수법을 이용 시 적용할 수 있는 particular solution의 형태
  <br>
  그림 출처: Advance Engineering Mathematics, Dennis G. Zill, 6th ed., Jones & Bartlett Learning
</p>

여기서 $x_p$의 형태가 그렇게 다양하지 않다는 점이 보일 수도 있다.

다시 말해, 미정계수 방법을 이용할 때에는 비제차 항이 다항함수, 사인함수, 코사인 함수, 지수함수 혹은 이들의 선형결합일 경우에만 적용할 수 있다. 이 외의 비제차 항에 대해서는 매개변수 변환법을 이용해야 한다.

# 예제 문제 풀기

## 예제 문제 1

미정계수법을 이용해 간단한 예제를 한번 풀어보도록 하자.

가령 식 (1)의 경우 particular solution의 꼴을 

$$At+B$$

와 같이 두고 문제를 풀어볼 수 있다.

[2계 선형미분방정식의 해법(2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 본 내용을 적용하면 비제차 미분방정식의 완전해는 homogeneous solution과 particular solution의 합이다. 

식 (1)의 homogeneous solution은 다음과 같이 풀 수 있다. 

식 (1)의 제차미분방정식 형태는 다음과 같다.

$$x''-4x'+3x = 0$$

여기서 $x=e^{\lambda t}$라고 가정하여 대입하면,

$$\lambda^2e^{\lambda t}-4\lambda e^{\lambda t}+3e^{\lambda t} = 0$$

$e^{\lambda t}$로 식을 묶어주면,

$$e^{\lambda t}(\lambda^2-4\lambda+3) = 0$$

$e^{\lambda t}$는 항상 양수이므로,

$$\lambda^2-4\lambda+3 = 0$$

이고 $\lambda$는

$$\lambda = 1 \quad \text{ or } \quad 3$$

이다.

따라서, homogeneous solution은

$$x_h = c_1e^t+c_2e^{3t}$$

이다.

그러면 homogeneous solution에 particular solution을 합친 것을 일반해라고 볼 수 있으므로 우리의 일반해는 아래와 같은 형태가 될 것이다.

$$x(t) = c_1e^t + c_2e^{3t}+At+B$$

이 식은 원래의 식 (1)의 미분방저식에 대입해도 성립해야 하므로,

$$x' = c_1e^t + 3c_2e^{3t}+A$$

$$x'' = c_1e^t + 9c_2e^{3t}$$

라는 관계를 이용해 원래 식 (1)에 대입하면,

$$식 (1)\Rightarrow (c_1e^t+9c_2e^{3t})-4\times (c_1e^t+3c_2e^{3t}+A)+3\times(c_1e^t + c_2e^{3t}+At+B)=t$$

$$=e^x(c_1-4c_1+3c_1)+e^{3t}(9c_2-12c_2+3c_2)+3At+(-4A+3B)=t$$

따라서 $3A = 1$ 이고 $-4A+3B = 0$ 이므로,

$$A=1/3, \quad B = 4/9$$

와 같다. 따라서, 식 (1)의 일반해는

$$x(t) = c_1e^t + c_2e^{3t}+\frac{1}{3}t+\frac{4}{9}$$

이다.

## 예제 문제 2

아래의 미분방정식의 particular solution을 찾으시오.

$$x''-x'+x = 2\sin(3t)$$

이 문제를 보면 particular solution의 꼴을 $A\sin(3t)$라고 설정할 수 있지만 $\sin(3t)$를 여러번 미분하다보면 $\sin(3t)$ 뿐만 아니라 $\cos(3t)$의 꼴도 함께 얻어지게 된다는 것을 생각해볼 수 있다.

따라서, 우리는 particular solution의 형태를 다음과 같이 생각할 수 있다.

$$x_p=A\cos(3t)+B\sin(3t)$$

이제 $x_p$를 미분하고 원래 주어진 미분방정식에 대입하면 다음과 같은 결과를 얻을 수 있다.

$$x_p'' -x_p'+x_p = (-8A-3B)\cos(3t)+(3A-8B)\sin(3t)=2\sin(3t)$$

따라서,

$$-8A-3B=0$$

$$3A-8B = 2$$

이다.

따라서,

$$A=\frac{6}{73},B =-\frac{16}{73}$$

이다.

따라서, particular solution은

$$x_p(t)0=\frac{6}{73}\cos(3t)-\frac{16}{73}\sin(3t)$$

이다.

## 예제 문제 3

아래의 미분방정식의 particular solution을 찾으시오.

$$x''-5x'+4x=8e^{t}$$

이번 문제는 약간 독특한데, 만약 우변에 있는 형태 그대로 particular solution을 $Ae^{t}$라고 상정해보면 문제가 풀리지 않는다는 것을 쉽게 알 수 있다.

실제로 대입해보면,

$$Ae^{t}-5Ae^t+4Ae^t=8e^{t}$$

이므로 $0=e^{8t}$와 같은 이상한 결과를 얻게 되어서 기존의 미정계수법으로는 문제를 풀 수 없음을 알 수 있다.

이렇게 문제가 풀리지 않는 이유는 주어진 미분방정식의 제차 꼴의 미분방정식의 기저해 중 하나가 $e^t$이기 때문이다.

우리는 reduction of order 편에서 봤던 내용과 유사하게 $e^t$와 선형독립인 새로운 기저 $te^t$를 particular solution의 기저해로 잡고 문제를 풀어보자.

$$x_p=Ate^t$$

따라서,

$$x_p'=Ae^t+Ate^t$$

이고

$$x_p''=Ae^t+Ae^t+Ate^t=2Ae^t+Ate^t$$

임을 알 수 있으며, 원래의 미분방정식에 대입하면,

$$x_p''-5x_p'+4x_p=-3Ae^t=8e^t$$

와 같다는 것을 알 수 있다.

따라서,

$$x_p=-\frac{8}{3}te^t$$

임을 알 수 있다.




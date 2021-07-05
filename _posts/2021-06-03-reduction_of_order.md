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
* [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html)

# 들어가기에 앞서

이전 [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서는 2계 제차 선형 미분방정식의 일반해에 대해 다루었다.

우리가 다루는 2계 선형 제차 미분방정식이 아래와 같은 꼴이라고 하자.

$$ax''+bx'+cx = 0$$

여기서 우리는 보조방정식을 얻고, 보조방정식의 근을 통해 고윳값을 확인한다고 공부하였다.

그리고 특히, 보조방정식의 근이 중근인 경우는 중복되는 고윳값을 갖게 되는 경우인데, 가령 중복되는 고윳값을 $\lambda$라고 하면 그 경우 아래와 같이 일반해를 선정할 수 있다고 언급한 바 있다.

$$x(t)=c_1e^{\lambda t}+c_2 te^{\lambda t}$$

다시 말해, 이 솔루션 $x(t)$는 $e^{\lambda t}$ 라는 해 하나만 주어졌을 때 또 다른 해는 $te^{\lambda t}$라고 놓으라고 말해주는 것과 같다.

여기서 $e^{\lambda t}$ 나 $te^{\lambda t}$를 기저함수라고도 부르는데 이 내용에 대해서는 추후에 더 깊게 다루도록 하자. 앞으로는 기저함수라는 표현을 종종 쓰도록 하겠다.

다시 말해, 기저 함수라는 용어를 사용한다면, 2계 미분방정식의 해는 두 개의 기저함수의 선형 결합으로 이루어지는데, 우리는 하나의 기저함수만 부여받은 경우를 생각하게 된 것이라고 말할 수 있다.

그렇다면, 왜 $e^{\lambda t}$라는 기저함수가 주어졌을 때 새로운 기저함수는 $te^{\lambda t}$라고 설정하면 문제가 풀리게 되는 걸까?

# 문제를 푸는 방법

사실 기저가 하나만 주어졌을 때 또 다른 기저를 구하는 방법은 공식만 알면 그렇게 어려운 문제는 아니다.

이번 reduction of order 시간에는 공식을 이용해 문제를 먼저 풀어보고 이 공식이 어떻게 유도되었는지 과정을 살펴보도록 하자.

(유도 과정의 수식 전개가 복잡해 보이기 때문에 이런 구성을 선택했다.)

가령 식 (3)과 같은 방정식에 대해 $x_1(t)$라는 해 하나가 주어졌을 때,

$$x_2(t) = ux_1(t)$$

라고 가정하자.

그리고,

$$u = \int U dt$$

이고,

$$U = \frac{1}{x_1^2}\exp\left(-\int p(t) dt\right)$$

인 $U$를 찾는 것을 목적으로 하여 문제를 풀어보도록 하자.

적분상수들은 일반해를 계산할 때 기저해 두 개를 선형결합 하는 과정에서 의미가 없어지기 때문에 신경쓰지 않아도 괜찮다.

## 예제 문제 1.

아래의 초기값 문제를 해결하시오.

$$x''-4x'+4x = 0 \quad x(0) = 12 \quad x'(0) = -3$$

---

이 문제는 [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 보았던 보조 방정식이 중근을 가지는 경우의 예제 문제이다.

이 경우가 바로 기저해가 하나만 주어지는 경우라고 볼 수 있다.

보조 방정식을 풀면 기저해 중 하나는

$$x_1(t)=e^{2t}$$

라는 것을 알 수 있다.

따라서, 또 다른 기저해인 $x_2(t)$는 다음과 같다고 설정하자.

$$x_2(t) = ux_1(t)$$

그리고 $u=\int U dt$와 같이 설정하고 $U$는

$$U = \frac{1}{(e^{2t})^2}\exp\left(-\int -4 dt\right)$$

와 같다.

따라서, $U$를 조금 더 계산하면,

$$U = \frac{1}{e^{4t}}\exp(4t)=1$$

임을 알 수 있다.

그리고,

$$u=\int U dt$$

이므로,

$$u(t) = t$$

임을 알 수 있다.

따라서, 또 다른 기저 $x_2(t)= ux_1(t) = te^{2t}$임을 알 수 있게 된다.

따라서 일반해는

$$x(t) = c_1e^{2t}+c_2te^{2t}$$

이고, 초기값을 이용하면,

$$x(0) = c_1 = 12$$

$$x'(t) = 2c_1e^{2t}+c_2e^{2t}+2c_2te^{2t}$$

$$x'(0) = 2c_1+c_2= -3$$

$$c_2 = -3-24 =-27$$

$$\therefore x(t) = 12e^{2t}-27te^{2t}$$

와 같이 문제를 풀 수 있게 된다.

# Reduction of Order 공식의 유도 방법

Reduction of order 공식을 유도하는 방법은 식이 깔끔하게 이해되기는 어려워서 굳이 설명하고 싶지는 않다.

하지만 이 방법은 추후 [매개변수 변환법](https://angeloyeo.github.io/2021/06/05/variation_of_parameters.html)의 아이디어와도 맥을 같이 하기 때문에 꼭 짚고 넘어가는 것이 좋다.

---

아래와 같은 조금 더 일반적인 형태의 2계 제차 선형 미분방정식을 푼다고 생각해보자.

$$x''+p(t)x'+q(t)x = 0 % 식 (3)$$

그리고 여기서 기저 함수 $x_1(t)$는 주어져있다고 하자.

$x_2(t) = h(t)x_1(t)$라는 꼴을 띈다고 가정하고 $h(t)$를 구할 수 있을지 알아보자.

여기서 왜 그런 가정을 하냐?라고 묻는다면 특별히 그래야만 하는 이유는 없다. 

미분방정식에서는 해가 유일하게 존재함이 보장된다면 어떤 방식의 아이디어로 방정식을 풀더라도 해만 나오면 그 방법이 정답이다. 다시 말해 해를 구하기 위한 아이디어의 싸움일 뿐이다.

다만, $x_2(t)=h(t)x_1(t)$라고 두면 $x_1(t)$와는 독립적인 기저 함수를 얻을 수 있기 때문에 이렇게 결정하는 것은 타당한 접근이라고 볼 수는 있다.

(독립적인 기저 여부를 판단하기 위해선 [Wronskian](https://angeloyeo.github.io/2019/10/10/Wronskian.html)을 적용할 수 있다.)

---

여기서 주목해야 할 부분 중 하나는 $x_1(t)$와 $x_2(t)$는 모두 2계 제차 미분방정식의 솔루션의 일부분이므로 아래의 두 식이 모두 만족된다는 것이다.

$$x_1''+p(t)x_1'+q(t)x_1= 0$$

$$x_2''+p(t)x_2'+q(t)x_2= 0$$

따라서 우리는 방금 언급 된 식 중 두 번째 식을 사용하기 위해 $x_2'$과 $x_2''$을 구해보자. 

$$x_2' = h'x_1 + hx'_1$$

$$x_2'' = h''x_1+h'x_1'+h'x_1' +hx_1''$$

$$=h''x_1+2h'x_1'+hx_1''$$

따라서 원래의 식에 $x_2'$와 $x_2{''}$를 대입하면,

$$x_2''+p(t)x_2'+q(t)x_2=0$$

$$\Rightarrow h''x_1+2h'x_1'+hx_1''+p(t)(h'x_1+hx_1')+q(t)hx_1=0$$

여기서 $h{''}$와 $h'$, $h$에 대하여 식을 묶어 보자.

$$\Rightarrow h''(x_1) + h'(2x_1'+p(t)x_1)+h(x_1''+p(t)x_1'+q(t)x_1)=0$$

앞서 언급한 바와 같이 $(x_1{''}+p(t)x_1'+q(t)x_1)=0$이므로

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

그러면 [1계 선형 미분방정식](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html) 편에서 본 것 처럼 식 (14)의 양변에 $\mu(t)$를 곱해주면 다음과 같이 식을 변형할 수 있게 된다.

$$식(14)\Rightarrow h''x_1^2\exp\left(\int p(t)dt\right)+\left(2\frac{x_1'}{x_1}+p(t)\right)h'x_1^2\exp\left(\int p(t)dt\right) = 0$$

미분의 chain rule을 이용해 묶어주면 다음과 같이 쓸 수 있다.

$$\Rightarrow \frac{d}{dt}\left\lbrace h'x_1^2\exp\left(\int p(t)dt\right)\right\rbrace=0$$

따라서, $h'$는 다음과 같이 구할 수 있다. 위 식의 양변에 적분을 취해주면,

$$\Rightarrow h'x_1^2\exp\left(\int p(t)dt\right)=C_1$$

여기서 $C_1$은 적분상수이다.

$$\Rightarrow h'=\frac{C_1}{x_1^2}\exp\left(-\int p(t) dt\right)$$

그리고 최종적으로 $h$는 다음과 같다.

$$h(t) = \int \frac{C_1}{x_1^2}\exp\left(-\int p(t) dt\right) dt+C_2$$

여기서 $C_2$ 역시 적분상수이다.

그러면 $x_1(t)$가 식 (3)의 해로 주어졌을 경우 $x_2(t)$를 $h(t)x_1(t)$와 같은 형식으로 구할 수 있음을 알 수 있다.

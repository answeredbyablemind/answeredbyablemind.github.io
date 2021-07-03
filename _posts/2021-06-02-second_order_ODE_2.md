---
title: 2계 선형 미분방정식의 해법 (2)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210602
tags: 미분방정식
---

# Prerequisites

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [2계 선형 미분방정식의 해법 (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html)
* [미분방정식을 이용한 오일러 공식 유도](https://angeloyeo.github.io/2020/09/22/Euler_Formula_Differential_Equation.html)
* [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)

# 2계 제차 선형 미분방정식

2계 선형 미분방정식이란 아래와 같이 미분계수의 최고 미분횟수가 2회인 미분방정식을 의미한다.

$$a(t)\frac{d^2x}{dt^2} + b(t)\frac{dx}{dt} + c(t)x(t) = g(t) % 식 (1)$$

이번 시간에는 특별히 $a(t)$, $b(t)$, $c(t)$가 모두 상수이고 $g(t)=0$인 2계 제차 선형 미분방정식에 대해 다루고자 한다.

다시 말해 우리가 다루고자 하는 미분방정식의 꼴은 아래와 같다.

$$a\frac{d^2x}{dt^2}+b\frac{dx}{dt}+cx(t) = 0 % 식 (2)$$

여기서 $a$는 0이 아니어야 한다.

# 대입 방법을 이용한 해법

앞서 [2계 선형 미분방정식의 해법 (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html) 편에서는 2계 제차 선형 미분방정식의 해를 구할 때 연립방정식의 형태로 방정식을 수정하여 솔루션을 구할 수 있다는 것에 대해 알아보았다.

그 때 핵심적이었던 것은 고윳값과 고유벡터에 관한 것이었다는 것을 기억해보자.

잠깐 복습하면 $y=dx/dt$로 대입하면 식 (2)와 같은 2계 미분방정식을 연립 미분방정식의 꼴로 쓰면 다음과 같았다.

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix} = \begin{bmatrix}0 & 1 \\ -c/a & -b/a\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix} % 식 (3)$$

그리고 위 식에 들어있는 행렬의 특성방정식을 구하면 다음과 같았다.

$$\lambda^2+\frac{b}{a}\lambda + \frac{c}{a}=0 % 식 (4)$$

그리고 이 특성방정식을 통해 고윳값을 구하면,

$$\lambda_{1,2}=\frac{-b\pm \sqrt{b^2-4ac}}{2a} % 식 (5) $$

였으며, 고유벡터는

$$v_{1,2}=\begin{bmatrix}1\\ \lambda_{1,2}\end{bmatrix} % 식 (6)$$

라는 것을 알 수 있었다.

그리고 위의 연립 미분방정식의 솔루션인,

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1e^{\lambda_1 t}\begin{bmatrix}1 \\ \lambda_1\end{bmatrix}+c_2e^{\lambda_2 t}\begin{bmatrix}1 \\ \lambda_2\end{bmatrix} % 식 (7)$$

중에서 $x(t)$만 떼서 얻어내면 된다.

따라서,

$$x(t)=c_1 e^{\lambda_1 t}+c_2e^{\lambda_2 t} % 식 (8)$$

와 같은 솔루션을 얻어낼 수 있음을 알 수 있다. 그러므로, 2계 선형미분방정식의 해를 얻어낼 때 가장 중요한 부분은 고윳값이라는 것을 알 수 있다.

우리는 2계 선형 미분방정식의 해를 구하기 위한 조금 더 쉬운 방법으로 대입 방법을 이용해보자.

대입 방법을 이용한 해법은 일반적으로 교과서에서 많이 소개되고 있는 해법으로 미분방정식의 해를 

$$x(t) = e^{\lambda t} % 식 (3+6)$$

와 같이 상정하여 풀이를 진행해 나가는 것이다.

따라서 식 (1)과 같은 선형 제차 2계 미분방정식에 대해 $x(t) = e^{\lambda t}$라고 하면 다음이 성립할 것이다.

$$\Rightarrow a\lambda^2 e^{\lambda t} + b \lambda e^{\lambda t} + c e^{\lambda t} = 0$$

여기서 $e^{\lambda t}$로 식을 묶어내면,

$$\Rightarrow e^{\lambda t}(a\lambda^2+b\lambda + c)=0$$

이 되고, $e^{\lambda t}$는 항상 양수이므로,

$$a\lambda^2+b\lambda + c=0$$

이 되어야 한다. 즉, 대입법을 이용하면 우리가 식 (4)와 동일한 특성방정식을 얻을 수 있다는 것을 알 수 있다.

따라서, 이 방정식의 근을 구하면 우리는 고윳값에 해당되던 $\lambda$가 어떤 것인지 알 수 있게 된다.

참고로 식 (12)와 같은 방정식을 우리는 '보조 방정식(auxiliary equation)'이라고 부른다.

그리고, 2차 방정식의 근은 두 개이기 때문에 두 개의 고윳값을 알게되면 아래와 같이 두 개의 solution을 얻게 되는 것이다.

$$x_1(t)=e^{\lambda_1 t} % 식 (7+6)$$

$$x_2(t)=e^{\lambda_2 t} % 식 (8+6)$$

## 중복되지 않는 실수 고윳값을 갖는 경우

우리는 식 (9)와 같은 대입법을 이용해 2계 제차 상미분 방정식의 해를 구할 수 있는 방법을 생각해보았다.

이 때, 해는 결론적으로 식 (12)와 같은 2차 방정식으로부터 얻는 고윳값을 통해 결정된다.

그럼 우리는 쉽게 2차 방정식의 해가 실수인 경우와 복소수인 경우로 나눠질 수 있다는 것을 알 수 있다. 근의 공식에 따르면,

$$\lambda = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$$

이며, 다시 말해 식 (2)의 계수 $a$, $b$, $c$ 간의 관계가 $b^2-4ac>0$인 경우 실수 고윳값을 갖는다는 것을 알 수 있다.

### 예시 문제

다음 초기값 문제를 해결하시오.

$$x''+11x'+24x = 0\quad x(0) = 0\quad x'(0) = -7$$

---

여기서 $x=e^{\lambda t}$로 가정하고 보조 방정식을 얻으면,

$$\lambda^2+11\lambda+24 = 0$$

이다.

그리고, 이 보조 방정식의 근을 구해보면,

$$(\lambda+8)(\lambda+3) = 0$$

$$\therefore \lambda = -8 \quad \text{or}\quad \lambda = -3$$

따라서, 이 초기값 문제의 일반해는

$$x(t) = c_1 e^{-8t}+c_2 e^{-3t}$$

이다[^1].

[^1]: 왜 상수 $c_1$, $c_2$를 곱하냐고 묻는 질문이 많다. 그 이유는 방향장 혹은 위상 평면 편에서 보았던 것 처럼 초기값에 의해 결정되기 전에는 무수히 많은 가능한 솔루션이 존재하기 때문이다. 

여기서 초기 조건을 이용하면,

$$x(0) = c_1+c_2 = 0$$

$$x'(0) = c_1(-8)+c_2(-3) = -7$$

$$\therefore c_1 = 1.4,\quad c_2 = -1.4$$

따라서, 솔루션은

$$x(t) = 1.4e^{-8t}-1.4e^{-3t}$$

이다.

## 복소수 고윳값을 갖는 경우

식 (2)의 계수 $a$, $b$, $c$ 간의 관계가 $b^2-4ac<0$인 경우 복소수 고윳값을 갖는다는 것을 알 수 있다.

### 예시 문제

다음 초기값 문제를 해결하시오.

$$x''-4x'+9x = 0,\quad x(0) = 0,\quad x'(0)=-8$$

여기서 $x=e^{\lambda t}$로 가정하고 보조 방정식을 얻으면,

$$\lambda^2-4\lambda+9=0$$

이다.

따라서 $\lambda$는

$$\lambda = \frac{4\pm\sqrt{16-4*9}}{2}$$

$$=\frac{4\pm\sqrt{-20}}{2}=2\pm i \sqrt 5$$

이다.

따라서, 방정식의 일반해는

$$x(t)=c_1e^{(2+i\sqrt 5)t}+c_2e^{(2-i\sqrt 5)t}$$

여기부터는 $e^t$를 $\exp(t)$와 같이 쓰도록 하자. (지수 승이 잘 안 보임)

$$=c_1\exp(2t)\exp(i\sqrt 5 t)+c_2\exp(2t)\exp(-i\sqrt 5t)$$

오일러 공식

$$e^{i\theta}=\cos(\theta)+i\sin(\theta)$$

에 의해,

$$\Rightarrow c_1\exp(2t)\left(\cos(\sqrt{5}t)+i\sin(\sqrt{5}t)\right) + c_2\exp(2t)\left(\cos(\sqrt{5}t)-i\sin(\sqrt{5}t)\right)$$

$$=\exp(2t)\left(
  c_1\cos(\sqrt{5}t)+c_2\cos(\sqrt{5}t)+ic_1\sin(\sqrt{5t})-ic_2\sin(\sqrt{5}t)
  \right)$$

여기서 $c_1+c_2$와 $ic_1-ic_2$를 각각 새로운 상수 $c_3$와 $c_4$로 치환하면,

$$\Rightarrow \exp(2t)\left(
  c_3\cos(\sqrt{5}t)+c_4\sin(\sqrt{5}t)
  \right)$$

가 된다.

여기서 초기 조건을 대입하면,

$$x(0) = c_3=0$$

$$x'(t)=2\exp(2t)\left(c_3\cos(\sqrt{5}t)+c_4\sin(\sqrt{5}t)\right)
+\exp(2t)\left(
  -\sqrt{5}c_3\sin(\sqrt 5 t) + \sqrt{5}c_4\cos(\sqrt{5}t)
  \right)$$

$$=2\exp(2t)(c_4\sin(\sqrt{5}t))+\exp(2t)(\sqrt{5}c_4\cos(\sqrt{5}t))$$

$$x'(0) = \exp(0)(\sqrt{5}c_4)=-8$$

$$\therefore c_4 = -\frac{8}{\sqrt{5}}$$

따라서, 이 미분방정식의 해는

$$\therefore x(t) = -\frac{8}{\sqrt{5}}\exp(2t)\sin(\sqrt{5}t)$$

이다.

## 중근을 갖는 경우

식 (2)의 계수 $a$, $b$, $c$ 간의 관계가 $b^2-4ac=0$인 경우 중근 고윳값을 갖는다는 것을 알 수 있다.

이 경우는 해법이 조금 독특한데, 보조방정식의 해가 되는 $\lambda$를 이용해 하나의 해를 $e^{\lambda t}$로 설정하고 또 다른 해는 $te^{\lambda t}$라고 설정하여 문제를 푼다.

이렇게 설정할 수 있는 이유에 대해서는 다른 포스팅에서 자세히 소개할 것이다. 관련 내용은 [reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html)라고 부르는 테크닉이다.

### 예시 문제

아래의 초기값 문제를 해결하시오.

$$x''-4x'+4x=0\quad x(0) = 12\quad x'(0) = -3$$


이 미분방정식의 보조 방정식을 구하면 다음과 같다.

$$\lambda^2-4\lambda+4 = 0$$

따라서, $\lambda = 2\text{(중근)}$이다.

그러므로 우리는 다음과 같이 일반해를 생각할 수 있게 된다.

$$x(t)=c_1e^{2t}+c_2te^{2t}$$

초기값을 이용하면,

$$x(0) = c_1 = 12$$

$$x'(t) = 2c_1e^{2t}+c_2e^{2t}+2c_2te^{2t}$$

$$x'(0) = 2c_1+c_2= -3$$

$$c_2 = -3-24 =-27$$

$$\therefore x(t) = 12e^{2t}-27te^{2t}$$
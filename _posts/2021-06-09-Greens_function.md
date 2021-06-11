---
title: 그린 함수를 이용한 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210609
tags: 미분방정식
---

그린 함수는 연속적인 입력과 출력을 쪼개서 표현하게 되면 해를 얻기 쉬울 수 있다는 창의적이고도 천재적인 아이디어에서 출발합니다.

그린 함수의 그린은 영국의 수학자 George Green의 이름에서 따왔습니다. George Green이 생각해낸 아이디어가 어떤 것인지 알아보도록 합시다.

# Prerequisites

그린 함수를 이용한 미분방정식의 해법을 이해하기 위해서는 다음의 내용에 대해 이해하고 오시는 것이 좋습니다.

* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

아래는 신호 및 시스템 과목에 관한 내용인데, 그린 함수를 이해하기 위해서 읽으면 좋은 optional prerequisites 입니다.

* [Discrete Time Convolution](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)
* [Continuous Time Convolution](https://angeloyeo.github.io/2019/07/01/Continuous_Time_Convolution.html)

# 미분방정식을 보는 또 다른 관점

지금까지 네 가지 관점에서 미분방정식을 해석해보았다. (많이도 했다...)

[미분방정식을 이용한 현상 모델링](https://angeloyeo.github.io/2021/05/01/modeling_with_differential_equation.html)편에서는 미분계수가 포함된 방정식을 미분방정식이라고 보았다.

또, [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html) 편에서는 좌표 (x,y )에 매핑된 기울기로 미분방정식을 기하학적으로 해석했으며,

[자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서는 미분방정식이란 연속성장의 관점에서 시시각각 변화율이 바뀌는 시스템의 관점에서 미분방정식을 해석하였다.

그리고, [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 알아보았고 미분 연산자의 관점에서 미분 방정식을 해석했다.

이번 시간에는 미분방정식을 **시스템**의 관점에서 해석하고자 한다. 특히, 미분방정식은 closed-loop system으로 해석할 수 있다.

이 내용은 [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 본 되먹임에 관한 내용이나 [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)에서 확인한 연산자 이론의 내용과 궤를 같이 하는 것이다. 하지만 이런 관점의 전환을 통해 왜 그린 함수라는 아이디어가 나올 수 있었는지를 한번 더 이해할 수 있게 될 것이다.


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic1.png">
  <br>
  그림 1. 미분방정식은 closed-loop가 포함된 system으로 볼 수 있다.
</p>

---

기본적으로 시스템이라고 하는 것은 입력과 출력이 있는 것이다. 이것은 함수의 개념과도 유사하다고 할 수 있다.

그런데, closed-loop 시스템이라고 하는 것은 '피드백을 통한 내부적인 작동'과 '외부 입력에 의한 반응'을 동시에 확인할 수 있어야 한다는 점에서 일반적인 함수와 다르다.

여기서 말하는 '피드백을 통한 내부적인 작동'은 미분방정식의 제차해(homogeneous solution)을 말한다. 

즉, [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편과 [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 보았던 것 처럼 제차해(homogeneous solution)은 아무런 외부 입력이 없더라도 자체적으로 구동하는 동작 방법이 서술되어 있는것이다. 왜냐면 제차해는 피드백을 통한 연속 성장에 대한 서술이기 때문이다.

또, '외부 입력에 의한 반응'이라 함은 미분방정식의 비제차 해(particular solution)을 말한다. 이것은 [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 다루었던 것 처럼 시간에 따라 추가적인 외부 입력이 들어올 때의 출력 변화를 의미한다. 거기다 이 출력 변화는 '자체적으로 구동하는' 미분방정식의 제차 시스템(homogeneous system or autonomous system)의 해 위에 얹어져서 작동하게 된다. 우리는 이것을 중첩의 원리라고 부르기도 한다. 

---

그럼 우리는 입력과 출력의 관점에서, 미분방정식으로 서술된 시스템의 출력이란 매 시간 포인트마다의 입력값에 반응하여 얻게 되는 시스템의 출력값들을 모두 모아 합친 것이라고 볼 수 있지는 않을까?

연속 시간의 관점에서 이 관계를 이해하기는 쉽지 않기 때문에 적절한 시간 간격을 두고 입력과 출력을 생각해보자.

가령, 1초 간격으로 한 포인트씩 입력을 넣는데 $[2, 3, 5, 1, 4]$와 같은 입력을 넣고 $[8, 5, 1, 2, 7]$이라는 출력을 얻었다고 생각해보자.

그러면 우리는 $[8, 5, 1, 2, 7]$이라는 출력값은 다음 그림과 같은 방법으로 얻은 것이라고 생각할 수도 있을 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic2.png">
  <br>
  그림 2. 시스템의 입출력 관계로 미분방정식을 생각할 때, 각각의 시간 step에 해당하는 입력은 각 시간 step에 해당하는 출력에만 관여한다고 볼 수 있다.
</p>

위의 그림 2에서 말하고자 하는 것은 이 시스템이 각 time step에서의 입력값이 각 time step의 출력값에만 영향을 준다고 하면 입력과 출력을 time step 구간 별로 나눠서 생각해볼 수 있다는 것이다.

이렇게 작동할 수 있는 것은 벡터와 시스템이 모두 선형성을 만족하기 때문이다.

다시 정리하면, 아래의 애니메이션이 표현하는 것 처럼 각각의 dimension의 벡터 입력은 각각의 dimension의 벡터 출력에 관여한다고 볼 수 있다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic4.mp4">
  </video>
  <br>
  그림 3. (벡터 관점) 각 time step에서의 입력값이 각 time step의 출력값에만 영향을 준다
</p>

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서 우리는 함수가 일반적인 벡터의 일종으로 볼 수 있다고 언급했다.

그 말은 함수란 무한 차원의 벡터라는 뜻이고, 그것은 숫자가 무한하게 나열된 함수를 하나의 벡터로 취급하겠다는 뜻이다.

따라서, 위의 개념을 함수에 확장시키면 아래의 애니메이션과 같이 짧은 구간 구간의 입력 함수 값들은 각각의 구간의 출력 함수값들에만 관여한다고도 볼 수 있다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic5.mp4">
  </video>
  <br>
  그림 4. (함수 관점) 각 time step에서의 입력값이 각 time step의 출력값에만 영향을 준다
</p>

# 디랙 델타 함수 (Dirac delta function)

## 디랙 델타 함수의 motivation

그림 3과 4를 통해 각 time step의 입력값이 각 time step의 출력값에만 영향을 준다고 본다면, 우리는 각 time step의 벡터값들을 뽑아올 수 있는 것 처럼 함수값을 뽑아올 수 있어야 한다.

그림 3에서 각 벡터의 원소들을 뽑아오기 위해서는 각 dimension에 해당하는 기저벡터를 이용해 각 함수값을 추출할 수 있다.

가령, $[2, 3, 5, 1, 4]$라는 벡터에 대해 맨 앞의 2라는 값을 뽑아오기 위해서는 기저벡터 $[1, 0, 0, 0, 0]$과 내적해줌으로써 원소값을 뽑아올 수 있다.

$$\text{dot}([2, 3, 5, 1 , 4], [1, 0, 0, 0, 0]) = 2 % 식(1)$$

마찬가지 방식으로 우리도 함수의 특정 위치의 값을 뽑아오기 위해서는 내적을 해주기 위한 기저 벡터와 유사한 함수를 생각해야 한다.

함수의 내적은 구간이 적절하게 $[a,b]$와 같이 정해졌을 때 아래와 같이 정의되었다.

$x\in[a,b]$에서 정의된 함수 $f$, $g$에 대해

$$\langle f, g\rangle = \int_{a}^{b}\overline{f(x)}g(x)dx % 식(2)$$

여기서 $\overline{f(x)}$는 $f(x)$의 complex conjugate 이다.

만약 $f(x)$와 $g(x)$가 모두 실수함수라면 다음과 같이도 써줄 수 있다.

$$\langle f, g\rangle = \int_{a}^{b}f(x)g(x)dx % 식(3)$$

즉, 함수의 내적은 적분으로 정의되므로 적분을 이용해 함수값을 뽑아내주기 위해 아래와 같은 함수를 생각해보자.

$$r(x) = \begin{cases}1/(2\xi),\quad -\xi<x<\xi \\ 0,\quad\quad \quad\quad \text{elsewhere}\end{cases} % 식(4)$$

여기서 $\xi$는 아주 작은 크기의 실수(real number)이다.

이 함수는 모든 실수 구간에서 적분했을 때 넓이는 1이므로 값을 얻고자 하는 함수 $f(x)$와 적분하면 $f(0)$ 근처의 값을 얻어올 수 있게 된다. 만약 $x=0$ 외의 다른 위치 $x_0$에서의 함수값을 얻고 싶다면 $r(x)$를 평행이동 시켜 $r(x-x_0)$과 적분해주면 될 것이다. 

즉, 우리는 원하는 위치의 함수값을 내적을 통해 얻기 위해 다음과 같은 일을 수행하면 될 것으로 보인다. $x_0$가 구간 $[a, b]$ 사이에 위치한다고 가정했을 때,

$$f(x_0) \approx \int_{a}^{b}f(x)r(x-x_0)dx % 식(5)$$

와 같다.

그런데, 문제는 $r(x)$는 적절한 너비 $2\xi$ 만큼에 대해 정의되어 있으므로 $f(x)$와 $r(x)$의 적분으로는 실제 $f(x_0)$ 값을 얻기 어려울 것이다. 따라서 우리는 $\xi$를 매우 작게 만들면 더 정확히 $f(x)$의 값을 위 식과 같은 내적을 통해서 얻을 수 있다는 것을 예상할 수 있다. 우리는 $\xi$를 작게 만들어줄 때 다음과 같은 일이 일어날 것임을 알 수 있다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic6.mp4">
  </video>
  <br>
  그림 5. $\xi$가 작아지면서 바뀌어가는 $r(x)$의 형태
</p>

따라서, 우리는 $\xi$가 작아질 수록 $r(x)$가 아래의 $\delta(x)$와 같은 모습을 띄게 된다는 것을 알 수 있다.

$$\delta(x)=\begin{cases}\infty,\quad  x=0 \\ 0,\ \ \quad x\neq 0\end{cases} % 식(6)$$

$$\int_{-\infty}^{\infty}\delta(x)dx = 1 % 식(7)$$

## 디랙 델타 함수의 수학적 의미

디랙 델타 함수는 정말 독특하다. 처음에 디랙 델타 함수를 보면 이게 뭔가 싶고, 조금 더 생각해보면 이게 함수의 정의에 따른 함수가 아니라는 것도 알 수 있다. 함수값이 발산하기 때문에 공역의 원소를 특정할 수 없기 때문이다.

이 개념에 대해 더 엄밀하게 알기 위해선 분포 이론(distribution theory)를 알아야 한다. 간단하게만 소개하면 distribution theory에서는 기존의 함수의 정의를 확장한 '일반화된 함수'의 개념을 도입하는데 일반화된 함수의 정의역은 더 이상 숫자가 아니라 구간이다. 구간을 정의역으로 정의함으로써 함수값이 무한대로 발산하는 이상한 문제를 해결할 수 있게 된다. 

또, 어떻게 생각하면 델타 함수는 범함수(functional)의 개념에 가깝다. 범함수는 [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 잠깐 다루었던 개념인데, 벡터를 실수나 복소수로 mapping 해주는 함수이다. 우리는 벡터의 내적에서 행벡터의 역할이 범함수라는 것을 배웠는데, 델타함수 $\delta(x-x_0)$도 마찬가지로 내적연산을 취해줌으로써 함수 $f(x)$를 함수값($f(x_0)$)으로 매핑 해준다는 관점에서 델타 함수는 범함수(functional)에 가까운 개념이라고 할 수 있다. 이런 관점에서 보면 끼워맞추기 식으로 정의된것만 같았던 델타함수의 의미가 더 다가올 것으로 생각된다.

## Sifting Property

디랙 델타 함수는 앞서 계속 설명했지만 내적을 이용해 함수값을 얻어내는 것을 목적으로 고안된 개념이다.

그러다 보니 다음의 성질은 가장 중요한 디랙 델타 함수의 성질이다.

$$\langle \delta(x-x_0), f(x)\rangle = f(x_0)$$

이 특성의 이름은 "SIFTING" property 인데 절대 "SHIFTING"이 아니다[^1]. 

[^1]: sift라는 단어가 없다고 하거나, 오타라고 말하는 등의 이상한 설명이 많다.

SIFT는 체로 걸러낸다는 뜻으로 $x_0$ 만큼 이동한 델타함수와 함수 $f(x)$의 내적이 마치 $x=x_0$라는 점에서 함수값을 체로 걸러내주는 듯한 결과를 보여주기 때문에 이런 이름이 붙은 것이다.

sifting property는 다음과 같이 확인해볼 수 있다.

$$\langle \delta(x-x_0), f(x)\rangle=\int_{a}^{b}\delta(x-x_0)f(x)dx$$

구간 $[a, b]$ 사이에 존재하는 $x_0$에 대해서, 델타함수의 정의에 따라,

$$\Rightarrow \lim_{\xi\rightarrow 0}\int_{x_0-\xi}^{x_0+\xi}\frac{f(x)}{2\xi}dx=\lim_{\xi\rightarrow 0}\frac{1}{2\xi}\int_{x_0-\xi}^{x_0+\xi}f(x)dx$$

여기서 평균값 정리를 사용하자. 임의의 구간 $[x_1, x_2]$에서 평균값 정리는 함수 $f$가 $[x_1,x_2]$에서 연속이고 $(x_1,x_2)$에서 미분가능할 때 다음을 만족시키는 임의의 $\bar{x}\in(x_1,x_2)$가 적어도 하나 존재한다는 정리이다.

$$f'(\bar{x})=\frac{f(x_2)-f(x_1)}{x_2-x_1}$$

여기서 우리는 위 식의 적분꼴을 생각해보면,

$$\Rightarrow \frac{1}{x_2-x_1}\int_{x_1}^{x_2}f(x)dx=f(\bar{x})$$

임을 알 수 있다. (이것을 적분 평균값 정리라고 부른다.) 

여기서, $x_1=x_0-\xi$, $x_2=x_0+\xi$로 치환하면,

$$\Rightarrow \frac{1}{2\xi}\int_{x_0-\xi}^{x_0+\xi}f(x)dx=f(\bar{x})$$

와 같다는 것을 알 수 있는데, $\bar{x}$는 $x_0-\xi$와 $x_0+\xi$ 사이의 값인데 $\xi$는 0으로 수렴하고 있으므로 $\bar{x}$는 $x_0$로 수렴함을 알 수 있다.

따라서,

$$\langle \delta(x-x_0), f(x)\rangle=\int_{a}^{b}\delta(x-x_0)f(x)dx=f(x_0)$$

이다.

# 그린 함수

## 그린 함수의 정의

그린 함수의 정의는 다음과 같다.

구간 $x\in[a,b]$ 및 적절한 경계 조건에서 정의된 선형연산자 $L$과 함수 $u, f$에 대해서 다음이 성립한다고 하자.

$$Lu=f$$

그 때 그린 함수 $G(x, \xi)$는 다음과 같은 조건을 만족하는 함수이다.

$$LG= \delta(x-\xi)$$

여기서 $\delta(x)$는 디랙 델타 함수이다. 또, $\xi$ 역시 $\xi\in[a,b]$와 같이 정의된 변수이다.

왜 그린 함수는 저렇게 복잡하게 생긴 방식으로 정의했을까?

위 식에서 양변에 $f$를 곱하고 $\xi$에 대해 적분해보자.

$$\Rightarrow \int L G(x, \xi)f(\xi)d\xi$$

여기서 그린 함수의 정의에 의해 다음과 같이 바꿔 쓸 수 있다.

$$\Rightarrow \int \delta(x-\xi)f(\xi)d\xi$$

여기서 디랙 델타 함수의 sifting property에 따라 다음이 성립한다.

$$\int\delta(x-\xi)f(\xi)d\xi = f(x)=Lu$$

한편, $L$은 $x$에만 작용하는 선형 연산자이므로 적분 밖으로 뺄 수도 있다.

$$\Rightarrow L\left(\int G(x, \xi)f(\xi)d\xi\right)=Lu$$

따라서

$$u(x)=\int G(x,\xi)f(\xi)d\xi$$

와 같이 미분방정식의 해를 구할 수 있다는 것을 알 수 있다.

잘 생각해보면 그린 함수가 해를 구해내는 방식은 선형대수학에서 역행렬을 이용하는 방식과 유사하다.

$Ax=b$라는 문제에서 $x=A^{-1}b$로 표현되듯 $Lu=f$라는 함수해석학의 문제에 대해서 $u=L^{-1}f$와 유사하게 $u=\langle f, G\rangle$로 표현되는 것이다.

## 예시 문제
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

* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)
* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

아래는 신호 및 시스템 과목에 관한 내용인데, 그린 함수를 이해하기 위해서 읽으면 좋은 optional prerequisites 입니다.

* [Discrete Time Convolution](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)
* [Continuous Time Convolution](https://angeloyeo.github.io/2019/07/01/Continuous_Time_Convolution.html)

# 선형 연산자의 역행렬을 생각할 수 있을까?

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 알아보았고 미분 연산자의 관점에서 미분 방정식을 해석했다. 또, 선형 연산자란 선형대수학에서 공부한 행렬의 개념을 확장시킨 것으로, 함수를 입력 받으면 또 다른 함수를 출력해주는 것이라고 배웠다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic4.png">
  <br>
  그림 1. 연산자(operator)란 함수를 입력으로 받고 또 다른 함수를 출력해주는 함수이다. 이 개념은 선형대수학의 행렬을 확장시킨 개념이라고 볼 수 있다.
</p>

이번에는 그러면 역행렬에 대해 생각해보자.

역행렬은 아래와 같이 정의되는 행렬이다. 임의의 정사각 행렬(square matrix) $A$와 벡터 $x$, $b$에 대해 다음이 성립한다고 하자.

$$Ax=b$$

만약 $A$라는 행렬이 역행렬을 가진다고 하면 역행렬 $B$는 다음과 같은 성질을 만족하는 행렬이다.

$$AB=I$$

여기서 $I$는 단위 행렬이다.

우리는 보통 역행렬을 $A^{-1}$라고들 많이 쓰지만 여기선 역행렬 또한 일종의 행렬임을 강조하고자 썼다.

연산자 이론을 처음 배울 때 강조했던 것 처럼 어떤 개념을 다른 필드로 확장시키기 위해선 의심해보고 또 의심해봐야 한다. 그리고 확장 시키고자 하는 개념의 본래적 의미가 무엇이었는지 수차례 고민해보아야 한다.

우리는 행렬곱과 역행렬의 의미를 다시 한번 생각해보자.

## 행렬곱과 역행렬의 의미

우리는 행렬 곱에 대해 다시 한번 생각해보자.

두 행렬 $A$, $B$에 대해 $A$와 $B$를 곱한다는 것은 $A$는 행위자로, $B$는 피행위자로 연산되는 것이라고 볼 수 있다.

왜냐하면, [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)편에서 보았던 것 처럼 기본적으로 행렬의 곱은 앞에 곱해지는 행렬 $A$와 뒤에 곱해지는 행렬 $B$에 대해 $A$의 행벡터들과 $B$의 열벡터 간의 내적으로 볼 수 있기 때문이다. 거기에, [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 보았던 것 처럼 행벡터는 열벡터에 대한 함수(functional)로 작용한다고 했으니 앞선 행렬 $A$는 행벡터를 위아래로 쌓아둔 연산자들의 집합이라고 볼 수 있고, 뒤에 놓인 행렬 $B$는 열벡터를 양 옆으로 쌓아둔 피연산자들의 집합이라고도 볼 수 있다.

그리고 $AB=I$라는 식을 보면 다음과 같은 일들이 일어나는 것임을 알 수 있다.

* $A$라는 연산자가 $B$의 첫번째 열에 적용되면 첫 번째 기저벡터가 출력된다.

* $A$라는 연산자가 $B$의 두번째 열에 적용되면 두 번째 기저벡터가 출력된다.

$$\vdots\notag$$

* $A$라는 연산자가 $B$의 마지막 열에 적용되면 마지막 기저벡터가 출력된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic1.png">
  <br>
  그림 2. 두 행렬이 역행렬이 되려면 앞에 곱해지는 행렬이 뒤에 곱해지는 행렬의 각각의 열에 작용해 각 순번에 해당하는 기저벡터를 출력해야 한다.
</p>

우리는 이 개념들을 함수 공간에서 유사하게 확장시켜 적용해 볼 것이다.

---

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 설명했는데, 앞선 설명에서 열벡터가 피연산자라고 하였으니, 함수를 대응시키는 벡터는 열벡터라고 생각할 수 있다.

그러니까, 만약 $AB=I$라는 $B$ 행렬이 존재할 수 있다면 $B$ 행렬은 열벡터를 쌓아 만든 개념으로 볼 수 있는 것이고 함수해석학에서는 어떤 함수들이 쌓아진 것으로 봐야 한다는 뜻이다. 다시 말해 원래의 독립변수가 아닌 또 다른 독립변수에 대해 대응되는 함수들을 쭉 나열해둔 것이어야 한다. 핵심 포인트는 $B$ 행렬에 대응될 개념을 함수해석학에서 찾아야 한다면 '함수 뭉치들'이어야 한다는 것이다.

우리는 $Lu=f$에 대해 생각할 것인데, $L$은 선형연산자, $u(x)$와 $f(x)$는 $x\in[a,b]$에서 정의된 함수라고 생각해보자. 그리고 우리가 생각해낼 '함수 뭉치들'을 다음과 같은 기호로 써보자.

$$G(x,s)$$

이런 기호로 새로운 함수 뭉치들을 써낸 것은 $s$ 역시 $s\in[a,b]$의 정의역에서 정의되는 새로운 독립변수로 쓴 것이고, 새로운 $s$축을 따라 $G(x;s)$를 쌓아줄 것이기 때문이다.

그러면 우리는 $L$이라는 연산자가 $s$를 따라가면서 적용될 때 다음과 같은 일이 일어나야 역행렬이 해주는 일과 유사한 일을 적용시킨다는 것을 알 수 있다.

* $L$이라는 연산자가 $G(x, s)$의 $s$의 첫 번째 값($a$)에 대응되는 함수에 적용되면 첫 번째 기저벡터에 대응되는 함수가 출력된다.

* $L$이라는 연산자가 $G(x, s)$의 $s$의 두 번째 값($a$의 바로 옆 값)에 대응되는 함수에 적용되면 두 번째 기저벡터에 대응되는 함수가 출력된다.
  
$$\vdots\notag$$

* $L$이라는 연산자가 $G(x, s)$의 $s$의 마지막 값($b$)에 대응되는 함수에 적용되면 마지막 기저벡터에 대응되는 함수가 출력된다.
  



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

$$r(x) = \begin{cases}1/(2\epsilon),\quad -\epsilon<x<\epsilon \\ 0,\quad\quad \quad\quad \text{elsewhere}\end{cases} % 식(4)$$

여기서 $\epsilon$은 아주 작은 크기의 실수(real number)이다.

이 함수는 모든 실수 구간에서 적분했을 때 넓이는 1이므로 값을 얻고자 하는 함수 $f(x)$와 적분하면 $f(0)$ 근처의 값을 얻어올 수 있게 된다. 만약 $x=0$ 외의 다른 위치 $x_0$에서의 함수값을 얻고 싶다면 $r(x)$를 평행이동 시켜 $r(x-x_0)$과 적분해주면 될 것이다. 

즉, 우리는 원하는 위치의 함수값을 내적을 통해 얻기 위해 다음과 같은 일을 수행하면 될 것으로 보인다. $x_0$가 구간 $[a, b]$ 사이에 위치한다고 가정했을 때,

$$f(x_0) \approx \int_{a}^{b}f(x)r(x-x_0)dx % 식(5)$$

와 같다.

그런데, 문제는 $r(x)$는 적절한 너비 $2\epsilon$ 만큼에 대해 정의되어 있으므로 $f(x)$와 $r(x)$의 적분으로는 실제 $f(x_0)$ 값을 얻기 어려울 것이다. 따라서 우리는 $\epsilon$을 매우 작게 만들면 더 정확히 $f(x)$의 값을 위 식과 같은 내적을 통해서 얻을 수 있다는 것을 예상할 수 있다. 우리는 $\epsilon$을 작게 만들어줄 때 다음과 같은 일이 일어날 것임을 알 수 있다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic6.mp4">
  </video>
  <br>
  그림 5. $\epsilon$이 작아지면서 바뀌어가는 $r(x)$의 형태
</p>

따라서, 우리는 $\epsilon$이 작아질 수록 $r(x)$가 아래의 $\delta(x)$와 같은 모습을 띄게 된다는 것을 알 수 있다.

$$\delta(x)=\begin{cases}\infty,\quad  x=0 \\ 0,\ \ \quad x\neq 0\end{cases} % 식(6)$$

$$\int_{-\infty}^{\infty}\delta(x)dx = 1 % 식(7)$$

## 디랙 델타 함수의 수학적 의미

디랙 델타 함수는 정말 독특하다. 처음에 디랙 델타 함수를 보면 이게 뭔가 싶고, 조금 더 생각해보면 이게 함수의 정의에 따른 함수가 아니라는 것도 알 수 있다. 함수값이 발산하기 때문에 공역의 원소를 특정할 수 없기 때문이다.

이 개념에 대해 더 엄밀하게 알기 위해선 분포 이론(distribution theory)를 알아야 한다. 간단하게만 소개하면 distribution theory에서는 기존의 함수의 정의를 확장한 '일반화된 함수'의 개념을 도입하는데 일반화된 함수의 정의역은 더 이상 숫자가 아니라 구간이다. 구간을 정의역으로 정의함으로써 함수값이 무한대로 발산하는 이상한 문제를 해결할 수 있게 된다. 

또, 어떻게 생각하면 델타 함수는 범함수(functional)의 개념에 가깝다. 범함수는 [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 잠깐 다루었던 개념인데, 벡터를 실수나 복소수로 mapping 해주는 함수이다. 우리는 벡터의 내적에서 행벡터의 역할이 범함수라는 것을 배웠는데, 델타함수 $\delta(x-x_0)$도 마찬가지로 내적연산을 취해줌으로써 함수 $f(x)$를 함수값$f(x_0)$으로 매핑 해준다는 관점에서 델타 함수는 범함수(functional)에 가까운 개념이라고 할 수 있다. 이런 관점에서 보면 끼워맞추기 식으로 정의된것만 같았던 델타함수의 의미가 더 다가올 것으로 생각된다.

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

$$\Rightarrow \lim_{\epsilon\rightarrow 0}\int_{x_0-\epsilon}^{x_0+\epsilon}\frac{f(x)}{2\epsilon}dx=\lim_{\epsilon\rightarrow 0}\frac{1}{2\epsilon}\int_{x_0-\epsilon}^{x_0+\epsilon}f(x)dx$$

여기서 평균값 정리를 사용하자. 임의의 구간 $[x_1, x_2]$에서 평균값 정리는 함수 $f$가 $[x_1,x_2]$에서 연속이고 $(x_1,x_2)$에서 미분가능할 때 다음을 만족시키는 임의의 $\bar{x}\in(x_1,x_2)$가 적어도 하나 존재한다는 정리이다.

$$f'(\bar{x})=\frac{f(x_2)-f(x_1)}{x_2-x_1}$$

여기서 우리는 위 식의 적분꼴을 생각해보면,

$$\Rightarrow \frac{1}{x_2-x_1}\int_{x_1}^{x_2}f(x)dx=f(\bar{x})$$

임을 알 수 있다. (이것을 적분 평균값 정리라고 부른다.) 

여기서, $x_1=x_0-\epsilon$, $x_2=x_0+\epsilon$으로 치환하면,

$$\Rightarrow \frac{1}{2\epsilon}\int_{x_0-\epsilon}^{x_0+\epsilon}f(x)dx=f(\bar{x})$$

와 같다는 것을 알 수 있는데, $\bar{x}$는 $x_0-\epsilon$과 $x_0+\epsilon$ 사이의 값인데 $\epsilon$은 0으로 수렴하고 있으므로 $\bar{x}$는 $x_0$로 수렴함을 알 수 있다.

따라서,

$$\langle \delta(x-x_0), f(x)\rangle=\int_{a}^{b}\delta(x-x_0)f(x)dx=f(x_0)$$

이다.

# 그린 함수

## 그린 함수의 정의

그린 함수의 정의는 다음과 같다.

구간 $x\in[a,b]$ 및 적절한 경계 조건에서 정의된 선형연산자 $L$과 함수 $u, f$에 대해서 다음이 성립한다고 하자.

$$Lu=f$$

여기서 경계조건은 다음과 같은 homogeneous boundary condition을 만족한다고 하자.

$$u(a)=0, u(b)=0$$

여기서 homogeneous 경계조건이라 함은 혹은 $u'(a)=0$, $u'(b)=0$ 과 같은 경계 조건을 가질 수도 있는 것이지만 여기서는 문제를 쉽게 만들기 위해 위와 같은 단순한 조건을 상정해보자.

이 때 그린 함수 $G(x, s)$는 다음과 같은 조건을 만족하는 함수이다.

$$LG= \delta(x-s)$$

여기서 $\delta(x)$는 디랙 델타 함수이다. 또, $s$ 역시 $s\in[a,b]$와 같이 정의된 변수이다.

왜 그린 함수는 저렇게 복잡하게 생긴 방식으로 정의했을까?

[//]:# (이유가 어떻게 될지 서술...?)

(쓰는 중)

그린 함수의 역할은 역행렬과 같다.

$$G=L^{-1}\delta(x-s)$$

와 같은 방식으로 생각해보면 ... ($L^{-1}$은 수학적으로 정의될 수 있는 용어가 아님)

[//]:# (이유가 어떻게 될지 서술...?)

위 식에서 양변에 $f$를 곱하고 $s$에 대해 적분해보자.

$$\Rightarrow \int_{a}^{b} L G(x, s)f(s)ds$$

여기서 그린 함수의 정의에 의해 다음과 같이 바꿔 쓸 수 있다.

$$\Rightarrow \int_{a}^{b} \delta(x-s)f(s)ds$$

여기서 디랙 델타 함수의 sifting property에 따라 다음이 성립한다.

$$\int_{a}^{b}\delta(x-s)f(s)ds = f(x)=Lu$$

한편, $L$은 $x$에만 작용하는 선형 연산자이므로 적분 밖으로 뺄 수도 있다.

$$\Rightarrow L\left(\int_{a}^{b} G(x, s)f(s)ds\right)=Lu$$

따라서

$$u(x)=\int_{a}^{b} G(x,s)f(s)ds$$

와 같이 미분방정식의 해를 구할 수 있다는 것을 알 수 있다.

잘 생각해보면 그린 함수가 해를 구해내는 방식은 선형대수학에서 역행렬을 이용하는 방식과 유사하다.

$Ax=b$라는 문제에서 $x=A^{-1}b$로 표현되듯 $Lu=f$라는 함수해석학의 문제에 대해서 $u=L^{-1}f$와 유사하게 $G$와 $f$의 적분으로 표현되는 것이다.

## 그린 함수 계산하기




## 예시 문제
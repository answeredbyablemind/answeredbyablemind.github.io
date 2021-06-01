---
title: 선형 연산자와 함수 공간
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210531
tags: 미분방정식
---

# 미분방정식을 보는 또 다른 관점

지금까지 미분방정식을 해석하는 여러가지 관점에 대해 알아보았다.

[미분방정식을 이용한 현상 모델링](https://angeloyeo.github.io/2021/05/01/modeling_with_differential_equation.html)편에서는 미분계수가 포함된 방정식을 미분방정식이라고 보았다.

또, [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html) 편에서는 좌표 $(x,y)$에 매핑된 기울기로 미분방정식을 기하학적으로 해석했으며,

[미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서는 미분방정식이란 연속성장의 관점에서 시시각각 변화율이 바뀌는 시스템의 관점에서 미분방정식을 해석하였다.

위의 세 가지 해석은 미분방정식을 수치적으로나 해석적(analytic)으로나 매우 유용한 관점이었으며, 1계 미분방정식 뿐만 아니라 그 이상의 degree의 미분방정식의 해 특성을 파악하는데에도 중요한 역할을 하는 주춧돌이었다.

---

지금부터는 미분방정식을 보는 또 다른 관점으로 바라보고자 한다. 여기서는 선형대수학에서 사용되던 벡터, 행렬의 개념을 함수에 도입할 것이다.

이제부터는 함수를 일종의 벡터로 취급할 수 있다는 것을 알 수 있게 되며, 선형대수학에서 행렬에 해당하는 연산이 '선형 연산자(linear operator)'라는 이름으로 개념이 확장된다.

또, 벡터들의 집합인 벡터 공간을 함수들의 집합인 함수 공간으로 개념을 확장시켜 사용할 것이다.

이런 논리가 아주 자세하게 학문으로 정립된 것이 '함수해석학'인데 이번 글에서는 기본적인 내용만 간단히 짚고 넘어가고자 한다.

# Prerequisites

이번 포스팅을 이해하기 위해선 아래의 내용에 대해 자세히 알고 오시는 것을 추천드립니다.

* [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)
* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)
* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)

# functions as vectors

이전 포스팅 중 선형대수학의 기초 부분인 [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)에서는 세 가지 관점으로 벡터를 생각했다.

그 중 가장 수학적인 벡터의 정의로써 벡터랑 벡터 공간의 원소라는 정의를 내세운 바 있다.

또, 이 정의가 중요한 이유는 '이런 방식으로 벡터를 정의하는 것은 이러한 특성을 가진 것들은 모두 벡터로 취급해서 다룰 수 있다는 점을 강조한다'라고 말했다.

다시 말해, 벡터의 특성을 가지는 개념을 발견한다면, 선형대수학에서 적용해볼 수 있었던 테크닉들과 개념들을 확장해 적용해볼 수 있게 되는 것이다.

조금 더 구체적으로 말하자면 어떤 수학적 object(가령, 벡터, 행렬, 함수, 등등...)가 벡터이기 위해선 다음의 두 가지 연산에 대해 닫혀있어야 한다.

* 벡터의 상수배
* 벡터의 합

너무 단순한가?

마치 쿠팡에서 로켓와우 멤버십 가입비 2900원만내면 쿠팡에서 제공하는 모든 로켓배송 서비스를 누릴 수 있는 것 처럼, 어떤 수학적 object가 위의 두 개의 법칙만 잘 만족하는 것이라고 확인된다면 '벡터'라는 멤버십을 받게 되는 것이다.

그리고 이에 따라 선형대수학에서 열심히 일궈놓은 개념들과 테크닉들을 적용받을 수 있게 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic1.png">
  <br>
  그림 1. 쿠팡에서 로켓와우 멤버십에 가입해 누릴 수 있는 혜택들 (출처: 쿠팡)
</p>

엄밀한 증명은 아니지만 간단하게만 생각해봐도 함수는 벡터로 볼 수 있는 자격을 갖췄다.

아래는 함수의 상수배와 함수끼리의 합을 표현한 것이다. 

$$(c\cdot f)(x) = c\cdot f(x) % 식 (1)$$

$$(f+g)(x) = f(x)+g(x) % 식 (2)$$

다시 말해 어떤 함수 $f(x)$에 임의의 상수 $c$를 곱하더라도 여전히 $cf(x)$는 함수이고,

어떤 함수 $f(x)$와 $g(x)$를 더하더라도 $f(x)+g(x)$ 역시 함수다.

<p align = "center">
  <img src = "https://upload.wikimedia.org/wikipedia/commons/d/d7/Example_for_addition_of_functions.svg">
  <br>
  그림 2. 두 함수의 합
  <br>
  <a href = "https://en.wikipedia.org/wiki/Function_space"> 그림 출처: Fucntion space, Wikipeda </a>
</p>

이렇게 되면 벡터가 벡터 공간의 원소로 정의되었던 것 처럼, 함수도 벡터 공간의 원소로 정의될 수 있는 벡터가 되며, 이 때 함수가 포함되어 있는 벡터 공간을 <span style="color:red"><b>"함수 공간(function space)"</b></span>이라고 부른다.

---

우리는 벡터의 개념을 확장해서 함수 공간이라는 개념을 얻어낼 수 있음을 알게되었다.

이제 중요한 점은 어떻게 벡터에 적용되는 선형대수학의 개념들과 테크닉들을 함수에 적용할 것인가 라는 점이다.

개념의 확장이 있고 난 뒤에는 아무 의심없이 적용했던 모든 것들을 의심해봐야 한다.

이 개념이 어디서부터 나왔는지, 이 개념이 가졌던 근본적인 의미가 뭐였는지 생각해본 뒤에 비로소 확장된 버전의 테크닉들을 생각해낼 수 있기 때문이다.

여기서는 총 세 가지의 선형대수학의 개념에 대해 함수해석학에서 "확장된" 버전의 개념이 어떤 것인지 알아볼 것이다.

## 벡터 간의 내적 → 함수의 내적

첫 번째는 내적(inner product) 연산이다.

선형대수학에서 벡터의 내적은 다음과 같이 정의되었다.

임의의 아래와 같은 $n$차원 실수 벡터 $\vec{a}$와 $\vec{b}$에 대하여,

$$\vec{a} = \begin{bmatrix}a_1\\ a_2 \\ \vdots \\ a_n\end{bmatrix} % 식 (3)$$

$$\vec{b} = \begin{bmatrix}b_1\\ b_2 \\ \vdots \\ b_n\end{bmatrix} % 식 (4)$$

$$\text{dot}(\vec{a}, \vec{b})=a_1b_1 + a_2b_2 +\cdots + a_nb_n % 식 (5)$$

만약 $\vec{a}$와 $\vec{b}$가 복소 벡터였다고 하면 내적은 다음과 같이 정의된다.

$$\text{dot}(\vec{a}, \vec{b})=a_1^*b_1 + a_2^*b_2 +\cdots + a_n^*b_n % 식 (6)$$

여기서 $*$은 복소 켤레(complex conjugate) 연산이다.

왜 복소 벡터는 복소 켤레 연산이 들어가는지 생각해본다면 내적을 통해 복소 벡터에서 길이를 정의하기 위해서이다.

어떤 실수 벡터 $\vec{a}$의 크기(보통 L2-norm)는 다음과 같이 정의된다.

$$\text{norm}(\vec{a}) = \sqrt{a_1^2 + a_2^2 + \cdots + a_n^2} % 식 (7)$$

즉,

$$\text{norm}(\vec{a}) = \sqrt{\text{dot}(\vec{a}, \vec{a})}=\sqrt{a_1a_1+a_2a_2+\cdots+a_na_n} % 식 (8)$$

이 개념을 복소벡터에까지 확장시키면, 복소 벡터 $\vec{a}$에 대해서

$$\text{norm}(\vec{a})=\sqrt{a_1^2+a_2^2 + \cdots a_n^2}=\sqrt{a_1^*a_1+a_2^*a_2+\cdots +a_n^*a_n}=\sqrt{\text{dot}(\vec{a},\vec{a})} % 식 (9)$$

이어야 하므로 복소벡터의 내적연산은 식 (6)과 같이 정의되어야 하는 것이다.

이제 식 (6)의 방식을 확장해 함수의 내적을 정의해보도록 하자.

미분방정식을 다룰 때 사용되는 함수들은 실수 함수 범위에서 그치지않고 함수값이 복소수가 될 수 도 있기 때문에 다음과 같이 복소 벡터의 내적의 정의를 확장해 다음과 같이 정의한다.

실수 입력 복소수 출력을 갖는 구간 $(a, b)$에서 정의된 임의의 복소함수 $f$, $g$에 대해 두 함수의 inner product $\langle f, g\rangle$은 

$$\langle f, g\rangle \equiv \int_a^bf^*(x)g(x) dx % 식 (10)$$

이다. 여기서 $f^*(x)$는 $f(x)$의 complex conjugate이다.

## 행렬과 벡터의 곱 → 연산자와 함수의 관계

[행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html) 편에서는 행렬은 벡터에 적용되는 일종의 함수라고 말한 바 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic1.png">
  <br>
  그림 3. 행렬은 벡터를 입력으로 받고 또 다른 벡터를 출력으로 내주는 일종의 함수 역할을 한다.
</p>

우리가 만약 일반적인 함수 $f(x)$, $g(x)$를 벡터로 생각할 수 있다면 선형대수학에서의 행렬의 개념을 확장시킨 함수를 입력으로 받고 다른 함수를 출력해주는 개념을 생각할 수 있다.

그러한 개념을 우리는 함수에 적용되는 '연산자(operator)'라고 부르자. 선형대수학의 행렬처럼 연산자는 함수를 입력받고 다른 함수를 출력해준다.

그리고, 특히 아래와 같은 특성을 만족하는 연산자라면 그 연산자는 '선형 연산자'라고 부른다. 어떤 연산자 $L$에 대해,

$$L(\alpha f + \beta g) = \alpha Lf + \beta Lg  % 식 (11)$$

이며, $\alpha$와 $\beta$는 임의의 복소수이고, $f$와 $g$는 임의의 복소 함수이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic4.png">
  <br>
  그림 4. 연산자(operator)란 함수를 입력으로 받고 또 다른 함수를 출력해주는 함수이다.
</p>

---

계속 추상적인 표현으로 '연산자'라고만 하면 이해하기 어렵기 때문에 아래와 같이 연산자의 쉬운 예시를 몇 가지 생각해보자.

연산자 $L$과 함수 $\phi(x)$에 대해,

### (1) 스칼라배 연산

$$L\phi = \alpha \phi  % 식 (12)$$

### (2) 미분 연산자. 

미분 차수는 몇 차(order)여도 상관없다.

$$L\phi = \frac{d^3}{dx^3}\phi \quad\text{ or }\quad L = \frac{d^3}{dx^3} % 식 (13)$$ 

또는 여러 개의 미분연산이 결합된 것도 하나의 연산자로 볼 수 있으며 다른 함수를 곱하고 미분을 취해주는 방식도 가능하다.

가령, 아래와 같은 연산자도 생각할 수 있으며 선형 연산자이다.

$$L\phi = \phi^{(n)}(x)+a_1(x)\phi^{(n-1)}(x)+\cdots+a_{n-1}(x)\phi'(x)+a_n(x)\phi(x) % 식 (14)$$

즉, 연산자는

$$L = \frac{d^n}{dx^n}+a_1(x)\frac{d^{n-1}}{dx^{n-1}}+\cdots+a_{n-1}\frac{d}{dx}+a_n(x) % 식 (15)$$

이다.

### (3) 적분 연산자. 

일반적인 적분 뿐만 아니라 다른 어떤 함수를 곱하고 적분을 취해주는 방식도 가능하다. 마찬가지로 선형연산자이다.

임의의 복소함수 $K(\cdot,\cdot)$에 대해,

$$L\phi = \int_{a}^{b}K(x, x')\phi(x')dx' % 식 (16)$$

가령 convolution 연산도 적분 연산자의 일종이다.

$$L\phi = \int_{-\infty}^{\infty}\phi(x')g(x-x')dx' % 식 (17)$$

또는 푸리에 변환도 적분 연산자의 일종이다.

$$L\phi = \int_{-\infty}^{\infty}\phi(\xi)e^{2\pi i\xi x}d\xi % 식 (18)$$

## 전치 연산 → adjoint 연산

이번에는 전치 연산에 대해 생각해보자.

벡터의 전치 연산은 매우 간단하다. 아래와 같이 행과 열을 뒤집어 주면 된다.

$$\begin{bmatrix}1 & 2\end{bmatrix}^T = \begin{bmatrix}1\\2 \end{bmatrix} % 식 (19)$$

그럼 선형대수학에서 전치 연산의 역할은 무엇이었던가?

전치 연산은 열벡터를 행벡터로, 혹은 행벡터를 열벡터로 바꿔주는 역할을 해주었다.

[행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 보았던 것 처럼 행벡터는 열벡터에 적용되는 함수(functional)이다.

그리고 벡터의 전치 연산을 정의하고 행벡터를 열벡터에 작용하는 함수로 생각함으로써 두 벡터의 내적은 다음과 같이도 계산할 수 있게 되었다.

임의의 벡터 $\vec{a}$와 $\vec{b}$에 대해서,

$$\vec{a}\cdot\vec{b} = \vec{a}^T\vec{b} % 식 (20)$$

와 같이 쓸 수 있게 되는 것이다.

(이런 배경을 바탕으로 수학자들은 행벡터와 열벡터 간의 연산을 내적으로 정의하였다. 이 정의는 자연스레 행렬과 벡터의 곱의 정의로 확장되게 된다.)

즉, $\vec{a}$에 전치연산을 취해줌으로써 원래의 열벡터를 행벡터로 바꿔놓았고, 이를 통해 벡터의 기능을 연산자로 작동할 수 있게 해준 것이다.

여기서 말하고자 하는 핵심 포인트는 '전치 연산은 내적과 함께 생각해야 하는 것이며, 연산자에 작용시키기 위해 만든 연산'이라는 것이다.

---

한편, 임의의 두 벡터의 내적 연산을 생각해보는데 두 벡터 중 두 번째 벡터는 $A$라는 행렬을 통해 선형변환 된 결과로써의 벡터라고 생각해보자. 

다시 말해, 임의의 두 벡터 $x$, $y$에 대해,

$$x\cdot Ay % 식 (21)$$

와 같은 내적연산을 생각해보자. 

우리는 이 식을 통해 행렬 $A$의 전치 연산에 대해 생각해볼 것이다. 식 (20)에 따르면 식 (21)은 전치연산을 활용해 쓸 수 있다.

즉, 식 (21)은

$$x^TAy % 식 (22)$$

가 된다.

여기서 괄호를 조금 다르게 묶어서 생각해보면 식 (22)는 이렇게도 볼 수 있다.

$$(x^TA)y % 식 (23)$$

만약 이 식을 $x^TA$라는 벡터와 $y$라는 벡터의 내적으로 본다면, 식 (23)은 전치연산을 통해 다음과 같이 표현될 수도 있다.

$$(A^Tx)^Ty=(A^Tx)\cdot y % 식 (24)$$

여기까지 본 내용을 통해 벡터의 전치 연산을 함수 공간에 어떻게 확장시켰는지 알아보자[^1].

[^1]: 좀 더 자세하게는 우리가 생각하는 함수 공간의 함수는 모두 복소 함수이므로 transpose가 아니라 conjugate transpose에 대해 알아보는 것이 더 맞지만, 큰 흐름은 같다.

두 함수 $\psi$와 $\phi$, 그리고 연산자 $L$에 대해 다음이 성립하게 하는 것을 연산자 $L$에 대한 adjoint 연산($^\dagger$, dagger라고 읽음)이다.

$$\langle \psi, L\phi \rangle = \langle L^\dagger \psi, \phi\rangle$$

여기서 $\langle \psi, \phi \rangle$은 $\psi$와 $\phi$ 간의 내적이다.

[//]:# (이렇게만 써두면 마치 Transpose의 특성 중 일부만을 만족시키는 연산인 것 같다.)

---

연산자를 설명할 때와 마찬가지로 추상적으로만 adjoint에 대해 설명하기 보단 몇 가지 예시를 들어서 확인해보도록 하자.

### (1) 스칼라배 연산자의 adjoint

구간 $x\in [a, b]$에서 정의된 복소함수 $\phi$, $\psi$, $f$, $g$와 임의의 복소수 $\alpha$에 대해, 아래와 같은 연산자를 생각하자.

$$L\phi = \alpha \phi$$

그러면 $L^\dagger$는 다음을 만족해야 한다.

$$\langle f, Lg\rangle = \langle L^\dagger f, g\rangle$$

$$\langle f, Lg \rangle = \int_{a}^{b}f^*(x)Lg(x)dx=\int_{a}^{b}f^*(x)\alpha g(x)dx$$

$$=\int_{a}^{b}(\alpha^*)^*f^*(x)g(x)dx=\langle a^*f, g\rangle$$

이다. 따라서, $L^{\dagger}$는

$$L^{\dagger}\psi = \alpha^*\psi$$

와 같은 연산자이다. (여기서 $^*$는 complex conjugate)

### (2) 미분 연산자의 adjoint

$$Lu = \frac{d}{dx}u$$

$$L^{\dagger}v=-\frac{d}{dx}v$$

$$Lu = a(x)\frac{d^2u}{dx^2}+b(x)\frac{du}{dx}+c(x)u$$

formal adjoint $L^{\dagger}v$는

$$L^{\dagger}v=(av)_{xx}-(bv)_x+cv$$

# Ax=b in the world of functions

$$Lu=f$$

## Solvability

Fredholm's alternative theorem 정리하기.

left nullspace와 column space가 직교하는 것이 solvability condition


# 참고 문헌

* function space, Wikipedia (https://en.wikipedia.org/wiki/Function_space)
* Applied Mathematical Methods in Theoretical Physics, 2nd ed., Wiley-VCH, Michio Masujima
* Advanced Differential Equations: Asymptotics & Perturbations, Arxiv, 2020, J Nathan Kutz 

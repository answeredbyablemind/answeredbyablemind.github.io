---
title: 그린 함수를 이용한 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210609
tags: 미분방정식
---

※ 본 포스팅의 내용은 수학적인 엄밀성 보다는 그린 함수의 개념에 더 쉽게 다가가기 위해 작성한 것입니다. 혹시나 수학적으로 치명적인 오류가 있다면 꼭 조언 부탁드립니다.

# Prerequisites

그린 함수를 이용한 미분방정식의 해법을 이해하기 위해서는 다음의 내용에 대해 이해하고 오시는 것이 좋습니다.

* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)
* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

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

* $A$라는 연산자가 $B$의 첫번째 열에 적용되면 첫 번째 단위 기저벡터가 출력된다.

* $A$라는 연산자가 $B$의 두번째 열에 적용되면 두 번째 단위 기저벡터가 출력된다.

$$\vdots\notag$$

* $A$라는 연산자가 $B$의 마지막 열에 적용되면 마지막 단위 기저벡터가 출력된다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic1.png">
  <br>
  그림 2. 행렬 곱셈 연산이 수행되는 두 행렬에 대해 두 번째 행렬이 앞선 행렬의 역행렬이 되려면 앞에 곱해지는 행렬이 뒤에 곱해지는 행렬의 각각의 열에 작용해 각 순번에 해당하는 단위 기저벡터를 출력해야 한다.
</p>

우리는 이 개념들을 함수 공간에서 유사하게 확장시켜 적용해 볼 것이다.

---

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 설명했는데, 앞선 설명에서 열벡터가 피연산자라고 하였으니, 함수를 대응시키는 벡터는 열벡터라고 생각할 수 있다.

그러니까, 만약 $AB=I$라는 $B$ 행렬이 존재할 수 있다면 $B$ 행렬은 열벡터를 쌓아 만든 개념으로 볼 수 있는 것이고 함수해석학에서는 어떤 함수들이 쌓아진 것으로 봐야 한다는 뜻이다. 다시 말해 원래의 독립변수가 아닌 또 다른 독립변수에 대해 대응되는 함수들을 쭉 나열해둔 것이어야 한다. 핵심 포인트는 $B$ 행렬에 대응될 개념을 함수해석학에서 찾아야 한다면 '함수 뭉치들'이어야 한다는 것이다.

우리는 $Lu=f$에 대해 생각할 것인데, $L$은 선형연산자, $u(x)$와 $f(x)$는 $x\in[a,b]$에서 정의된 함수라고 생각해보자. 그리고 우리가 생각해낼 '함수 뭉치들'을 다음과 같은 기호로 써보자.

$$G(x,y)$$

이런 기호로 새로운 함수 뭉치들을 써낸 것은 $y$ 역시 $y\in[a,b]$의 정의역에서 정의되는 새로운 독립변수로 쓴 것이고, 새로운 $y$축을 따라 $G(x;y)$를 쌓아줄 것이기 때문이다.

그러면 우리는 $L$이라는 연산자가 $y$를 따라가면서 적용될 때 다음과 같은 일이 일어나야 역행렬이 해주는 일과 유사한 일을 적용시킨다는 것을 알 수 있다.

* $L$이라는 연산자가 $G(x, y)$의 $y$의 첫 번째 값($a$)에 대응되는 함수에 적용되면 첫 번째 단위 기저벡터에 대응되는 함수가 출력된다.

* $L$이라는 연산자가 $G(x, y)$의 $y$의 두 번째 값($a$의 바로 옆 값)에 대응되는 함수에 적용되면 두 번째 단위 기저벡터에 대응되는 함수가 출력된다.
  
$$\vdots\notag$$

* $L$이라는 연산자가 $G(x, y)$의 $y$의 마지막 값($b$)에 대응되는 함수에 적용되면 마지막 단위 기저벡터에 대응되는 함수가 출력된다.
  
<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic2.png">
  <br>
  그림 3. 어떤 선형 연산자 $L$에 대해 역행렬에 대응되는 함수 $G(x,y)$를 얻으려면 연산자가 각 순번 $y$에 대응하는 함수 $G(x, y)$에 적용되었을 때 단위 기저벡터에 대응하는 함수를 출력해줄 수 있어야 한다.
</p>

그렇다면 우리는 단위 기저 벡터에 대응되는 함수의 개념을 생각해보아야 한다. 이 개념은 디랙 델타 함수라는 개념에서부터 찾을 수 있다.

# 디랙 델타 함수 (Dirac delta function)

## 디랙 델타 함수의 motivation

우리는 단위 기저 벡터에 대해 생각해보기 위해 먼저 단위 기저 벡터라는 것이 어떤 것이었는지 알아보고 이 개념을 함수 공간에 확장시켜보도록 하자.

가장 간단한 단위 기저 벡터는 보통 표준 기저(standard basis)라고 부르는 것들이다. 2차원 벡터 공간에서는 $\hat{i}$, $\hat{j}$라고 단위 기저 벡터를 부르며 각각은 

$$\hat{i}=\begin{bmatrix}1\\0\end{bmatrix}$$

$$\hat{j}=\begin{bmatrix}0\\1\end{bmatrix}$$

이다.

여기서 기저 벡터의 기능은 무엇이라고 할 수 있을까? 그것은 임의의 벡터를 기저벡터의 선형결합으로 표현하는데 있다.

가령, 임의의 벡터

$$\begin{bmatrix}a\\b\end{bmatrix}$$

는 다음과 같이 위의 두 기저벡터 $\hat{i}$와 $\hat{j}$의 선형결합으로 표현할 수 있다.

$$\begin{bmatrix}a\\b\end{bmatrix} = a\begin{bmatrix}1 \\ 0 \end{bmatrix}+b\begin{bmatrix}0 \\ 1 \end{bmatrix}=a\hat{i}+b\hat{j}$$

그러다보니 다음과 같이 임의의 벡터를 기저 벡터와 내적해주면 기저벡터가 가지고 있는 성분량이 나오게 되는 것이다.

가령, 임의의 벡터 $[a,b]^T$에 대해 $\hat{i}$ 기저벡터와의 내적은 $a$라는 값을 뽑아준다.

$$\text{dot}(\begin{bmatrix}a\\b \end{bmatrix}, \begin{bmatrix}1\\0 \end{bmatrix})=a$$

그리고 벡터는 숫자들의 나열이라고도 볼 수 있고 이 때 나열된 숫자의 개수가 벡터의 차원을 의미한다고 볼 수 있다[^1].

[^1]: 수학적으로 엄밀한 표현은 아니지만 ...

가령, $[2, 3, 5, 1, 4]^T$라는 5차원 벡터에 대해 기저벡터 $[1, 0, 0, 0, 0]^T$과 내적해줌으로써 이 기저벡터가 $[2, 3, 5, 1, 4]^T$라는 벡터를 표현할 때 담당하는 성분량을 알 수 있게 되는 것이다.

$$\text{dot}\left(\begin{bmatrix}2\\3\\5\\1\\4\end{bmatrix}, \begin{bmatrix}1\\0\\0\\0\\0\end{bmatrix}\right) = 2$$

마찬가지 방식으로 우리도 함수의 특정 위치의 값을 뽑아오기 위해서는 내적을 해주기 위한 기저 벡터와 유사한 함수를 생각해야 한다.

함수의 내적은 구간이 적절하게 $[a,b]$와 같이 정해졌을 때 아래와 같이 정의되었다.

$x\in[a,b]$에서 정의된 함수 $f$, $g$에 대해

$$\langle f, g\rangle = \int_{a}^{b}\overline{f(x)}g(x)dx$$

여기서 $\overline{f(x)}$는 $f(x)$의 complex conjugate 이다.

만약 $f(x)=\overline{f(x)}$라면 다음과 같이도 써줄 수 있다.

$$\langle f, g\rangle = \int_{a}^{b}f(x)g(x)dx$$

즉, 함수의 내적은 적분으로 정의되므로 적분을 이용해 함수값을 뽑아내주기 위해 아래와 같은 함수를 생각해보자.

$$r(x) = \begin{cases}1/(2\epsilon),\quad -\epsilon<x<\epsilon \\ 0,\quad\quad \quad\quad \text{elsewhere}\end{cases}$$

여기서 $\epsilon$은 아주 작은 크기의 실수(real number)이다.

이 함수는 $r(x)=\overline{r(x)}$이므로 식 (11)과 같은 적분으로 함수의 내적을 이용할 수 있을 것이다.

이 함수는 모든 정의역 구간에서 적분했을 때 넓이는 1이므로 값을 얻고자 하는 함수 $f(x)$와 적분하면 $f(0)$ 근처의 값을 얻어올 수 있게 된다. 

다시 말해 다음과 같은 내적을 생각할 수 있다는 의미이다. 만약 $x\in[a,b]$에 대해 $a\lt 0\lt b$ 인 경우를 상정한다면

$$\langle r(x), f(x)\rangle=\int_{a}^{b}r(x)f(x)dx\approx f(0)$$

이라는 것이다.

그런데, 문제는 $r(x)$는 적절한 너비 $2\epsilon$ 만큼에 대해 정의되어 있으므로 $f(x)$와 $r(x)$의 적분으로는 실제 $f(0)$ 값을 얻기 어려울 것이다. 따라서 우리는 $\epsilon$을 매우 작게 만들면 더 정확히 $f(x)$의 값을 위 식과 같은 내적을 통해서 얻을 수 있다는 것을 예상할 수 있다. 우리는 $\epsilon$을 작게 만들어줄 때 다음과 같은 일이 일어날 것임을 알 수 있다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic6.mp4">
  </video>
  <br>
  그림 4. $\epsilon$이 작아지면서 바뀌어가는 $r(x)$의 형태
</p>

따라서, 우리는 $\epsilon$이 작아질 수록 $r(x)$가 아래의 $\delta(x)$와 같은 모습을 띄게 된다는 것을 알 수 있다.

$$\delta(x)=\begin{cases}\infty,\quad  x=0 \\ 0,\ \ \quad x\neq 0\end{cases} $$

$$\int_{-\infty}^{\infty}\delta(x)dx = 1 $$

즉, 우리는 $\epsilon$을 매우 작게 만들어줌으로써 다음과 같은 관계를 얻어낼 수 있게 된다.

$$\int_{a}^{b}\delta(x)f(x)=f(0)$$

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic7.mp4">
  </video>
  <br>
  그림 5. 디랙 델타함수와의 내적을 통해 함수의 특정 값을 얻어낼 수 있다.
</p>

또, 만약 $x=0$ 외의 다른 위치 $x_0$에서의 함수값을 얻고 싶다면 $r(x)$를 평행이동 시켜 $r(x-x_0)$과 적분해주면 될 것이다. 

$x_0$가 구간 $[a, b]$ 사이에 위치한다고 가정했을 때,

$$f(x_0) \approx \int_{a}^{b}r(x-x_0)f(x)dx$$

와 같다.

여기서도 $\epsilon$을 매우 작게 만들어주면,

$$f(x_0)=\int_{a}^{b}\delta(x-x_0)f(x)dx$$

와 같이 $f(x)$의 $x_0$라는 입력에 해당하는 원소의 값을 얻어낼 수 있게 되는 것이다. 

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic8.mp4">
  </video>
  <br>
  그림 6. $x=0$이 아닌 임의의 위치의 함수값을 얻고 싶다면 디랙 델타 함수를 옮겨 계산하면 된다.
</p>

이 과정에서 우리는 디랙 델타함수의 sifting property를 확인할 수 있게 된다.

sifting property란 함수 $f(x)$의 특정값 $x=x_0$만을 델타함수를 이용해 체로 걸러내는 듯한 디랙 델타함수의 특성이다.

## 디랙 델타 함수의 수학적 의미

디랙 델타 함수는 전체 정의역 범위에서 정적분이 1이고 특정 값에서만 무한대 값을 가지는 독특한 함수이다. 위에서 언급했던 내용들을 기반으로 디랙델타 함수의 의미를 정리해보자.

### 디랙 델타 함수는 범함수(functional)

디랙 델타 함수는 엄밀하게 말하면 함수의 정의에 따른 함수가 아니다. 함수값이 발산하기 때문에 공역의 원소를 특정할 수 없기 때문이다.이 개념에 대해 더 엄밀하게 알기 위해선 분포 이론(distribution theory)를 알아야 한다. 

간단하게만 소개하면 distribution theory에서는 기존의 함수의 정의를 확장한 '일반화된 함수'의 개념을 도입하는데 일반화된 함수의 정의역은 더 이상 숫자가 아니라 구간이다. 구간을 정의역으로 정의함으로써 함수값이 무한대로 발산하는 이상한 문제를 해결할 수 있게 된다. 

이런 관점에서 델타 함수는 범함수(functional)의 개념에 가깝다. 범함수는 [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 잠깐 다루었던 개념인데, 벡터를 실수나 복소수로 mapping 해주는 함수이다. 우리는 벡터의 내적에서 행벡터의 역할이 범함수라는 것을 배웠는데, 델타함수 $\delta(x-x_0)$도 마찬가지로 내적연산을 취해줌으로써 함수 $f(x)$를 함수값$f(x_0)$으로 매핑 해준다는 관점에서 델타 함수는 범함수(functional)에 가까운 개념이라고 할 수 있다. 이런 관점에서 보면 끼워맞추기 식으로 정의된것만 같았던 델타함수의 의미가 더 다가올 것으로 생각된다.

### 디랙 델타 함수를 이용한 함수의 표현

임의의 벡터는 다음과 같이 각 원소들의 값을 기저벡터들의 결합으로 표현할 수 있다.

가령, 벡터 $\vec{a}$의 원소가 $[a_1, a_2, \cdots, c_n]^T$와 같다고 하고 단위 기저벡터들을 $e_i$라고 했을 때,

$$\vec{a}=\sum_{i=1}^{n} a_ie_i$$

와 같다고 할 수 있다. 예를 들면,

$$\begin{bmatrix}3\\5\\2\end{bmatrix}=3\begin{bmatrix}1\\0\\0\end{bmatrix}+5\begin{bmatrix}0\\1\\0\end{bmatrix}+2\begin{bmatrix}0\\0\\1\end{bmatrix}$$

이다.

델타 함수가 단위 기저 벡터와 같은 역할을 한다고 계속 말하였던 것을 생각해보면 $x\in[a,b]$에서 정의되는 임의의 함수 $f(x)$는 다음과 같이도 표현할 수 있음을 알 수 있다.

$$f(x)=\int_{a}^{b}f(\tau)\delta(x-\tau)d\tau$$

이것이 말해주는 바는 바로 $\delta(x)$의 선형결합으로 임의의 함수를 표현해줄 수 있다는 점이다. 조금 관점을 바꿔 말하면 어떤 함수든지 디랙 델타 함수를 이용하면 각각의 point 별로 쪼개서 함수를 표현해줄 수 있다는 것이다.

# 그린 함수

## 그린 함수의 정의

그린 함수의 정의는 다음과 같다.

구간 $x\in[a,b]$ 및 적절한 경계 조건에서 정의된 선형연산자 $L$과 함수 $u, f$에 대해서 다음이 성립한다고 하자.

$$Lu=f$$

여기서 경계조건은 다음과 같은 homogeneous boundary condition을 만족한다고 하자.

$$u(a)=0, u(b)=0$$

여기서 homogeneous 경계조건이라 함은 혹은 $u'(a)=0$, $u'(b)=0$ 과 같은 경계 조건을 가질 수도 있는 것이지만 여기서는 문제를 쉽게 만들기 위해 위와 같은 단순한 조건을 상정해보자.

이 때 그린 함수 $G(x, y)$는 다음과 같은 조건을 만족하는 함수이다.

$$LG= \delta(x-y)$$

여기서 $\delta(x)$는 디랙 델타 함수이다. 또, $y$ 역시 $y\in[a,b]$와 같이 정의된 변수이다.

잘 생각해보면 그린 함수는 포스팅의 초반부에 언급했던 '함수 뭉치들'인 $G(x,y)$와 같다. 즉, 그린 함수의 역할은 선형대수학에서의 역행렬과 같은 것이다.

그것을 다시 한번 확인해보기 위해 위 식에서 양변에 $f(y)$를 곱하고 $y$에 대해 적분해보자.

$$\Rightarrow \int_{a}^{b} L G(x, y)f(y)dy$$

여기서 그린 함수의 정의에 의해 다음과 같이 바꿔 쓸 수 있다.

$$\Rightarrow \int_{a}^{b} \delta(x-y)f(y)dy$$

여기서 디랙 델타 함수의 sifting property에 따라 다음이 성립한다.

$$\int_{a}^{b}\delta(x-y)f(y)dy = f(x)=Lu$$

한편, $L$은 $x$에만 작용하는 선형 연산자이므로 적분 밖으로 뺄 수도 있다.

$$\Rightarrow L\left(\int_{a}^{b} G(x, y)f(y)dy\right)=Lu$$

따라서

$$u(x)=\int_{a}^{b} G(x,y)f(y)dy$$

와 같이 미분방정식의 해를 구할 수 있다는 것을 알 수 있다.

다시 말해, 그린 함수가 해를 구해내는 방식은 선형대수학에서 역행렬을 이용하는 방식과 유사하다.

$Ax=b$라는 문제에서 $x=A^{-1}b$로 표현되듯 $Lu=f$라는 함수해석학의 문제에 대해서 $u=L^{-1}f$와 유사하게 $G$와 $f$을 곱한 것의 적분으로 표현되는 것이다 (미분의 역연산이 적분이기 때문).

## 그린 함수 계산하기




## 예시 문제
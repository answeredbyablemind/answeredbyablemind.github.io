---
title: 행벡터의 의미와 벡터의 내적
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200909
tags: 선형대수
---

행벡터는 열벡터에 대한 함수이다.

가령

$$\begin{bmatrix}2 & 1\end{bmatrix}\left(\begin{bmatrix}3\\-4\end{bmatrix}\right) = 2\cdot 3 + 1\cdot(-4) = 6-4 = 2$$

즉, $V\rightarrow\Bbb{R}$인 함수

그리고 선형연산자이다.

$$\alpha(\vec{v}+\vec{w}) = \alpha\vec{v} + \alpha\vec{w}$$

예시)

$$\begin{bmatrix}2 & 1\end{bmatrix}\left(\begin{bmatrix}3\\-4\end{bmatrix} + \begin{bmatrix}1\\2\end{bmatrix}\right) 

= \begin{bmatrix}2 & 1\end{bmatrix}\left(\begin{bmatrix}3\\-4\end{bmatrix}\right) + \begin{bmatrix}2 & 1\end{bmatrix}\left(\begin{bmatrix}1\\2\end{bmatrix}\right)$$

$$\alpha(n\vec{w}) = n\alpha(\vec{w})$$

예시)

다시 말해 row vector는

* 열벡터를 입력으로 받아 스칼라(즉, 숫자)를 출력하는 함수[^1]
* 선형연산자임. 
* 다시 말해 두 벡터를 더한 채로 함수 출력을 볼 때와 두 벡터의 함수 출력을 합한 것이 같음.
* 또, 선형연산자이기 때문에 입력에 상수배를 해준 채로 함수를 출력할 때와 출력된 함수에 상수배를 해준 것의 결과는 같음.

# 행벡터의 시각화

지금까지 우리는 행벡터는 열벡터를 입력으로 받는 함수라고 언급하였다. 그렇다면 함수를 시각화 한다는 것, 즉 함수를 그린다는 것의 의미는 무엇일까?

함수를 시각화 한다는 것의 의미는 임의의 입력 $x$에 대해 함수의 출력 $f(x)$를 대응시킨 좌표들을 나열한 것이다.

가령 $y=x^2$을 시각화 한다는 것은 시각화하기에 좋은 범위의 $x$, 가령 $-2\leq x \leq 2$ 에 대해 대응되는 $y=f(x)=x^2$ 값을 좌표 평면에 모두 나타낸 것이다.


그렇다면 $\begin{bmatrix}2 & 1\end{bmatrix}$이라는 행벡터를 시각화 한다고 하면, 임의의 벡터 $\begin{bmatrix}x & y \end{bmatrix}^T$에 대해 함수의 출력을 좌표계에 나열하면 된다.

$$\begin{bmatrix}2 & 1 \end{bmatrix}\left(\begin{bmatrix}x \\ y \end{bmatrix}\right) = 2x+ y$$


등고선의 아이디어를 이용하자.

// 등고선 그림 넣을 것 //

즉, 이 등고선을 이용하면 임의의 벡터 $\vec{v}$가 $\begin{bmatrix} 2 & 1\end{bmatrix}$이라는 함수를 통과했을 때의 출력값을 쉽게 시각화 할 수 있게 된다.


<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-09-row_vector_and_inner_product/pic1.png">
  <br>
  그림 1. 행벡터를 통해 출력된 함수값들의 시각화
</p>


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-09-row_vector_and_inner_product/pic2.png">
  <br>
  그림 2. 
</p>


## 행벡터가 선형함수라는 것의 의미.

행벡터의 스칼라배

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-09-row_vector_and_inner_product/pic3.mp4">
  </video>
  <br>
  그림 3. 다양한 스칼라배로 크기가 커지거나 작아지는 행백터에 대응한 시각화
</p>

벡터에 대해 정의할 때 스칼라배와 벡터 간의 합에 대해 정의가 되는 것들을 벡터로 정의한다고 하였으며, 이 벡터는 벡터 공간을 이룬다고 하였다.

따라서, 행벡터에 대한 선형 함수로 생각할 수 있는 행벡터들도 벡터로 간주할 수 있다는 것을 알 수 있다. 즉, 함수를 벡터로 생각한 경우이다.

이 때, 덧셈 법칙과 곱셈 법칙이 정의된 행벡터들로 구성된 집합을 **행공간**이라고 부른다.

행공간은 ~라는 점에서 열공간의 쌍대공간(dual space)라고 볼 수 있다.

지금까지 우리가 행벡터를 행벡터라고 불렀기 때문에 당연히 벡터라고 생각하고 있지만, 이렇듯 엄밀한 잣대를 들이댐으로써 새로운 개념의 벡터에 대해 생각해볼 수 있는 것이다.

# 행벡터와 벡터의 내적

벡터에 왜 정사영을 해주게 왜 내적의 기하학적 의미란 말인지?

[^1]: 좀 더 엄밀하게는 범함수(functional)이라고 하는게 맞는 표현이지만, 엄밀한 내용에 대해선 넘어가도록 하자.
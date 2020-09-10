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

## 행벡터가 선형함수라는 것의 의미.

작성 할 것.

grid 들의 결합

# 행벡터와 벡터의 내적

벡터에 왜 정사영을 해주게 왜 내적의 기하학적 의미란 말인지?

[^1]: 좀 더 엄밀하게는 범함수(functional)이라고 하는게 맞는 표현이지만, 엄밀한 내용에 대해선 넘어가도록 하자.
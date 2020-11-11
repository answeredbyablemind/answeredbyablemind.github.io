---
title: 의사역행렬의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201111
tags: 선형대수
---

※ 의사역행렬의 정확한 이름은 무어-펜로즈 유사역행렬인 것으로 보이나 일반적으로 많이 쓰는 이름인 의사역행렬(pseudo inverse)를 이용하도록 하겠습니다.

※ 의사역행렬은 복소수-체의 범위에서 정의가능하나 이번 post에서는 실수-체 범위에서 설명하도록 하겠습니다. (시각화 목적 및 계산의 헷갈림 방지)

※ 의사역행렬은 기본적으로 [선형회귀의 선형대수학적 접근](https://angeloyeo.github.io/2020/08/24/linear_regression.html#%EC%84%A0%ED%98%95%EB%8C%80%EC%88%98%ED%95%99%EC%9D%98-%EA%B4%80%EC%A0%90%EC%97%90%EC%84%9C-%EB%B3%B8-%ED%9A%8C%EA%B7%80%EB%B6%84%EC%84%9D)에서 본 내용과 완전히 같은 approach를 가지고 접근합니다.

# Prerequisites

해당 포스트를 이해하기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html): 특히, 쌍대공간의 개념
* [특이값 분해(SVD)](https://angeloyeo.github.io/2019/08/01/SVD.html)

# 의사역행렬의 정의

우선 가장 심플하게 의사역행렬의 정의부터 알아보도록 하자.

의사역행렬은 임의의 행렬 $A\in\Bbb{R}^{m\times n}$에 대해서 

1) $m \gt n$이고 모든 열벡터가 선형 독립인 경우

$$A^+ = (A^TA)^{-1}A^T$$

[//]:# (식 1)

이 때 $A^TA$는 가역행렬이어야 한다.

이 경우 $A^+A=I$가 성립하므로 $A^+$는 좌측 역행렬(left inverse)이라고 부른다.

2) $m \lt n$이고 모든 행벡터가 선형 독립인 경우

$$A^{+} = A^T(AA^T)^{-1}$$

[//]:# (식 2)

이 때 $AA^T$는 가역행렬이어야 한다.

이 경우 $AA^+=I$가 성립하므로 $A^+$는 우측 역행렬(right inverse)이라고 부른다.

위의 1)과 2)를 보았을 때 임의의 크기의 행렬 $A$에 대해 특정 조건만을 만족한다면 어떤 크기의 행렬이라도 [역행렬](https://angeloyeo.github.io/2019/08/06/determinant.html)의 기능과 유사한 기능을 하는 행렬을 구할 수 있다는 것을 알 수 있다.

보통 데이터를 분석할 때는 1)과 2) 중 1)의 경우에 더 많이 직면하게 된다. 그것은 1)의 상황이 데이터 수가 feature 수 보다 많은 상황을 나타내기 때문이다. 이번 포스트에서도 1)의 경우인 '좌측 역행렬'이 가지는 의미에 대해서 조금 더 깊게 탐구해보고자 한다.

# 의사역행렬의 수식적 의미

그렇다면, 의사역행렬이 가지는 근본적인 수식적 의미는 무엇일까?

가령, 다음과 같은 연립방정식이 주어졌다고 생각해보자.

$$Ax = b$$

[//]:# (식 3)

$$\Rightarrow 
  \begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 0 && 1\end{bmatrix}
  \begin{bmatrix}x_1 \\ x_2 \end{bmatrix}
  =
  \begin{bmatrix}0 \\ 1 \\ 3 \end{bmatrix}$$

[//]:# (식 4)

기본적으로 의사역행렬이 하고자 하는 일은 임의의 행렬 $A\in\Bbb{R}^{m\times n}\text{ where } m\gt n$에 대해 적절한 행렬 $A^{+}\in\Bbb{R}^{n\times m}\text{ where } m\gt n$을 얻음으로써 위의 주어진 문제를 해결하고자 하는 것이다.

식 (3)에서 $A^{+}\in\Bbb{R}^{n\times m}\text{ where } m\gt n$을 양변의 좌측에 곱해보자. 그러면,

$$식 (3) \Rightarrow A^+Ax=A^+b$$

[//]:# (식 5)

이며, 우리가 알고있는 식 (1)의 left inverse의 공식을 이용해 $A^+$을 계산해보면,

$$A^+ = (A^TA)^{-1}A^T=\begin{bmatrix}-1 && 0.5 && 0.5 \\ 0 && 0.5 && 0.5\end{bmatrix}$$

[//]:# (식 6)

이므로 식 (5)를 직접 계산해보면 아래와 같이 $x_1$과 $x_2$의 값을 계산할 수 있게 된다.

$$식(5)\Rightarrow \begin{bmatrix}-1 & 0.5 & 0.5 \\ 0 & 0.5 & 0.5\end{bmatrix}\begin{bmatrix}-1 & 1 \\ 0 & 1\\ 0 & 1\end{bmatrix}\begin{bmatrix}x_1 \\ x_2\end{bmatrix}=\begin{bmatrix}-1 & 0.5 & 0.5 \\ 0 & 0.5 & 0.5\end{bmatrix}\begin{bmatrix}0 \\ 1 \\ 3 \end{bmatrix}$$

[//]:# (식 7)

$$\Rightarrow \begin{bmatrix}x_1 \\ x_2\end{bmatrix} = \begin{bmatrix}2\\2\end{bmatrix}$$

[//]:# (식 8)

그런데, 여기서 이상한 점이 하나 있다.

이 $x_1$과 $x_2$를 원래의 식에 대입해보면 식이 성립하지 않는다는 점이다.

다시 말해 식 (4)에 대해 식 (4)의 좌변 값을 계산해보면 아래와 같은데,

$$\text{식(4)의 좌변}\Rightarrow 
  \begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 0 && 1\end{bmatrix}
  \begin{bmatrix}2 \\ 2 \end{bmatrix} = 
  \begin{bmatrix}0 \\ 2 \\ 2\end{bmatrix}
$$

[//]:# (식 9)

식 (9)의 결과는 식 (4)의 우변과 같지 않다.

그렇다면, 왜 의사역행렬은 식 (1)과 같은 공식을 갖게 되었으며, 식 (9)의 결과가 식 (4)의 우변과 같지 않다는 것은 어떤 의미를 갖고 있을까?

# 의사역행렬의 기하학적 의미

중학교 시절 연립방정식에 대해 배운 적 있을 것이다.

연립방정식은 2개 이상의 미지수를 포함하는 방정식의 조를 말하는데, 보통 중, 고등학교 과정에서는 이원 일차 연립방정식을 푸는 경우가 많았던 것 같다.

보통의 연립 방정식의 꼴은 아래와 같이 쓸 수 있겠다.

$$
  \begin{cases}
    ax + by = p \\
    cx + dy = q
  \end{cases}
$$

우리는 이번에 미지수의 개수보다 데이터가 훨씬 많은 경우에 대해 적절한 solution을 찾는 과정을 통해 의사역행렬에 대해 생각해보고자 한다.

가령, 다음과 같이 세 개의 데이터 포인트가 주어져 있다고 하자.

$$(-1, 0),\text{ }(0, 1),\text{ }(0, 3)$$

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic1.png">
  <br>
  그림 1. 주어진 세 개의 데이터 포인트
</p>

만약 이 세 점에 대해 $f(x) = mx+b$와 같은 모델을 통해 이 세 개의 데이터 포인트를 얻었다고 가정하면 아래와 같이 세 개의 방정식으로 구성된 연립방정식을 세울 수 있다.

$$f(-1) = -m + b = 0$$

$$f(0) = 0 + b = 1$$

$$f(0) = 0 + b = 3$$

이것을 행렬과 벡터를 이용해 표시하면 다음과 같다.

$$(Ax = b) \Rightarrow\begin{bmatrix}-1 && 1 \\ 0 && 1 \\ 0 && 1\end{bmatrix}\begin{bmatrix}m \\ b\end{bmatrix} = \begin{bmatrix}0\\1 \\ 3 \end{bmatrix}$$

이 행렬을 푸는 문제를 기하학적인 관점에서 생각해보면 그림 1과 같이 세 개의 데이터 포인트가 주어졌을 때 이 데이터 포인트들을 모두 통과하는 직선을 구하는 문제와 같다. 

2차원 평면 상에 어떻게 선을 놓더라도 이 세 점을 동시에 통과하는 직선을 구할 수는 없다.

다시 말해, 이 문제는 풀릴 수 없다. 해가 존재하지 않기 때문이다.

## 선형대수학적으로 연립방정식을 보는 관점

선형대수학의 관점에서 연립방정식을 푼다는 것은 아래와 같은 행렬을 푸는 것과도 같이 생각할 수 있는데,

$$A\vec{x} = \vec{b}$$

여기서 벡터와 행렬을 모두 열벡터로 표현하고, $\vec{x}$의 두 요소를 나눠 쓰면 아래와 같다.

$$\Rightarrow \begin{bmatrix} | & | \\ \vec{a}_1 & \vec{a}_2 \\ | & | \end{bmatrix}\begin{bmatrix}x_1 \\ x_2\end{bmatrix} = \begin{bmatrix}\text{ } | \text{ } \\ \text{ } \vec{b} \text{ }\\\text{ } | \text{ }\end{bmatrix}$$

그러면, 위 식은 아래와 같이 생각할 수 있다.

$$\Rightarrow x_1\begin{bmatrix} | \\ \vec{a}_1 \\ | \end{bmatrix} + x_2\begin{bmatrix} | \\ \vec{a}_2 \\ | \end{bmatrix} = \begin{bmatrix}\text{ } | \text{ } \\ \text{ } \vec{b} \text{ }\\\text{ } | \text{ }\end{bmatrix}$$

즉, 열벡터 $\vec{a}_1$와 $\vec{a}_2$를 어떻게 조합하면 $\vec{b}$를 얻어낼 것인가?라는 물음에 적절한 조합 비율인 $x_1$과 $x_2$를 답변해주는 것과 같은 이야기인 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic2.png">
  <br>
  그림 2. A의 열(column)을 이루는 열벡터($\vec{a}_1$, $\vec{a}_2$)의 생성공간(span)인 A의 열공간 $col(A)$에 포함되어 있는 $\vec{b}$를 구하려면 $\vec{a}_1$와 $\vec{a}_2$를 얼마만큼 조합해주어야 할까?
</p>

하지만 $\vec{a}_1$과 $\vec{a}_2$를 조합해서 $\vec{b}$를 얻을 수 있으려면 $\vec{b}$는 $\vec{a}_1$과 $\vec{a}_2$를 조합해 얻을 수 있는 모든 경우의 수 중 하나여야 한다.

다시 말해 $\vec{a}_1$과 $\vec{a}_2$의 생성공간(span) 안에 $\vec{b}$가 포함되어 있어야 한다. 이것이 해를 찾을 수 있는 조건이다.

## 최적의 해를 찾기

꿩대신 닭이라고 했던가. 그림 1과 같은 문제에서 처럼 정확한 정답을 찾을 수 없다면 최대한 정답에 가까운 것이라도 찾아야 한다.

다시 말해 그래도 그나마 가장 세 점의 트렌드를 잘 표현해줄 수 있는 직선을 찾을 수는 있을 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic3.png">
  <br>
  그림 3. 그나마 세 점의 트렌드를 잘 설명해 줄 수 있을 것 같은 직선을 그어보자
</p>

여기서, 우리가 점 세 개의 트렌드를 잘 표현해주는 직선을 과정은 선형대수학적으로는 해($\vec{b}$)가 행렬 $A$의 열공간(column space)안에 존재하지 않는 경우 열 공간안에 있는 정답에 가장 가까운 해를 찾는 과정과 일치시켜 생각할 수 있다.

실제로 그림 1 혹은 그림 3의 문제에서 $\vec{a}_1$, $\vec{a}_2$와 이 두 벡터로부터 생성되는 열공간, 그리고 $\vec{b}$를 직접 그려보면 다음과 같다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic4.mp4">
  </video>
  <br>
  그림 4. $[-1, 0, 0]^T$ (파란색)와 $[1, 1, 1]^T$ (주황색) 두 벡터의 생성공간(span)으로 표현되는 열공간과 이 column space에 포함되지 않는 벡터 $[0, 1, 3]^T$ (보라색)
</p>

그림 4에 있는 내용을 조금 더 추상적으로 그리면 아래의 그림 5와 같다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic5.png">
  <br>
  그림 5. A의 열(column)을 이루는 열벡터($\vec{a}_1$, $\vec{a}_2$)의 span인 A의 열공간 $col(A)$와 열공간에 포함되지 않는 $\vec{b}$
</p>

그림 5에서 볼 수 있듯이 $\vec{b}$는 $\vec{a}_1$과 $\vec{a}_2$의 열공간 안에 포함되어 있지 않다. 그리고 그림 5에서 확인할 수 있듯이 여기서 우리가 찾을 수 있는 $\vec{b}$와 가장 가까우면서 $\vec{a}_1$과 $\vec{a}_2$의 선형결합을 통해 얻을 수 있는 최적의 벡터는 $\vec{b}$가 열공간(col(A))에 정사영된 $\vec{p}$이며 우리는 이 $\vec{p}$를 계산해줌으로써 벡터 $\vec{a}_1$과 $\vec{a}_2$를 얼마만큼 선형조합 해주어야 할지($\hat{x}$)를 알 수 있게 된다.

그렇다면 원래의 해 $\vec{b}$와 정사영 벡터 $\vec{p}$의 차이 벡터를 $\vec{e}$라고 하면 $\vec{e}$는 행렬 $A$의 어떤 벡터와도 직교하므로 다음이 성립한다.

$$A\cdot\vec{e} = \begin{bmatrix} | & | \\ \vec{a}_1 & \vec{a}_2 \\ | & | \end{bmatrix}\cdot\vec{e} = 0$$

여기서 '$\cdot$'은 내적 연산이다.

즉, 내적을 계산해주면,

$$A^Te = A^T(\vec{b}-A\hat{x}) = 0$$

$$\Rightarrow A^T\vec{b}-A^TA\hat{x} = 0$$

$$\Rightarrow A^TA\hat{x} = A^T\vec{b}$$


$$\therefore \hat{x}=(A^TA)^{-1}A^T\vec{b}$$

이라는 것을 알 수 있다.

## 의사역행렬과의 연관성

우리가 지금까지 수행한 일은 무엇인가?

$Ax=b$라는 방정식에서 적절한 term을 좌변에 곱해 $\hat{x}$를 계산한 것이다.

즉, 여기서 찾아진 적절한 term을 $A^+$라 할 때, $A^+A = I$라는 사실을 알 수 있는 것이다.

다시 말해, 우리가 얻은 $(A^TA)^{-1}A^T$라는 term이 바로 우리가 구하고자 하는 의사역행렬임을 알 수 있다.

# Pseudo-inverse의 MATLAB 계산 비교

# SVD를 이용한 의사역행렬의 표현

임의의 행렬 $A\in\Bbb{R}^{m\times n}\text{ where } m\gt n$을 [특이값 분해](https://angeloyeo.github.io/2019/08/01/SVD.html)하면 다음과 같이 쓸 수 있다.

$$A=U\Sigma V^T$$

여기서 $U\in\Bbb{R}^{m\times m}$, $\Sigma\in\Bbb{R}^{m\times n}$, $V\in\Bbb{R}^{n\times n}$의 크기를 가지는 행렬이며, $U$, $V$는 orthogonal matrix, $\Sigma$는 diagonal matrix이다.

여기서 $\Sigma$는 singluar value $\lambda$가 대각성분에 위치하는 행렬이다.

$$\Sigma = diag_{m,n}(\lambda_1, \cdots, \lambda_{min\lbrace m,n\rbrace})$$

특히 orthogonal matrix의 성질은 다음과 같다.

$$UU^T = U^TU = I$$

$$V^TV=V^TV = I$$

또, diagonal matrix의 성질은 다음과 같다.

$$\Sigma^T = \Sigma$$

특이값 분해된 $A$에 전치연산(transpose)을 취해주면 다음과 같이 계산할 수 있다.

$$A^T = V\Sigma^T U^T=V\Sigma U^T$$

따라서,

$$A^TA = V\Sigma U^T U \Sigma V^T$$

$$=V\Sigma^2 V^T$$

이다.

그러므로, $A^TA$의 역행렬을 계산해보면,

$$(A^TA)^{-1} = (V\Sigma^2V^T)^{-1} = V(\Sigma^2)^{-1}V^T$$

이다.

위 식에서 식을 전개할 때 $V^{-1} = V^T$라는 orthogonal 행렬 $V$의 특성을 이용하였다.

이제 식 (1)의 좌측역행렬을 계산해보면 다음과 같이 계산할 수 있다.

$$A^+ = (A^TA)^{-1}A^T =  V(\Sigma^2)^{-1} V^TV\Sigma U^T$$

여기서 $V^TV= I$ 이고 $(\Sigma^2)^{-1}\Sigma = \Sigma^{-1}$이므로 SVD를 이용한 좌측역행렬은

$$\Rightarrow V\Sigma^{-1}U^T$$

이다.

여기서 $\Sigma^{-1}$은 다음과 같은 행렬이다.

$$\Sigma^{-1}=diag_{n,m}(\lambda_1^+, \cdots, \lambda^+_{min\lbrace m,n\rbrace})$$

where

$$\lambda^+=\begin{cases}\lambda^{-1} && \lambda \neq 0 \\ 0 && \lambda = 0 \end{cases}$$
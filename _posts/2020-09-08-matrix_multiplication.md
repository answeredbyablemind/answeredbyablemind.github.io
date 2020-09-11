---
title: 행렬 곱에 대한 새로운 이해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200908
tags: 선형대수
---

# 일반적으로 이용하는 행렬곱의 방법

필자는 고등학교 시절 7차 교육과정을 거치면서 고등학교 시절 행렬에 대해 배운 적이 있다.

그때 처음 배운 행렬의 곱셈 방식은 너무나도 독특했는데, 지금 생각해도 익숙하지 않다면 행렬의 곱은 "왜 이렇게 계산하지?"라고 생각이 들 정도로 이상하다.

행렬의 곱은 일반적으로 다음과 같이 생각한다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-08-matrix_multiplication/pic1.png">  <br>
  그림 1. 행렬의 일반적인 곱셈 방법
</p>

수식을 이용해 조금 더 정확하게 쓰면 다음과 같다.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a & b \\ c & d\end{bmatrix} = 

\begin{bmatrix}
  1 \cdot a +2\cdot c && 1\cdot b + 2\cdot d \\ 
  3\cdot a + 4\cdot c && 3\cdot b + 4 \cdot d
\end{bmatrix}$$

이것을 잘 뜯어 생각해보면, 왼쪽에 있는 행렬에서 행 하나를 가져오고 오른쪽에 있는 행렬에서 열 하나를 가져와서 계산하게 된다는 것을 알 수 있다.

또, 가져온 행 혹은 열을 벡터로 생각한다면 계산된 행렬의 각 원소값은 ***벡터의 내적을 표현한 것***임을 알 수 있다.

즉, 식(1)의 계산 결과에서 1행 1열의 원소값은 계산 되기 전 두 행렬 중 왼쪽 행렬의 1행의 행벡터와 오른쪽 행렬의 1열의 열벡터를 가져와 계산한 것임을 알 수 있다.

$$\begin{bmatrix}1 & 2\end{bmatrix}\begin{bmatrix}a\\c\end{bmatrix} = 1\cdot a + 2\cdot c$$

즉, 일반적으로 이용하는 행렬곱의 관점은 행벡터와 열벡터 간의 내적(inner product)을 계산함으로써 행렬곱이 이루어진다는 것을 알 수 있다.

참고로 이러한 관점을 응용한 개념으로는 [공분산 행렬](https://angeloyeo.github.io/2019/07/27/PCA.html#%EA%B3%B5%EB%B6%84%EC%82%B0-%ED%96%89%EB%A0%AC%EC%9D%98-%EC%9D%98%EB%AF%B8)이 있으며, 공분산 행렬의 의미는 여러 종류의 feature들이 서로 얼마나 닮았는가(즉, 내적을 이용)를 의미한다.

# 열벡터의 선형 결합

또 다른 방식으로 행렬의 곱을 이해하는 방법은 [열벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9)으로 이해하는 방법이다.

이번에는 행렬과 벡터의 곱에 대해 생각해보자. 다시 말해 식 (1)에서 두 행렬을 곱했던 경우에서 오른쪽에 곱해지는 행렬의 한 열만 가져와서 결과를 확인해보자.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a \\ c \end{bmatrix} = 

\begin{bmatrix}
  1 \cdot a +2\cdot c  \\ 
  3\cdot a + 4\cdot c
\end{bmatrix}$$

이 결과를 보면 다음과 같이 생각할 수도 있다는 점을 알 수 있다.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a \\ c \end{bmatrix} = 

a\cdot\begin{bmatrix}
  1\\ 
  3
\end{bmatrix}
+

c\cdot\begin{bmatrix}
  2\\ 
  4
\end{bmatrix}
$$

다시 말해 행렬과 벡터의 곱은 행렬을 구성하고 있는 [두 열벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9)을 다른 방식으로 표현한 것이라고 할 수 있는 것이다.

## 열공간을 기반한 해석

[벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9) 부분에서 설명했던 것 처럼 벡터의 선형결합이 의미하는 것은 벡터 공간의 생성이다. 즉, 행렬과 벡터의 곱이라는 수식이 우리에게 묻는것은 "주어진 열벡터들을 이용해 만들 수 있는 벡터 공간(즉, 열공간(column space))에 대한 탐구"라는 점에서 매우 중요하다고 할 수 있다.

이런 관점에서 다음의 수식의 의미를 생각해보자.

$$A\vec{x} = \vec{b}$$

예를 들어 아래와 같은 문제를 생각해보자.

$$\begin{bmatrix}1 & 2 \\ 3 & 4\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}=\begin{bmatrix}3\\5\end{bmatrix}$$

이 문제의 해답은 아래와 같다는 것은 연립방정식을 풀면 쉽게 알 수 있다.

$$\begin{cases}
x+2y = 3 \\
3x+4y = 5
\end{cases}$$

$$\Rightarrow x=-1, \text{ }y=2$$

하지만, 이번엔 이 식을 아래와 같이 생각해보자.

$$x\begin{bmatrix}1\\3\end{bmatrix}+y\begin{bmatrix}2\\4\end{bmatrix}=\begin{bmatrix}3\\5\end{bmatrix}$$

위 식을 필자는 이렇게 해석하고 싶다. 

<center>

  "두 벡터 $\begin{bmatrix}1\\3\end{bmatrix}$과 $\begin{bmatrix}2\\4\end{bmatrix}$로부터 생성된  벡터공간 내에 벡터 $\begin{bmatrix}3\\5\end{bmatrix}$가 존재하는가? 

</center>

<center>

  만약 그렇다면,  $\begin{bmatrix}1\\3\end{bmatrix}$과 $\begin{bmatrix}2\\4\end{bmatrix}$을 어떻게 조합해야 $\begin{bmatrix}3\\5\end{bmatrix}$을 구할 수 있을까??"

</center>

이러한 관점을 이용한 선형대수학에서의 응용은 [선형연립방정식의 풀이](https://angeloyeo.github.io/2019/09/09/Gauss_Jordan.html)와 [선형 회귀](https://angeloyeo.github.io/2020/08/24/linear_regression.html)가 있다.

## 선형 변환을 기반한 해석

이 뿐 아니라, 행렬과 벡터의 곱이 열벡터의 선형결합이라는 해석이 우리에게 주는 또 다른 관점은 행렬과 벡터의 곱을 기저 벡터의 변형을 통한 **벡터의 선형 변환**으로 해석할 수 있도록 도움을 주기 때문이다. 

예를 들어, 행렬

$$A=\begin{bmatrix}
 2 & -3 \\
 1 & 1
 \end{bmatrix} $$

 를 이용해 벡터

 $$\vec x=\begin{bmatrix} 1 \\ 1 \end{bmatrix}$$

 를 변환시켜 보면,


 $$A\vec x =\begin{bmatrix}
 2 & -3 \\
 1 & 1
 \end{bmatrix} \begin{bmatrix} 1 \\ 1 \end{bmatrix}=\begin{bmatrix} -1 \\ 2 \end{bmatrix}$$


 임을 알 수 있는데, 아래의 영상에서 처럼 이 값은 새로운 두 기저벡터의 1배와 1배의 합으로
 표현될 수 있다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/transformation1/" width="650" height = "520" frameborder="0"></iframe></p>

이 내용에 대해서는 [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)편에서 자세히 다루었으므로 해당 포스트를 참고하는 것도 좋을 것 같다.

이러한 관점을 이용한 선형대수학에서의 응용은 [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html), [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html), [특이값 분해(SVD)](https://angeloyeo.github.io/2019/08/01/SVD.html) 등이 있다.
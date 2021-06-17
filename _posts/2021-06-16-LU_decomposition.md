---
title: LU 분해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210616
tags: 선형대수학
---

# Prerequisites

이번 포스팅의 내용을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)

# 삼각행렬 소개

이번 LU 분해를 이해하기 위해선 아래의 삼각행렬이라는 용어를 조금 다루고 가는 것이 좋을 것 같아 짧게 소개한다.

선형대수학에서 종종 보이는 특이한 형태의 행렬 중 삼각행렬이라는 행렬이 있다. 이 행렬은 주대각선을 기준으로 대각 성분의 윗쪽이나 아랫쪽 항들의 값이 모두 0인 행렬을 말한다.

그래서 대각성분의 윗쪽 항들이 모두 0인 행렬을 하삼각행렬(lower triangular matrix)라고 하고, 대각 성분 아랫쪽 항들이 모두 0인 행렬을 상삼각행렬이라고 한다.

* 하삼각행렬(lower triangular matrix)

$$L=\begin{bmatrix}
  l_{1,1} &         &        &           &    0    \\
  l_{2,1} & l_{2,2} &        &           &         \\
  l_{3,1} & l_{3,2} & \ddots &           &         \\
  \vdots  & \vdots  & \ddots & \ddots    &         \\
  l_{n,1} & l_{n,2} & \cdots & l_{n,n-1} & l_{n,n}  \end{bmatrix}$$


* 상삼각행렬(upper triangular matrix)

$$U=\begin{bmatrix}
  u_{1,1} & u_{1,2} & u_{1,3} & \cdots & u_{1,n}   \\
          & u_{2,2} & u_{2,3} & \cdots & u_{2,n}   \\
          &         & \ddots  & \ddots & \vdots    \\
          &         &         & \ddots & u_{n-1,n} \\
     0    &         &         &        & u_{n,n}   \end{bmatrix}$$

# 연립 방정식의 풀이 다시 생각해보기

연립 방정식의 풀이 과정에 들어가는 기본 행 연산들을 행렬로 표현해주기 위해 우리는 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)에 대해 생각해보았다.

잠깐 복습하면 기본행렬은 총 세 가지 종류가 있었는데 각각은

1. Row multiplication
2. Row switching
3. Row addition

이었다. 

그리고 이런 기본 행 연산들을 통해서 해를 얻어주는 과정을 우리가 다시 잘 생각해보면 가장 아랫쪽에 있던 방정식에서는 가장 마지막 미지수에 대한 식만을 남기고, 그 위에 있는 방정식은 마지막 두 개의 미지수만을 남기는 식으로 미지수를 소거해 나가면 가장 아래에 있는 식으로부터 마지막 미지수에 대한 값을 얻고, 그 위에 있는 식에 대입하는 과정을 통해 그 다음 미지수에 대한 값을 얻고... 등의 순서로 미지수의 값들을 차례대로 얻어낼 수 있게 된다는 사실을 알 수 있다.

$$\begin{cases}x+y+z = 6 \\ 2x+3y-z=5 \\ 2x+3y+3z=17\end{cases} % 식 (3)$$

아래와 같은 연산을 수행하자.

$$r_2 \rightarrow r_2-2r_1 % 식 (4)$$

$$r_3 \rightarrow r_3 - 2r_1 % 식 (5)$$

$$\begin{cases}x+y+z = 6 \\ 0x+y-3z=-7 \\ 0x+y+z=5\end{cases} % 식 (6)$$

아래와 같은 연산을 수행하자.

$$r_3 \rightarrow r_3- r_2 % 식 (7)$$

$$\begin{cases}x+y+z = 6 \\ 0x+y-3z=-7 \\ 0x+0y+4z=12\end{cases} % 식 (8)$$

그러면 아래에서부터 $4z=12$이므로 $z=3$임을 알 수 있고,

이 값을 두 번째 식에 대입해 $y=2$ 임을 알 수 있고,

$y=2, z=3$을 첫번째 식에 대입하면 $x=1$임을 알 수 있게 된다.

가장 마지막 미지수부터 처음 미지수로 계산해 나간다고 해서 이런 과정을 back substitution이라고 부른다.

# Back substituion을 행렬로 표현해보자.

위에서 계산했던 해를 구하는 과정을 행렬로 표현해보면 어떨까?

즉, 식 (3) 방정식을 표현한 행렬

$$\left[\begin{array}{ccc|c} 1 & 1 & 1 & 6 \\ 2 & 3 & -1 & 5 \\ 2 & 3 & 3 & 17\end{array}\right]% 식 (9)$$

에 식 (4), (5), (7)과 같은 기본 행 연산들을 수행해줌으로써 식 (8)의 방정식을 표현한 행렬

$$\left[\begin{array}{ccc|c} 1 & 1 & 1 & 6 \\ 0 & 1 & -3 & -7 \\ 0 & 0 & 4 & 12\end{array}\right]$$

을 얻게 된 과정을 기본 행렬로 기본 행 연산들을 표현해 써보자는 것이다.

기본 행 연산들을 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)을 이용해 표현하면 다음과 같이 요약해서 쓸 수 있다.

$$\begin{bmatrix}1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & -1 & 1\end{bmatrix}
\begin{bmatrix}1 & 0 & 0 \\ 0 & 1 & 0 \\ -2 & 0 & 1\end{bmatrix}
\begin{bmatrix}1 & 0 & 0 \\ -2 & 1 & 0 \\ 0 & 0 & 1\end{bmatrix}
\left[\begin{array}{ccc|c} 1 & 1 & 1 & 6 \\ 2 & 3 & -1 & 5 \\ 2 & 3 & 3 & 17\end{array}\right]=
\left[\begin{array}{ccc|c} 1 & 1 & 1 & 6 \\ 0 & 1 & -3 & -7 \\ 0 & 0 & 4 & 12\end{array}\right]$$

원래의 $[A\|b]$ 행렬 왼쪽에 붙은 기본 행렬들의 의미를 생각해본다면 다음과 같은 기본 행 연산들이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-16-LU_decomposition/pic1.png">
  <br>
  그림 1. 기본 행렬 연산을 통해서 얻게 된 최종 결과물로 back substitution을 수행할 수 있게 된다.
</p>
---
title: 가우스 / 가우스-조던 소거법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210619
tags: 선형대수학
---

본 포스팅은 University of California Davis ENG 006: Engineering Problem Solving에서 제공하는 ZyBooks의 내용을 바탕으로 작성하였습니다.

# Prerequisites

이번 포스팅의 내용을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)
* [LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html)

# Introduction

[기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html) 편과 [LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html) 편을 통해서 우리는 행렬 형태를 이용해 연립 방정식을 풀 수 있다는 것을 확인했다. 이때 핵심적인 역할을 하는 것이 기초적인 행 연산(elementary row operations)에 대응하는 기본 행렬들 (주로 $E$라고 씀) 이었다.

즉, 우리의 목표는 아래와 같이 기본 행 연산들을 수행함으로써 $Ax=b$를 $Ux=c$와 같이 변경해주는 것이다.

여기서 $U$는 상삼각행렬(upper triangular matrix)이다. 

만약 $Ax=b$를 $Ux=c$와 같은 형태로 바꿔줄 수 있다면 우리는 back-substitution을 이용해 미지수 $x_1, x_2, x_3$을 수월하게 구해낼 수 있게 된다는 것을 공부하였다.

<p align = "center">
    <img width = "800" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic1.png">
    <br>
    그림 1. 기본 행 연산을 통해 상삼각행렬을 얻는 과정
</p>

[LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html) 에서는 위와 같은 방법을 적용할 때 행렬 $A$가 $n\times n$ 형태의 정방 행렬(square matrix)였다.

그런데, 꼭 행렬 $A$가 정방 행렬이어야지만 위와 같은 방식의 row operation을 해줄 수 있는 것은 아니다.

다시 말해, 식의 개수보다 변수의 개수가 많은 경우도 있을 수 있고, 변수의 개수보다 식의 개수가 많은 경우에 대해서도 위와 같은 상삼각행렬 비슷한 것을 남길 수 있지 않을까?

또, 상삼각행렬의 꼴이 아니라 대각성분 위에 남아있는 숫자들도 모두 row operation을 취해줌으로써 소거해버리면 어떻게 될까?

# LU 분해와 REF, RREF

정방행렬이 아닌 직사각행렬(rectangular matrix)에 대해 row operation을 취해줌으로써 우리가 얻어야 하는 최종 결과물은 마치 LU 분해를 수행해서 상삼각행렬(upper triangular matrix)를 얻은 것과 같은 형태이다.

대략적으로는 아래와 같은 모습을 띄고 있는 것이라고 말할 수 있다.

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic4.png">
    <br>
    그림 2. 직사각 행렬에 대해 row operation을 수행해 얻고자 기대하는 결과물
</p>

그림 2와 같은 행렬을 우리는 row-echelon matrix라고 한다. 한국말로는 사다리꼴 행렬이라고 부른다. (이 단어만은 한국어 표현이 잘못되었다고 생각해 row-echelon matrix라고 부르도록 하겠다.) 그림 2에서 삼각형(▲)과 하이픈(-)은 모두 0이 아닌 원소들을 의미한다. 또, 0이 아닌 행의 선행 계수인 삼각형(▲)을 특별히 피벗(pivot)이라고 이름 붙였고, pivot이 포함된 열(column)을 pivot column이라고 부른다.

용어를 어느정도 파악했을테니 row-echelon matrix가 갖는 특성을 글로 정리하자면 다음과 같다.

* 0이 아닌 모든 행은 모두 0 행 위에 있다 (즉, 모두 0 행은 행렬의 맨 아래에 있음).
* 0이 아닌 행의 선행 계수는 항상 위 행의 0이 아닌 첫 번째 항목의 오른쪽에 있다.
* 피벗 아래의 모든 열 항목은 0이다.

글로 써둔 것을 보면 헷갈리지만 아래와 같은 계단 형태를 띄고 있는 형태의 행렬이라는 것을 의미한다.

<p align = "center">
    <img width = "400" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic5.png">
    <br>
    그림 3. row-echelon matrix는 계단 형태의 행렬이며 각 계단의 끄트머리에 발을 딛고 올라갈 부분을 pivot이라고 부른다.
</p>

다시 말해 row-echelon matrix는 직사각행렬 $A$에 대해 row operation을 수행한 결과로 얻어지는 행렬로 상삼각행렬과 유사한 형태와 기능을 갖는 행렬이다. 그리고 위에서 언급한 세 가지 특성을 가져야 한다. 따라서, row operation을 수행해주면서 해당 형태를 갖게끔 행교환을 계속 수행해줌으로써 얻을 수 있게 된다.

## Echelon이라는 단어의 번역에 대해서

Row-echelon 행렬은 한국말로는 사다리꼴 행렬이라고 번역한다.

이 번역은 아주 잘못된 번역의 좋은 예시로 볼 수 있을 것 같다. 그리고 이런 오역으로 인해 학생들이 row-echelon 행렬을 이해하는데 더 어려움을 가중할 것 같다.

우리가 보통 수학에서 사다리꼴이라고 하면 아래와 같은 도형을 생각하기 쉽다.

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic2.png">
    <br>
</p>

그런데 '사다리꼴' 이 말하는 사다리(ladder)의 형태를 말하는 것이다. 즉,

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic3.png">
    <br>
</p>

왜냐면 echelon이라는 영어 단어가 '사다리'라는 뜻을 갖는 영단어에서 유래되었기 때문인 것으로 보인다. 하지만 여기서 row-echelon form이라는 뜻에서 echelon은 step-like architecture를 의미하는 것으로 보아야 타당하다.

다시 말하면, 행렬의 하단부에 0이 쏠려있다보니 그 0들의 형태가 마치 계단 형태인 것 처럼 보인다는 의미에서 echelon이라는 단어를 썼다고 보는 것이 더 낫다. 그리고 그래야 맥락에 맞지 않아 보이는 pivot이라는 용어도 단어의 이용 의도를 조금더 파악할 수 있게 된다.

## REF & RREF의 형태 예시: 눈으로 구별해보세요.

Row-echelon 행렬의 개념은 처음 접하게 되면 어리둥절할 수 있다.

글로 써진 row-echelon 행렬의 특징이 쉽게 와닿긴 어렵기 때문이다. 그래서 몇 가지 예시를 가지고 row-echelon 행렬인지의 여부를 확인해보자.

아래의 행렬은 Row-echelon matrix라고 할 수 있다.

$$\begin{bmatrix}
   1 & ● & ● & ● \\
   0 & 1 & ● & ● \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

여기서 '●'는 0이 아닌 숫자를 의미한다.

아래의 행렬은 또 Row-echelon matrix라고 할 수 있다. 꼭 첫번째 행의 첫번째 값이 non-zero term이 되어야 한다는 요구 조건은 없다.

$$\begin{bmatrix}
   0 & 3 & ● & ● & ● & ● & ●\\
   0 & 0 & 2 & ● & ● & ● & ●\\
   0 & 0 & 0 & 0 & 0 & 5 & ●\\
   0 & 0 & 0 & 0 & 0 & 0 & ●
\end{bmatrix}$$

그런데, 아래의 행렬은 row-echelon matrix가 아니다. 0으로만 구성된 행은 가장 아래에 위치해야 한다는 법칙을 어긴 것이기 때문이다.

$$\begin{bmatrix}
   1 & ● & ● & ● \\
   0 & 2 & ● & ● \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 1
\end{bmatrix}$$

또, 아래와 같은 꼴의 행렬도 row-echelon form이 아니다. 세 가지 특성 중 두 번째를 어겼기 때문이다. 다시 말해 두번째 행의 0이 아닌 선행 계수가 첫 번째 행의 0이 아닌 선행 계수보다 왼쪽에 위치하기 때문이다.

$$\begin{bmatrix}
   0 & 1 & ● & ● \\
   1 & ● & ● & ● \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

또 아래와 같은 행렬도 row-echelon form이 아니다. 두 번째 pivot인 4가 포함되어 있는 2열을 보면 pivot인 4 아래의 모든 항이 0으로 표시되어 있지 않기 때문이다.

$$\begin{bmatrix}
   3 & ● & ● & ● \\
   0 & 4 & ● & ● \\
   0 & 2 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

## REF & RREF 직접 구해보기

### 손으로 REf, RREF 구하기

아래의 행렬 $A$에 대해 elementary row operation을 수행해 row-echelon matrix를 얻어보자.

$$\begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    2 & 6 & 4 & 6 & 2 \\
    3 & 3 & 8 & 12 & 17
\end{bmatrix}$$

다음과 같은 row operation들을 수행하자.

$$r_2 \rightarrow r_2- 2r_1$$

$$r_3 \rightarrow r_3- 3r_1$$

그러면 다음과 같은 행렬을 얻을 수 있게 된다.

$$\begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    0 & 4 & 0 & 0 & -6 \\
    0 & 0 & 2 & 3 & 5
\end{bmatrix}$$

### MATLAB에서 REF, RREF 구하기

# REF와 RREF의 쓸모

## RREF: 역행렬의 계산

$Ax=b$에서 $b$ 벡터가 여러 종류일 때, 한꺼번에 해 $x$들을 구할 수 있다.

가령, 아래와 같이 세 가지 경우의 솔루션을 얻고자 한다고 하자.

$$\begin{cases}3x-z = 1 \\ x+2y+3z = 1 \\ 2x-y+z=1\end{cases}$$

$$\begin{cases}3x-z = 2 \\ x+2y+3z = 2 \\ 2x-y+z=2\end{cases}$$

$$\begin{cases}3x-z = 3 \\ x+2y+3z = 3 \\ 2x-y+z=3\end{cases}$$

그러면 각각의 경우에 대해서 세 번의 계산을 할 것이 아니라 다음과 같이 augmented matrix를 구성하고 가우스-조던 소거를 수행하면 한번에 세 가지 방정식을 다 풀어낼 수 있게 된다.

$$\left[\begin{array}{ccc|ccc} 
    3 & 0 & -1 & 1 & 2 & 3 \\
    1 & 2 & 3 &  1 & 2 & 3 \\
    2 & -1 & 1 & 1 & 2 & 3
\end{array}\right]$$

이것은 다시 말해 다음과 같은 행렬 문제를 푸는 것과 다르지 않다.

$$AB=
    \begin{bmatrix}3 & 0 & -1 \\ 1 & 2 & 3 \\ 2 & -1 & 1\end{bmatrix}
    \begin{bmatrix}x_{11} & x_{12} & x_{13} \\ x_{21} & x_{22} & x_{23} \\ x_{31} & x_{32} & x_{33}\end{bmatrix}
    =\begin{bmatrix}1 & 2 & 3 \\ 1 & 2 & 3 \\ 1 & 2 & 3\end{bmatrix}$$

그럼 만약 이렇게 augmented matrix를 쓸 수 있다는 점을 응용해 augmented matrix를 다음과 같이 설정하면 어떨까?

$$\left[\begin{array}{ccc|ccc} 
    3 & 0  & -1 & 1 & 0 & 0 \\
    1 & 2  & 3  & 0 & 1 & 0 \\
    2 & -1 & 1  & 0 & 0 & 1
\end{array}\right]$$

즉, $B$라는 행렬은 $A$라는 행렬 뒤에 곱해져서 결과로써 단위 행렬을 출력해주어야 한다.

다시 말해 $B$ 행렬은 $A$ 행렬의 역행렬이다.

즉, 위의 augmented matrix에 대해 가우스-조던 행렬 소거를 적용해 reduced-row echelon matrix로 만들어주면 다음과 같다.

$$\left[\begin{array}{ccc|ccc} 
    1 & 0  & 0  & 1/4 & 1/20 & 1/10 \\
    0 & 1  & 0  & 1/4 & 1/4 & -1/2 \\
    0 & 0  & 1  & -1/4 & 3/20 & 3/10
\end{array}\right]$$

그러므로 $A$의 역행렬을 다음과 같이 계산할 수 있는 것이다.

$$A^{-1}=\begin{bmatrix}
    1/4 & 1/20 & 1/10 \\
    1/4 & 1/4 & -1/2 \\
    -1/4 & 3/20 & 3/10
\end{bmatrix}$$


## 행동치 관계를 통한 솔루션 계산

$Ax=b$, $Ux=c$, $Rx=d$의 해는 모두 동일하다.

$A$와 $U$와 $R$은 모두 행동치 행렬이다.

row operation을 수행해주더라도 row space의 변화는 없다. (다만 column space에는 변화가 생긴다.)

## 행 벡터의 선형 독립 / 종속 판별

## 행렬의 rank 계산

## free variable이 어떤 것인지 확인

non-zero row, pivot column, free column

complete solution을 구하기 위해 필요한 과정
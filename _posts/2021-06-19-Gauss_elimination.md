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

※ REF는 Row-Echelon Form을 줄인 말이고, RREF는 Reduced Row-Echelon Form을 줄인 말입니다.

정방행렬이 아닌 직사각행렬(rectangular matrix)에 대해 row operation을 취해줌으로써 우리가 얻어야 하는 결과물은 마치 LU 분해를 수행해서 상삼각행렬(upper triangular matrix)를 얻은 것과 같은 형태일 수 있다.

대략적으로는 아래와 같은 모습을 띄고 있는 것이라고 말할 수 있다.

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic4.png">
    <br>
    그림 2. 직사각 행렬에 대해 row operation을 수행해 얻고자 기대하는 결과물
</p>

그림 2와 같은 행렬을 우리는 row-echelon matrix 혹은 주어진 행렬의 row-echelon form이라고 한다. 한국말로는 사다리꼴 행렬이라고 부른다. (이 단어만은 한국어 표현이 잘못되었다고 생각해 row-echelon matrix라고 부르도록 하겠다.) 그림 2에서 삼각형(▲)과 하이픈(-)은 모두 0이 아닌 원소들을 의미한다. 또, 0이 아닌 행의 선행 계수인 삼각형(▲)을 특별히 피벗(pivot)이라고 이름 붙였고, pivot이 포함된 열(column)을 pivot column이라고 부른다.

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

그리고 만약 여기서 scaling을 통해 pivot들을 모두 1로 만들고, pivot 위의 숫자들도 모두 0으로 만들어줄 수도 있을 것이다. 가령, 그림 3의 형태의 row-echelon form에 대해 다음과 같이 변형시킬 수 있다.

<p align = "center">
    <img width = "400" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic6.png">
    <br>
    그림 4. row-echelon form에서 pivot 을 모두 1로 scaling 해주고 pivot 위의 값들도 모두 0으로 만들어주면 reduced-row echelon form이 된다.
</p>

## Echelon이라는 단어의 번역에 대해서

Row-echelon 행렬은 한국말로는 사다리꼴 행렬이라고 번역한다.

이 번역은 아주 잘못된 번역의 좋은 예시로 볼 수 있을 것 같다. 그리고 이런 오역으로 인해 학생들이 row-echelon 행렬을 이해하는데 더 어려움을 가중할 것 같다.

우리가 보통 수학에서 사다리꼴이라고 하면 아래와 같은 도형을 생각하기 쉽다.

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic2.png">
    <br>
    그림 5. 사다리꼴 도형의 형태
</p>

그런데 '사다리꼴' 이 말하는 사다리(ladder)의 형태를 말하는 것이다. 즉,

<p align = "center">
    <img width = "300" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic3.png">
    <br>
    그림 6. 그냥 사다리
</p>

왜냐면 echelon이라는 영어 단어가 '사다리'라는 뜻을 갖는 영단어에서 유래되었기 때문인 것으로 보인다. 하지만 여기서 row-echelon form이라는 뜻에서 echelon은 step-like architecture를 의미하는 것으로 보아야 타당하다.

다시 말하면, 행렬의 하단부에 0이 쏠려있다보니 그 0들의 형태가 마치 계단 형태인 것 처럼 보인다는 의미에서 echelon이라는 단어를 썼다고 보는 것이 더 낫다. 그리고 그래야 맥락에 맞지 않아 보이는 pivot이라는 용어도 단어의 이용 의도를 조금더 파악할 수 있게 된다.

## REF & RREF의 형태 예시: 눈으로 구별해보세요.

Row-echelon 행렬의 개념은 처음 접하게 되면 어리둥절할 수 있다.

글로 써진 row-echelon 행렬의 특징이 쉽게 와닿긴 어렵기 때문이다. 그래서 몇 가지 예시를 가지고 row-echelon 행렬인지의 여부를 확인해보자.

REF는 Row-Echelon Form, RREF는 Reduced Row-Echelon Form을 각각 의미한다.

아래의 행렬은 REF이라고 할 수 있다.

$$\begin{bmatrix}
   1 & - & - & - \\
   0 & 1 & - & - \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

여기서 '-'는 0이 아닌 숫자를 의미한다.

아래의 행렬은 또 REF이라고 할 수 있다. 꼭 첫번째 행의 첫번째 값이 non-zero term이 되어야 한다는 요구 조건은 없다.

$$\begin{bmatrix}
   0 & 3 & - & - & - & - & -\\
   0 & 0 & 2 & - & - & - & -\\
   0 & 0 & 0 & 0 & 0 & 5 & -\\
   0 & 0 & 0 & 0 & 0 & 0 & -
\end{bmatrix}$$

그런데, 아래의 행렬은 REF이 아니다. 0으로만 구성된 행은 가장 아래에 위치해야 한다는 법칙을 어긴 것이기 때문이다.

$$\begin{bmatrix}
   1 & - & - & - \\
   0 & 2 & - & - \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 1
\end{bmatrix}$$

또, 아래와 같은 꼴의 행렬도 REF이 아니다. 세 가지 특성 중 두 번째를 어겼기 때문이다. 다시 말해 두번째 행의 0이 아닌 선행 계수가 첫 번째 행의 0이 아닌 선행 계수보다 왼쪽에 위치하기 때문이다.

$$\begin{bmatrix}
   0 & 1 & - & - \\
   1 & - & - & - \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

또 아래와 같은 행렬도 REF이 아니다. 두 번째 pivot인 4가 포함되어 있는 2열을 보면 pivot인 4 아래의 모든 항이 0으로 표시되어 있지 않기 때문이다.

$$\begin{bmatrix}
   3 & - & - & - \\
   0 & 4 & - & - \\
   0 & 2 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

아래의 행렬은 RREF이라고 할 수 있다.

$$\begin{bmatrix}
   1 & 0 & 3 & 2 \\
   0 & 1 & 4 & 5 \\
   0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0
\end{bmatrix}$$

그러나 아래의 행렬은 RREF이 아니다. pivot의 정의 상 2행 2열의 4는 2행의 pivot인데, RREF라면 pivot이 모두 1이 되어야 하기 때문이다.

만약 여기서 2행에 1/4를 모두 곱해주면 RREF이 된다.

$$\begin{bmatrix}
   1 & 0 & 0 & 2 \\
   0 & 4 & 1 & 5 \\
   0 & 0 & 0 & 0 \\
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

여기까지만 구하면 이것이 행렬 $A$의 row-echelon form이다.

여기서 2행에 1/4를 곱해주고 3행에 1/2를 곱해주자.

즉, 

$$r_2 \rightarrow \frac{1}{4}r_2 $$

$$r_3 \rightarrow \frac{1}{2}r_3$$

연산을 취해주면 다음과 같이 행렬이 수정된다.

$$\begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    0 & 1 & 0 & 0 & -3/2 \\
    0 & 0 & 1 & 3/2 & 5/2
\end{bmatrix}$$

여기서 pivot 위의 값들도 모두 0으로 만들어주기 위해 아래와 같은 두 개의 행연산을 취해주자.

$$r_1 \rightarrow r_1 - r_2$$

$$r_1 \rightarrow r_1 - 2r_3$$

그러면 최종적으로 다음과 같은 행렬을 얻을 수 있게 된다.

$$\begin{bmatrix}
    1 & 0 & 0 & 0 & 1/2 \\
    0 & 1 & 0 & 0 & -3/2 \\
    0 & 0 & 1 & 3/2 & 5/2
\end{bmatrix}$$

이것이 행렬 A의 reduced-row echelon form이다.

### MATLAB에서 REF, RREF 구하기

MATLAB이나 여타 선형대수학을 위한 계산 도구를 통해 주어진 행렬의 Row Echelon Form(REF) 혹은 Reduced Row Echelon Form(RREF)를 계산할 수 있다.

그런데, REF는 유일하게 결정되지는 않는다. 가령, 어떤 행렬의 REF을 구할 때 pivot 값을 약분해주지 않더라도 여전히 REF로 볼 수 있다.

가령 아래와 같은 행렬 $A$에 대해,

$$A = \begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    2 & 6 & 4 & 6 & 2 \\
    3 & 3 & 8 & 12 & 17
\end{bmatrix}$$

REF 중 하나는 다음과 같은 것일 수 있다.

$$REF(A)_1 = \begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    0 & 4 & 0 & 0 & -6 \\
    0 & 0 & 2 & 3 & 5
\end{bmatrix}$$

그런데, 가령 2번 행에 1/2를 곱해주더라도 여전히 REF의 꼴임을 알 수 있다.

$$REF(A)_2 = \begin{bmatrix}
    1 & 1 & 2 & 3 & 4 \\
    0 & 2 & 0 & 0 & -3 \\
    0 & 0 & 2 & 3 & 5
\end{bmatrix}$$

그래서 REF는 유일하게 결정되지는 않지만 MATLAB에서는 LU분해에 사용되는 lu 함수를 이용해 REF 유사한 것을 얻을 수 있게 된다.

MATLAB에서 아래와 같이 커맨드를 입력해보면,

```
A = [1, 1, 2, 3, 4; 2, 6, 4, 6, 2; 3, 3, 8, 12, 17]

[~, ref_A]=lu(A);
```

아래와 같이 REF를 얻을 수 있다.


원래 ref_A는 LU 분해를 통해 얻은 상삼각행렬(upper triangular matrix)이 들어오는 자리.

ref는 유일하게 결정되지 않아서 손으로 푼 REF 결과와 MATLAB의 LU 분해 결과는 다를 수 있다.

rref_A = rref(A);

<p align = "center">
    <img width = "400" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic7.png">
    <br>
    그림 7. MATLAB으로 구한 행렬 A의 Row-Echelon Form
</p>

반면 RREF는 pivot을 약분해주고 pivot 위의 원소들도 모두 소거해주기 때문에 유일하게 결정된다.

MATLAB에서는 rref()라는 함수를 이용해 RREF를 구할 수 있다.

<p align = "center">
    <img width = "400" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/pic8.png">
    <br>
    그림 8. MATLAB으로 구한 행렬 A의 Reduced Row-Echelon Form
</p>

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

연립방정식의 해를 구할 때는 방정식에 상수배를 취해주거나, 방정식 끼리 더해주거나, 방정식의 순서를 바꿔주는 과정을 통해 해를 얻을 수 있다.

그리고, [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html) 편에서 보았던 것 처럼 연립방정식에 적용하던 테크닉들을 행렬 연산으로 옮겨놓은 것이

row operation이다. row operation은 행렬의 한 행을 상수배해주는 것, 행렬의 행 끼리 더해주는 것, 그리고 행의 순서를 바꿔주는 세 가지 테크닉을 의미한다.

연립방정식의 해를 구할 때 상수배, 방정식 끼리 더 해주기, 순서 바꿔주기를 해주어도 해에는 변함이 없는 것 처럼 row-operation을 수행해주어도 해는 여전히 동일하게 유지된다.

그러니까 원래 행렬을 $A$, 그 행렬의 REF를 $U$, RREF를 $R$이라고 하면 $Ax=b$, $Ux=c$, $Rx=d$의 해는 모두 동일하다.

(이 때, $c$와 $d$는 $A$를 $U$ 혹은 $R$로 바꿔주면서 우항의 벡터 $b$가 변형된 것이다.)

조금 어려운 말로 하면 $A$와 $U$와 $R$은 모두 행동치(row-equivalent)이다.

다른 말로 하면 row operation을 수행해주더라도 row space의 변화는 없다고 할 수 있다. 하지만 column space에는 변화가 생긴다.

예를 들어 아래와 같은 연립방정식을 푼다고 생각해보자.

$$\begin{cases}3x+3y+z=3 \\ 4x+5y+2z=1 \\ 2x+5y+z = 3 \end{cases}$$

그것은 아래와 같은 행렬식을 푸는 것과 같다고 할 수 있다.

$$\begin{bmatrix}3 & 3 & 1 \\ 4 & 5 & 2  \\ 2 & 5 & 1 \end{bmatrix}\begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}3\\1\\3\end{bmatrix}$$

그런데, REF를 구해서 $Ux=c$의 꼴로 만들어준 다음 해를 구해도 마찬가지 위 방정식의 해와 동일한 해를 구할 수 있다.

$$\begin{bmatrix}4 & 5 & 2 \\ 0 & 5/2 & 0  \\ 0 & 0 & -1/2 \end{bmatrix}\begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}1\\5/2\\3\end{bmatrix}$$

그리고 RREF를 구해서 $Rx=d$의 꼴로 만들어준 다음 해를 구해도 마찬가지 해를 구할 수 있다.

$$\begin{bmatrix}1 & 0 & 0 \\ 0 & 1 & 0  \\ 0 & 0 & 1 \end{bmatrix}\begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}2\\1\\6\end{bmatrix}$$

해를 구하기에 가장 쉬워보이는 방정식은 $Rx=d$이고 $x,y,z$는 

$$x=2, y= 1, z= -6$$

임을 쉽게 알 수 있다.

## 행 벡터의 선형 독립 / 종속 판별

## 행렬의 rank 계산

## free variable이 어떤 것인지 확인

non-zero row, pivot column, free column

complete solution을 구하기 위해 필요한 과정
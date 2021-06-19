---
title: 가우스 소거법
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

다시 말해, 식의 개수보다 변수의 개수가 많은 경우도 있을 수 있고, 변수의 개수보다 식의 개수가 많은 경우에 대해서도 생각해볼 수 있지 않을까? 

그리고, 정방행렬이 아닌 계수 행렬 $A$에 대해 row operation을 수행해 얻은 행렬 $U$가 우리에게 시사해주는 바는 어떤 것들이 있을지도 한번 생각해보자.

# Row-echelon and row-reduced echelon matrices

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

## echelon이라는 단어에 대해서

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

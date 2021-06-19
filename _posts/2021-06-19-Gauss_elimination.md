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
</p>

[LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html) 에서는 위와 같은 방법을 적용할 때 행렬 $A$가 $n\times n$ 형태의 정방 행렬(square matrix)였다.

그런데, 꼭 행렬 $A$가 정방 행렬이어야지만 위와 같은 방식의 row operation을 해줄 수 있는 것은 아니다.

다시 말해, 식의 개수보다 변수의 개수가 많은 경우도 있을 수 있고, 변수의 개수보다 식의 개수가 많은 경우에 대해서도 생각해볼 수 있지 않을까? 

그리고, 정방행렬이 아닌 계수 행렬 $A$에 대해 row operation을 수행해 얻은 행렬 $U$가 우리에게 시사해주는 바는 어떤 것들이 있을지도 한번 생각해보자.

# Row-echelon and row-reduced echelon matrices

Row-echelon 행렬은 한국말로는 사다리꼴 행렬이라고 번역한다.

이 번역은 아주 잘못된 번역의 좋은 예시로 볼 수 있을 것 같다. 그리고 이런 오역으로 인해 학생들이 row-echelon 행렬을 이해하는데 더 어려움을 가중할 것 같다.

우리가 보통 수학에서 사다리꼴이라고 하면 

<p align = "center">
    <img width = "800" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-19-Gauss_elimination/trapezoid.png">
    <br>
</p>





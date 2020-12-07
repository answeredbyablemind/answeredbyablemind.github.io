---
title: 기저의 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201207
tags: 선형대수
---

# Prerequisites

해당 post를 잘 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것을 추천드립니다.

* [벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)

# 벡터의 불변성과 가변성

[벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)에서는 벡터가 무엇인가에 대해 다룰 때 벡터란 "화살표 같은 것"이면서 동시에 "숫자를 순서대로 나열한 것"이라는 두 가지의 특징에 대해 설명한 바 있다.

아래의 그림은 이러한 벡터의 불변성과 가변성을 한번에 설명해주고 있는 그림으로, 좌표계가 변하더라도 빨간색으로 표시한 화살표는 요지부동(불변성)이다. 하지만, 동시에 다른 좌표계를 통해 본 벡터의 좌표는 (3, 4)에서 (3.6, 3.4)로 바뀐 것(가변성)을 볼 수 있다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-07-basic_vector_operation/pic1.png">
  <br>
  그림 1. 좌표계의 변환과 벡터. 좌표계가 변할 때 벡터는 변하지 않지만 벡터의 성분은 변한다.
</p>

이번 post에서는 벡터를 표현하는 좌표계를 변경시켰을 때, 어떻게 기존의 벡터를 새롭게 표현할 수 있는지에 대해 알아보고자 한다.

# 새로운 좌표계 = 새로운 기저의 도입

## 표준 기저를 이용한 좌표 표현

좌표평면 상의 어떤 점(즉 벡터)을 표현할 때 우리가 보통 사용하는 좌표계는 cartesian coordinate이다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-12-07-change_of_basis/Cartesian-coordinate-system.png">
  <br>
  그림 2. 데카르트 좌표계의 2차원 실수 공간 상의 좌표 평면
  <br> 그림 출처: <a href = "https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%B9%B4%EB%A5%B4%ED%8A%B8_%EC%A2%8C%ED%91%9C%EA%B3%84"> 위키피디아, 데카르트 좌표계 </a>
</p>

일반적인 데카르트 좌표계에서 이용되는 기저 벡터는 $(1,0)$과 $(0,1)$을 가르키는 벡터를 이용하고, 각각을

$$\hat{i} = \begin{bmatrix}1 \\0 \end{bmatrix}$$

과

$$\hat{j} = \begin{bmatrix}0\\1\end{bmatrix}$$

로 쓴다.

다시 말해, 기저 벡터란 해당 좌표계를 구성하는 가로 세로 눈금 한 칸을 얼마만큼의 길이로 정할것인지를 정해주는 것이라고 생각할 수 있다.

또한 데카르트 좌표계 상의 임의의 점, 가령 (2,3)이라는 점은 두 기저 벡터의 선형결합으로 표현할 수 있는데, 다시 말해

$$\begin{bmatrix}2\\3 \end{bmatrix} = 2\begin{bmatrix}1\\0 \end{bmatrix} + 3\begin{bmatrix}0\\1 \end{bmatrix} = 2\hat{i} + 3\hat{j}$$

라고 쓸 수 있다는 점이다.

여기서 우리는 용어를 하나 정의하고자 하는데, 앞으로는 데카르트의 좌표계의 기저벡터들($\hat{i}, \hat{j}$)을 표준 기저(standard basis)라고 부르도록 하자.

## 신규 기저를 이용한 좌표 표현

만약 표준 기저가 아닌 전혀 새로운 기저를 이용해 좌표계를 구성한다고 하면 임의의 벡터를 어떻게 다시 표현할 수 있을까?

아래와 같은 새로운 기저 벡터들의 집합을 생각해보자.

$$\mathscr{B} = \left\lbrace\begin{bmatrix}1 \\ 1\end{bmatrix}, \begin{bmatrix}-1 \\ 1\end{bmatrix}\right\rbrace$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-12-07-change_of_basis/pic1.png">
  <br>
  그림 3. 임의의 새로운 기저 벡터 집합 $\mathscr{B}$의 두 기저 벡터
</p>

기저 집합 $\mathscr{B}$를 이용하여 새로운 좌표계를 생각하고, 임의의 벡터를 새로운 기저를 이용해 표현해보자.

가령, 표준 기저를 이용해 표현한 벡터 (2, 2)를 놓고 생각해보자.

원래의 데카르트 좌표계와 새로운 좌표계를 동시에 놓고 생각해본다면 다음의 그림 4와 같을 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-12-07-change_of_basis/pic2.png">
  <br>
  그림 4. 표준 기저로 표현한 벡터 (2,2)에 대한 원래 좌표계와 새로운 좌표계에서의 관찰
</p>

그림 4에서 볼 수 있듯이 표준 기저에서는 (2, 2)로 표현되던 좌표 (빨간색 화살표)가 새로운 좌표게에서는 (2, 0)으로 표현하면 충분할 것으로 보인다.

앞으로 기저가 변경되는 경우 벡터를 표현할 때 아랫첨자로 기저가 되는 벡터 집합의 이름을 기재하도록 하자.

가령, 표준 기저에서 표현되는 (2,2) 벡터는

$$\begin{bmatrix}2, 2\end{bmatrix}_{\mathscr{e}}$$

라고 표현하고, 새로운 기저 $\mathscr{B}$를 기반으로 하여 표현되는 벡터 (1, 0)은 

$$\begin{bmatrix}2, 0\end{bmatrix}_{\mathscr{B}}$$

라고 쓰자.

그렇다면, 그림 4에서 보았던 것 처럼 다음과 같은 관계를 확인할 수 있다.

$$\begin{bmatrix}2, 2\end{bmatrix}_{\mathscr{e}} = \begin{bmatrix}2, 0\end{bmatrix}_{\mathscr{B}}$$
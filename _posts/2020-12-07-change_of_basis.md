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

좌표평면 상의 어떤 점(즉 벡터)을 표현할 때 우리가 보통 사용하는 좌표계는 cartesian coordinate이다.

<p align = "center">
  <img width = "400" src = "https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%B9%B4%EB%A5%B4%ED%8A%B8_%EC%A2%8C%ED%91%9C%EA%B3%84#/media/%ED%8C%8C%EC%9D%BC:Cartesian-coordinate-system.svg">
  <br>
  그림 2. 데카르트 좌표계의 2차원 실수 공간 상의 좌표 평면
</p>


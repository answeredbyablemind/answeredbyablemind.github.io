---
title: 가우스 소거법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210619
tags: 선형대수학
---

# Prerequisites

이번 포스팅의 내용을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)
* [LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html)

# LU 분해 복습: 연립 방정식을 푸는 방법에 대해서

우리는 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)과 [LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html)를 공부하면서 연립 방정식을 행렬로 만들고 풀 수 있다는 사실을 확인했다.

연립 방정식을 행렬로 만들었을 때 얻게 되는 가장 큰 이점은 컴퓨터로 방정식의 해를 구하는 과정을 쉽게 만들 수 있는 것이라고도 언급한 바 있다.

LU 분해를 이용하면 선형 시스템 $Ax=b$를 아래와 같은 방식으로 

[LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html)에서는 다음과 같이 변수의 개수와 식의 개수가 같은 연립방정식에 대해서만 해를 구했다.







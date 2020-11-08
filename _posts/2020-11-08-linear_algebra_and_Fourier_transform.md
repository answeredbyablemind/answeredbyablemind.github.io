---
title: 선형대수와 푸리에 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201108
tags: 선형대수 신호처리
---

# Prerequisites

해당 포스트에 대해 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)
* [벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)
* [행렬 곱에 대한 새로운 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)

# 푸리에 변환이란 무엇인지?

## 사용 예시

MATLAB을 이용해 두 개의 주파수 성분을 가진 시계열에 대한 Fourier Transform 수행하고, 결과를 시각적으로 보여준 뒤 결과에 대한 설명해줄 것.

그리고, 푸리에 변환이 왜 유용한지에 대해 설명함으로써 motivation 심어줄 것.

# 무한 차원 벡터 공간

지금까지 선형대수학에서 다루어왔던 벡터들이 함수와 어떤 연관성이 있는지?

무한 차원이란 무엇인지?

함수를 벡터로써 일반화 할 수 있음을 소개하고, 그 때에 해당하는 벡터 공간의 이름들을 소개 (수열공간, 함수공간, 힐버트공간)

# 다시 유한 차원으로: 이산 푸리에 변환

DFT 파트에서 해당 내용 가져올 것.

## 푸리에 행렬의 의미

결국 푸리에 변환도 행렬과 벡터 간의 선형변환으로 볼 수 있다는 것이다.


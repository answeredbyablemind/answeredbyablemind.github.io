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

# 푸리에 변환이란?

푸리에 변환은 신호의 주파수 분석을 수행할 때 이용된다.

조금 쉽게 예를 들면 톤이 매우 낮은 남자와 톤이 높은 여자가 동시에 말을 한다고 생각해보자.

이 때 우리가 듣게 되는 소리는 낮은 음과 높은 음이 섞인 신호 일 것이다.

여기서 우리가 알고싶은 정보는 다음과 같다.

* 낮은 음과 높은 음의 주파수 값은 어떻게 될까? (즉, 얼마나 높고 낮은지를 수치화 하고싶다는 의미)
* 낮은 음과 높은 음의 신호 크기 비율은 어떻게 될까? (한마디로, 둘의 목소리가 얼마나 컸나)

## 사용 예시

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-08-linear_algebra_and_Fourier_transform/pic1.png">
  <br>
  그림 1. 50Hz 및 120 Hz의 정현파가 섞여있는 신호
</p>

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-08-linear_algebra_and_Fourier_transform/pic2.png">
  <br>
  그림 2. 푸리에 변환 결과 50Hz, 120Hz의 두 주파수 성분이 포함되어 있는 신호임을 역으로 추정할 수 있다.
</p>

# 무한 차원 벡터 공간

지금까지 선형대수학에서 다루어왔던 벡터들이 함수와 어떤 연관성이 있는지?

무한 차원이란 무엇인지?

함수를 벡터로써 일반화 할 수 있음을 소개하고, 그 때에 해당하는 벡터 공간의 이름들을 소개 (수열공간, 함수공간, 힐버트공간)

# 다시 유한 차원으로: 이산 푸리에 변환

DFT 파트에서 해당 내용 가져올 것.

## 푸리에 행렬의 의미

결국 푸리에 변환도 행렬과 벡터 간의 선형변환으로 볼 수 있다는 것이다.


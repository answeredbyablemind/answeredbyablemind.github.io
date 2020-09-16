---
title: Rejection Sampling
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200916
tags: 통계학
---

# 확률 분포로부터 샘플 추출

uniform distribution이나 정규분포의 샘플은 컴퓨터를 이용하면 코드 한 줄이면 추출할 수 있다.

MATLAB의 경우는 아래와 같은 코드를 이용할 수 있다.

```
uniform_sample = rand(1,1)

normal_sample = randn(1,1)
```

그런데, 임의의 수식을 가진 확률밀도함수로부터 랜덤한 샘플을 추출하려면 어떻게 해야할까?

# Rejection Sampling

수식을 알고 있는 어떤 확률 밀도 함수가 있다고 하자.

가령 아래와 같은 확률 밀도를 생각해볼 수 있다.

$$f(x) = 0.3\exp\left(-0.2 * x^2\right) + 0.7\exp\left(-0.2 * (x-10)^2\right)$$

이 함수를 plot 해보면 다음과 같은 형태를 가지고 있다는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-16-rejection_sampling/pic1.png">
  <br>
  그림 1. 수식을 알고 있는 임의의 확률밀도 함수
</p>

만약에 우리가 이런 형태의 확률밀도함수로부터 샘플을 추출하려고 하면 어떻게 샘플을 추출할 수 있을까?




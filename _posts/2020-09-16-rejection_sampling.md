---
title: Rejection Sampling
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200916
tags: 통계학
---

해당 포스팅은 [CHML 님의 포스팅](https://untitledtblog.tistory.com/134?category=823331)을 참고하여 작성하였습니다.

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

가령 아래와 같은 확률 밀도 함수 $f(x)$를 생각해볼 수 있다.

$$f(x) = 0.3\exp\left(-0.2x^2\right) + 0.7\exp\left(-0.2(x-10)^2\right)$$

우리가 샘플을 추출하고자 하는 이 확률 분포를 '타겟 분포(target distribution)'라고 이름 붙이고, $f(x)$로 쓰도록 하자.

이 타겟 분포를 plot 해보면 다음과 같은 형태를 가지고 있다는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-16-rejection_sampling/pic1.png">
  <br>
  그림 1. 수식을 알고 있는 임의의 확률밀도 함수
</p>

만약에 우리가 이런 형태의 확률밀도함수로부터 샘플을 추출하려고 하면 어떻게 샘플을 추출할 수 있을까?

이럴 때 사용할 수 있는 것이 rejection sampling이라고 할 수 있다.

## 제안 분포(혹은 유사 분포)

rejection sampling의 첫 단계는 제안 분포(proposal distribution)를 설정하는 것이다.

앞으로 제안 분포를 $g(x)$로 쓰도록 하자.

제안 분포 $g(x)$는 우리가 쉽게 샘플을 추출할 수 있는 분포를 이용해서 생성할 수 있다.

가령, uniform distribution이 생긴게 가장 단순하기 때문에 uniform distribution을 이용해서 제안 분포를 만들 수 있을 것이다.

교과서에서는 타겟 분포와 가장 유사한 형태의 제안 분포를 설정하는 것이 좋다고 되어 있다. 

(하지만, uniform distribution을 쓰는게 제일 속편하다.)

이렇게 제안 분포를 일단 결정했으면 타겟 분포와 제안 분포를 일단 그려보자.


이 예시에서는 제안 분포로 결정한 uniform distribution의 정의역의 범위를 아래와 같이 설정하였다.

그 이유는 $x$ 범위에서 가능한 타겟 분포를 모두 포함할 수 있도록 하기 위해서이다.

$$x = \lbrace x|-7\leq x \lt 17\rbrace$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-16-rejection_sampling/pic2.png">
  <br>
  그림 2. 타겟분포와 제안분포
</p>

그런 다음 제안 분포에 상수배($M$)를 취해주어 $y$ 축에서도 타겟 분포를 모두 포함할 수 있도록 해주자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-16-rejection_sampling/pic3.png">
  <br>
  그림 3. 타겟분포와 제안분포에 상수배를 취해주어 타겟 분포를 모두 포함할 수 있도록 한 것.
</p>


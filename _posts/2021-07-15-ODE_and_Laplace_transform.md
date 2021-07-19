---
title: 미분방정식과 라플라스 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210715
tags: 미분방정식
---

# Prerequisites

이번 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)


# 라플라스 변환의 정의

함수 $x(t)$의 라플라스 변환은 모든 실수 $t\geq 0$에 대해 다음과 같은 함수 $X(s)$로 정의된다.

$$X(s)=\mathscr{L}\lbrace x(t)\rbrace=\int_{0}^{\infty}e^{-st}x(t)dt$$

여기서 $s=\sigma+i\omega$의 형태를 띄는 복소수이다.

## 라플라스 변환은 선형 연산자

선형 미분방정식에서만 사용할 수 있다.

## 초기값 문제에 적용 가능

초기값 문제가 갖는 의미는?

# 의미

$$x(t)=c_1e^{\lambda_1 t}+c_2e^{\lambda_2 t}$$

서로 다른 성장 속도를 갖는 기저 함수의 선형 결합을 볼 수 있다.

각 기저함수의 성장 속도는 $\lambda_i$로 기술되며 이 값은 고윳값이다.


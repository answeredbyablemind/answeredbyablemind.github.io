---
title: 고유함수 전개
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210601
tags: 미분방정식
---

# 에르미트 행렬 소개

에르미트(Hermitian) 행렬은 자기 자신과 켤레 전치가 같은 복소수 정사각 행렬이다. 다시 말해, 임의의 $n\times n$행렬에 대해 아래의 성질이 성립한다면 에르메트 행렬이다.

$$A^H=A$$

즉,

$$A_{ij}=\bar{A_{ji}}$$

여기서 $A^H$은 켤레 전치(conjugate transpose), $\bar{A}$는 켤레 복소수(complex conjugate)를 의미한다.

에르미트 행렬은 실수 행렬(real matrices)에서 사용되던 전치 행렬 (transpose matrix)을 복소수 체계에 까지 개념을 확장한 것이다.

가령, 아래와 같은 행렬들이 에르미트 행렬이다.

$$\begin{bmatrix} 2 & 2+i & 4 \\ 2-i & 3 & i \\ 4 & -i & 1\end{bmatrix}$$

## 주요 성질

대칭 행렬은 임의의 $n\times n$ 행렬 $A$ 중 아래와 같은 성질을 가지고 있는 행렬을 의미한다.

$$A^T=A$$

대칭 행렬의 성질 중 가장 중요한 성질 중 하나는 고윳값, 고유벡터에 관한 성질이다.


---
title: 사비츠키-골레이 필터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201021
tags: 신호처리
---

# Prerequisites

이번 포스팅을 이해하기 위해선 다음의 지식이 선행 학습되어야 합니다.

* FIR 필터
* 행렬 연산에 관한 기초 지식 (행렬곱, 역행렬 등)

# 유도 과정

$$\epsilon_N = \sum_{n=-M}^{M}\left(p(n)-x[n]\right)^2$$

$$=\sum_{n=-M}^{M}\left(\sum_{k=0}^Na_kn^k - x[n]\right)^2$$

편미분을 통해 에러를 최소화 할 수 있는 계수 $a_i\text{ for }i=0,1,\cdots,N$을 찾을 수 있다.

$$\frac{\partial\epsilon_N}{\partial a_i}=\sum_{n=-M}^{M}2\left(\sum_{k=0}^{N}a_kn^k-x[n]\right)n^i = 0\notag$$

$$\text{ for }i=0,1,\cdots,N$$

위 식을 조금 더 정리하면,

$$\sum_{n=-M}^{M}n^i\sum_{k=0}^{N}a_kn^k-\sum_{n=-M}^{M}n^ix[n] = 0$$

$$\Rightarrow \sum_{n=-M}^{N}\sum_{k=0}^{N}n^{i+k}a_k=\sum_{n=-M}^{M}n^ix[n]$$

이제 이 식을 행렬을 이용해 표현하면 다음과 같이 쓸 수 있다.

$(2M+1)\times(N+1)$의 dimension을 갖는 어떤 행렬 $A$를 다음과 같이 정의하도록 하자.

$$A = \lbrace a_{n, i} \rbrace = \lbrace n^i \rbrace\notag$$

$$\text{where }-M\leq n \leq M \text{ and } i=0,1,\cdots,N$$

여기서 $\lbrace a_{n,i}\rbrace$의 표시는 $n$번째 행 $i$번째 열의 원소가 $n^i$와 같이 정의한다는 것을 의미한다.

참고로, 원소별로 쓰면 행렬 $A$는 다음과 같다[^1].

$$A = \begin{bmatrix}
  (-M)^0 && (-M)^1 && \cdots && (-M)^N \\\\
  (-M+1)^0 && (-M+1)^1 && \cdots && (-M+1)^N \\\\
  \vdots && \vdots && \vdots && \vdots \\\\
  0^0 && 0^1 && \cdots && 0^N \\\\
  1^0 && 1^1 && \cdots && 1^N \\\\
  \vdots && \vdots && \ddots && \vdots \\\\
  M^0 && M^1 && \cdots && M^N
\end{bmatrix}$$

[^1]: 잘 보면 행렬 A는 전형적인 [반데르몽드 행렬](https://en.wikipedia.org/wiki/Vandermonde_matrix)이다.


# 참고자료

* [What is a Savitzky-Golay Filter, IEEE, 2011, Ronald W. Schafer](https://ieeexplore.ieee.org/document/5888646)
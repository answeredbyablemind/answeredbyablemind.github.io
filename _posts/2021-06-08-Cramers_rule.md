---
title: 크래머 공식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210608
tags: 선형대수학
---

# 크래머 공식

크래머 공식은 아래와 같은 방정식의 해를 얻을 때 사용할 수 있는 공식이다.

임의의 $n\times n$ 사이즈의 행렬 $A$와 $n\times 1$ 사이즈의 벡터 $b$이고 $x=[x_1, x_2, \cdots, x_n]^T$라고 할 때,

$$Ax=b$$

가 성립할 때, 솔루션 $x$의 각 원소 $x_i\text{ for }i=1,2,\cdots, n$는

$$x_i = \frac{\text{det}(A^{rep}_{i})}{\text{det}(A)}$$

와 같이 정해진다는 공식이다.

여기서 $A^{rep}_{i}$는 행렬 $A$의 $i$번째 열을 $b$ 벡터로 치환한 행렬이다.

## 공식의 증명

행렬 $A$는 아래와 같이 $n$ 개의 열벡터를 양 옆으로 쌓아둔 것과 같다고 할 수 있다.

$$A=\begin{bmatrix}
   |   &  |   &        &   | \\
  A_1  & A_2  & \cdots &  A_n \\
   |   &  |   &        &   | \end{bmatrix}$$

그리고, $A$ 행렬의 열 notation을 이용해 $Ax=b$는 다음과 같이도 쓸 수 있다.

$A$의 각 열을 $\begin{bmatrix}| \\ A_1\\ |\end{bmatrix}$, $\begin{bmatrix}| \\ A_2\\ |\end{bmatrix}$, $\cdots$, $\begin{bmatrix}| \\ A_n\\ |\end{bmatrix}$이라 하고 $x$의 각 원소를 $x_1$, $x_2$, $\cdots$, $x_n$이라 할 때,

$$Ax=x_1\begin{bmatrix}| \\ A_1\\ |\end{bmatrix}+x_2\begin{bmatrix}| \\ A_2\\ |\end{bmatrix}+\cdots+x_n\begin{bmatrix}| \\ A_n\\ |\end{bmatrix} = b$$

과 같이 쓸 수 있는 것이다.

---


$i$ 번째 열을 $b$ 벡터로 대체한 행렬을 $A^{rep}_{i}$라고 부르자. 다시 말해,

$$A^{rep}_{i} =\begin{bmatrix}
   |   &  |   &        & | &       &   |  \\
  A_1  & A_2  & \cdots & b & \cdots &  A_n \\
   |   &  |   &        & | &       &   |  \end{bmatrix}$$

와 같은 행렬을 생각하는 것이며 이 때 $b$는 $i$번째 열에 대입된 것이다.

이것을 표기의 편리함을 위해 아래와 같이 줄여서 쓰도록 하자.

$$A^{rep}_{i} = [A_1, A_2, \cdots, b,\cdots,A_n]$$

이 표기 역시 $i$번째 열에 $b$벡터가 대입된 것이다.

그럼 여기서 $A^{rep}_{i}$의 행렬식을 계산해보자.

$$\text{det}(A^{rep}_{i}) = \text{det}\left([A_1, A_2, \cdots, b,\cdots,A_n]\right)$$

여기서 $b$는 $x_1A_1 + x_2A_2 + \cdots + x_nA_n$과 같으므로,

$$\Rightarrow \text{det}\left([A_1, A_2, \cdots, x_1A_1 + x_2A_2 + \cdots + x_nA_n,\cdots,A_n]\right)$$

행렬식의 성질에 의해,

$$\Rightarrow x_1 \text{det}\left([A_1, A_2, \cdots, A_1,\cdots,A_n]\right) \\
\quad + x_2 \text{det}\left([A_1, A_2, \cdots, A_2,\cdots,A_n]\right) \\
\vdots \\
\quad + x_n \text{det}\left([A_1, A_2, \cdots, A_n,\cdots,A_n]\right) $$

$$=\sum_{j=1}^{n}x_j \text{det}\left([A_1, A_2, \cdots, A_j,\cdots,A_n]\right) $$

행렬을 이루는 열벡터 중 선형독립이 아닌 열벡터가 존재하는 경우 행렬식의 값은 0이다.

따라서, 위 식은 $j=i$인 경우에만 0이 아니고 나머지 경우는 모두 0이 된다.

그러므로,

$$\Rightarrow x_i \text{det}\left([A_1, A_2, \cdots, A_i, \cdots, A_n]\right)$$

그런데 $[A_1, A_2, \cdots, A_i, \cdots, A_n]$ 행렬은 기존의 $A$ 행렬과 동일하므로 위 식은

$$\Rightarrow x_i \text{det}(A)$$

이다.

따라서, 원래의 식과 비교해보면

$$\text{det}(A^{rep}_{i})=x_i\text{det}(A)$$

이므로,

$$x_i = \frac{\text{det}(A^{rep}_{i})}{\text{det}(A)}$$

임을 알 수 있다.


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

에르미트 행렬의 성질 중 중요한 성질 몇 가지만 꼽으면 아래와 같다.

### 1. 에르미트 행렬의 대각 원소는 항상 실수이다.

증명:

행렬 $A$가 $n\times n$에르미트 행렬이라고 할 때, $i = 1, 2, \cdots, n$에 대해서,

$$A_{ii}=\bar{A_{ii}}$$

이므로, $A_{ii}$의 허수부는 0이다.

### 2. 에르메트 행렬의 고윳값은 항상 실수(real number)이다.

증명:

$\lambda \in \Bbb{C}$가 에르미트 행렬 $A$의 고윳값이라고 하자. 그러면,

$$Av=\lambda v$$

인 고유벡터 $v\neq 0$가 존재한다고 할 수 있는 것이다. 그러면 여기서 $Av$에 $v$ 벡터를 한번 더 내적해보자. 내적 연산을 $\langle \cdot, \cdot \rangle$이라고 쓰면,

$$\langle Av, v\rangle=(Av)^Hv=v^HA^Hv=\langle v, A^Hv\rangle=\langle v, Av \rangle$$

과 같이 쓸 수 있다. 여기서 고윳값, 고유벡터의 정의에 의해 $Av=\lambda v$이므로 위 식의 가장 왼쪽에 있는 식은

$$\langle Av, v\rangle = \langle \lambda v, v\rangle=\bar \lambda v^Hv$$

이고,

위 식의 가장 오른쪽에 있는 식은

$$\langle v, Av\rangle=v^H\lambda v=\lambda v^Hv$$

이다. 한편, 고유벡터는 0벡터가 아니므로 $v^Hv$는 0이 아니다.

따라서,

$$\lambda = \bar\lambda$$

이므로 항상 고윳값 $\lambda$는 실수이다.

### 3. 에르미트 행렬의 서로 다른 고윳값에 대응하는 고유벡터들은 서로 직교한다.

증명:

0 벡터가 아닌 $n$ 차원 복소 벡터 $v_1, v_2\in \Bbb{C}^n$가 행렬 $A$의 고윳값 $\lambda_1\neq \lambda_2$에 대한 고유벡터라고 하자. 이제 $Av_1$이라는 벡터에 $v_2$ 벡터를 내적해보자. 그러면,

$$\langle Av_1, v_2\rangle=(Av_1)^Hv_2=v_1^HA^Hv_2=\langle v_1, A^Hv_2\rangle=\langle v_1, Av_2\rangle$$

과 같이 쓸 수 있다.

이 때, 위 식의 가장 왼쪽에 있는 식은

$$\langle Av_1, v_2\rangle = \langle \lambda_1v_1, v_2\rangle=\lambda_1\langle v_1, v_2\rangle$$

이며, 가장 오른쪽에 있는 식은

$$\langle v_1, Av_2\rangle=\langle v_1, \lambda_2 v_2\rangle=\lambda\langle v_1, v_2\rangle$$

이다.

두 식은 동일하므로

$$\lambda_1\langle v_1, v_2\rangle = \lambda_2\langle v_1, v_2\rangle$$

$$\Rightarrow (\lambda_1-\lambda_2)\langle v_1, v_2\rangle = 0$$

이다.

여기서 $\lambda_1 \neq \lambda_2$이므로 $\langle v_1, v_2\rangle = 0$이다.

따라서, 서로 다른 두 고윳값에 대응되는 두 고유벡터는 서로 직교한다.

# 고유벡터를 이용한 해(solution)의 표현

$A$가 $n\times n$ 에르미트 행렬이라고 하고,

$$Ax_i=\lambda_i x_i \quad\text{ for }\quad i=1,2,\cdots,n$$

와 같은 $n$개의 eigenvalue $\lambda_i$와 eigenvector $x_i$를 생각해보자.

$n\times n$ 에르미트 행렬은 고윳값이 distinct 하다고 하면 서로 직교하는 고유벡터 $n$개를 갖는다.

따라서, $n$ 차원 복소공간의 어떤 벡터라도 eigenvector의 선형결합으로 표현할 수 있게 된다.

그러므로 $Ax=b$ 문제를 풀고자 할 때 solution $x$는 다음과 같이 표현할 수도 있는 것이다.

$$x=\sum_{i=1}^{n}c_i x_i$$

즉, 우리는 solution $x$를 고유벡터 이용해 표현할 수 있으며, 우리가 알아야 하는 것은 기저벡터를 얼마만큼 써먹을 것인지에 관한 $c_i$ 값이다. 

고유벡터 $x_i$와 $Ax=b$의 $b$ 벡터는 모두 알고 있는 것이므로 다음과 같이 $c_i$ 값을 구할 수 있게 된다.

아래와 같은 수식에 대해서,

$$Ax=b$$

$x$를 고유벡터를 이용해 표현해주면 다음과 같이 쓸 수 있다.

$$A\sum_{i=1}^n c_ix_i=b$$

여기서 양변에 다시 고유벡터 $x_j$와 내적을 취해주자.

$$A\sum_{i=1}^n c_ix_i\cdot x_j=b\cdot x_j$$

여기서 좌변에 있던 $A$를 summation 안에 넣어줘서,

$$\sum_{i=1}^n c_iAx_i\cdot x_j=b\cdot x_j$$

와 같이 만들면 고윳값, 고유벡터의 정의에 의해 아래와 같이 식을 바꿔 쓸 수 있다.

$$\Rightarrow \sum_{i=1}^n c_i\lambda_i x_i\cdot x_j=b\cdot x_j$$

$A$는 에르미트 행렬이라고 하고 만약 모든 eigenvalue들이 distinct하다면 서로 다른 eigenvector들은 서로 직교이다.

따라서, 위 식의 $x_i\cdot x_j$는 $i=j$인 경우에만 1이고 아닌 경우에는 0이 된다. 따라서,

$$\Rightarrow c_j\lambda_j (x_j\cdot x_j) = b\cdot x_j$$

$$=c_j\lambda_j=b\cdot x_j$$

그러므로 $c_i$는 다음과 같이 계산할 수 있는 것이다.

$$c_i = \frac{b\cdot x_i}{\lambda_i}$$

그렇기 때문에, 일반적으로 $Ax=b$ 문제에 대한 솔루션은 eigenvector, eigenvalue를 이용해 다음과 같이 쓸 수도 있는 것이다.

$$x=\sum_{i=1}^{n}c_ix_i=\sum_{i=1}^{n}\left(\frac{b\cdot x_i}{\lambda_i}\right)x_i$$

흥미로운 점은 이런 방식으로 솔루션을 얻으면 꼭 inverse를 구하지 않고도 해를 구할 수 있다는 점이다.

# 고유함수 전개


---
title: 숄레스키 분해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210617
tags: 선형대수학
---

# Prerequisites

이번 포스팅의 내용을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html)

# LU 분해를 수행하는 또 다른 방법

[LU 분해](https://angeloyeo.github.io/2021/06/16/LU_decomposition.html) 편에서는 LU 분해란 Gaussian elimination을 수행하는 과정에서 사용하는 기본 행 연산을 이용해 얻게 되는 행렬 분해 방법이라고 소개한 바 있다.

그런데, 꼭 Gaussian elimination을 이용하지 않더라도 아래와 같이 행렬 $A$를 하삼각행렬과 상삼각행렬의 곱으로 분해된다고 가정하더다라도 LU 분해의 결과를 그대로 얻을 수 있을 것이다.

임의의 $3\times 3$ 사이즈의 행렬 $A$에 대해 다음과 같이 행렬 분해가 가능하다고 생각해보자.

$$
    \begin{bmatrix}
        a_{11} & a_{12} & a_{13} \\
        a_{21} & a_{22} & a_{23} \\
        a_{31} & a_{32} & a_{33} \\
    \end{bmatrix} = 
    \begin{bmatrix}
        1      & 0      & 0 \\
        l_{21} & 1      & 0 \\
        l_{31} & l_{32} & 1 \\
    \end{bmatrix}
    \begin{bmatrix}
        u_{11} & u_{12} & u_{13} \\
        0      & u_{22} & u_{23} \\
        0      & 0      & u_{33} \\
    \end{bmatrix}
$$

$$=\begin{bmatrix}
    u_{11}          & u_{12}                      & u_{13} \\
    u_{11}l_{21}    & u_{12}l_{21} + u_{22}       & u_{13}l_{21}+u_{23} \\
    u_{11}l_{31}    & u_{12}l_{31} + u_{22}l_{32} & u_{13}l_{31}+u_{23}l_{32}+u_{33} \\
\end{bmatrix}$$

이 결과만을 놓고 보면 $u_{11}$, $u_{12}$, $u_{13}$이 $a_{11}$, $a_{12}$, $a_{13}$과 같은 것을 알 수 있고, 다음 행의 내부 값은 구해놓은 $u_{11}$, $u_{12}$, $u_{13}$로부터 구할 수 있음을 알 수 있다. 

이런 방식으로 순차적으로 $L$과 $U$의 원소들을 구할 수 있다.

# Symmetric 행렬의 LU 분해?

Symmetric 행렬의 경우[^1] LU 분해를 다음과 같은 방식으로도 생각할 수 있다.

[^1]: 복소 행렬이라면 에르미트 행렬로 확장할 수 있다. 다만, 에르미트 행렬의 경우에도 대칭 행렬의 경우와 같은 방법으로 Cholesky factorization의 아이디어를 생각할 수 있으므로 이번 포스팅에서는 실수 성분만을 갖는 symmetric 행렬에 한정해 생각해보도록 하자.

만약 $A$가 symmetric matrix라면 __**혹시**__ 이런식으로도 분해될 수 있지는 않을까?

$$A=LL^T=L^TL$$

왜냐면 symmetric matrix는 $A=A^T$이므로 $(LL^T)^T = LL^T$라고 쓸 수도 있을 것 같고, $L^T$는 상삼각행렬이므로 $LU$ 분해와 유사한 형태의 결론을 얻을 수도 있을 것 같기 때문이다.

[//]:# (Positive Definite 조건이 필요한 이유?)

그런데 $A$가 symmetric 행렬이라고 해서 항상 $A=LL^T=L^TL$로 분해할 수 있는 것은 아니다. 우리는 임의의 $L$이 어떤 특성을 가져야만 하는지 생각해보자.

임의의 벡터는 행렬 $L$과 벡터 $x$의 곱 $Lx$를 생각해보자. 이 $Lx$ 벡터의 L2-norm 값은 항상 0보다 크거나 같다. 

그리고 L2-norm을 계산하는 방법은 벡터의 내적으로도 가능한데, 이 과정을 다시 쓰면,

$$|Lx|^2 = (Lx)^T(Lx)$$

이다.

그리고 전치 연산자의 성질에 의해 다음과 같이 정리해서 쓸 수 있다.

$$\Rightarrow x^TL^TLx$$

그리고 괄호로 중간에 있는 $L^TL$을 묶어주면,

$$x^T(L^TL)x$$

이며 $(L^TL)$이 어떤 행렬 $A$라고 한다면,

$$x^TAx$$

와 같이 쓸 수 있으며 이 계산은 임의의 벡터 $Lx$의 L2-norm을 계산하는 방법으로부터 왔으므로

$$x^TAx\geq 0$$

이다. 우리는 $x^TAx\geq 0$과 같은 성질을 만족하는 행렬을 semi positive definite 행렬이라고 부른다. 다시 말해, $A=LL^T=L^TL$을 만족하는 행렬은 semi-positive definite 행렬이어야 한다.

정리하면,

* 행렬 A가 정방행렬이고
* 대칭행렬이면서
* semi-positive definite

일 때 $A=LL^T=L^TL$과 같이 분해 가능하며 이 분해 방법을 **Cholesky factorization (숄레스키 분해)**라고 부른다.

Cholesky–Banachiewicz algorithm

```{MATLAB}
A = [4,12,-16;12,37,-43;-16,-43,98];
L = zeros(size(A));

for i = 1:size(A,1)
    for j = 1:i
        my_sum = 0;
        
        for k = 1:j-1
            my_sum = my_sum + L(i,k)*L(j,k);
        end
        
        if i == j
            L(i,j)=sqrt(A(i,i)-my_sum);
        else
            L(i,j)=(1/L(j,j)*(A(i,j)-my_sum));
        end
    end
end

L
transpose(chol(A))
```

# 참고문헌

* [Cholesky decomposition, 위키피디아](https://en.wikipedia.org/wiki/Cholesky_decomposition)
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

그런데, 꼭 Gaussian elimination을 이용하지 않고 아래와 같이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq1.png">를 하삼각행렬과 상삼각행렬의 곱으로 분해된다고 가정하더라도 LU 분해의 결과를 그대로 얻을 수 있을 것이다.

임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq2.png"> 사이즈의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq3.png">에 대해 다음과 같이 행렬 분해가 가능하다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq4.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq5.png"> </p>


이 결과만을 놓고 보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq6.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq7.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq8.png">이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq9.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq10.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq11.png">과 같은 것을 알 수 있고, 다음 행의 내부 값은 구해놓은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq12.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq13.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq14.png">로부터 구할 수 있음을 알 수 있다. 

이런 방식으로 순차적으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq15.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq16.png">의 원소들을 구할 수 있다.

# Symmetric 행렬의 LU 분해?

Symmetric 행렬의 경우[^1] LU 분해를 다음과 같은 방식으로도 생각할 수 있다.

[^1]: 복소 행렬이라면 에르미트 행렬로 확장할 수 있다. 다만, 에르미트 행렬의 경우에도 대칭 행렬의 경우와 같은 방법으로 Cholesky factorization의 아이디어를 생각할 수 있으므로 이번 포스팅에서는 실수 성분만을 갖는 symmetric 행렬에 한정해 생각해보도록 하자.

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq17.png">가 symmetric matrix라면 **혹시** 이런식으로도 분해될 수 있지는 않을까?

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq18.png"> </p>

왜냐면 symmetric matrix는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq19.png">이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq20.png">라고 쓸 수도 있을 것 같고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq21.png">는 상삼각행렬이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq22.png"> 분해와 유사한 형태의 결론을 얻을 수도 있을 것 같기 때문이다.

[//]:# (Positive Definite 조건이 필요한 이유?)

그런데 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq23.png">가 symmetric 행렬이라고 해서 항상 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq24.png"> </p>로 분해할 수 있는 것은 아니다. 우리는 임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq25.png">이 어떤 특성을 가져야만 하는지 생각해보자.

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq26.png">과 임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq27.png">의 곱 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq28.png">를 생각해보자. 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq29.png"> 벡터의 L2-norm 값은 항상 0보다 크거나 같다. 

그리고 L2-norm을 계산하는 방법은 벡터의 내적으로도 가능한데, 이 과정을 다시 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq30.png"> </p>

이다.

그리고 전치 연산자의 성질에 의해 다음과 같이 정리해서 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq31.png"> </p>

그리고 괄호로 중간에 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq32.png">을 묶어주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq33.png"> </p>

이며 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq34.png">이 어떤 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq35.png">라고 한다면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq36.png"> </p>

와 같이 쓸 수 있으며 이 계산은 임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq37.png">의 L2-norm을 계산하는 방법으로부터 왔으므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq38.png"> </p>

이다. 우리는 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq39.png"> </p>과 같은 성질을 만족하는 행렬을 semi positive definite 행렬이라고 부른다. 다시 말해, <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq40.png"> </p>을 만족하는 행렬은 semi-positive definite 행렬이어야 한다.

정리하면,

* 행렬 A가 정방행렬이고
* 대칭행렬이면서
* semi-positive definite

일 때 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq41.png"> </p>과 같이 분해 가능하며 이 분해 방법을 **Cholesky factorization (숄레스키 분해)**라고 부른다.

# Cholesky factorization 계산

Cholesky factorization은 앞선 LU 분해의 또 다른 계산 방법에서와 같은 맥락으로 계산할 수 있다.

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq42.png">가 대칭행렬이면서 semi-positive definite이라고 가정하자.

그러면 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq43.png">를 다음과 같이 분해할 수 있다고 가정할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq44.png"> </p>

행렬 곱을 계산해보면 다음과 같은 결과를 얻을 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq45.png"> </p>

위의 계산 결과와 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq46.png">의 원소를 1:1로 비교하면 다음과 같이 정리할 수 있다는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq47.png"> </p>

이것의 패턴을 일반화 하면 다음과 같다는 것 또한 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq48.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-17-Cholesky_decomposition/eq49.png"> </p>

## MATLAB 구현

Cholesky factorization의 계산 방법을 직접 구현한 알고리즘 중 하나로  Cholesky–Banachiewicz algorithm 이 있다.

이 알고리즘은 Cholesky factorization의 하삼각행렬을 매 행마다 계산해나가는 방식으로 구현되어 있다.

아래는 MATLAB으로 Cholesky-Banachiewicz 알고리즘을 구현한 것이다.

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

위 결과에서 L과 transpose(chol(A))를 비교한 결과가 같다는 것을 확인할 수 있을 것이다.

# 참고문헌

* [Cholesky decomposition, 위키피디아](https://en.wikipedia.org/wiki/Cholesky_decomposition)
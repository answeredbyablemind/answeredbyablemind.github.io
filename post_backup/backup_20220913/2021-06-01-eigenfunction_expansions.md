---
title: 고유함수 전개
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210601
tags: 미분방정식
---

이 포스팅은 [Nathan Kutz 교수님의 강의](https://www.youtube.com/watch?v=_ZOJjiuO4eE&ab_channel=NathanKutz)를 많이 참고 하여 작성한 것임을 미리 밝힙니다.

# Prerequisites

이 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

# 에르미트 행렬 소개

에르미트(Hermitian) 행렬은 자기 자신과 켤레 전치가 같은 복소수 정사각 행렬이다. 다시 말해, 임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq1.png">행렬에 대해 아래의 성질이 성립한다면 에르메트 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq2.png"> </p>

즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq3.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq4.png">은 켤레 전치(conjugate transpose), <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq5.png">는 켤레 복소수(complex conjugate)를 의미한다.

에르미트 행렬은 실수 행렬(real matrices)에서 사용되던 전치 행렬 (transpose matrix)을 복소수 체계에 까지 개념을 확장한 것이다.

가령, 아래와 같은 행렬들이 에르미트 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq6.png"> </p>

## 주요 성질

에르미트 행렬의 성질 중 중요한 성질 몇 가지만 꼽으면 아래와 같다.

### 1. 에르미트 행렬의 대각 원소는 항상 실수이다.

증명:

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq7.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq8.png">에르미트 행렬이라고 할 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq9.png">에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq10.png"> </p>

이므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq11.png">의 허수부는 0이다.

### 2. 에르메트 행렬의 고윳값은 항상 실수(real number)이다.

증명:

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq12.png">가 에르미트 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq13.png">의 고윳값이라고 하자. 그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq14.png"> </p>

인 고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq15.png">가 존재한다고 할 수 있는 것이다. 그러면 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq16.png">에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq17.png"> 벡터를 한번 더 내적해보자. 내적 연산을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq18.png">이라고 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq19.png"> </p>

과 같이 쓸 수 있다. 여기서 고윳값, 고유벡터의 정의에 의해 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq20.png"> </p>이므로 위 식의 가장 왼쪽에 있는 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq21.png"> </p>

이고,

위 식의 가장 오른쪽에 있는 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq22.png"> </p>

이다. 한편, 고유벡터는 0벡터가 아니므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq23.png">는 0이 아니다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq24.png"> </p>

이므로 항상 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq25.png">는 실수이다.

### 3. 에르미트 행렬의 서로 다른 고윳값에 대응하는 고유벡터들은 서로 직교한다.

증명:

0 벡터가 아닌 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq26.png"> 차원 복소 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq27.png">가 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq28.png">의 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq29.png">에 대한 고유벡터라고 하자. 이제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq30.png">이라는 벡터에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq31.png"> 벡터를 내적해보자. 그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq32.png"> </p>

과 같이 쓸 수 있다.

이 때, 위 식의 가장 왼쪽에 있는 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq33.png"> </p>

이며, 가장 오른쪽에 있는 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq34.png"> </p>

이다.

두 식은 동일하므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq36.png"> </p>

이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq37.png">이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq38.png">이다.

따라서, 서로 다른 두 고윳값에 대응되는 두 고유벡터는 서로 직교한다.

(P.S.)[^0]

[^0]: 참고 사이트 https://math.stackexchange.com/questions/2797590/orthogonality-of-eigenvectors-of-a-hermitian-matrix

여기서 만약 에르미트 행렬의 두 교윳값이 같다고 했을 때는 어떻게 대처할 수 있을까?

두 고윳값이 같은 에르미트 행렬 중 하나는 단위 행렬이다.

아래와 같은 행렬을 생각해볼 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq39.png"> </p>

고윳값은 두 개가 모두 1인데 고유벡터는 어느 방향의 벡터여도 상관없다는 것을 알 수 있다. 이러한 내용을 일반화 하면 다음과 같이 생각할 수 있다.

만약, 두 고윳값이 같다고 하면 선형독립인 두 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq40.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq41.png">를 정하고 이 두 벡터가 생성하는 벡터 공간 안에 있는 벡터를 두 개 선택하면 된다.

다시 말해, 임의의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq42.png">에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq43.png"> </p>

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq44.png">와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq45.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq46.png">가 span하는 벡터 공간안에서 임의의 벡터 두 개를 선정할 수 있으며 꼭 직교해야 하는 것은 아니지만 직교하는 벡터 두 개를 선정할 수 있음을 알 수 있다.

# 고유벡터를 이용한 해(solution)의 표현

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq47.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq48.png"> 에르미트 행렬이라고 하고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq49.png"> </p>

와 같은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq50.png">개의 eigenvalue <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq51.png">와 eigenvector <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq52.png">를 생각해보자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq53.png"> 에르미트 행렬은 고윳값이 distinct 하다고 하면 서로 직교하는 고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq54.png">개를 갖는다.

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq55.png"> 차원 복소공간의 어떤 벡터라도 eigenvector의 선형결합으로 표현할 수 있게 된다.

그러므로 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq56.png"> </p> 문제를 풀고자 할 때 solution <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq57.png">는 다음과 같이 표현할 수도 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq58.png"> </p>

즉, 우리는 solution <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq59.png">를 고유벡터 이용해 표현할 수 있으며, 우리가 알아야 하는 것은 기저벡터를 얼마만큼 써먹을 것인지에 관한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq60.png"> 값이다. 

고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq61.png">와 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq62.png"> </p>의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq63.png"> 벡터는 모두 알고 있는 것이므로 다음과 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq64.png"> 값을 구할 수 있게 된다.

아래와 같은 수식에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq65.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq66.png">를 고유벡터를 이용해 표현해주면 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq67.png"> </p>

여기서 양변에 다시 고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq68.png">와 내적을 취해주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq69.png"> </p>

여기서 좌변에 있던 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq70.png">를 summation 안에 넣어줘서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq71.png"> </p>

와 같이 만들면 고윳값, 고유벡터의 정의에 의해 아래와 같이 식을 바꿔 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq72.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq73.png">는 에르미트 행렬이라고 하고 만약 모든 eigenvalue들이 distinct하다면 서로 다른 eigenvector들은 서로 직교이다.

따라서, 위 식의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq74.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq75.png">인 경우에만 1이고 아닌 경우에는 0이 된다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq76.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq77.png"> </p>

그러므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq78.png">는 다음과 같이 계산할 수 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq79.png"> </p>

그렇기 때문에, 일반적으로 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq80.png"> </p> 문제에 대한 솔루션은 eigenvector, eigenvalue를 이용해 다음과 같이 쓸 수도 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq81.png"> </p>

흥미로운 점은 이런 방식으로 솔루션을 얻으면 꼭 inverse를 구하지 않고도 해를 구할 수 있다는 점이다.

# 고유함수 전개

## 고윳값, 고유함수의 개념 소개

선형대수학에서 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq82.png"> </p> 문제를 풀 때 고유벡터를 기저로 solution <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq83.png">를 표현함으로써 solution을 구해냈다면 함수해석학에서도 마찬가지로 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq84.png"> </p> 문제를 풀 때 solution function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq85.png">를 고유함수를 기저로 표현함으로써 문제를 풀 수도 있다.

선형연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq86.png">에 대해 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq87.png">과 고유함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq88.png">의 개념을 생각해보자.

이전 [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서 보았던 것 처럼 행렬이 벡터를 입력받고 벡터를 출력해주는 함수로 작용하듯이,

어떤 함수를 입력받고 새로운 함수를 출력해주는 새로운 개념의 함수를 생각해볼 수 있다. 이 때, 이 입출력 함수간의 관계를 매개해주는 것이 선형 연산자라고 언급하였다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic4.png">
  <br>
  그림 1. 벡터와 행렬의 관계는 함수와 연산자의 관계로 개념이 확장된다.
</p>

한편, 선형대수학에서는 [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)를 정의했는데, 이 개념은 어떤 벡터에 행렬을 적용할 때 행렬을 통해 출력된 벡터가 입력된 벡터의 상수배이기만 한 벡터를 찾을 수 있다면 그 벡터가 고유벡터, 그 상수배된 상수값이 고윳값임을 말해준 것이었다.

이 개념을 확장시키면 선형 연산자도 고윳값, 고유함수의 개념을 생각할 수 있다는 것을 알 수 있다.

다시 말해 아래와 같은 관계를 가지는 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq89.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq90.png">을 생각해낼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq91.png"> </p>

위 식이 말해주는 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq92.png">이라는 선형연산자를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq93.png">이라는 함수에 적용해주면 그 특정 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq94.png">이라는 함수는 입력함수의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq95.png"> 배만큼만 변하게 만들어준다는 뜻이다.

## 직교하는 고유함수를 이용한 전개

이 포스팅의 초반부에서 eigenvector의 선형 결합을 이용해 해를 표현할 수 있었던 것 처럼 eigenfunction의 선형 결합을 이용해 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq96.png"> </p>의 해를 표현할 수 있다.

아래와 같은 미분방정식을 생각하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq97.png"> </p>

여기서 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq98.png">이 서로 직교하는 무한개의 고유함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq99.png">를 갖는다고 가정하자[^1]. 그리고 이 고유함수들의 크기(norm)는 모두 1이라고 가정하자.

[^1]: 우리는 앞서 Hermitian matrix의 고유벡터를 이용했다. 고윳값이 다른 Hermitian matrix의 고유벡터들은 서로 직교하는 성질이 있기 때문이다. 지금은 연산자가 Hermitian matrix와 관련이 있는지에 대해서는 직접적으로 다루지 않고, 연산자에 대응하는 eigenfunction들이 직교한다고 가정하고 eigenfunction expansion을 생각 해본다. Hermitian matrix와 연관된 연산자에 대해선 추후의 Sturm-Liouville 이론을 참고하자.

그러면 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq100.png"> </p>의 솔루션 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq101.png"> 는 고유함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq102.png">을 새로운 기저로하여 다음과 같이 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq103.png"> </p>

이를 고유함수 전개(eigenfunction expansion)이라고 한다.

한편, 구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq104.png">에서 정의된 두 함수 간의 내적 연산을 아래와 같이 정의하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq105.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq106.png">은 complex conjugate을 표시한 것이다.

그리고 함수의 크기(norm)은 내적을 이용해 다음과 같이 정의하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq107.png"> </p>

이제 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq108.png"> </p>라는 식을 다음과 같이 고유함수를 이용해 풀어 써보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq109.png"> </p>

그리고 위 식의 양변에 고유함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq110.png">을 내적해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq111.png"> </p>

연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq112.png">은 선형연산자이므로 아래와 같이 summation 안으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq113.png">을 넣어주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq114.png"> </p>

고윳값과 고유함수의 정의에 따라 다음과 같이 식을 바꿀 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq115.png"> </p>

여기서 모든 서로 다른 고유함수들은 직교한다고 하였으므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq116.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq117.png"> 같을 때만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq118.png">이 1이고 아닐 때는 모두 값이 0이 된다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq119.png"> </p>

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq120.png">를 고유함수 전개하기 위해 필요한 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq121.png">을 구하였다고 할 수 있다. 따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq122.png">에 대한 고유함수 전개는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq123.png"> </p>

## 예제 문제

아래와 같은 경계값 문제에 대해 고유함수 전개를 수행해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq124.png"> </p>

### 풀이

우리는 위 문제를 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq125.png"> </p>의 문제로 생각해본다면 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq126.png">은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq127.png"> </p>

과 같다는 것을 알 수 있다.

따라서, 이 연산자에 대한 고윳값 문제를 풀기 위해 다음과 같은 식을 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq128.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq129.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq130.png"> </p>

이 식은 일반적인 2계 상미분방정식이므로 솔루션은,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq131.png"> </p>

이다. 여기서 Boundary Condition을 적용해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq132.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq133.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq134.png"> </p>

여기서 중요한 부분은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq135.png">을 0으로 만들어버리면 솔루션이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq136.png">이 되어버리므로 trivial solution을 구하는 것이 된다. 따라서, trivial solution이 나오지 않도록 막기 위해선 고윳값을 다음과 같이 정해야 함을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq137.png"> </p>

따라서, 고유함수들은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq138.png"> </p>

가 된다. 그런데 이 고유함수들의 크기(norm)는 1이 아니기 때문에 정규화를 시켜줘서 크기가 1인 고유벡터들로 모두 수정하자.

각 고유함수들의 크기는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq139.png"> </p>

이다. 따라서, 정규화된 고유함수들은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq140.png"> </p>

과 같다. 

이 고유함수들은 직교한다는 것을 함수의 내적을 통해서 쉽게 확인할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq141.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq142.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq143.png"> </p>

그러므로 원래 문제의 조건을 만족하는 해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq144.png"> 는 아래와 같이 고유함수 전개해서 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq145.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq146.png"> </p>

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq147.png">이라고 하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq148.png">이라고 하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq149.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq150.png"> </p>

부분적분을 활용하면 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq151.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq152.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq153.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq154.png"> </p>

와 같다는 것이다.

이 미분방정식을 다시 쓰면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq155.png"> </p>

이고 경계조건은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq156.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq157.png">이다. 이 방정식의 해를 eigenfunction expansion이 아닌 일반적인 방법으로 직접 구해보면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq158.png"> </p>

임을 쉽게 알 수 있는데, 위의 eigenfunction expansion으로 구한 식을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-01-eigenfunction_expansions/eq159.png">이 1일 때부터 서서히 더해나가면 일반적인 방법으로 구한 해에 근사해 가는 것을 확인할 수 있다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-01-eigenfunction_expansion/pic2.mp4">
  </video>
  <br>
</p>
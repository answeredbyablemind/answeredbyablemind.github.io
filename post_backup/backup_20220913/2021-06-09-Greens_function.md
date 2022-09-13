---
title: 그린 함수를 이용한 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210609
tags: 미분방정식
---
※ 본 포스팅의 내용은 수학적인 엄밀성 보다는 그린 함수의 개념에 더 쉽게 다가가기 위해 작성한 것입니다. 혹시나 수학적으로 치명적인 오류가 있다면 꼭 조언 부탁드립니다.

# Prerequisites

그린 함수를 이용한 미분방정식의 해법을 이해하기 위해서는 다음의 내용에 대해 이해하고 오시는 것이 좋습니다.

* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)
* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

# 선형 연산자의 역행렬을 생각할 수 있을까?

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 알아보았고 미분 연산자의 관점에서 미분 방정식을 해석했다. 또, 선형 연산자란 선형대수학에서 공부한 행렬의 개념을 확장시킨 것으로, 함수를 입력 받으면 또 다른 함수를 출력해주는 것이라고 배웠다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic4.png">
  <br>
  그림 1. 연산자(operator)란 함수를 입력으로 받고 또 다른 함수를 출력해주는 함수이다. 이 개념은 선형대수학의 행렬을 확장시킨 개념이라고 볼 수 있다.
</p>

이번에는 그러면 역행렬에 대해 생각해보자.

역행렬은 아래와 같이 정의되는 행렬이다. 임의의 정사각 행렬(square matrix) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq1.png">와 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq3.png">에 대해 다음이 성립한다고 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq4.png"> </p>

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq5.png">라는 행렬이 역행렬을 가진다고 하면 역행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq6.png">는 다음과 같은 성질을 만족하는 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq7.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq8.png">는 단위 행렬이다.

우리는 보통 역행렬을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq9.png">라고들 많이 쓰지만 여기선 역행렬 또한 일종의 행렬임을 강조하고자 썼다.

연산자 이론을 처음 배울 때 강조했던 것 처럼 어떤 개념을 다른 필드로 확장시키기 위해선 의심해보고 또 의심해봐야 한다. 그리고 확장 시키고자 하는 개념의 본래적 의미가 무엇이었는지 수차례 고민해보아야 한다.

우리는 행렬곱과 역행렬의 의미를 다시 한번 생각해보자.

## 행렬곱과 역행렬의 의미

우리는 행렬 곱에 대해 다시 한번 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq10.png"> </p>라는 식을 보면 다음과 같은 일들이 일어나는 것임을 알 수 있다.

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq11.png">라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq12.png">의 첫번째 열에 적용되면 첫 번째 단위 기저벡터가 출력된다.
* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq13.png">라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq14.png">의 두번째 열에 적용되면 두 번째 단위 기저벡터가 출력된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq15.png"> </p>

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq16.png">라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq17.png">의 마지막 열에 적용되면 마지막 단위 기저벡터가 출력된다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic1.png">
  <br>
  그림 2. 행렬 곱셈 연산이 수행되는 두 행렬에 대해 두 번째 행렬이 앞선 행렬의 역행렬이 되려면 앞에 곱해지는 행렬이 뒤에 곱해지는 행렬의 각각의 열에 작용해 각 순번에 해당하는 단위 기저벡터를 출력해야 한다.
</p>

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 설명하였다.

그러니까, 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq18.png"> 라는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq19.png"> 행렬이 존재할 수 있다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq20.png"> 행렬은 열벡터를 쌓아 만든 개념으로 볼 수 있는 것이므로 함수해석학에서 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq21.png">에 대응하는 개념은 함수를 연속적으로 쌓아 만든 것으로 볼 수 있다.

다시 말해 원래의 독립변수가 아닌 또 다른 독립변수에 대응되는 함수들을 쭉 나열해둔 것이어야 한다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq22.png">은 선형연산자, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq23.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq24.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq25.png">에서 정의된 함수라고 생각해보자. 이 때, 다음이 성립한다고 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq26.png"> </p>

그리고 우리가 생각해낼 \'함수의 나열\'을 다음과 같은 기호로 써보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq27.png"> </p>

이런 기호로 새로운 함수 뭉치들을 써낸 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq28.png"> 역시 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq29.png">의 정의역에서 정의되는 새로운 독립변수로 쓴 것이고, 새로운 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq30.png">축을 따라 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq31.png">를 쌓아줄 것이기 때문이다.

그러면 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq32.png">이라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq33.png">를 따라가면서 적용될 때 다음과 같은 일이 일어나야 역행렬이 해주는 일과 유사한 일을 적용시킨다는 것을 알 수 있다.

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq34.png">이라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq35.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq36.png">의 첫 번째 값(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq37.png">)에 대응되는 함수에 적용되면 첫 번째 단위 기저벡터에 대응되는 함수가 출력된다.
* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq38.png">이라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq39.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq40.png">의 두 번째 값(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq41.png">의 바로 옆 값)에 대응되는 함수에 적용되면 두 번째 단위 기저벡터에 대응되는 함수가 출력된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq42.png"> </p>

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq43.png">이라는 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq44.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq45.png">의 마지막 값(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq46.png">)에 대응되는 함수에 적용되면 마지막 단위 기저벡터에 대응되는 함수가 출력된다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic2.png">
  <br>
  그림 3. 어떤 선형 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq47.png">에 대해 역행렬에 대응되는 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq48.png"> 를 얻으려면 연산자가 각 순번 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq49.png">에 대응하는 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq50.png">에 적용되었을 때 단위 기저벡터에 대응하는 함수를 출력해줄 수 있어야 한다.
</p>

그렇다면 우리는 단위 기저 벡터에 대응되는 함수의 개념을 생각해보아야 한다. 이 개념은 디랙 델타 함수라는 개념에서부터 찾을 수 있다.

# 단위 기저 함수?

## 디랙 델타 함수의 motivation

우리는 단위 기저 벡터에 대해 생각해보기 위해 먼저 단위 기저 벡터라는 것이 어떤 것이었는지 알아보고 이 개념을 함수 공간에 확장시켜보도록 하자.

가장 간단한 단위 기저 벡터는 보통 표준 기저(standard basis)라고 부르는 것들이다. 2차원 벡터 공간에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq51.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq52.png">라고 단위 기저 벡터를 부르며 각각은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq53.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq54.png"> </p>

이다.

여기서 기저 벡터의 기능은 무엇이라고 할 수 있을까? 그것은 임의의 벡터를 기저벡터의 선형결합으로 표현하는데 있다.

가령, 임의의 벡터

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq55.png"> </p>

는 다음과 같이 위의 두 기저벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq56.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq57.png">의 선형결합으로 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq58.png"> </p>

그러다보니 다음과 같이 임의의 벡터를 기저 벡터와 내적해주면 기저벡터가 가지고 있는 성분량이 나오게 되는 것이다.

가령, 임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq59.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq60.png"> 기저벡터와의 내적은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq61.png">라는 값을 뽑아준다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq62.png"> </p>

그리고 벡터는 숫자들의 나열이라고도 볼 수 있다. 그래서 더 많은 숫자를 나열해볼 수도 있다.

가령, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq63.png">라는 5차원 벡터에 대해 기저벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq64.png">과 내적해줌으로써 이 기저벡터가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq65.png">라는 벡터를 표현할 때 담당하는 성분량을 알 수 있게 되는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq66.png"> </p>

마찬가지 방식으로 우리도 함수의 특정 위치의 값을 뽑아오기 위해서는 내적을 해주기 위한 기저 벡터와 유사한 함수를 생각해야 한다.

함수의 내적은 구간이 적절하게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq67.png">와 같이 정해졌을 때 아래와 같이 정의되었다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq68.png">에서 정의된 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq69.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq70.png">에 대해

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq71.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq72.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq73.png">의 complex conjugate 이다.

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq74.png">라면 다음과 같이도 써줄 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq75.png"> </p>

즉, 함수의 내적은 적분으로 정의되므로 적분을 이용해 함수값을 뽑아내주기 위해 아래와 같은 함수를 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq76.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq77.png">은 아주 작은 크기의 실수(real number)이다.

이 함수는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq78.png">이므로 아래와 같은 적분으로 함수의 내적을 이용할 수 있을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq79.png"> </p>

이 함수는 모든 정의역 구간에서 적분했을 때 넓이는 1이므로 값을 얻고자 하는 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq80.png">와 적분하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq81.png"> 근처의 값을 얻어올 수 있게 된다.

다시 말해 다음과 같은 내적을 생각할 수 있다는 의미이다. 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq82.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq83.png"> 인 경우를 상정한다면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq84.png"> </p>

이라는 것이다.

## 디랙 델타 함수의 출현

그런데, 문제는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq85.png">는 적절한 너비 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq86.png"> 만큼에 대해 정의되어 있으므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq87.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq88.png">의 적분으로는 실제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq89.png"> 값을 얻기 어려울 것이다. 따라서 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq90.png">을 매우 작게 만들면 더 정확히 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq91.png">의 값을 위 식과 같은 내적을 통해서 얻을 수 있다는 것을 예상할 수 있다. 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq92.png">을 작게 만들어줄 때 다음과 같은 일이 일어날 것임을 알 수 있다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic6.mp4">
  </video>
  <br>
  그림 4. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq93.png">이 작아지면서 바뀌어가는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq94.png">의 형태
</p>

따라서, 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq95.png">이 작아질 수록 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq96.png">가 아래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq97.png">와 같은 모습을 띄게 된다는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq98.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq99.png"> </p>

즉, 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq100.png">을 매우 작게 만들어줌으로써 다음과 같은 관계를 얻어낼 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq101.png"> </p>

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic7.mp4">
  </video>
  <br>
  그림 5. 디랙 델타함수와의 내적을 통해 함수의 특정 값을 얻어낼 수 있다.
</p>

또, 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq102.png"> 외의 다른 위치 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq103.png">에서의 함수값을 얻고 싶다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq104.png">를 평행이동 시켜 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq105.png">과 적분해주면 될 것이다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq106.png">가 구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq107.png"> 사이에 위치한다고 가정했을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq108.png"> </p>

와 같다.

여기서도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq109.png">을 매우 작게 만들어주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq110.png"> </p>

와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq111.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq112.png">라는 입력에 해당하는 원소의 값을 얻어낼 수 있게 되는 것이다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic8.mp4">
  </video>
  <br>
  그림 6. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq113.png">이 아닌 임의의 위치의 함수값을 얻고 싶다면 디랙 델타 함수를 옮겨 계산하면 된다.
</p>

결국 디랙 델타 함수는 단위 기저벡터에 대응하는 함수라고 볼 수 있다 [^2].

# 미분 연산자의 inverse = 그린 함수

## 그린 함수의 정의

앞서 고민하던 기저벡터의 개념을 디랙 델타함수를 통해 확장시킬 수 있다는 것을 알았으니 이제는 역행렬에 대응되는 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq114.png"> 를 제대로 정의할 수 있게 되었다. 이 역행렬에 해당되는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq115.png"> 는 그린 함수(Green function)라는 이름이 붙어있는데 조금 자세하게 보면 그린 함수의 정의는 다음과 같다.

구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq116.png"> 및 적절한 경계 조건에서 정의된 선형연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq117.png">과 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq118.png">에 대해서 다음이 성립한다고 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq119.png"> </p>

여기서 경계조건은 다음과 같은 것일 수 있다[^3].

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq120.png"> </p>

이 때 그린 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq121.png">는 다음과 같은 조건을 만족하는 함수이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq122.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq123.png">는 디랙 델타 함수이다. 또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq124.png"> 역시 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq125.png">와 같이 정의된 변수이다.

이렇게 보면 위 식이 바로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq126.png"> </p>

와 같은 꼴임을 생각할 수 있다.

즉, 대략적인 표기로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq127.png"> </p>

이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq128.png"> </p>가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq129.png">의 inverse가 될 수 있는지 다시 한번 확인해보기 위해 위 식에서 양변에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq130.png">를 곱하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq131.png">에 대해 적분해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq132.png"> </p>

여기서 그린 함수의 정의에 의해 다음과 같이 바꿔 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq133.png"> </p>

여기서 디랙 델타 함수의 sifting property에 따라 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq134.png"> </p>

한편, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq135.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq136.png">에만 작용하는 선형 연산자이므로 적분 밖으로 뺄 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq137.png"> </p>

따라서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq138.png"> </p>

와 같이 미분방정식의 해를 구할 수 있다는 것을 알 수 있다.

다시 말해, 그린 함수가 해를 구해내는 방식은 선형대수학에서 역행렬을 이용하는 방식과 유사하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq139.png"> </p>

라는 문제에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq140.png">로 표현되듯 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq141.png"> </p>

라는 함수해석학의 문제에 대해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq142.png">와 유사하게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq143.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq144.png">을 곱한 것의 적분으로 표현되는 것이다 (미분의 역연산이 적분이기 때문).

## 예시 문제 1.

그린 함수는 이론적으로만 보면 의미가 어느정도 와닿긴 하지만 실제로 어떻게 미분방정식의 해를 구하는데 사용되는지는 이해하기 어려울 수 있다. 이를 보완하기 위해 예시 문제를 풀어보면서 그린 함수의 의미에 대해 조금 더 생각해보도록 하자.

아래와 같은 미분방정식을 그린 함수를 이용해서 해를 구해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq145.png"> </p>

여기서 초기 조건을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq146.png">이라고 두고, 우리가 관심을 갖는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq147.png">의 범위는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq148.png">라고 생각하자.

### 예시 문제 1의 풀이

미분계수를 연산자로 생각하면 우리의 미분연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq149.png">은 다음과 같은 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq150.png"> </p>

그리고 그린 함수의 정의에 의해 다음과 같은 그린 함수를 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq151.png"> </p>

우선 디랙 델타 함수의 성질에 따라 다음과 같이 그린 함수의 형태를 상정할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq152.png"> </p>

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq153.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq154.png"> 및 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq155.png">인 구간에서는 미분연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq156.png">의 homogeneous solution을 통해 표현할 수 있게 되는 것이다. 한번 미분해서 0이 되는 경우는 상수함수에 해당한다. 즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq157.png"> <br> 식 (35) </p>

[//]:# (식 35)

라고 쓸 수 있다.

한편, 그린 함수의 정의를 생각해보면 다음과 같은 사실도 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq158.png"> </p>

(여기서 미분연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq159.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq160.png">로 바뀐 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq161.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq162.png"> 두 변수에 대한 함수이기 때문이다.)

다시 말해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq163.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq164.png">라는 점에서는 불연속적인 값을 갖는 함수일 것이라는 것이다. 거기에, 충분히 작은 양의 실수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq165.png">에 대해서 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq166.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq167.png"> </p>

이라는 사실을 알 수 있으므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq168.png"> 값을 기준으로 양 옆의 값이 1만큼 차이나는 함수의 형태를 띄고 있다는 것을 상상해볼 수 있다.

대략적인 그린 함수의 형태는 아래의 그림 7과 같을 것이다.

그림 7을 볼 때는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq169.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq170.png">의 값이 같을 때 discontinuity가 있다는 것에 주목해야하며 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq171.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq172.png">의 범위는 중요하지 않다. 또, discontinuity가 있는 곳의 함수값의 차이가 1이라는 것에 주목하도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic9.png">
  <br>
  그림 7. 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq173.png">이 1계 미분계수인 경우의 그린 함수의 대략적인 형태
</p>

여기서 초기값 조건을 이용하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq174.png"> </p>

이므로 식 (35)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq175.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq176.png">인 것을 알 수 있다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq177.png"> </p>

와 같이 그린 함수를 계산할 수 있다.

이 함수는 unit step function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq178.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq179.png">만큼 양의 방향으로 평행이동 시킨 것으로도 볼 수 있다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq180.png">는 다음과 같은 형태이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq181.png"> </p>

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic10.png">
  <br>
  그림 8. unit step function의 형태
</p>

그러므로 미분방정식의 솔루션은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq182.png"> </p>

이며, unit step function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq183.png">을 이용해서 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq184.png"> </p>

이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq185.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq186.png"> 관점에서 보면 unit step function을 좌우로 뒤집어 둔 뒤 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq187.png">만큼 양의 방향으로 이동한 것으로 파악할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic11.png">
  <br>
  그림 9. unit step function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq188.png">의 형태
</p>

따라서, 솔루션을 구하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq189.png"> </p>

이라는 사실을 알 수 있다.

## 예시 문제 2.

이번에는 2계 미분계수가 포함되는 미분방정식을 그린 함수를 이용해 풀어보자.

가령, 아래와 같은 미분방정식을 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq190.png"> </p>

여기서 경계조건은 다음과 같이 주어졌다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq191.png"> </p>

### 예시 문제 2의 풀이

우리에게 주어진 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq192.png">은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq193.png"> </p>

이므로, 그린 함수의 정의에 따라 다음과 같이 그린 함수를 생각할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq194.png"> </p>

예시 문제 1을 풀 때와 마찬가지로 디랙 델타 함수의 성질을 생각하면 다음과 같은 성질을 만족해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq195.png"> </p>

따라서,<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq196.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq197.png"> 및 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq198.png">인 구간에서 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq199.png">의 homogeneous equation을 이용해 표현할 수 있는 것이다.

두 번 미분해서 0이 되려면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq200.png"> </p>

가 되어야 함을 알 수 있고, 경계 조건에 따라,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq201.png"> </p>

이고

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq202.png"> </p>

임을 알 수 있다. 

또, 충분히 작은 양의 실수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq203.png">에 대해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq204.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq205.png"> </p>

임을 알 수 있다. 다시 말해 즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq206.png"> 근처에서의 미분계수는 1만큼 차이가 나게 된다.

또, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq207.png"> </p>

이다. 다시 말해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq208.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq209.png"> 근처에서 연속이다.

그 이유는 귀류법을 이용해 설명할 수 있는데, 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq210.png"> 가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq211.png"> 근처에서 불연속이었다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq212.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq213.png"> 근처에서 unit step function을 통해 모델링 할 수 있는것이 된다.  그런데, unit step function의 1차 미분이 delta function이고 2차 미분은 unit doublet이라고 함수이다. 그런데, 이미<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq214.png"> 의 2계 미분이 디랙 델타 함수라는 것을 토대로 생각해보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq215.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq216.png"> 근처에서 연속이어야 한다는 것을 알 수 있다.

따라서 위 조건들을 대입해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq217.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq218.png"> </p>

이다. 위 조건들을 조합하면 그린 함수는 다음과 같다는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq219.png"> </p>

와 같다.

그린 함수를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq220.png"> 인 경우에 대해 그려보면 다음과 같은 형태를 띈다는 것을 알 수 있는데,

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic12.png">
  <br>
  그림 10. 예시 문제 2의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq221.png">인 경우의 그린 함수
</p>

원래의 미분방정식 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq222.png">는 파동의 형태에 대한 미분방정식이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq223.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq224.png">인 것을 생각해보면 양 끝이 고정되어 있는 로프의 움직임과 관련된 모델을 보여주는 것이라 할 수 있다.

그리고, 그림 10과 같은 그린 함수의 형태가 말해주는 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq225.png">이라는 점에 힘이 주어지고 그 때의 로프의 변형이 어떻게 되는지를 나타내주는 것이라 할 수 있다.

이런 식의 설명이 가능한 이유는 다음의 식을 생각해보았을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq226.png"> </p>

[비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 보았던 것 처럼 비제차 항(여기서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq227.png">)은 자체적인 미분방정식 시스템(autonomous system)과는 관계없는 외부로부터 들어오는 forcing term 이기 때문이다.

다시 말해, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq228.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq229.png">일 때의 외부로부터의 충격에 가까운 입력이다. 따라서 그림 10에서 말하는 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq230.png">인 위치에 외부 충격이 가해지면 그 때의 로프의 상태는 그림 10의 것과 같다라고 해석할 수 있게 되는 것이다.

(여담으로, 이런 식으로 그린 함수를 해석하는 것을 신호/시스템 과목에서는 impulse response라고 부르기도 한다. 물론 Time Invariant 속성이 추가되어야 한다. 다시 말해, impulse response는 그린 함수의 특수 케이스라고도 볼수도 있다.)

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq231.png">라고 하면 솔루션은 다음과 같이 얻을 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq232.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq233.png"> </p>

## 예시 문제 3.

이번에는 2계 미분방정식의 형태가 조금 더 복잡해진 경우를 보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq234.png"> </p>

여기서 경계 조건은 다음과 같이 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq235.png"> </p>

### 예시 문제 3 풀이

예시 문제 2번의 풀이와 유사하게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq236.png"> 인경우와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq237.png"> 인 경우로 나눠 풀이할 수 있다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq238.png"> 인 경우에 대해, 미분 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq239.png">은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq240.png"> </p>

이므로, 이 경우의 그린 함수는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq241.png"> </p>

이다.

따라서, 그린 함수는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq242.png"> </p>

인데, 경계 조건 중 첫번째 조건을 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq243.png"> </p>

임을 알 수 있다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq244.png">인 경우에 대해서는 마찬가지 미분연산자를 이용하되 경계 조건 중 두번째를 대입하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq245.png"> </p>

임을 알 수 있다.

그린 함수의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq246.png"> 근처에서의 연속 조건과 미분 계수의 차이가 1이라는 조건을 만족시킬 수 있는 그린 함수를 찾으면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq247.png"> </p>

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq248.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq249.png">인 경우라고 하면 그린 함수의 형태는 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic13.png">
  <br>
  그림 11. 예시 문제 3의 그린 함수
</p>

마찬가지 방법으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq250.png">가 정해지면 그린 함수와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq251.png">의 적분을 통해 솔루션 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq252.png">를 구할 수 있게 된다.

# 참고 문헌

* [Advanced Differential Equations: Asymptotics & Perturbations, J. Nathan Kutz, University of Washington](https://arxiv.org/pdf/2012.14591.pdf)
* [Green\'s function, Wolfram Alpha](https://mathworld.wolfram.com/GreensFunction.html)
* [StackEschange: Green function Impulse response confusion](https://math.stackexchange.com/questions/2432092/greens-function-impulse-response-confusion)
* [Brilliant: Green\'s Funcions in Physics](https://brilliant.org/wiki/greens-functions-in-physics/)
* [Green\'s functions for ODEs, David Skinner, University of Cambridge](http://www.damtp.cam.ac.uk/user/dbs26/1Bmethods.html)
* [Wikipedia: Green function](https://en.wikipedia.org/wiki/Green%27s_function)

[^2]: 엄밀하게는 distribution theory를 들먹여야하고, functional의 개념에 대해 들먹여야 한다. 하고 싶은 말은 많지만 필자의 역할은 교과서 집필이 아니라 큰 그림 이해로의 안내라고 생각하기 때문에 디랙 델타 함수에 대한 자세한 내용은 생략하고자 한다. 자세한 내용은 분포 이론에 대한 교과서를 참고해보자.
    
[^3]: 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq253.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-09-Greens_function/eq254.png"> 과 같은 또 다른 homogeneous 경계 조건의 경우의 수도 있다.
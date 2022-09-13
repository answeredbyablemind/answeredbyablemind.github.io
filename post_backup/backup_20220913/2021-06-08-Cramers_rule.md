---
title: 크래머 공식의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210608
tags: 선형대수학
---

# 행렬식의 성질

크래머 공식을 잘 이해하기 위해선 아래의 몇 가지 행렬식의 성질을 잘 이해하고 하면 좋다.

* 행렬식은 각 열벡터로 구성된 평행사변형의 넓이와 같은 의미를 갖는다.

가령 임의의 행렬

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq1.png"> </p>

에 대해 각 열들을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq3.png">라고 한다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq4.png">는 아래의 평행사변형의 넓이와 같다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-06_determinant/pic2.png">
  <br>
  그림 1. 행렬식의 값은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq5.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq6.png"> 벡터로 구성된 평행사변형의 넓이와 같다.
</p>

따라서, 평행사변형을 구성하는 벡터가 평행이라면 이 평행사변형의 넓이는 무조건 0이 된다.

다른 말로는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq7.png">의 열벡터가 모두 선형독립이 아니라면 평행사변형의 넓이는 0이 되고 역행렬을 가지지 않는 행렬이 된다.

* 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq8.png">의 하나의 열이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq9.png">배 되면 행렬식의 값도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq10.png">배 된다.

다시 말해 행렬식은 아래와 같은 성질을 만족한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq11.png"> </p>

이것은 그림 1에서 평행사변형의 변 중 하나가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq12.png">배 된 경우를 상상해보면 이해하기 쉽다.

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq13.png"> 등이 열벡터이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq14.png">는 스칼라라고 하자. 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq15.png">를 이용해 열벡터를 묶은 행렬을 표현할 때, 행렬식은 아래와 같은 결과를 만족한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq16.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq17.png"> </p>

# 크래머 공식

크래머 공식은 아래와 같은 방정식의 해를 얻을 때 사용할 수 있는 공식이다.

임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq18.png"> 사이즈의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq19.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq20.png"> 사이즈의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq21.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq22.png">라고 할 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq23.png"> </p>

가 성립할 때, 솔루션 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq24.png">의 각 원소 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq25.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq26.png"> </p>

와 같이 정해진다는 공식이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq27.png">는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq28.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq29.png">번째 열을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq30.png"> 벡터로 치환한 행렬이다.

다시 말해 아래와 같은 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq31.png"> </p>라는 식에서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq32.png"> </p>

벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq33.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq34.png">번째 원소 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq35.png">는 다음과 같이 정해진다는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq36.png"> </p>

## 공식의 증명

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq37.png">는 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq38.png"> 개의 열벡터를 양 옆으로 쌓아둔 것과 같다고 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq39.png"> </p>

그리고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq40.png"> 행렬의 열 notation을 이용해 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq41.png"> </p>는 다음과 같이도 쓸 수 있다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq42.png">의 각 열을 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq43.png"> </p>

이라 하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq44.png">의 각 원소를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq45.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq46.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq47.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq48.png">이라 할 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq49.png"> </p>

과 같이 쓸 수 있는 것이다.

---


<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq50.png"> 번째 열을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq51.png"> 벡터로 대체한 행렬을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq52.png">라고 부르자. 다시 말해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq53.png"> </p>

와 같은 행렬을 생각하는 것이며 이 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq54.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq55.png">번째 열에 대입된 것이다.

이것을 표기의 편리함을 위해 아래와 같이 줄여서 쓰도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq56.png"> </p>

이 표기 역시 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq57.png">번째 열에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq58.png">벡터가 대입된 것이다.

그럼 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq59.png">의 행렬식을 계산해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq60.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq61.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq62.png">과 같으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq63.png"> </p>

행렬식의 성질에 의해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq64.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq65.png"> </p>

행렬을 이루는 열벡터 중 선형독립이 아닌 열벡터가 존재하는 경우 행렬식의 값은 0이다.

따라서, 위 식은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq66.png">인 경우에만 0이 아니고 나머지 경우는 모두 0이 된다.

그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq67.png"> </p>

그런데 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq68.png"> 행렬은 기존의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq69.png"> 행렬과 동일하므로 위 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq70.png"> </p>

이다.

따라서, 원래의 식과 비교해보면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq71.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq72.png"> </p>

임을 알 수 있다.

# 기하학적 의미

## Prerequisites

크래머 공식의 기하학적 의미를 알기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행렬식의 기하학적 의미](https://angeloyeo.github.io/2019/08/06/determinant.html)
* 평행사변형의 넓이 = 밑변 x 높이

## 기하학적 해석

크래머 공식의 기하학적 의미는 행렬식이 두 벡터가 이루는 평행사변형의 넓이와 같다는 점과 평행사변형의 넓이는 밑변 x 높이로 계산할 수 있다는 사실 두 가지만으로 기하학적 의미를 해석할 수 있다.

아래와 같은 아주 간단한 행렬, 벡터의 곱을 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq73.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq74.png"> </p>

[행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html) 편에서 열공간을 기반한 해석 파트를 보면 위의 행렬과 벡터의 곱은 다음과 같이도 쓸 수 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq75.png"> </p>

이것을 그림으로 표현하면 다음과 같다고 할 수 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-08-Cramers_rule/pic1.png">
  <br>
  그림 1. 식 (18)의 행렬 벡터 곱을 그림으로 표현한 것
</p>

이 때, 우리는 세 개의 평행사변형을 관찰해보도록 하자.

첫 번째는 식 (16)의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq76.png">의 각 열 벡터를 두 변으로 하는 평행사변형이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-08-Cramers_rule/pic2.png">
  <br>
  그림 2. 식 (16)의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq77.png">의 열벡터로 구성되는 평행사변형
</p>

이 평행사변형의 넓이는 [행렬식의 기하학적 의미](https://angeloyeo.github.io/2019/08/06/determinant.html) 편에서 보았던 것 처럼 행렬식의 값으로 표현할 수 있다.

두 번째 볼 평행사변형은 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq78.png">에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq79.png">를 곱한 벡터와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq80.png">의 두 열벡터로 구성되는 평행사변형이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-08-Cramers_rule/pic3.png">
  <br>
  그림 3. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq81.png">에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq82.png">를 곱한 벡터와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq83.png">의 두 열벡터로 구성되는 평행사변형
</p>

이 평행사변형의 넓이를 계산해보면 다음과 같다는 것을 쉽게 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq84.png"> </p>

그림 3에서 관찰하는 이 평행사변형은 그림 2에서 보았던 평행사변형의 넓이에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq85.png">배 만큼 커진 것으로 볼 수 있다.

혹은 위 식에서 행렬식의 특성에 의해 다음과 같이 쓸 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq86.png"> </p>

한편, 세 번째로 관찰해볼 평행사변형은 아래의 그림 4와 같다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-08-Cramers_rule/pic4.png">
  <br>
  그림 4. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq87.png"> 벡터와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq88.png"> 벡터로 구성된 평행사변형
</p>

그림 4의 평행사변형의 넓이는 행렬식을 이용해 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq89.png"> </p>

그런데 재밌는 점은 그림 3의 평행사변형과 그림 4의 평행사변형의 넓이는 같다. 왜냐면 밑변의 길이는 변화가 없고, 두 평행사변형의 높이도 같기 때문이다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq90.png"> </p>

와 같이 쓸 수 있으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq91.png"> </p>

와 같다는 것을 알 수 있다. 이것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-08-Cramers_rule/eq92.png">에 대해서도 같은 방법으로 확인할 수 있다.

그리고, 마지막으로 이 결과는 크래머 공식과 같다는 것을 알 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/DcBBKZyv-8M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
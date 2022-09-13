---
title: 의사역행렬의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201111
tags: 선형대수
---

※ 의사역행렬의 정확한 이름은 무어-펜로즈 유사역행렬인 것으로 보이나 일반적으로 많이 쓰는 이름인 의사역행렬(pseudo inverse)를 이용하도록 하겠습니다.

※ 의사역행렬은 복소수-체의 범위에서 정의가능하나 이번 post에서는 실수-체 범위에서 설명하도록 하겠습니다. (시각화 목적 및 계산의 헷갈림 방지)

※ 의사역행렬은 기본적으로 [선형회귀의 선형대수학적 접근](https://angeloyeo.github.io/2020/08/24/linear_regression.html#%EC%84%A0%ED%98%95%EB%8C%80%EC%88%98%ED%95%99%EC%9D%98-%EA%B4%80%EC%A0%90%EC%97%90%EC%84%9C-%EB%B3%B8-%ED%9A%8C%EA%B7%80%EB%B6%84%EC%84%9D)에서 본 내용과 완전히 같은 approach를 가지고 접근합니다.

# Prerequisites

해당 포스트를 이해하기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html): 특히, 쌍대공간의 개념
* [특이값 분해(SVD)](https://angeloyeo.github.io/2019/08/01/SVD.html)

# 의사역행렬의 정의

우선 가장 심플하게 의사역행렬의 정의부터 알아보도록 하자.

의사역행렬은 임의의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq1.png">에 대해서 

1) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq2.png">이고 모든 열벡터가 선형 독립인 경우

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq3.png"> <br> 식 (1) </p>

[//]:# (식 1)

이 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq4.png">는 가역행렬이어야 한다.

이 경우 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq5.png">가 성립하므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq6.png">는 좌측 역행렬(left inverse)이라고 부른다.

2) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq7.png">이고 모든 행벡터가 선형 독립인 경우

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq8.png"> <br> 식 (2) </p>

[//]:# (식 2)

이 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq9.png">는 가역행렬이어야 한다.

이 경우 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq10.png">가 성립하므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq11.png">는 우측 역행렬(right inverse)이라고 부른다.

위의 1)과 2)를 보았을 때 임의의 크기의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq12.png">에 대해 특정 조건만을 만족한다면 어떤 크기의 행렬이라도 [역행렬](https://angeloyeo.github.io/2019/08/06/determinant.html)의 기능과 유사한 기능을 하는 행렬을 구할 수 있다는 것을 알 수 있다.

보통 데이터를 분석할 때는 1)과 2) 중 1)의 경우에 더 많이 직면하게 된다. 그것은 1)의 상황이 데이터 수가 feature 수 보다 많은 상황을 나타내기 때문이다. 이번 포스트에서도 1)의 경우인 '좌측 역행렬'이 가지는 의미에 대해서 조금 더 깊게 탐구해보고자 한다.

# 의사역행렬의 수식적 의미

그렇다면, 의사역행렬이 가지는 근본적인 수식적 의미는 무엇일까?

가령, 다음과 같은 연립방정식이 주어졌다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq13.png">  <br> 식 (3)</p>

[//]:# (식 3)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq14.png"> <br> 식 (4) </p>

[//]:# (식 4)

기본적으로 의사역행렬이 하고자 하는 일은 임의의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq15.png">에 대해 적절한 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq16.png">을 얻음으로써 위의 주어진 문제를 해결하고자 하는 것이다.

식 (3)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq17.png">을 양변의 좌측에 곱해보자. 그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq18.png"> <br> 식 (5) </p>

[//]:# (식 5)

이며, 우리가 알고있는 식 (1)의 left inverse의 공식을 이용해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq19.png">을 계산해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq20.png"> <br> 식 (6) </p>

[//]:# (식 6)

이므로 식 (5)를 직접 계산해보면 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq21.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq22.png">의 값을 계산할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq23.png">  <br> 식 (7)</p>

[//]:# (식 7)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq24.png"> <br> 식 (8) </p>

[//]:# (식 8)

그런데, 여기서 이상한 점이 하나 있다.

이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq25.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq26.png">를 원래의 식에 대입해보면 식이 성립하지 않는다는 점이다.

다시 말해 식 (4)에 대해 식 (4)의 좌변 값을 계산해보면 아래와 같은데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq27.png"> <br> 식 (9) </p>

[//]:# (식 9)

식 (9)의 결과는 식 (4)의 우변과 같지 않다.

그렇다면, 왜 의사역행렬은 식 (1)과 같은 공식을 갖게 되었으며, 식 (9)의 결과가 식 (4)의 우변과 같지 않다는 것은 어떤 의미를 갖고 있을까?

# 의사역행렬의 기하학적 의미

중학교 시절 연립방정식에 대해 배운 적 있을 것이다.

연립방정식은 2개 이상의 미지수를 포함하는 방정식의 조를 말하는데, 보통 중, 고등학교 과정에서는 이원 일차 연립방정식을 푸는 경우가 많았던 것 같다.

보통의 연립 방정식의 꼴은 아래와 같이 쓸 수 있겠다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq28.png"> </p>

우리는 이번에 미지수의 개수보다 데이터가 훨씬 많은 경우에 대해 적절한 solution을 찾는 과정을 통해 의사역행렬에 대해 생각해보고자 한다.

가령, 다음과 같이 세 개의 데이터 포인트가 주어져 있다고 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq29.png"> </p>

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic1.png">
  <br>
  그림 1. 주어진 세 개의 데이터 포인트
</p>

만약 이 세 점에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq30.png">와 같은 모델을 통해 이 세 개의 데이터 포인트를 얻었다고 가정하면 아래와 같이 세 개의 방정식으로 구성된 연립방정식을 세울 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq33.png"> </p>

이것을 행렬과 벡터를 이용해 표시하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq34.png"> </p>

이 행렬을 푸는 문제를 기하학적인 관점에서 생각해보면 그림 1과 같이 세 개의 데이터 포인트가 주어졌을 때 이 데이터 포인트들을 모두 통과하는 직선을 구하는 문제와 같다. 

2차원 평면 상에 어떻게 선을 놓더라도 이 세 점을 동시에 통과하는 직선을 구할 수는 없다.

다시 말해, 이 문제는 풀릴 수 없다. 해가 존재하지 않기 때문이다.

## 선형대수학적으로 연립방정식을 보는 관점

선형대수학의 관점에서 연립방정식을 푼다는 것은 아래와 같은 행렬을 푸는 것과도 같이 생각할 수 있는데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq35.png"> </p>

여기서 벡터와 행렬을 모두 열벡터로 표현하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq36.png">의 두 요소를 나눠 쓰면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq37.png"> </p>

그러면, 위 식은 아래와 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq38.png"> </p>

즉, 열벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq39.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq40.png">를 어떻게 조합하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq41.png">를 얻어낼 것인가?라는 물음에 적절한 조합 비율인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq42.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq43.png">를 답변해주는 것과 같은 이야기인 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic2.png">
  <br>
  그림 2. A의 열(column)을 이루는 열벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq44.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq45.png">)의 생성공간(span)인 A의 열공간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq46.png">에 포함되어 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq47.png">를 구하려면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq48.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq49.png">를 얼마만큼 조합해주어야 할까?
</p>

하지만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq50.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq51.png">를 조합해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq52.png">를 얻을 수 있으려면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq53.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq54.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq55.png">를 조합해 얻을 수 있는 모든 경우의 수 중 하나여야 한다.

다시 말해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq56.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq57.png">의 생성공간(span) 안에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq58.png">가 포함되어 있어야 한다. 이것이 해를 찾을 수 있는 조건이다.

## 최적의 해를 찾기

꿩대신 닭이라고 했던가. 그림 1과 같은 문제에서 처럼 정확한 정답을 찾을 수 없다면 최대한 정답에 가까운 것이라도 찾아야 한다.

다시 말해 그래도 그나마 가장 세 점의 트렌드를 잘 표현해줄 수 있는 직선을 찾을 수는 있을 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic3.png">
  <br>
  그림 3. 그나마 세 점의 트렌드를 잘 설명해 줄 수 있을 것 같은 직선을 그어보자
</p>

여기서, 우리가 점 세 개의 트렌드를 잘 표현해주는 직선을 과정은 선형대수학적으로는 해(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq59.png">)가 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq60.png">의 열공간(column space)안에 존재하지 않는 경우 열 공간안에 있는 정답에 가장 가까운 해를 찾는 과정과 일치시켜 생각할 수 있다.

실제로 그림 1 혹은 그림 3의 문제에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq61.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq62.png">와 이 두 벡터로부터 생성되는 열공간, 그리고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq63.png">를 직접 그려보면 다음과 같다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic4.mp4">
  </video>
  <br>
  그림 4. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq64.png"> (파란색)와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq65.png"> (주황색) 두 벡터의 생성공간(span)으로 표현되는 열공간과 이 column space에 포함되지 않는 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq66.png"> (보라색)
</p>

그림 4에 있는 내용을 조금 더 추상적으로 그리면 아래의 그림 5와 같다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic5.png">
  <br>
  그림 5. A의 열(column)을 이루는 열벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq67.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq68.png">)의 span인 A의 열공간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq69.png">와 열공간에 포함되지 않는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq70.png">
</p>

그림 5에서 볼 수 있듯이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq71.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq72.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq73.png">의 열공간 안에 포함되어 있지 않다. 그리고 그림 5에서 확인할 수 있듯이 여기서 우리가 찾을 수 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq74.png">와 가장 가까우면서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq75.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq76.png">의 선형결합을 통해 얻을 수 있는 최적의 벡터는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq77.png">가 열공간(col(A))에 정사영된 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq78.png">이며 우리는 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq79.png">를 계산해줌으로써 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq80.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq81.png">를 얼마만큼 선형조합 해주어야 할지(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq82.png">)를 알 수 있게 된다.

그렇다면 원래의 해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq83.png">와 정사영 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq84.png">의 차이 벡터를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq85.png">라고 하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq86.png">는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq87.png">의 어떤 벡터와도 직교하므로 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq88.png"> </p>

여기서 '<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq89.png">'은 내적 연산이다.

즉, 내적을 계산해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq90.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq91.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq92.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq93.png"> </p>

이라는 것을 알 수 있다.

## 의사역행렬과의 연관성

우리가 지금까지 수행한 일은 무엇인가?

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq94.png">라는 방정식에서 적절한 term을 좌변에 곱해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq95.png">를 계산한 것이다.

즉, 여기서 찾아진 적절한 term을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq96.png">라 할 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq97.png">라는 사실을 알 수 있는 것이다.

다시 말해, 우리가 얻은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq98.png">라는 term이 바로 우리가 구하고자 하는 의사역행렬임을 알 수 있다.

또, 식 (9)에서 계산한 결과가 식 (4)의 우변과 같지 않다는 것은 어떤 의미를 갖고 있을까?

그것은 우리가 의사역행렬을 통해 얻은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq99.png">는 결코 원래 방정식인 식 (4)의 해는 아니지만, 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq100.png">를 통해 얻을 수 있는 것은 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq101.png">의 열공간 내에 있는 벡터 중 가장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq102.png">에 가까운 벡터를 찾기 위한 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq103.png">의 열벡터의 조합으로 볼 수 있다는 의미가 된다.

# SVD를 이용한 의사역행렬의 표현

임의의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq104.png">을 [특이값 분해](https://angeloyeo.github.io/2019/08/01/SVD.html)하면 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq105.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq106.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq107.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq108.png">의 크기를 가지는 행렬이며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq109.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq110.png">는 orthogonal matrix, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq111.png">는 diagonal matrix이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq112.png">는 singluar value <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq113.png">가 대각성분에 위치하는 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq114.png"> </p>

특히 orthogonal matrix의 성질은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq115.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq116.png"> </p>

또, diagonal matrix의 성질은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq117.png"> </p>

특이값 분해된 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq118.png">에 전치연산(transpose)을 취해주면 다음과 같이 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq119.png"> </p>

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq120.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq121.png"> </p>

이다.

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq122.png">의 역행렬을 계산해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq123.png"> </p>

이다.

위 식에서 식을 전개할 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq124.png">라는 orthogonal 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq125.png">의 특성을 이용하였다.

이제 식 (1)의 좌측역행렬을 계산해보면 다음과 같이 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq126.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq127.png"> 이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq128.png">이므로 SVD를 이용한 좌측역행렬은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq129.png"> </p>

이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq130.png">은 다음과 같은 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq131.png"> </p>

where

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-11-pseudo_inverse/eq132.png"> </p>
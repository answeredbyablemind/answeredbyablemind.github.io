---
title: 2계 선형 미분방정식의 해법 (1)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210527
tags: 미분방정식
---

# Prerequisitess

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)

# 2계 제차 선형 미분방정식

2계 선형 미분방정식이란 아래와 같이 미분계수의 최고 미분횟수가 2회인 미분방정식을 의미한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq1.png"> </p>

이번 시간에는 특별히 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq3.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq4.png">가 모두 상수이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq5.png">인 2계 제차 선형 미분방정식에 대해 다루고자 한다.

다시 말해 우리가 다루고자 하는 미분방정식의 꼴은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq6.png"> <br> 식 (2) </p>

[//]:# (식 2)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq7.png">는 0이 아니어야 한다.

# 선형 연립 미분방정식을 이용한 해법

우리는 사실 2계 제차 선형 미분방정식의 해법에 대해 다룬 적이 있다. 

[연립 미분방정식 모델링](https://angeloyeo.github.io/2021/05/11/modeling_with_systems.html) 편에서 damped harmonic oscillation을 다룰 때 이 해법을 언급한 적이 있다. 

2계 제차 선형 미분방정식의 해법은 1차 미분계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq8.png">를 새로운 변수로 놓고 풀어주는 것이 핵심이다.

식 (2)와 같은 2계 제차 선형 미분방정식에 대해서 우리는 다음과 같이 생각할 수 있다.

만약, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq9.png"> </p>

와 같은 새로운 변수를 생각한다면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq10.png"> </p>

이므로,

식 (2)는 다음과 같이 쓸 수도 있을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq11.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq12.png"> </p>

다시 한번 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq13.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq14.png">에 대한 연립 미분방정식으로 이 과정을 풀어서 생각하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq15.png"> </p>

그러므로 식 (2)의 2계 제차 선형 미분방정식은 다음과 같이 행렬의 꼴로 항상 나타낼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq16.png"> <br> 식 (8) </p>

[//]:# (식 8)

여러번 강조하는 것 같지만 식 (8)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq17.png">는 0이 아니어야 한다.

여기서 알 수 있게 되는 것은 식 (8)을 풀게 됨으로써 2계 제차 선형 미분방정식의 solution을 얻어낼 수 있다는 것이다.

## 선형 연립 미분방정식으로 해를 구하는 것의 의미

선형 연립 미분방정식으로 만들어 2계 제차 미분방정식의 해를 구할 수 있다는 것은 [위상 평면](https://angeloyeo.github.io/2021/05/12/phase_plane.html)편 에서 보았던 것 처럼 식 (8)에 있는 행렬의 고윳값, 고유벡터를 이용하는 것이 solution을 구하는 연결고리가 된다는 점을 시사하기도 한다.

우리는 식 (8)에 들어있는 행렬의 고윳값, 고유벡터를 구해 연립 미분방정식의 솔루션을 구해보도록 하자.

식 (8)에 들어있는 행렬에 대한 특성방정식을 구해보면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq18.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq19.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq20.png"> </p>

여기서 2차 방정식의 근의 공식을 이용해 특성방정식의 해를 구하면 다음과 같음을 알 수 있다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq21.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq22.png"> </p>

그리고 고유벡터를 구하면 다음과 같음을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq23.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq24.png"> </p>

따라서, 연립 미분방정식의 일반해 공식에 따라 솔루션을 써보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq25.png"> </p>

이다. 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq26.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq27.png">는 임의의 상수이며 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq28.png">는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq29.png"> </p>

이다.

우리는 2계 미분방정식을 풀 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq30.png">로 놓고 풀기 때문에 식 (16)의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq31.png"> 부분 만을 얻어오면 그것이 2계 미분방정식의 solution이 되는 것이다.

그러므로 2계 제차 선형미분방정식의 솔루션 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq32.png">는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq33.png"> </p>

## 예시 문제

이론 설명만으로는 이해하기 어려울 수도 있으니 2계 제차 미분방정식 예시 문제를 직접 풀어보도록 하자.

아주 간단한 예시로 문제 풀이를 해보자. 아래의 2계 제차 미분 방정식의 해를 구해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq34.png"> <br> 식 (19) </p>

[//]:# (식 19)

우리는 이 문제를 풀기 위해 2계 미분방정식을 연립 미분방정식으로 바꿔보자.

그러기 위해 다음과 같은 새로운 변수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq35.png">를 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq36.png"> </p>

그러면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq37.png"> </p>

과 같은 관계를 얻을 수 있다.

따라서, 우리는 아래와 같은 연립 미분방정식을 도출할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq38.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq39.png"> <br> 식 (23) </p>

[//]:# (식 23)

이제 우리는 식 (23)에 있는 행렬의 고윳값과 고유벡터를 얻어보도록 하자. 

고윳값, 고유벡터의 정의에 따라, 고유벡터가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq40.png">라고 하고 고윳값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq41.png">라고 했을 때 다음 식을 만족해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq42.png"> </p>

모든 항을 왼쪽으로 이항하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq43.png"> <br> 식 (25) </p>

[//]:# (식 25)

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq44.png">가 영벡터가 되지 않기 위해선 식 (25)의 행렬이 역행렬을 가지면 안되기 때문에 아래의 조건을 만족해야 한다. (이것을 특성방정식이라고도 부른다.)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq45.png"> <br> 식 (26) </p>

[//]:# (식 26)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq46.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq47.png"> </p>

따라서, 고윳값은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq48.png"> </p>

이다.

각 고윳값에 해당하는 고유벡터를 찾아보면, 식 (25)로부터

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq49.png">인 경우,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq50.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq51.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq52.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq53.png"> </p>

또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq54.png">인 경우,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq55.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq56.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq57.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq58.png"> </p>

따라서, 식 (23)의 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq59.png"> </p>

이다.

그러므로, 식 (19)의 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-27-second_order_ODE/eq60.png"> </p>

이다.

참고로 식 (23)에 대한 위상평면을 그려보면 다음과 같다. 굵은 검은색 선은 고유벡터를 따라가는 직선이다.

<p align = "center">
  <img src=  "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-27-second_order_ODE/pic1.png">
  <br>
  그림 2. 식 (23)의 연립 미분방정식에 관한 위상 평면. 굵은 검은색 선은 고유벡터를 따라가는 직선임.
</p>


<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/g5nMlMlkL2I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/csz_oo7psbU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>
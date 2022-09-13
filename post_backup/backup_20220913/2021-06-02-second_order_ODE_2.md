---
title: 2계 선형 미분방정식의 해법 (2)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210602
tags: 미분방정식
---

# Prerequisites

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [2계 선형 미분방정식의 해법 (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html)
* [미분방정식을 이용한 오일러 공식 유도](https://angeloyeo.github.io/2020/09/22/Euler_Formula_Differential_Equation.html)

# 2계 제차 선형 미분방정식

2계 선형 미분방정식이란 아래와 같이 미분계수의 최고 미분횟수가 2회인 미분방정식을 의미한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

이번 시간에는 특별히 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq3.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq4.png">가 모두 상수이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq5.png">인 2계 제차 선형 미분방정식에 대해 다루고자 한다.

다시 말해 우리가 다루고자 하는 미분방정식의 꼴은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq6.png"> <br> 식 (2) </p>

[//]:# (식 2)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq7.png">는 0이 아니어야 한다.

# 대입 방법을 이용한 해법

앞서 [2계 선형 미분방정식의 해법 (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html) 편에서는 2계 제차 선형 미분방정식의 해를 구할 때 연립방정식의 형태로 방정식을 수정하여 솔루션을 구할 수 있다는 것에 대해 알아보았다.

그 때 핵심적이었던 것은 고윳값과 고유벡터에 관한 것이었다는 것을 기억해보자.

잠깐 복습하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq8.png">로 대입하면 식 (2)와 같은 2계 미분방정식을 연립 미분방정식의 꼴로 쓰면 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq9.png"> </p>

그리고 위 식에 들어있는 행렬의 특성방정식을 구하면 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq10.png"> <br> 식 (4) </p>

[//]:# (식 4)

그리고 이 특성방정식을 통해 고윳값을 구하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq11.png"> </p>

였으며, 고유벡터는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq12.png"> </p>

라는 것을 알 수 있었다.

그리고 위의 연립 미분방정식의 솔루션인,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq13.png"> </p>

중에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq14.png">만 떼서 얻어내면 된다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq15.png"> </p>

와 같은 솔루션을 얻어낼 수 있음을 알 수 있다. 그러므로, 2계 선형미분방정식의 해를 얻어낼 때 가장 중요한 부분은 고윳값이라는 것을 알 수 있다.

우리는 2계 선형 미분방정식의 해를 구하기 위한 조금 더 쉬운 방법으로 대입 방법을 이용해보자.

대입 방법을 이용한 해법은 일반적으로 교과서에서 많이 소개되고 있는 해법으로 미분방정식의 해를 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq16.png"> </p>

와 같이 상정하여 풀이를 진행해 나가는 것이다.

따라서 식 (1)과 같은 선형 제차 2계 미분방정식에 대해 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq17.png"> </p>라고 하면 다음이 성립할 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq18.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq19.png">로 식을 묶어내면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq20.png"> </p>

이 되고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq21.png">는 항상 양수이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq22.png"> <br> 식 (12) </p>

[//]:# (식 12)

이 되어야 한다. 즉, 대입법을 이용하면 우리가 식 (4)와 동일한 특성방정식을 얻을 수 있다는 것을 알 수 있다.

따라서, 이 방정식의 근을 구하면 우리는 고윳값에 해당되던 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq23.png">가 어떤 것인지 알 수 있게 된다.

참고로 식 (12)와 같은 방정식을 우리는 \'보조 방정식(auxiliary equation)\'이라고 부른다.

그리고, 2차 방정식의 근은 두 개이기 때문에 두 개의 고윳값을 알게되면 아래와 같이 두 개의 solution을 얻게 되는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq24.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq25.png"> </p>

## 중복되지 않는 실수 고윳값을 갖는 경우

우리는 식 (9)와 같은 대입법을 이용해 2계 제차 상미분 방정식의 해를 구할 수 있는 방법을 생각해보았다.

이 때, 해는 결론적으로 식 (12)와 같은 2차 방정식으로부터 얻는 고윳값을 통해 결정된다.

그럼 우리는 쉽게 2차 방정식의 해가 실수인 경우와 복소수인 경우로 나눠질 수 있다는 것을 알 수 있다. 근의 공식에 따르면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq26.png"> </p>

이며, 다시 말해 식 (2)의 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq27.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq28.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq29.png"> 간의 관계가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq30.png">인 경우 실수 고윳값을 갖는다는 것을 알 수 있다.

### 예시 문제

다음 초기값 문제를 해결하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq31.png"> </p>

---

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq32.png">로 가정하고 보조 방정식을 얻으면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq33.png"> </p>

이다.

그리고, 이 보조 방정식의 근을 구해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq34.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq35.png"> </p>

따라서, 이 초기값 문제의 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq36.png"> </p>

이다[^1].

[^1]: 왜 상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq37.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq38.png">를 곱하냐고 묻는 질문이 많다. 그 이유는 방향장 혹은 위상 평면 편에서 보았던 것 처럼 초기값에 의해 결정되기 전에는 무수히 많은 가능한 솔루션이 존재하기 때문이다. 

여기서 초기 조건을 이용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq39.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq41.png"> </p>

따라서, 솔루션은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq42.png"> </p>

이다.

## 복소수 고윳값을 갖는 경우

식 (2)의 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq43.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq44.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq45.png"> 간의 관계가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq46.png">인 경우 복소수 고윳값을 갖는다는 것을 알 수 있다.

### 예시 문제

다음 초기값 문제를 해결하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq47.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq48.png">로 가정하고 보조 방정식을 얻으면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq49.png"> </p>

이다.

따라서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq50.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq51.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq52.png"> </p>

이다.

따라서, 방정식의 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq53.png"> </p>

여기부터는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq54.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq55.png">와 같이 쓰도록 하자. (지수 승이 잘 안 보임)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq56.png"> </p>

오일러 공식

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq57.png"> </p>

에 의해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq58.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq59.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq60.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq61.png">를 각각 새로운 상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq62.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq63.png">로 치환하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq64.png"> </p>

가 된다.

여기서 초기 조건을 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq65.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq66.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq67.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq68.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq69.png"> </p>

따라서, 이 미분방정식의 해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq70.png"> </p>

이다.

## 중근을 갖는 경우

식 (2)의 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq71.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq72.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq73.png"> 간의 관계가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq74.png">인 경우 중근 고윳값을 갖는다는 것을 알 수 있다.

이 경우는 해법이 조금 독특한데, 보조방정식의 해가 되는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq75.png">를 이용해 하나의 해를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq76.png">로 설정하고 또 다른 해는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq77.png">라고 설정하여 문제를 푼다.

이렇게 설정할 수 있는 이유에 대해서는 다른 포스팅에서 자세히 소개할 것이다. 관련 내용은 [reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html)라고 부르는 테크닉이다.

### 예시 문제

아래의 초기값 문제를 해결하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq78.png"> </p>


이 미분방정식의 보조 방정식을 구하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq79.png"> </p>

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq80.png">(중근)이다.

그러므로 우리는 다음과 같이 일반해를 생각할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq81.png"> </p>

초기값을 이용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq82.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq83.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq84.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq85.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-02-second_order_ODE_2/eq86.png"> </p>
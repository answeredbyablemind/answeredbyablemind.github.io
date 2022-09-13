---
title: 매개변수 변환법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210605
tags: 미분방정식
---

# Prerequisites

이 포스팅을 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html)
* [론스키안(Wronskian)](https://angeloyeo.github.io/2019/10/10/Wronskian.html)
* [크래머 공식(Cramer\'s Rule)](https://angeloyeo.github.io/2021/06/08/Cramers_rule.html)
* [미정계수법](https://angeloyeo.github.io/2021/06/04/undetermined_coefficients.html)

# 매개변수 변환법 소개

매개변수 변환법은 비제차 미분방정식을 풀이하기 위해 고안된 방법이다.

미정계수법은 비제차 항이 다항 함수, 코사인, 사인함수, 지수함수인 경우에만 적용할 수 있었지만 매개변수 변환법은 그 활용도가 더 넓다고 할 수 있다.

아래와 같은 2계 비제차 미분방정식을 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

위와 같은 2계 비제차 미분방정식의 해는 다음과 같은데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq2.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq3.png">의 기저 함수는 두 개이므로 조금 더 풀어쓰면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq4.png"> </p>

여기서 매개변수 변환법의 아이디어는 [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html) 편에서 본 것 처럼 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq5.png">의 기저 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq6.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq7.png">를 이용해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq8.png">를 구해낼 수는 없을까 라는 것이다.

다시 말해 아래와 같이

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq9.png"> </p>

와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq10.png">를 설정하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq11.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq12.png">에 모두 독립적인 적절한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq13.png">를 얻어낼 수 있을 것이라는 아이디어이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq14.png">를 잘 보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq15.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq16.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq17.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq18.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq19.png">로 바꾼 것임을 알 수 있다. 다시 말해, parameter를 바꾼 것이라고 할 수 있고 이런 맥락에서 매개변수 변환법(variation of parameters)라는 method의 이름이 부여된 것이락 볼 수 있다.

아무튼 여기서 중요한 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq20.png"> 역시도 식(1)을 만족하는 solution이라는 것이다. 따라서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq21.png">를 식 (1)에 대입해보자.

그러기 위해 1차 미분과 2차 미분을 구해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq22.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq23.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq24.png">을 구하기 전에 아래와 같은 가정을 덧붙여보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq25.png"> <br> 식 (7) </p>

[//]:# (식 7)

이 가정은 미분 식을 간단하게 만들어줄 뿐만 아니라 솔루션을 구하는데 매우 핵심적인 역할을 한다. 이 가정은 뒤에 있을 Cramer\'s rule에 적용하기 위한 연립 방정식으로 연결되기 때문이다. 우리는 적절한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq26.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq27.png">를 찾는 것이 목적이기 때문에 이런 가정까지도 만족하는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq28.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq29.png">를 찾기만 하면 되는 것이다. 

이런 가정을 가지고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq30.png">을 구하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq31.png"> </p>

임을 알 수 있다.

따라서, 원래의 미분방정식에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq32.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq33.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq34.png">를 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq36.png"> </p>

이 식을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq37.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq38.png">에 관해 다시 정리해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq39.png"> </p>

이다. 여기서 중괄호(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq40.png">) 안에 있는 방정식은 모두 제차미분방정식의 해를 가지고 써준 것이므로 0이다. 따라서 위의 식은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq41.png"> <br> 식 (12) </p>

[//]:# (식 12)

와 같이 쓸 수 있다.

---

여기서 식 (7)과 식 (12)를 묶어 다음과 같이 표현해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq42.png"> </p>

이 식은 일종의 연립방정식으로 아래와 같이 행렬을 이용해 표현할 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq43.png"> </p>

따라서, 우리가 구하게 되는 해는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq44.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq45.png">에 관한 것이다.

이 연립방정식을 구할 수 있는 해법 중 하나는 크래머 법칙(Cramer\'s rule)이다.

크래머 법칙을 이용하면 아래와 같이 해를 구할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq46.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq47.png"> </p>

여기서 분모의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq48.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq49.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq50.png">의 [론스키안(Wronskian)](https://angeloyeo.github.io/2019/10/10/Wronskian.html)이라고 부르는데 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq51.png">라고 적자.

그리고 각 분자에 있는 행렬식은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq52.png"> 행렬의 행렬식을 직접 계산할 수 있으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq53.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq54.png"> </p>

임을 알 수 있다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq55.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq56.png"> </p>

과 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq57.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq58.png">를 계산할 수 있게 된다.

따라서, particular solution은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq59.png"> <br> 식 (21) </p>

[//]:# (식 21)

가 됨을 알 수 있다.

# 예제문제

## 문제 1.

아래의 미분방정식의 해를 구하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq60.png"> </p>

### Solution

매개변수 변환법을 이용해 문제를 풀 때 빠질 수 있는 함정 중 하나는 최고 차항의 계수가 1이 아닌 경우에 이것을 1로 만들어줘야 한다는 점이다.

그러기 위해 양변을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq61.png">로 나눠주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq62.png"> </p>

[2계 선형미분방정식의 해법(2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 확인한 바와 같이 대입법을 이용해 위 방정식의 제차꼴 해를 풀어주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq63.png"> </p>

임을 알 수 있다.

따라서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq64.png"> 이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq65.png">이다.

식 (21)의 해법을 이용해 비제차 해(particular solution)을 구해보자.

그러기 위해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq66.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq67.png">와 Wronskian을 먼저 계산하도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq68.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq69.png"> </p>

따라서, particular solution은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq70.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq71.png"> 라는 사실을 이용하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq72.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq73.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq74.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq75.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq76.png">의 적분이 아래와 같다는 사실을 이용하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq77.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq78.png"> </p>

여기서 뒤의 두 개 항은 부호만 반대이고 값은 같은 것이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq79.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq80.png"> </p>

와 같이 particular solution을 구할 수 있다.

따라서 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-05-variation_of_parameters/eq81.png"> </p>

이다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/TmgzQ83rNs4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
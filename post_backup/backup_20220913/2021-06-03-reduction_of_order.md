---
title: reduction of order
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210603
tags: 미분방정식
---

# Prerequisites

본 포스팅을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html)
* [변수분리법](https://angeloyeo.github.io/2021/05/06/separable_differential_equations.html)

# 들어가기에 앞서

이전 [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서는 2계 제차 선형 미분방정식의 일반해에 대해 다루었다.

우리가 다루는 2계 선형 제차 미분방정식이 아래와 같은 꼴이라고 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

여기서 우리는 보조방정식을 얻고, 보조방정식의 근을 통해 고윳값을 확인한다고 공부하였다.

그리고 특히, 보조방정식의 근이 중근인 경우는 중복되는 고윳값을 갖게 되는 경우인데, 가령 중복되는 고윳값을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq2.png">라고 하면 그 경우 아래와 같이 일반해를 선정할 수 있다고 언급한 바 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq3.png"> </p>

다시 말해, 이 솔루션 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq4.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq5.png"> 라는 해 하나만 주어졌을 때 또 다른 해는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq6.png">라고 놓으라고 말해주는 것과 같다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq7.png"> 나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq8.png">를 기저함수라고도 부르는데 이 내용에 대해서는 추후에 더 깊게 다루도록 하자. 앞으로는 기저함수라는 표현을 종종 쓰도록 하겠다.

다시 말해, 기저 함수라는 용어를 사용한다면, 2계 미분방정식의 해는 두 개의 기저함수의 선형 결합으로 이루어지는데, 우리는 하나의 기저함수만 부여받은 경우를 생각하게 된 것이라고 말할 수 있다.

그렇다면, 왜 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq9.png">라는 기저함수가 주어졌을 때 새로운 기저함수는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq10.png">라고 설정하면 문제가 풀리게 되는 걸까?

# 문제를 푸는 방법

사실 기저가 하나만 주어졌을 때 또 다른 기저를 구하는 방법은 공식만 알면 그렇게 어려운 문제는 아니다.

이번 reduction of order 시간에는 공식을 이용해 문제를 먼저 풀어보고 이 공식이 어떻게 유도되었는지 과정을 살펴보도록 하자.

(유도 과정의 수식 전개가 복잡해 보이기 때문에 이런 구성을 선택했다.)

가령 식 (1)과 같은 방정식에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq11.png">라는 해 하나가 주어졌을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq12.png"> </p>

라고 가정하자.

그리고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq13.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq14.png"> </p>

인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq15.png">를 찾는 것을 목적으로 하여 문제를 풀어보도록 하자.

적분상수들은 일반해를 계산할 때 기저해 두 개를 선형결합 하는 과정에서 의미가 없어지기 때문에 신경쓰지 않아도 괜찮다.

## 예제 문제 1.

아래의 초기값 문제를 해결하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq16.png"> </p>

---

이 문제는 [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 보았던 보조 방정식이 중근을 가지는 경우의 예제 문제이다.

이 경우가 바로 기저해가 하나만 주어지는 경우라고 볼 수 있다.

보조 방정식을 풀면 기저해 중 하나는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq17.png"> </p>

라는 것을 알 수 있다.

따라서, 또 다른 기저해인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq18.png">는 다음과 같다고 설정하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq19.png"> </p>

그리고 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq20.png"> </p>와 같이 설정하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq21.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq22.png"> </p>

와 같다.

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq23.png">를 조금 더 계산하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq24.png"> </p>

임을 알 수 있다.

그리고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq25.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq26.png"> </p>

임을 알 수 있다.

따라서, 또 다른 기저 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq27.png">임을 알 수 있게 된다.

따라서 일반해는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq28.png"> </p>

이고, 초기값을 이용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq29.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq30.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq33.png"> </p>

와 같이 문제를 풀 수 있게 된다.

# Reduction of Order 공식의 유도 방법

Reduction of order 공식을 유도하는 방법은 식이 깔끔하게 이해되기는 어려워서 굳이 설명하고 싶지는 않다.

하지만 이 방법은 추후 [매개변수 변환법](https://angeloyeo.github.io/2021/06/05/variation_of_parameters.html)의 아이디어와도 맥을 같이 하기 때문에 꼭 짚고 넘어가는 것이 좋다.

---

아래와 같은 조금 더 일반적인 형태의 2계 제차 선형 미분방정식을 푼다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq34.png"> <br> 식 (19) </p>

[//]:# (식 19)

그리고 여기서 기저 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq35.png">는 주어져있다고 하자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq36.png">라는 꼴을 띈다고 가정하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq37.png">를 구할 수 있을지 알아보자.

여기서 왜 그런 가정을 하냐?라고 묻는다면 특별히 그래야만 하는 이유는 없다. 

미분방정식에서는 해가 유일하게 존재함이 보장된다면 어떤 방식의 아이디어로 방정식을 풀더라도 해만 나오면 그 방법이 정답이다. 다시 말해 해를 구하기 위한 아이디어의 싸움일 뿐이다.

다만, <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq38.png"> </p>라고 두면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq39.png">와는 독립적인 기저 함수를 얻을 수 있기 때문에 이렇게 결정하는 것은 타당한 접근이라고 볼 수는 있다.

(독립적인 기저 여부를 판단하기 위해선 [Wronskian](https://angeloyeo.github.io/2019/10/10/Wronskian.html)을 적용할 수 있다.)

---

여기서 주목해야 할 부분 중 하나는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq40.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq41.png">는 모두 2계 제차 미분방정식의 솔루션의 일부분이므로 아래의 두 식이 모두 만족된다는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq42.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq43.png"> </p>

따라서 우리는 방금 언급 된 식 중 두 번째 식을 사용하기 위해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq44.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq45.png">을 구해보자. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq46.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq47.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq48.png"> </p>

따라서 원래의 식에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq49.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq50.png">를 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq51.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq52.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq53.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq54.png">, u에 대하여 식을 묶어 보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq55.png"> </p>

앞서 언급한 바와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq56.png">이므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq57.png"> </p>

이다.

이 식을 다시 쓰면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq58.png"> </p>

이 되고, 양변을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq59.png">로 나눠주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq60.png"> </p>

과 같다.

여기서 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq61.png">을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq62.png">로 바꿔써보자.

그러면 식은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq63.png"> <br> 식 (31) </p>

[//]:# (식 31)

가 된다.

즉, 해결을 위한 미분방정식의 order가 2차에서 1차로 내려갔다. (그래서 reduction of order technique이라고 부른다.)

식 (31)을 잘 보면 [변수분리법](https://angeloyeo.github.io/2021/05/06/separable_differential_equations.html)을 이용해 풀 수 있는 간단한 형태임을 알 수 있다.

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq64.png">에 대한 식을 모두 좌변으로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq65.png">에 대한 식을 모두 우변으로 옮기면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq66.png"> </p>

여기서 양변을 적분해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq67.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq68.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq69.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq70.png"> </p>

과 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq71.png">를 구할 수 있음을 알 수 있다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq72.png">이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq73.png">는 다음과 같이 계산할 수 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq74.png"> </p>

그리고 새로운 기저 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq75.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-03-reduction_of_order/eq76.png"> </p>

이다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/55jES6YrXEQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
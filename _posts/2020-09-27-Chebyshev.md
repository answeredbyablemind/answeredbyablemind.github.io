---
title: 체비세브 필터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200927
tags: 신호처리
---

본 포스팅은 IIT의 [S. C. Duta Roy 교수님의 강의](https://www.youtube.com/watch?v=2IZtWnGV-K4&ab_channel=nptelhrd)를 정리한 것임을 먼저 밝힙니다.

# 목표

1. Butterworth필터와 비교하여 Chebyshev 필터의 특징을 이해한다.
2. Chebyshev Polynomial의 특징을 이해한다.
3. Chebyshev 필터의 구현 조건인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq1.png">의 결정방법과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq2.png">의 결정 방법을 이해한다.

# 1. Chebyshev 필터의 특징

## 가. Introduction to Chebyshev Filter

Chebyshev 필터는 [Butterworth 필터](https://angeloyeo.github.io/2020/09/25/Butterworth.html)와 마찬가지로 일종의 All-Pole 필터로써 기본적으로 Lowpass Filter를 설계할 수 있도록 만들어진 필터이다. 

앞선 [Butterworth 필터 편](https://angeloyeo.github.io/2020/09/25/Butterworth.html)에서도 설명했듯이, Chebyshev 필터의 경우에도 Chebyshev 필터를 통한 Lowpass filter 설계에 중심을 맞춰서 정리해 나갈 생각이다. 

먼저, 개괄적으로, Chebyshev 필터는 elliptic filter를 제외하였을 때, 가장 ideal filter에 가까운 필터라고 할 수 있다. 그 이유는 같은 조건의 필터 차수(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq3.png">)와 specification requirement에 대해서 transition band가 가장 좁고, 가장 가파른 transition의 양상을 보이기 때문이다. 

참고로 elliptic filter는 numerical method를 사용해야만 만들 수 있는 필터이기 때문에 elliptic filter를 제외하였을 때, Chebyshev 필터가 가장 ideal filter에 가까운 필터라고 하였다. 즉, coefficient를 수식을 통해서 구할 수 있는 필터 중에서는 Chebyshev 필터가 가장 optimal한 필터의 종류라고 할 수 있다.

## 나. Chebyshev 필터의 모양

그렇다면 Chebyshev 필터의 대략적인 모습을 보도록 하자.

<p align = "center">
  <img width = "400" src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic1.png">
  <br> 그림 1. Chebyshev 필터의 대략적인 형태
  <br> <a href = "https://en.wikipedia.org/wiki/Chebyshev_filter"> 출처: 위키피디아 Chevyshev filter</a>
</p>

외형에서 볼 수 있는 가장 큰 특징은 passband안에 있는 ripple이라고 할 수 있다. 

조금 더 상세하게 Chebyshev 필터의 특징을 열거하면 다음과 같다.

① monotonic filter가 아니다.

② Equal ripple(Equi-Ripple)이 존재한다.

이 때, Type I의 Chebyshev 필터에서는 passband에 ripple이 있는데, stopband에서는 monotonic한 양상을 보인다. 

이것은 Type II에서는 반대의 양상을 보이는데, type II는 type I을 뒤집으면 얻을 수 있는 것이다. 하지만 type I이 선호되는데, 그 이유는 type II는 lowpass filter의 역할 중, 불필요한 신호 제거에 취약하기 때문이다. 

②의 이유에 대해서는 조금 뒤에 더 상세히 설명하겠지만, 그림에서와는 차이가 있는 것이, 실제로는 주기적인 모양을 가지는 ripple이 생기고, ripple에 대한 식 역시 존재한다. 그 ripple의 모양과 주기를 결정하는 식을 Chebyshev Polynomial이라고 하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq4.png">로 적는다.

## 다. 수식을 통해서 알 수 있는 것들은?

Chebyshev 필터는 다음과 같은 수식으로 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq5.png"> </p>

또는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq6.png"> </p>

이 때, A는 gain factor이다. 보통, passband 주파수에서의 증폭을 원하는 경우가 아닌 경우 A=1로 둔다.

이 식을 잘 살펴보면, Chebyshev 필터의 특징을 볼 수 있는데, 이 때 특히 Butterworth 필터와 비교하여 살펴보면 좀 더 직관적인 이해를 도울 수 있다.Butterworth 필터의 식은 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq7.png"> </p>

즉, Chebyshev 필터의 수식에는 Butterworth 필터의 수식에는 없는 것들이 있다. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq8.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq9.png">가 그것이다. 그리고 Chebyshev 필터와 Butterworth 필터의 사소하지만 중요한 차이는 Chebyshev 필터의 수식에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq10.png">가 들어가있는 반면에, Butterworth 필터에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq11.png">가 들어가있다는 점이다. 즉, Chebyshev 필터를 구현할 때에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq12.png">를 직접적으로 필요로 하지 않는다는 사실이다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq13.png">은 ripple의 크기를 정하는 요소이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq14.png">는 필터의 차수 N에 의해서 정해지는 ripple의 모양이며, 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq15.png">는 다음과 같이 정의된다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq16.png"> </p>

이 식을 잘 살펴보면, 왜 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq17.png">의 범위가 1을 중심으로 정의되는지 알 수 있다. 그것은 원래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq18.png">의 함수가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq19.png">에서 정의되기도 하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq20.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq21.png">보다 클 때와 작을 때의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq22.png">의 값이 다르다는 것을 의미한다. 즉,

① <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq23.png">는 어쨌든 cosine 함수이기 때문에 ripple이 생기며, 이 ripple은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq24.png">의 주기를 가진다.

② <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq25.png">는 주기함수가 아니다. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq26.png">함수는 Hyperbolic cosine이라고 읽고, 다음과 같이 정의된다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq27.png"> </p>

그러므로, 수식을 통해서 보았을 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq28.png">일 때는 주기성을 띄는 ripple을 가지는 함수이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq29.png">의 범위에서는 monotonic 한 함수라는 것을 확인할 수 있다.


# 2. Chebyshev polynomial <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq30.png">

## 가. Chebyshev polynomial의 정의

다시 한번, Chebyshev Polynomial의 정의는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq31.png"> </p>

우리는 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq32.png">인 경우에서의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq33.png">에 관심이 있다는 것을 먼저 밝히고 싶다. 이것이 중요한 이유는, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq34.png">의 성질에 의해서 Chebyshev 필터의 모양이 결정되기 때문이다.

## 나. Analyzing Chebyshev polynomial

먼저, 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq35.png">에 대해서 해석하는 것을 다시 한번 밝힌다. 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq36.png">이 변함에 따라서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq37.png">의 모양을 분석해보고자 한다. 이것은 Chebyshev 필터의 주요한 결정 요소는 필터의 차수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq38.png">과 ripple의 크기요소인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq39.png">이기 때문이다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq41.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq42.png">을 구하려면, 약간 머리를 써야한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq43.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq44.png">라고 하자. 그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq45.png">이다. 그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq46.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq47.png">도 비슷한 방법으로 구할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq48.png"> </p>

마찬가지로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq49.png">라고 하자. 그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq50.png">이다. 그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq51.png"> </p>

여기서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq52.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq53.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq54.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq55.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq56.png"> </p>

따라서 원래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq57.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq58.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq59.png">의 모양을 보면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq60.png">의 차수가 2차가 차이가 난다는 것을 알 수 있다.

그러므로, 일반적으로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq61.png"> </p>

임을 이용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq62.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq63.png"> </p>

라는 식을 이용해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq64.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq65.png"> </p>

이기 때문에, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq66.png"> </p>

라는 사실을 유도해 낼 수 있다.

그러므로, 일반적인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq67.png">의 식을 유도해 낼 수 있다.

그래서, 예를 들면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq68.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq69.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq70.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq71.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq72.png"> </p>

같은 방식으로 어떤 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq73.png">이든지 N의 크기에 상관없이 회귀적으로 그 값을 구해낼 수 있게 되었다.

몇 개의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq74.png">를 모아보았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq75.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq76.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq77.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq78.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq79.png"> </p>

이렇게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq80.png">를 모아놓고 보면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq81.png">은 특이한 주기성을 가진다는 것을 알 수 있다.

그것은,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq82.png"> </p>

이라는 것이다. 이것은 나중에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq83.png">의 Chebyshev 필터의 모양을 결정하는데 중요한 역할을 한다.

또한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq84.png">의 Polynomial을 모아서 보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic2.png">
  <br> 그림 2. 여러가지 n에 대한 Chebyshev Polynomial
  <br> <a href = "https://en.wikipedia.org/wiki/Chebyshev_filter"> 출처: 위키피디아 Chevyshev filter</a>
</p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq85.png">인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq86.png">에 대해서는 해당 색깔의 선을 따라 연속적으로 그어주면 된다. 그것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq87.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq88.png">에 대해서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq89.png">로 정의되기 때문이고, 이것은 다시 말하지만 monotonic한 모양을 가진다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic3.png">
  <br> 그림 3. 여러가지 n에 대한 Chebyshev Polynomial을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq90.png">인 경우에 대해서 까지 연장해 그린 것
  <br> (출처 : EE648 Chebyshev filters / John Stensby / ece.uah.edu)
</p>

그러므로, Chebyshev 필터에서 보이는 ripple은 equally oscillating 한다는 것을 알 수 있다.

## 다. N의 크기에 따른 Chebyshev filter의 모양

다시 한번 Chebyshev 필터의 수식을 써보자면 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq91.png"> </p>

여기서 우리는 Chebyshev filter의 모양을 그리기 위해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq92.png">의 최대값과 최소값을 생각해보자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq93.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq94.png">이 oscillating 하고, 그 값은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq95.png">이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq96.png"> </p>

만약 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq97.png">이라고 한다면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq98.png"> </p>

그러므로, 각 필터의 차수 N에 대하여 그 모양을 보게 되면,

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq99.png">일 때,

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic4.png">
  <br> 그림 4. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq100.png">인 경우의 Chebyshev 필터의 형태
</p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq101.png">이 홀수이기 때문에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq102.png">이다. 또한, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq103.png">이다.

그렇기 때문에 N=1일 때, Chebyshev 필터는 1부터 시작한다는 것을 알 수 있다. 
또한 N=1일 때는 Butterworth 와 같은 모습을 갖는다는 것도 알 수 있다. 하지만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq104.png"> 값을 어떻게 주는가에 따라서 Butterworth와 같은 값을 가질 수도 있고 아닐 수도 있기 때문에 모양이 같다고 해서 같은 필터가 되는 것은 아니다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq105.png">일 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq106.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq107.png"> </p>

이다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq108.png"> </p>

이라는 점에 주의해 필터의 형태를 그려보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic5.png">
  <br>
  그림 5. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq109.png">인 경우의 Chebyshev 필터의 형태  
</p>

N=3, N=4에 대해서도 각각의 Chebyshev filter를 그려볼 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic6.png">
  <br>
  그림 6. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq110.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq111.png">인 경우의 Chebyshev 필터의 형태
</p>


여기까지 보았을 때, 모든 Chebyshev 필터는 공통점을 갖고 있는데, 그것은 모든 Chebyshev 필터는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq112.png">의 크기에 상관없이 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq113.png"> </p>

점을 통과한다는 사실이다. 

그것은 모든 Chebyshev Polynomial은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq114.png">을 통과하기 때문이라고 할 수도 있고, 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq115.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq116.png">이기 때문이라고 직접 증명 할 수도 있는 것이다. 후에 이 사실을 이용해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq117.png">의 크기를 계산할 수 있게 될 것이다. 

몇 가지 사실에 대해 간단하게 정리하자면, 

① The number of Maxima & Minima within the Passband = N

② If <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq118.png"> = even, starting point = <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq119.png">

else if <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq120.png"> = odd, starting point = <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq121.png">

여기서 한 가지 더 생각해보아야 할 것은 3dB frequency (or cutoff frequency)를 찾는 방법이다. 이것은 간단하게, 3dB의 정의를 이용하면, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq122.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq123.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq124.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq125.png"> </p>

일반적으로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq126.png">은 "작은 값"으로 정의하는데, Chebyshev 필터의 특성 상, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq127.png">은 1보다 작은 값이 되어야 한다. 그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq128.png">를 사용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq129.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq130.png"> </p>

# 3. General transfer function of Chebyshev filter in s-domain

## 가. Finding poles of chebysehv filter

pole의 정의에 따라, pole은 다음 식을 만족하는 s와 같다고 할 수 있습니다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq131.png"> </p>

하지만, 안타깝게도, 이 식을 푸는데 필요한 algebra가 저에겐 너무 복잡해서 다 이해하지 못했습니다. 그렇기 때문에 pole을 구하는 algebra에 대해서는 그 설명을 생략합니다. 

하지만, 결론적으로는 이 pole을 구하게 되면 Butterworth filter의 pole과는 다르게 타원 위에 위치하게 된다고 합니다. 자세한 풀이과정은 위키피디아를 참고하길 바랍니다. 

## 나. The transfer function of Chebyshev filter

Chebyshev Filter의 경우도 Butterworth Filter와 마찬가지로 N의 크기가 짝수 일 때와, 홀수 일 때의 경우의 두 가지 경우로 나뉜다. 이것은 위에서 N의 차수에 따른 Chebyshev 필터의 전반적 모양에서 본 것에서도 알 수 있듯이, N의 홀수 짝수 여부에 따라 그 시작점이 다르기 때문에 N의 홀수 짝수 여부에 따라 그 식도 달라진다고도 볼 수 있다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq132.png"> : odd

<p align = "center"> 
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic_eq_N_odd.png">
</p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq133.png"> : even

<p align = "center"> 
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic_eq_N_even.png">
</p>

위 식을 통해서 다시 한번 알 수 있듯이, N이 짝수일 때에는 시작점이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq134.png">이기 때문에 그 값이 분자에 곱해져 있다는 것을 알 수 있다. 각 상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq135.png">에 대해서 설명하자면, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq136.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq137.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq138.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq139.png"> </p>


와 같다고 할 수 있다. 이제 마지막으로 N과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq140.png">을 정하는 방법에 대해서 생각해보아야 할 것이다.

## 다. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq141.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq142.png">을 결정하는 방법

일반적으로 필터를 구할 때에 받는 specification은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq143.png">라는 사실에 대해서 인지하고 있어야 한다. 이 값은 필터가 가졌으면 하는 요구조건이기 때문이다. 이것은 수학적으로 정해주는 것이 아니라, 필터의 설계자가 정하는 것이거나 요구하는 사장님이 정해주는 것이다. 

일반적으로, specification의 관계를 표현하자면 다음과 같이 그릴 수 있다.

<p align = "center"> 
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-27-Chebyshev/pic7.png">
  <br> 그림 7. 필터 설계 시 주어지는 specifictaion
</p>

위에서 설명했던 것과 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq144.png">는 주어진 값이기 때문에,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq145.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq146.png"> </p>

와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq147.png">을 정할 수 있다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq148.png">은 다음과 같이 정할 수 있다. 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq149.png">도 주어진 값이라는 사실을 이용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq150.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq151.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq152.png"> </p>

이 때, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq153.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq154.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq155.png"> </p>

을 만족하는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq156.png">를 찾을 수 있다. (여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq157.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq158.png">는 Chebyshev를 의미하고자 했다.) 

참고로, Butterworth filter의 차수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq159.png">는 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-27-Chebyshev/eq160.png"> </p>

결국 Chebyshev 필터와 Butterworth 필터에서의 N을 구하는 방법은 매우 닮아있다고 할 수 있다.

---
title: 테일러 급수의 유도와 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190902
tags: 미적분학
---

# 테일러 급수 공식 유도

테일러 급수의 공식은 미적분학의 기본정리로부터 유도할 수 있다.

미적분학의 기본정리는 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

식 (1)의 좌변을 살짝 변경해 다음과 같이 써도 무방하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq2.png"> <br> 식 (2) </p>

[//]:# (식 2)

여기서 우리는 식(2)의 좌변을 부분적분하고자 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq3.png"> <br> 식 (3)</p>

[//]:# (식 3)

로 두자. 그러면 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq4.png"> <br> 식 (4)</p>

[//]:# (식 4)

가 된다.

여기서 주의할 점은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq5.png">라고 보통은 둘 수 있지만, 사실은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq6.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq7.png">의 부정적분으로써

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq8.png">는 원래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq9.png">로 쓰는 것이 더 정확하다. 우리는 여기서 적분상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq10.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq11.png">로 사용하도록 하자.

피적분변수는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq12.png">이기 때문에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq13.png">는 상수에 불과하다. 

따라서, 식(4) 대신에 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq14.png">을 생각하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq15.png"> </p>

그러면 식(2)는 다음과 같이 전개될 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq16.png"> <br> 식 (6)</p>

[//]:# (식 6)

식 (6)의 첫 번째 항에서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq17.png">를 넣으면 그 값은 0이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq18.png">를 넣었을 때에는 값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq19.png">인데, 빼기를 해줄 차례이므로 식은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq20.png"> <br> 식 (7)</p>

[//]:# (식 7)

식 (7)을 계속 전개하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq21.png"> <br> 식 (8)</p>

[//]:# (식 8)

식 (6)에서와 마찬가지로 식 (8)에서 두 번째 항에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq22.png">를 넣으면 그 값은 0이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq23.png">를 넣었을 때는 값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq24.png">인데, 빼기를 해줄 차례이다. 그래서 식 (8)을 계속해서 전개하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq25.png"> </p>

같은 방식으로 계속 전개해 나가면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq26.png"> </p>

이런식으로 계속 더해가면 다음과 같은 패턴이 나오는 것을 알 수 있다[^1].

[^1]: 엄밀하게는 적분의 평균값 정리를 이용해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq27.png"><br> 식 (11)</p>

[//]:# (식 11)

원래 식 (11)은 식(1)에서부터 유도된 것이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq28.png"> <br> 식 (12)</p>

[//]:# (식 12)

식 (12)를 정리하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq29.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq30.png"> <br> 식 (14)</p>

[//]:# (식 14)

# 테일러 급수의 특성과 의미

## 다항함수를 이용한 근사

식 (14)의 테일러 급수의 공식을 보면 우선 테일러 급수는 어떤 함수를 다항함수로 표현할 수 있다는 것을 알 수 있다.

이러한 성질은 초월함수를 근사하여 사용할 때 매우 유용한데, 예를 들어 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq31.png"> 라는 점에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq32.png">를 근사하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq33.png"> </p>

## 한 포인트에서 근사를 수행한다.

테일러 급수의 특징 중 하나는 특정 포인트 주변의 함수 값을 근사한다는 것이다.

방금 위에서 든 예시처럼 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq34.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-09-02-Taylor_Series/eq35.png">를 근사하는 경우를 MATLAB을 이용해 그려보면 아래 그림과 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-02_Taylor_Series/pic1.gif">
  <br>
  그림 1. x=0에서 y=exp(x)를 근사하는 경우
</p>

또, 테일러 급수는 다변수 함수에서도 마찬가지로 적용될 수 있는데, 그림 2에서는 두 개의 독립변수를 갖는 함수에 대해서 (1,1)이라는 점에서 근사를 수행하는 모습을 볼 수 있다. 항을 더해갈수록 원래 함수의 모양에 더 가깝게 근사되는 것을 알 수 있다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-02_Taylor_Series/pic2.gif">
  <br>
  그림 2. (1,1)에서 다변수함수를 근사하는 경우
</p>

그림 1과 그림 2에서 보여주고자 하는 것은 테일러 급수는 특정 point의 근처의 함수를 근사한다는 특징이 있다는 것이다.

참고로, 이와 대조적인 급수로 푸리에 급수를 들 수 있는데, 푸리에 급수는 특정 point가 아니라 특정 interval에서 함수를 근사한다는 차이가 있다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-02_Taylor_Series/pic3.gif">
  <br>
  그림 3. 특정 point에서 함수를 근사하는 테일러 급수와는 다르게 푸리에 급수는 특정 interval 내에서 함수를 근사한다.
</p>

## 특정 포인트의 함수값과 그 주변값과의 관계를 이용한다.

테일러 급수의 식을 잘 생각해보면, 특정 함수 값에서 함수를 근사하기 위해서는 해당 point의 함수값과 도함수값을 이용하는 것을 알 수 있다.

그런데, 도함수, 즉, 미분 계수는 잘 생각해보면 특정 함수값과 그 주변 함수값간의 관계를 말한다.

1계 도함수는 바로 옆 포인트와의 관계, 2계 도함수는 양 옆 포인트와의 관계(혹은 바로 옆 포인트와 두번째 옆 포인트와의 관계로 생각할 수도 있다.)등을 설명하고 있는 것이기 때문이다.

따라서, 차수가 높으면 높을 수록 멀리있는 근사화하고자 하는 함수값에서 멀리 떨어진 곳까지도 함수의 근사가 정확해진다.

한마디로 요약하면, 테일러 급수는 특정 point의 도함수 정보를 이용해서 point 주변의 함수 값을 알아내는 방법이라고 할 수 있을 것 같다.

<p align = "center">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/O4T5STR8NPs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>
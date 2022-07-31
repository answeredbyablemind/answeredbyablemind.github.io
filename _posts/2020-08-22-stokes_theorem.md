---
title: 스토크스의 정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200822
tags: 미적분학
---

# 스토크스 정리의 수식

스토크스 정리의 수식을 써보자면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

식 (1)을 놓고 잘 생각해보면 그린정리의 수식과 매우 유사하다는 것을 알 수 있다. 그린정리의 수식은 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq2.png"> <br> 식 (2) </p>

[//]:# (식 2)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq3.png">는 2D curl이라는 의미로, 수식은 curl의 수식과 같으나 2차원에서 더 이상 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq4.png">방향으로 표시할 벡터가 없어 curl의 크기만 사용하겠다는 의미이다.

식 (1)과 식 (2)를 비교해보면 그린 정리는 선적분과 중적분 간의 관계에 대해 설명해주고 있는 반면, 스토크스 정리는 선적분과 면적분 간의 관계에 대해 설명해주고 있다고 할 수 있다.

스토크스의 정리는 그린 정리의 3차원 버전이라고 할 수 있다. [일반적인 스토크스 정리](https://en.wikipedia.org/wiki/Stokes%27_theorem)는 더 고차원 다양체에 대해 다룰 수 있다고 하지만, 우리는 우리가 필요한 3차원 정도의 수준에서 이해와 증명을 해보도록 하자.

# 스토크스 정리의 의미

## prerequisites

스토크스 정리의 의미를 이해하기 위해선 다음의 내용에 대해 알고 오는 것이 좋습니다

* [그린 정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)
* [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)
* [벡터장의 회전](https://angeloyeo.github.io/2019/08/25/curl.html)

특히, [그린 정리의 의미 설명 부분](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#curl%EC%9D%84-%ED%86%B5%ED%95%9C-%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A7%81%EA%B4%80%EC%A0%81-%EC%9D%B4%ED%95%B4)에 대해서는 꼭 알고 오시는 것을 추천드립니다.

## 스토크스 정리의 의미 소개

아래와 같이 어떤 벡터장 위에 넓이를 갖는 곡면 S과 그 가장 외각의 폐곡선 C가 있다고 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic1.mp4">
  </video>
  <br>
  그림 1. 3차원 공간 위에 임의의 곡면 S와 폐곡선 C를 가정해보자.
</p>

이 때, 이 3차원 공간에 벡터장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq5.png">가 주어져 있다고 하면 스토크스 정리에 의해 아래의 식이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq6.png"> <br> 식 (3) </p>

[//]:# (식 3)

식 (3)의 좌변은 curve C를 따라 벡터장에 대해 선적분한 것이다.

이제 식 (3)의 좌변으로부터 식(3)의 우변을 유도해보자. 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq7.png">를 아래와 같이 반으로 쪼개서 보도록 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic2.mp4">
  </video>
  <br>
  그림 2. 곡면 S를 두 개의 페곡선으로 나누어 표현한 것.
</p>

위 그림 2를 위쪽에서 조감해보면 아래와 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic3.png">
  <br>
  그림 3. 곡면 S를 2개의 폐곡선으로 나누었을 때의 선적분 경로
</p>

그림 3에서 보면 두 개로 쪼개진 닫힌 경로를 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq8.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq9.png">라고 하였다.

또한, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq10.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq11.png">의 선적분 경로를 잘 생각해보면 가운데 있는 구간에서는 선적분 경로의 길이는 같으나 길이는 반대이므로 이 영역에서는 선적분의 값이 상쇄된다.

따라서, 우리는 다음과 같은 관계를 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq12.png"> </p>

이번엔 아래와 같이 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq13.png">를 4등분 해보자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic4.mp4">
  </video>
  <br>
  그림 4. 곡면 S를 네 개의 페곡선으로 나누어 표현한 것.
</p>

위 그림 4를 위쪽에서 조감해보면 아래와 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic5.png">
  <br>
  그림 5. 곡면 S를 2개의 폐곡선으로 나누었을 때의 선적분 경로
</p>

앞서 곡면을 두 개로 쪼갰을 때와 마찬가지의 논리로 내부의 경로에서는 선적분 시 길이는 같고 방향은 반대이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq14.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq15.png">까지의 네 개의 닫힌 경로에 대한 선적분을 모두 더해주면 기존의 최외각 경로에 대한 선적분의 값과 같아진다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq16.png"> </p>

그렇다면 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq17.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq18.png"> 등분하면 어떻게 될까?

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic6.mp4">
  </video>
  <br>
  그림 6. 곡면 S를 많은 페곡선으로 나누어 표현한 것.
</p>

지금까지의 논리와 같이 아무리 많은 폐곡선으로 쪼개더라도 아래의 식이 성립하게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq19.png"> <br> 식 (6) </p>

[//]:# (식 6)

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq20.png"> 개로 쪼깨진 작은 곡면을 생각해보면 아래와 같이 상상할 수 있는데, 이 작은 경로 내부의 선적분은 결국 미소 경로에서의 [벡터장의 회전](https://angeloyeo.github.io/2019/08/25/curl.html)과 같은 의미를 갖게 된다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic7.png">
  <br>
  그림 7. 작은 곡면에서의 경로와 선적분
</p>

또, curl 편에서 확인했던 것 처럼 curl은 단위 영역에서 받는 회전력이므로 넓이가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq21.png">인 곡면에서의 회전량은 curl의 값에 곡면의 넓이를 곱해준 값으로 생각할 수 있다.

한편 curl의 벡터 방향과 곡면의 법선 벡터는 방향이 같으므로 curl의 크기와 곡면의 넓이의 곱은 curl 벡터와 곡면의 면벡터의 내적과 같다고 볼 수 있다.


그러므로, 아래와 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq22.png"> </p>

따라서 식 (6)을 다시 쓰면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq23.png"> <br> 식 (8) </p>

[//]:# (식 8)

식 (8)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq24.png">을 무한히 크게 만들면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq25.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq26.png">가 될 것이고 결국 식 (6)은 다음과 같이 변하게 될 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq27.png"> </p>

이렇듯 스토크스 정리는 곡면의 모양이 어떠하든 간에 상관없이 닫힌 경로의 모양만 유지된다면 같은 결과값을 가져오게 된다.


<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic8.mp4">
  </video>
  <br>
  그림 8. 곡면 S의 모양이 어떻든 간에 상관없이 닫힌 경로 C의 모양만 유지된다면 스토크스 정리는 항상 성립한다.
</p>

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/O1PrrBpbVjo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

# 스토크스 정리의 증명

## prerequisites

스토크스 정리의 증명 과정을 잘 이해하기 위해선 다음의 네 가지 정도의 내용에 대해서는 알고 오시는 것이 좋습니다.

* [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)
* [그린 정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)
* 편미분의 chain rule

여기서 필요한 편미분의 chain rule은 다음과 같이 세 가지이다.

1) for a function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq28.png">

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq29.png"> </p>

2) for two functions <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq30.png"> and <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq31.png">

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq32.png"> </p>

3) for a function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq33.png">

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq34.png"> </p>

위 세 가지 chain rule들은 증명 과정 이곳 저곳에서 필요할 때 쓰일 것이므로 혹시 어려운 부분이 있다면 미리 숙지해두도록 하자.

## 증명을 위한 곡면과 정의역 소개

이번 증명 과정에서는 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq35.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq36.png"> 평면이고 높이가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq37.png">와 같이 정해지는 함수를 통해 스토크스 정리를 증명하고자 한다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic9.png">
  <br>
  그림 9. 스토크스 정리의 증명을 위한 정의역이 x, y이고 높이가 x, y의 함수로 정해지는 영역과 닫힌 경로(검은 실선)와 그 정사영(점선 표시)
</p>

이후 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq38.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq39.png">인 경우와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq40.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq41.png">인 경우에 대해서는 지금의 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq42.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq43.png">인 경우에 대한 증명 방식과 유사한 방식으로 증명할 수 있다는 방식으로 일반적인 3차원 공간에 대해 스토크스 정리를 증명할 수 있다.

여기서 3차원 공간상에 주어진 벡터 필드 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq44.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq45.png">로 쓰도록 하자. 꺽쇠 괄호로 표시한 것은 원래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq46.png">를 줄여 표시한 것이다.

스토크스 정리의 수식을 쓰면 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq47.png"> </p>

## 면적분 부분의 계산

여기서 우리는 면적분 부분 증명을 먼저 시작해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq48.png"> <br> 식 (14) </p>

[//]:# (식 14)

여기서 벡터장의 curl 부분만 따로 계산해도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq49.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq50.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq51.png">등의 표기는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq52.png">에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq53.png">의 편미분으로 생각하면 된다.

또, 면벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq54.png">에 대해 생각해보면 매개 변수 2개를 이용해 곡면을 나타내는 일반적인 식은 아래와 같은데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq55.png"> </p>

이번 경우에는 매개변수 2개가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq56.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq57.png">에 해당하므로 곡면의 방정식은 다음과 같이 나타낼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq58.png"> </p>

따라서, [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)에서 알아보았던 것 처럼 면벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq59.png">는 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq60.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq61.png"> <br> 식 (20) </p>

[//]:# (식 20)

따라서 식(14)는 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq62.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq63.png"> </p>

여기서 더 이상 해줄 수 있는 일이 없기 때문에 스토크스 정리 수식의 선적분 부분의 계산으로 넘어가도록 하자.

## 선적분 부분의 계산

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq64.png"> <br> 식 (23) </p>

[//]:# (식 23)

선적분 부분의 계산을 위해 아래의 그림 10과 같이 원래의 곡면에 대한 닫힌 경로를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq65.png">, 그 경로의 정의역으로의 정사영을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq66.png">라고 하자.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic10.png">
  <br>
  그림 10. 닫힌 경로 C와 그 경로의 정의역으로의 정사영 C_0
</p>

그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq67.png">에 대한 곡선의 매개변수 방정식은 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq68.png"> </p>

또, 이에 따라 원래의 닫힌 경로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq69.png">에 대한 곡선의 매개변수 방정식은 다음과 같이 생각할 수 있다. 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq70.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq71.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq72.png">인 임의의 실수이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq73.png"> </p>

이제 우리는 닫힌 곡선 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq74.png">에 대한 미소변위 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq75.png">에 대해 생각해보자. 우선 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq76.png">을 계산하기 위해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq77.png">을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq78.png">에 대해 먼저 미분해보자. 스토크스 정리의 증명 파트 초반부에 소개하였던 편미분 chain rule 3) (식 (12))를 적용해보면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq79.png"> </p>

그런 다음 위 식에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq80.png">를 양변에 곱해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq81.png"> </p>

따라서, 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq82.png">는 주어진 것이므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq83.png">은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq84_1.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq84_2.png"> </p>

이를 이용하면 원래의 식 (23)의 선적분은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq85.png">에 대한 적분으로 바꿀 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq86.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq87.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq88.png"> 에 대해 묶으면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq89.png"> </p>

여기서 [그린정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)를 적용하면 2차원 평면 상의 닫힌 경로에 대한 선적분을 중적분으로 바꿔줄 수 있으므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq90.png"> <br> 식 (31) </p>

[//]:# (식 31)

여기서 괄호 뒤에 있는 아래첨자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq91.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq92.png">는 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq93.png">에 대한 편미분과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq94.png">에 대한 편미분을 의미한다.

이제 식 (31)의 두 개의 편미분 계산을 각각 수행해보도록 하자.

### (Q+Rg_y)_x에 대한 편미분 계산

식 (31)에서 앞쪽의 편미분 계산부를 먼저 가져오면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq95.png"> </p>

이 때, 증명부 초반에 소개했던 편미분 chain rule 중 첫 번째인 식 (10)과 두 번째인 식 (11)을 사용하면 위 식은 아래와 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq96.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq97.png">나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq98.png">나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq99.png">이므로 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq100.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq101.png">로 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq102.png"> <br> 식 (34)  </p>

[//]:# (식 34)

### (P+Rg_x)_y에 대한 편미분 계산

식 (31)에서 뒷쪽의 편미분 계산부를 가져오면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq103.png"> </p>

이 때, 증명부 초반에 소개했던 편미분 chain rule 중 첫 번째인 식 (10)과 두 번째인 식 (11)을 사용하면 위 식은 아래와 같이 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq104.png"> <br> 식 (36) </p>

[//]:# (식 36)

### 두 편미분 계산 과정을 종합하면,

식 (31)을 계산하기 위해 식 (34)의 결과에서 식 (36)의 결과를 빼보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq105.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq106.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq107.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq108.png"> </p>

따라서 식 (31)은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq109.png"> <br> 식 (40) </p>

[//]:# (식 40)

## 면적분 계산과 선적분 계산의 결과 일치 여부 확인

지금껏 우리는 스토크스 정리를 증명하기 위해 면적분 부분으로부터의 계산과 선적분 부분으로부터의 계산을 각각 수행했다.

각 계산의 최종 결과를 확인해보면 식(22)와 식(40)은 동일함을 알 수 있다.

## 일반적인 3차원 공간에 대한 스토크스 정리

앞서 우리는 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq110.png">와 같은 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq111.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq112.png">에 대한 함수인 경우에 대해 증명하였다.

이와 같은 방식으로 곡면이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq113.png"> 인 경우와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-22-stokes_theorem/eq114.png">인 경우에 대해서도 증명할 수 있으므로 일반적인 곡면에 대한 3차원 공간에서 스토크스 정리가 성립한다고 할 수 있다.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/6SanOG3cSjA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
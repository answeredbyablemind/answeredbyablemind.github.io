---
title: 가우스 적분
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200117
tags: 통계학
---

가우스 적분은 다음과 같이 가우스 함수에 대한 실수 전체 범위에 대한 적분으로, 그 값은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq1.png"> </p>

# 가우스 적분 계산 과정

우선 아래와 같이 가우스 적분의 값을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq2.png">라고 두자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq3.png"> </p>

그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq4.png">를 제곱한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq5.png">은 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq6.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq7.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq8.png"> <br> 식 (5) </p>

[//]:# (식 5)

여기서 아래와 같이 직교좌표계를 극좌표계로 변경해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq9.png"> </p>

## 직교좌표계 ⇒ 극좌표계: 적분 범위의 수정

적분범위는 다음과 같이 바뀌게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq10.png"> <br> 식 (75) </p>

[//]:# (식 7)

식 (7)과 같이 적분 범위가 바뀌는 이유는 식 (7)의 왼쪽 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq11.png">의 범위가 말하는 것은 실수 전체 범위이므로,

극좌표계에서 실수 전체 범위를 커버하기 위해선 반지름(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq12.png">)은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq13.png">부터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq14.png">까지 변하면서 각도는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq15.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq16.png">까지 한 바퀴를 다 돌면서 커버하면 되기 때문이다.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-17-Gaussian_Integral/pic1.png"> <br>
  그림 1. 직교좌표계와 극좌표계의 비교
</p>

## 직교좌표계 ⇒ 극좌표계: 미소 면적의 수정

식 (5)에 있는 미소 면적(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq17.png">)는 아래와 같이 바뀌게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq18.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq19.png"> 은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq20.png">방향으로 변하는 미소변위로 생각할 수 있고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq21.png">는 각도가 약간 변한 것이다. 그래서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq22.png">는 호의 길이의 미소변위로 생각해줄 수 있게 되는 것이고, 결과적으로 이 둘을 곱하면 미소면적 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq23.png">가 된다.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-17-Gaussian_Integral/pic2.png"> <br>
  그림 2. 극좌표계의 미소 면적
</p>

## 계속 적분을 수행해보자.

위의 두 과정을 생각하면 식(5)의 적분값은 다음과 같이 적어줄 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq24.png"> </p>

위 식은 아래와 같이도 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq25.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq26.png"> <br> 식 (11) </p>

[//]:# (식 11)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq27.png">로 치환해주자.

그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq28.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq29.png"> </p>

이므로, 식 (11)은 다음과 같이 바꿔 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq30.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq32.png"> </p>


위 결과는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq33.png">과 같으며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq34.png">의 값은 항상 양수이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-17-Gaussian_Integral/eq35.png"> </p>

임을 알 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/iLW-CgzA-NU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
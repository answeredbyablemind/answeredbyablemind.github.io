---
title: 순환행렬과 컨볼루션
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201125
tags: 선형대수 신호처리
---

# Prerequisites

본 포스트를 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [이산 시간 컨볼루션](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)

# cyclic permutation matrix 소개

치환행렬은 행의 순서를 바꿔주는 행렬이다.

다만, 우리가 이번 post에서 이용할 치환행렬은 cyclic permutation을 수행해주는 행렬이다. 

다시 말해, 어떤 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq1.png">에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq2.png"> </p>

cyclic permutation을 수행해준다는 것은 다음과 같은 연산이 수행된다는 것을 말한다. permutation 행렬을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq3.png">라고 할 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq4.png"> </p>

이러한 연산을 수행해주기 위해서는 다음과 같이 cyclic permutation 행렬이 정의되어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq5.png"> <br> 식 (3) </p>

[//]:# (식 3)

즉, 대각성분 바로 아래의 성분들(준대각선)의 값이 1이고 행렬의 가장 우상단의 값이 1이 되어야 한다.

cyclic permutation 행렬의 재밌는 점은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq6.png">를 두 번 적용시켜주면 행이 두 번 shift 된다는 점이다.

다시 말해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq7.png"> </p>

이다.

거기다가, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq8.png">을 직접 써보면 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq9.png"> <br> 식 (5) </p>

[//]:# (식 5)

행을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq10.png"> 번 shift 시켜주기 위해선 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq11.png"> 행렬을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq12.png"> 번 곱해줄 수 있다.

# 순환 행렬을 이용한 신호(벡터)의 분해

신호(벡터)의 분해를 생각하기 위해 신호의 분해의 기초가 되는 discrete unit sample function을 생각해보자. discrete unit sample function의 기호는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq13.png">로 쓰도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq14.png"> <br> 식 (6) </p>

[//]:# (식 6)

임의의 벡터에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq15.png"> <br> 식 (7) </p>

[//]:# (식 7)

즉, 식 (7)이 말하는 것은 어떤 벡터라도 표준정규기저에 상수배해준 것의 합으로 표현해줄 수 있음을 말하고 있다.

한편, 식 (7)의 임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq16.png">는 discrete unit sample function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq17.png">와 cyclic permutation matrix <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq18.png">를 이용해 다음과 같이도 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq19.png"> <br> 식 (8) </p>

[//]:# (식 8)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq20.png">라고도 쓸 수 있으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq21.png"> <br> 식 (9) </p>

[//]:# (식 9)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq22.png"> <br> 식 (10) </p>

[//]:# (식 10)

이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq23.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq24.png"> 등의 행렬을 직접 써서 다시 식 (10)을 써보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq25.png"> <br> 식 (11) </p>

[//]:# (식 11)

과 같이 쓸 수 있음을 알 수 있다.

여기서 식 (11)에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq26.png"> 앞에 곱해진 행렬을 일반적으로 **순환 행렬(circulant matrix)** 이라고 부른다.

앞으로는 순환행렬의 기호는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq27.png">로 쓸 것이며 식 (11)을 일반화해서 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq28.png"> </p>

## 순환행렬과 이산컨볼루션의 관계

신호처리 이론에서 Kronecker delta 함수는 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq29.png"> <br> 식 (13) </p>

[//]:# (식 13)

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic1.png">
  <br>
  그림 1. 크로네커 델타 함수
</p>

우리는 크로네커 델타 함수를 이용해 임의의 이산 신호를 다음과 같이 분해할 수 있음을 알 수 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-06-18-Discrete_Time_Convolution/pic3.png">
  <br>
  그림 2. 임의의 이산함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq30.png">는 크로네커 델타 함수를 이용해 분해해 생각할 수 있다.
</p>

이것을 수식으로 쓰면 아래와 같은데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq31.png"> <br> 식 (14) </p>

[//]:# (식 14)

또는 이렇게도 볼 수 있겠다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq32.png"> <br> 식 (15) </p>

[//]:# (식 15)

식 (15)는 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq33.png"> <br> 식 (16) </p>

[//]:# (식 16)

이 식에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq34.png">에 대해서만 생각해보면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq35.png"> <br> 식 (17) </p>

[//]:# (식 17)

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq36.png">에 대해 식 (16)을 다시 풀어 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq37.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq38.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq39.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq40.png"> </p>

과 같이 쓸 수 있는데, 식 (18)에서 식 (20)까지를 모두 합쳐서 행렬로 표현하면 다음과 같이 쓸 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq41.png"> </p>

이 식을 생각할 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq42.png">이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-25-permutation_and_circulant_matrix/eq43.png">의 주기를 갖는 주기함수라 보면 이것은 식 (11)에서 본 circulant matrix로 표현한 벡터의 분해와 같은 것이라 할 수 있다.

결론적으로 circulant matrix를 이용해 벡터를 표현하는 것은 신호처리 이론에서 컨볼루션을 이용해 신호를 분해하는 것과 같은 일을 해주는 것이라 할 수 있다.
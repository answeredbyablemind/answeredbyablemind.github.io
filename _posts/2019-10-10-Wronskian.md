---
title: 론스키안(Wronskian)과 함수의 선형 독립 판별
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20191010
tags: 선형대수
---

# 정의

우선 함수의 선형 독립이란 어떻게 정의[^1]되는지 알아보자.

[^1]: 이 꼭지의 정의들은 모두 Dennis G. Zill과 Michael R. Cullen의 Advanced Engineering Mathematics 3판에서 인용하였음.

DEFINTION 1. Linear Dependence/Independence 

A set of functions <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq1.png"> is said to be linearly dependent on an interval <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq2.png"> if there exist constants <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq3.png">, not all zero such that 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq4.png"> </p>

for every <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq5.png"> in the interval. If the set of functions is not linearly dependent on the interval, it is said to be linearly independent

즉, 다른 말로 하면 n개의 함수를 선형 결합시켜 우변에 0을 만들었을 때, 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq6.png">이 모두 0일 때 만 위의 식

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq7.png"> </p>

을 성립시킬 수 있다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq8.png">개의 함수들은 선형 독립이라고 할 수 있다.

이제 Wronskian은 어떻게 정의되는지 알아보자.

DEFINITION 2. Wronskian 

Suppose each of the functions <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq9.png"> possesses at leat <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq10.png"> derivatives. The determinant 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq11.png"> </p>

where the primes denote derivatives, is called the Wronskian of the function.

이 때, 론스키안 W가 0이 아닐 때 우리는 함수 집합 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq12.png">은 선형독립적이라고 말한다.

주의할 점은 론스키안 W가 0이라고 해서 해당 함수 집합이 항상 linearly dependent한 것을 의미하는 것은 아니라는 점이다.

# Wronskian과 선형 독립 판별

Wronskian의 아이디어를 이해하기 위해 다음의 과정을 생각해보자. 최소 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq13.png">까지의 미분계수를 갖는 함수 집합 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq14.png">에 대해서 다음의 식을 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq15.png"> </p>

이 식은 맨 처음 적었던 함수의 선형 결합이다. 조건에 따라 각각의 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq16.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq17.png">까지의 미분계수를 갖기 때문에 위 식은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq18.png">에 대해서 다음과 같이 미분 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq19.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq20.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq21.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq22.png"> </p>

이제 우리는 n개의 미지수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq23.png">에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq24.png">개의 연립방정식을 얻게 되었다. 그렇다면 위의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq25.png">개의 식을 다음의 행렬과 벡터의 곱으로 표현할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq26.png"> <br> 식 (8) </p>

[//]:# (식 8)

이제 모순을 이용한 증명(귀류법)을 통해 Wronskian을 이용하면 선형독립을 판별할 수 있다는 사실을 확인하자.

식 (8)에서 좌변의 왼쪽에 있는 행렬의 determinant는 론스키안 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq27.png"> 이다. 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq28.png">임에도 함수들이 linearly dependent하다고 가정해보자.

그렇다면 식 (8)에서 좌변의 왼쪽에 있는 행렬은 역행렬을 가진다는 의미가 되고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq29.png">의 유일한 해는 영벡터(zero vector)이다.

처음의 DEFINITION 1에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq30.png">의 유일한 해가 영벡터일 때 함수 세트 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq31.png">는 선형독립이라고 했으니 이는 명백한 모순이다. 

따라서 Wronskian이 0이 아니라면 함수 세트 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-10-10-Wronskian/eq32.png"> 는 항상 선형독립이다.

<p align = "center">

<iframe width="560" height="315" src="https://www.youtube.com/embed/XeDY_j-6vsw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</p>
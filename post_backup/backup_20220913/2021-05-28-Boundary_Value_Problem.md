---
title: 경계값 문제
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210528
tags: 미분방정식
---

# Prerequisites

경계값 문제에 대한 포스팅을 잘 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html)
* [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [2계 선형미분방정식의 해법](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html)
  
# 경계값 문제란?

지금까지 미분방정식의 해를 구할 때 우리는 초기값 문제를 가지고 해를 구했다. 초기값 문제는 쉽게 말해 어디서부터 미분방정식의 해(solution)의 성장을 진행시킬까에 관한 문제였다.

즉, 식으로 쓰자면 다음과 같은 조건이 주어진 경우에 문제를 풀 수 있는 것이다. 풀고자하는 미분방정식이 2계 미분방정식이라고 하면 초기 조건은 다음과 같은 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq1.png"> </p>

즉, 독립변수가 시간이라고 생각하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq2.png">가 위치에 관한 함수라고 하면 초기 위치와 초기 속도에 대한 값만을 가지고 이후의 궤적이 어떻게 될지를 생각해보는 문제라고 할 수 있다.

하지만, 어떤 경우에는 시작 시점과 종료 시점의 함수값 혹은 미분계수의 값이 주어지는 문제도 있을 수 있다.

가령, 로켓을 발사했을 때 처음 위치와 시점을 가지고 이후의 궤적을 구하는 것이 아니라 처음 발사 시점의 위치와 도달 위치를 정확하게 알고 있는 경우의 중간 과정이 어떻게 되어야 할지를 푸는 문제에서는 시작 시점과 종료 시점의 함수값이 주어져야 한다.

이런 문제를 경계값 문제라고 하며 경계값 문제에 해당하는 조건은 다음과 같은 네 가지 경우 중 하나이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq3.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq4.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq5.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq6.png"> </p>

즉, 시작 시점(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq7.png">)과 종료 시점(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq8.png">)에서의 함수값 혹은 미분계수의 값이 조건으로 주어진 것이며 이 조건을 우리는 경계 조건(boundary condition)이라고 한다.

경계값 문제는 초기값 문제보다 더 풀기가 어렵고, 이에 관한 내용은 매우 방대하다.

그러나 지금 우리는 경계값 문제가 초기값 문제와 어떻게 다른지에 대해 간단히 시각적으로 확인해보고자 한다.

# 시각적 설명

## 초기값 문제와 경계값 문제의 시각적 비교

아래와 같은 2계 선형미분방정식을 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq9.png"> </p>

이 미분방정식은 [2계 선형미분방정식의 해법](https://angeloyeo.github.io/2021/05/27/second_order_ODE.html) 편에서 보았던 것 처럼 아래와 같은 연립 미분방정식으로 바꿔 풀수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq10.png"> <br> 식 (7) </p>

[//]:# (식 7)

만약 여기서 아래와 같은 두 가지 경우를 생각해보자. 하나는 초기 조건(Initial Condition)이 주어진 경우이고 또 다른 하나는 경계 조건(Boundary Condition)이 주어진 경우이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq11.png"> <br> 식 (8) </p>

[//]:# (식 8)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq12.png"> <br> 식 (9) </p>

[//]:# (식 9)

그림으로 그리자면 식 (7)을 가지고 표현할 수 있는 방향장에 대해 식 (8)과 식 (9)는 아래의 그림 1과 같은 세팅을 하게 되는 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic1.png">
  <br>
  그림 1. 초기값 문제와 경계값 문제의 비교
</p>

생각해보면 초기값 문제는 시작점으로부터 주어진 방향을 따라 solution curve를 그려나가면 되지만, 경계값 문제는 정해진 시점에 맞춰진 함수값을 갖는 정확한 함수를 알아내야 하므로 초기값 문제보다 경계값 문제가 더 어렵게 보인다.

초기값 문제에 대한 solution curve들은 많이 구해봤으니 식 (9)로 주어진 경계값 문제에 대한 solution curve를 그려보면 아래의 그림과 같이 구할 수 있다 (MATLAB의 bvp4c solver를 이용해 plot).

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic2.png">
  <br>
  그림 2. 주어진 경계값 문제에 대한 solution curve
</p>

## 경계값 문제의 해 유도(analytic solution)

해석적으로 미분방정식의 해를 구해내는 관점에서 보면 경계값 문제든 초기값 문제든 별반 다를게 없어 보이긴 한다.

아래와 같이 얻어진 일반해에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq13.png"> </p>

경계값 조건을 대입하면 아래와 같은 식을 얻을 수 있다. 

경계값 조건은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq14.png">에 해당되는 값들만 주어진 것이므로 위 식에서 1행에 해당되는 값에 대해서만 조건을 적용하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq15.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq16.png"> </p>

이 두 식은 아래와 같은 연립방정식을 푸는 것과도 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq17.png"> </p>

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq18.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq19.png">는 아래와 같이 결정되고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq20.png"> </p>

해석적으로 구한 solution curve의 식은 다음과 같다. 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq21.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq22.png">와 같은 방법으로 결정되었다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-28-Boundary_Value_Problem/eq23.png"> </p>

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-28-Boundary_Value_Proglem/pic3.png">
  <br>
  그림 3. 주어진 경계값 문제에 대한 solution curve
</p>

이 솔루션 커브는 그림 2에 그려진 ODE solver를 이용해 그려본 curve와 거의 유사한 형태를 띄고 있음을 알 수 있다.
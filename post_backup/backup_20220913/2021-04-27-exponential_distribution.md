---
title: 지수 분포
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210427
tags: 통계학
---

<center>
  <iframe width = "500" height = "500" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-27-exponential_distribution/"></iframe>
  <br>
  파라미터 λ를 수정해가며 다양한 경우의 지수 분포의 생김새에 대해 확인해보자. 
  <br>
  지수분포에서 x 축에 있는 t가 갖는 것은 어떤 의미일까? 
  <br>
  그리고 지수 분포의 형태가 의미하는 것을 설명할 수 있는가?
  <br>
  <br>
</center>

# Prerequisites

지수 분포를 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [포아송 분포](https://angeloyeo.github.io/2021/04/26/Poisson_distribution.html)

# 지수 분포의 정의

지수분포의 확률밀도함수는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq1.png"> </p>

로 정의된다. 

사건이 서로 독립적일 때, 일정 시간동안 발생하는 사건의 회수가 포아송 분포를 따른다면, 다음 사건이 일어날 때 까지 대기 시간은 지수 분포를 따른다.

# 지수 분포의 쓸모

지수 분포는 포아송 분포와 밀접한 관련이 있다.

포아송 분포가 어떤 것이었는지 다시 생각해보자.

포아송 분포는 단위 시간동안 어떤 사건이 평균적으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq2.png">회 발생한다고 했을 때, 단위시간동안 사건이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq3.png">번 일어날 확률에 대한 분포를 지칭하고 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq4.png"> </p>

그럼, 여기서 우리가 생각해볼 수 있는 것은 이런 사건이 처음 일어나는 떄 까지 걸리는 시간이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq5.png"> 시간 이하일 확률은 얼마인지에 관한 문제이다.

이 문제는 산업에서 굉장히 중요한 질문일 수 있다. 가령, 드물게 환자가 오는 보건소에서 첫 번째 환자가 올 때 까지 걸리는 시간이 5시간 이하일 확률? 과 같은 문제에 대해 확률적으로 정확하게 접근할 수 있는 것이다.

그러니까, 다섯 시간 안에 첫번째 환자가 올까? 라는 질문에 대한 답이 될 수 있는 것이다.

아니면, 교통 사고에 대한 문제라던지, 첫 번째로 등록할 고객이 언제쯤 올 수 있을까? 라던지 등의 문제 말이다.

# 지수 분포의 유도

만약 위에서 설명한 분포가 있다고 하고 이 분포(즉, 확률밀도함수)를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq6.png">라고 한다면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq7.png"> 단위시간에 첫 사건이 일어날 확률은 다음과 같이 구해지는 것이어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq8.png"> </p>

한편, 포아송 분포를 이용해 위 문제를 풀기 위해선 여사건을 이용하는 것이 좋은 접근일 수 있다.

포아송 분포를 이용해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq9.png"> 단위시간동안 사건이 일어나지 않을 확률을 계산해서 전체 확률값(1)에서 빼주면 그 결과가 바로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq10.png">시간만에 해당 사건이 일어날 확률이기 때문이다.

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq11.png">이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq12.png">번 일어날 확률은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq13.png">을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq14.png">번 곱해서 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq15.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq16.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq17.png">승을 의미한다.

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq18.png"> 시간만에 해당 사건이 일어날 확률은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq19.png"> </p>

이다.

다시 말하면,

그런데, 지수 분포라고 할 수 있을만한 확률밀도함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq20.png">를 이용해 계산한 확률은 식(2)와 같으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq21.png"> </p>

와 같은 관계를 갖는다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq22.png"> </p>

와 같은 분포가 지수 분포이다.

# 지수 분포 예시 문제

## 문제 1.

어느 산골짜기 보건소에는 환자가 자주 오지 않아서 한산하다. 하루 평균 3명의 환자가 내원한다고 했을 때, 첫 번째 환자가 5시간안에 내원할 확률은?

### 문제 1의 Solution

하루 평균 3명의 환자가 내원한다고 했으니 1시간 마다 3/24명의 환자가 내원한다고 볼 수 있다.

따라서, 이 경우 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq23.png"> </p>

와 같은 지수분포를 따르는 경우이다.

따라서, 5시간 안에 첫 번째 환자가 내원할 확률은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-04-27-exponential_distribution/eq24.png"> </p>

즉, 46% 확률로 5시간 안에 첫 환자가 내원할 수 있다.
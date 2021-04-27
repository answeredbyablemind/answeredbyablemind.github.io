---
title: 기하 분포
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210428
tags: 통계학
---

<center>
  <iframe width = "500" height = "500" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-28-geometric_distribution/"></iframe>
  <br>
  파라미터 p를 수정해가며 다양한 경우의 기하 분포의 생김새에 대해 확인해보자. 
  <br>
  기하 분포에서 x 축에 있는 k가 갖는 것은 어떤 의미일까? 
  <br>
  그리고 기하 분포의 형태가 의미하는 것을 설명할 수 있는가?
  <br>
  <br>
</center>

# Prerequisites

기하 분포를 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [이항 분포](https://angeloyeo.github.io/2021/04/23/binomial_distribution.html)

# 기하 분포의 정의

기하 분포는 성공 혹은 실패의 두 가지 경우의 수로 구성된 시행을 연달아 수행 시 처음 성공할 때 까지 시도한 횟수 $k$에 대한 분포이다.

성공 확률이 $p$인 시행에 대해 $k$번 시행 후 첫번째 성공을 얻을 확률은

$$P(K=k) = (1-p)^{k-1}p$$

여기서 $k = 1, 2, 3, \cdots $이다.

여기서 잘 보면 확률값 $P(K=k)$의 수열은 $(1-p)$를 매 항마다 계속해서 곱해나가는 수열이므로 등비 수열이 되는데,

등비 수열의 또 다른 이름이 기하 수열(geometric sequence)이다보니 이 분포는 기하 분포라는 이름을 얻었다.

# 기하 분포의 형태



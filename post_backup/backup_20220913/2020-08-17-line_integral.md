---
title: 벡터장의 선적분
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200819
tags: 미적분학
---


<p align = "center"><a href="https://commons.wikimedia.org/wiki/File:Line_integral_of_vector_field.gif#/media/파일:Line_integral_of_vector_field.gif"><img src="https://upload.wikimedia.org/wikipedia/commons/b/b0/Line_integral_of_vector_field.gif" alt="Line integral of vector field.gif"></a>
  <br>
  선적분은 주어진 벡터장에 대해 지나간 경로를 따라 한 일을 구하는 문제와 같다.
  <br>
  그림 출처: Wikipedia, 벡터장의 선적분
</p>

# 물리학에서의 일(Work)

선적분의 개념을 적용하기에 가장 유용한 개념은 물리학에서의 "일"이다.

물리학에서 일은 다음과 같이 정의한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq1.png"> </p>

아래의 그림 1을 통해 철수가 한 일을 수식으로 표현하면 다음과 같이 생각할 수 있따.

철수가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq2.png">라는 힘으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq3.png"> 만큼의 거리를 이동했을 때 철수가 한 일은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq4.png">이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-17-line_integral/pic1.png">
  <br>
  그림 1. 철수가 수레를 끌며 한 일은 힘과 이동거리를 곱한 만큼의 값이다.
  <br>
  그림 출처: EBS
</p>

그런데, 만약 철수가 수레를 밀 때 앞으로 똑바로 밀지 않고 어느정도의 각도를 가지고 윗쪽 사선 방향으로 밀어줬다고 생각해보자.

이럴 때는 수평면과 힘 벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq5.png">)와의 각도가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq6.png">라고 했을 때 아래와 같이 이동 거리와 관련된 방향 벡터와 내적하여 다음과 같이 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq7.png"> </p>

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-17-line_integral/pic2.png">
  <br>
  그림 2. 철수가 수레를 끌 때 수평면으로 똑바로 밀지 않고 비스듬하게 밀었을 때 철수가 수레를 끌며 한 일은 벡터의 내적으로 계산할 수 있다.
  <br>
  그림 출처: EBS
</p>

## 조금 더 복잡한 경로에 대해서...

이번엔 철수가 전체 거리를 이동하는 동안 세 번으로 나눠서 일을 다르게 했다고 생각해보자.

다시 말해, 아래의 그림 3과 같이 전체 이동 거리 중 세 개의 구간에서 사용한 힘의 크기가 서로 달랐거나, 힘을 준 각도가 서로 달랐을 경우를 상정해보자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-17-line_integral/pic3.png">
  <br>
  그림 3. 이동 경로를 세 구간으로 나누어 각 구간에서 한 일을 합치면 전체 구간에서 한 일을 구할 수 있다.
</p>

그러면 이 때 철수가 전체 이동 경로에서 해준 일은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq8.png"> </p>

그럼 이번엔 경로를 조금만 더 복잡하게 만들어 생각해보자.

그림 4와 같이 검은 실선으로 표현된 구불 구불한 경로에서 한 일을 계산하려면 빨간 점선으로 나타낸 것과 같이 직선적으로 여러 구간으로 경로를 나눈 뒤 각 경로에서 한 일을 모두 더해주면 된다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-17-line_integral/pic4.png">
  <br>
  그림 4. 좀 더 구불구불하게 복잡한 경로에서 한 일을 계산하기 위해선 구간별로 잘게 잘라 각 구간에서 일한 일(Work)을 합하면 된다.
</p>

그림 4에서 표현하고 있는 일의 양을 수식으로 표현해주면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq9.png"> <br> 식 (4) </p>

[//]:# (식 4)

식 (4)와 같이 일을 계산할 때 경로를 무수하게 많이 쪼개려면 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq10.png"> </p>

이 값을 우리는 line integral이라고 정의할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq11.png"> </p>

# line integral

보통은 line integral을 표기할 때 식 (6)에서 사용한 적분인자(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq12.png">)를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq13.png">로 많이 쓴다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq14.png"> </p>

실제 문제에서는 그림 4에서 보는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq15.png">들이 벡터장으로 주어지며 벡터장은 다음과 같이 보통 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq16.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq17.png">는 힘(Force)이 아니라 장(Field)를 의미하며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq18.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq19.png">는 모든 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq20.png"> 좌표에서의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq21.png"> 성분과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq22.png">성분을 각각 의미한다.

또, 이동 경로로 표시한 curve는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq23.png">처럼 주어질 수도 있고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq24.png"> 혹은 아래와 같은 매개변수 방정식으로 주어질 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq25.png"> </p>

# 예시 문제 풀이

벡터장이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq26.png">로 주어져 있을 때, 아래의 경로를 따라 한 일의 양을 구하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq27.png"> </p>

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-17-line_integral/pic5.png">
  <br>
  그림 5. 예시 문제의 벡터장과 이동 경로
</p>

우리가 구하려는 적분값은 다음과 같은데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq28.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq29.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq30.png">방향으로의 성분 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq31.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq32.png">방향으로의 성분 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq33.png">의 합으로 표현할 수 있으므로 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq34.png"> </p>

따라서 주어진 벡터장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq35.png">와 내적해 생각하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq36.png"> </p>

여기서 경로는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq37.png">로 주어져 있으므로 위 식에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq38.png">를 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq39.png"> </p>

따라서, 선적분 값은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-17-line_integral/eq40.png"> </p>

임을 알 수 있다.


<p align = "center">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Z4RaVEQTKuY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>

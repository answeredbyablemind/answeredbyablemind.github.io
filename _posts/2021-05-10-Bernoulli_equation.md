---
title: 베르누이 미분방정식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210510
tags: 미분방정식
---

이전 포스팅 [1계 선형 미분 방정식의 해법](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html) 편에서는 아래와 같은 미분방정식의 해법을 찾는 방법에 대해 다룬 바 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq1.png"> <br> 식 (1)  </p>

[//]:# (식 1)

이번 시간에는 위 식 (1)이 약간 변형된 비선형 미분 방정식 중 하나인 베르누이 미분방정식의 해법에 대해 알아보고자 한다.

# 베르누이 미분방정식의 형태

베르누이 미분방정식의 형태는 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq2.png"> <br> 식 (2) </p>

[//]:# (식 2)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq3.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq4.png">는 우리가 분석하고자하는 구간에서 연속함수이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq5.png">은 실수라고 하자.

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq6.png">이거나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq7.png">이면 선형미분 방정식이 되는 경우이므로 베르누이 미분방정식에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq8.png">이거나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq9.png">이 아닌 경우에 관심이 있는 경우라고 할 수 있다.

# 베르누이 미분방정식의 해법

베르누이 미분방정식의 해법의 핵심은 식 (2)의 비선형적인 방정식을 선형적인 형태로 바꿔주는 것이다.

이를 위해 식 (2)의 양변을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq10.png">으로 나눠보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq11.png"><br> 식 (3)  </p>

[//]:# (식 3)

이제 식 (3)을 식 (1)과 유사한 형태로 바꿔주기 위해 식 (3)의 좌변에 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq12.png">을 새로운 함수인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq13.png">으로 바꾼다고 생각해보자.

여기서 확인해볼 수 있는 것 중 하나는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq14.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq15.png">에 대해 미분한 결과인데, chain rule을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq16.png">의 우변에 적용하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq17.png"> </p>

이다.

따라서, 식 (3)은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq18.png"> </p>

다시 말하면, 베르누이 미분방정식에 치환을 적절히 적용하면 일반적인 [1계 선형미분방정식](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)으로 바꿔줄 수 있게 된다.

# 예제

여타 미분방정식처럼 예제 문제를 풀어보는 것이 베르누이 미분방정식의 해를 구하는 방법을 이해하는데 도움이 될 것으로 보인다.

## 문제 1

다음 미분방정식의 해를 구하여라.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq19.png"> <br> 식 (6) </p>

[//]:# (식 6)

### 풀이

주어진 식은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq20.png">인 베르누이 미분방정식이다. 여기서 식 (6)의 양변을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq21.png">로 나눠주자.

그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq22.png"> <br> 식 (7) </p>

[//]:# (식 7)

이다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq23.png">라 두면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq24.png"> </p>

이다. 그러므로 식 (7)은 다음과 같이도 쓸 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq25.png"> </p>

여기서 양변에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq26.png">을 곱해주면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq27.png"> <br> 식 (10) </p>

[//]:# (식 10)

이다.

여기서부터는 1계 선형미분방정식의 해를 찾는 방법을 이용하여, 양변에 적분 인자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq28.png">를 곱해주자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq29.png">이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq30.png">이므로 적분인자는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq31.png">이다.

따라서, 식 (10)의 양변에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq32.png">를 곱해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq33.png"> <br> 식 (11) </p>

[//]:# (식 11)

가 되고, 식 (11)은 다음과 같이 변형할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq34.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq36.png"> </p>

원래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq37.png">라고 하였으므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-10-Bernoulli_equation/eq38.png"> </p>

이다.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Fluz6bjmgm8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
---
title: $\int x^{dx}-1=$?
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200901
tags: 미적분학
---

※ 이 포스팅은 Quora의 글 중 [What is <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq1.png"> </p>?](https://www.quora.com/What-is-int-x-dx-1)의 Oden Petersen의 답변을 재구성한 것입니다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq2.png"> </p>

이 수식을 보자마자 "장난치는건가?" 싶은 생각이 들었다.

전혀 익숙한 형태의 수식이 아닐 뿐더러 보통 적분을 계산할 때는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq3.png">를 적분 맨 뒤에 써다 주는 것이 관례적이라고 생각했기 때문일지도 모른다.

하지만, 리만 적분의 본래 의미를 생각해본다면 이 적분 값은 정당한 결과를 가져온 다는 것을 알 수 있을 것이다.

본 포스팅을 작성하는 이유는 적분 기호들의 원래적 의미에 다시 한번 집중해서 그 본질적 의미를 탐구했으면 한다는 Oden Petersen의 가르침을 공유하기 위함이다.

또한, 이 문제를 풀면서 적분의 본래적 의미 뿐만 아니라 미분 계수의 의미와 부분적분에 대해서도 생각해야 하기 때문에 미적분학의 기초를 다시끔 생각해볼 수 있게 하는 충실한 예시가 될 수 있을 것으로 생각한다.

# 리만 적분의 본래적 의미

리만 적분은 임의의 함수 아래의 면적을 계산하는데 사용된다.

아래의 그림 1에서 처럼 임의의 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq4.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq5.png">로 둘러싸인 영역의 면적을 계산하는데 리만 적분이 사용될 수 있다.

아래의 그림 1의 면적을 계산한다고 하면 이런 식으로 수식으로 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq6.png"> </p>

우리는 인테그랄 기호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq7.png">와 미소변위 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq8.png">를 그저 기호로만 생각할 뿐 본래 의미에 대해 간과하는 경우가 종종 있다.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/f/f2/Integral_as_region_under_curve.svg">
  <br>
  그림 1. 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq9.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq10.png">의 구간에 대한 면적 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq11.png">
  <br>
  출처: <a href = "https://en.wikipedia.org/wiki/Riemann_integral" target="_blank"> 위키피디아, 리만 적분</a>
</p>

하지만, 리만 적분의 본래적 의미는 무엇인가?

리만 적분은 정의역 구간을 작은 구간으로 잘게 나눠 각각의 작은 구간 위의 넓이를 직사각형의 넓이를 통해 근사하는 것이다.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/2/28/Riemann_integral_regular.gif">
  <br>
  그림 2. 리만 적분은 특정 구간 내에서 규칙적으로 구간을 분할하여 사각형의 면적 합을 계산하는 과정이라고 할 수 있다. <br> 맨 위의 숫자는 함수의 적분으로 수렴되는 사각형의 총 면적을 나타냄.
  <br>
  출처: <a href = "https://en.wikipedia.org/wiki/Riemann_integral" target="_blank"> 위키피디아, 리만 적분</a>
</p>

즉, 리만 적분의 원래 의미를 수식으로 쓰면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq12.png"> </p>

즉, 적분기호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq13.png">는 본래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq14.png">에서 부터 나왔으며 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq15.png">는 매우 작아지는 직사각형의 밑변의 길이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq16.png">를 의미하는 것이다.


# 본격적인 풀이

이제, 리만 적분의 의미를 생각하면서 아래의 식을 풀어가보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq17.png"> </p>

위 식에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq18.png">를 분자 분모에 곱해도 이 식의 결과는 영향을 받지 않는다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq19.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq20.png">에 대해 따로 떼어 놓고 생각해보자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq21.png">는 무한히 작아지는 값이므로 아래와 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq22.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq23.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq24.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq25.png"> 이라고 생각하면 다음과 같은 형태로 바꿔 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq26.png"> </p>

즉, 이 식은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq27.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq28.png">에 대한 미분계수를 의미하며, 특히 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq29.png">일 때의 미분 계수 값을 묻고 있는 것이다. (<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq30.png">에 대한 미분계수를 말하는 것이 아님에 주의하자.)

다시 말해 수식으로 쓰자면 아래와 같이 쓸 수 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq31.png"> </p>

지수함수에 대한 미분을 생각하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq33.png"> </p>

이다.

즉, 원래의 식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq34.png"> </p>

으로 쓸 수 있다.

여기서는 부분적분을 이용하면 위 부정적분을 계산할 수 있다.

부분적분의 공식은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq35.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq36.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq37.png">로 놓으면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq38.png">이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq39.png">이다.

따라서, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq41.png"> </p>

인 것을 알 수 있다. (여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-01-int_x_to_the_dx_minus_1/eq42.png">는 적분 상수)

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/bRKGnzHkmzo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
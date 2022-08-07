---
title: 오일러-코시 미분방정식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210607
tags: 미분방정식
---

# Prerequisites 

이 포스팅의 내용에 대해 잘 알기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html)

# 오일러-코시 미분방정식 소개

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq1.png">계 오일러 코시 미분방정식은 아래와 같은 형태를 띄는 미분방정식을 말한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq2.png"> </p>

2계 오일러-코시 미분방정식은 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq3.png"> <br> 식 (2) </p>

[//]:# (식 2)

2계 오일러-코시 미분방정식을 보면 이 미분방정식은 선형 미분방정식이지만 미분계수 앞에 붙은 값들이 상수가 아니기 때문에 일반적으로 사용하는 2계 선형미분방정식의 해법을 바로 적용하기는 어려운 면이 있다.

## 연산자의 선형성 확인

오일러 코시 미분방정식이 선형 미분방정식인 것을 확인해보기 위해선 아래의 절차를 거치면 된다.

오일러 코시 미분방정식의 미분연산자는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq4.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq5.png"> </p>

임을 확인해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq6.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq7.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq8.png"> </p>

따라서 오일러-코시 미분방정식은 선형미분방정식이다.

## 해를 구하는 방법 (1)

만약 오일러-코시 미분방정식이 제차 미분방정식인 경우에는 다음과 같이 식을 구하면 편하다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq9.png">의 형태를 띌 것이라 가정하는 것이다. 이렇게 하는 이유는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq10.png">으로 두면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq11.png">를 두번 미분한 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq12.png">가 되는데 그와 동시에 바로 앞에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq13.png">이 붙어 있으므로 두 번 미분해줘서 승수를 낮춰준 것이 상쇄되는 효과를 보인다고 생각할 수 있기 때문이다.

거듭해서 얘기하지만 미분방정식을 풀 때는 그 미분방정식이 유일해를 가진다고 판단되면 방법이 어떻든 간에 풀어내기만 하면 그것이 정답이다. 미분방정식의 해법은 그래서 아이디어 싸움이다보니 풀이법도 중구난방이다.

어찌되었든 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq14.png">이라고 가정한 것을 원래의 식 (2)에 대입하되, 제차 미분방정식의 꼴로 미분방정식을 생각해주면 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq15.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq16.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq17.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq18.png">일 때 공통인자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq19.png">을 제거하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq20.png"> </p>

이 된다.
 
따라서, 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq21.png">에 따라 미분방정식의 해를 구할 수 있게 되는 것이다.

## 해를 구하는 방법 (2)

또 다른 오일러-코시 미분방정식을 풀기 위한 방법은 아래와 같이 치환법을 이용하는 것이다.

이 방법은 비제차 오일러-코시 미분방정식을 풀어야 할 때 유용하게 사용할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq22.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq23.png"> </p>

그러면 미분계수는 다음과 같이 치환 가능하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq24.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq25.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq26.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq27.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq28.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq29.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq30.png"> </p>

따라서, 원래의 식 (2)는 다음과 같이 바뀐다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq33.png"> </p>

이제부터 위 식은 선형 2계 미분방정식을 풀어주는 방법을 도입해서 풀이할 수 있다.

이 결과는 방법 (1)과 같은 결과를 보여주는 것을 알 수 있다. 다만, 비제차 항을 처리할 방법이 생긴다는 점에서 방법 (1)과 다른 점이 있다.

# 예시

## 문제 1.

아래의 미분방정식의 해를 구하시오.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq34.png"> </p>

### 해법

우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq35.png">이라는 해를 가질 것이라 가정하고 문제를 풀어보자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq36.png">을 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq37.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq38.png">이 해가 되기 위해선 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq39.png">이라는 조건은 피해야만 한다. 이 조건을 제외했을 때 솔루션 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq40.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-07-Euler_Cauchy/eq41.png"> </p>

임을 알 수 있다.
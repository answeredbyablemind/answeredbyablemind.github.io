---
title: 스토크스의 정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200822
tags: 미적분학
---

# prerequisites

스토크스 정리를 이해하기 위해선 다음의 내용에 대해 알고 오는 것이 좋습니다

* [그린 정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)
* [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)
* [벡터장의 회전](https://angeloyeo.github.io/2019/08/25/curl.html)

특히, [그린 정리의 의미 설명 부분](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#curl%EC%9D%84-%ED%86%B5%ED%95%9C-%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A7%81%EA%B4%80%EC%A0%81-%EC%9D%B4%ED%95%B4)에 대해서는 꼭 알고 오시는 것을 추천드립니다.

# 스토크스 정리의 수식

스토크스 정리의 수식을 써보자면 다음과 같다.

$$\oint_c\vec{F}\cdot d\vec{r} = \iint_S(\vec{\nabla}\times\vec{F})\cdot d\vec{S}$$

식 (1)을 놓고 잘 생각해보면 그린정리의 수식과 매우 유사하다는 것을 알 수 있다. 그린정리의 수식은 다음과 같았다.

$$\oint_c\vec{F}\cdot d\vec{r} = \iint_A(\vec{\nabla}\times\vec{F})_{2D} dA$$

여기서 $(\vec{\nabla}\times\vec{F})_{2D}$는 2D curl이라는 의미로, 수식은 curl의 수식과 같으나 2차원에서 더 이상 $\hat k$방향으로 표시할 벡터가 없어 curl의 크기만 사용하겠다는 의미이다.

식 (1)과 식 (2)를 비교해보면 그린 정리는 선적분과 중적분 간의 관계에 대해 설명해주고 있는 반면, 스토크스 정리는 선적분과 면적분 간의 관계에 대해 설명해주고 있다고 할 수 있다.

스토크스의 정리는 그린 정리의 3차원 버전이라고 할 수 있다. [일반적인 스토크스 정리](https://en.wikipedia.org/wiki/Stokes%27_theorem)는 더 고차원 다양체에 대해 다룰 수 있다고 하지만, 우리는 우리가 필요한 3차원 정도의 수준에서 이해와 증명을 해보도록 하자.

# 스토크스 정리의 의미

아래와 같이 어떤 벡터장 위에 넓이를 갖는 곡면 S과 그 가장 외각의 폐곡선 C가 있다고 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic1.mp4">
  </video>
  <br>
  그림 1. 3차원 공간 위에 임의의 곡면 S와 폐곡선 C를 가정해보자.
</p>

이 때, 이 3차원 공간에 벡터장 $\vec{F}$가 주어져 있다고 하면 스토크스 정리에 의해 아래의 식이 성립한다.

$$\oint_C\vec{F}\cdot d\vec{r} = \iint_S(\vec{\nabla}\times\vec{F})\cdot d \vec{S}$$

식 (3)의 좌변은 curve C를 따라 벡터장에 대해 선적분한 것이다.

이제 식 (3)의 좌변으로부터 식(3)의 우변을 유도해보자. 곡면 $S$를 아래와 같이 반으로 쪼개서 보도록 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic2.mp4">
  </video>
  <br>
  그림 2. 곡면 S를 두 개의 페곡선으로 나누어 표현한 것.
</p>

위 그림 2를 위쪽에서 조감해보면 아래와 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic3.png">
  <br>
  그림 3. 곡면 S를 2개의 폐곡선으로 나누었을 때의 선적분 경로
</p>

그림 3에서 보면 두 개로 쪼개진 닫힌 경로를 각각 $C_1$, $C_2$라고 하였다.

또한, $C_1$과 $C_2$의 선적분 경로를 잘 생각해보면 가운데 있는 구간에서는 선적분 경로의 길이는 같으나 길이는 반대이므로 이 영역에서는 선적분의 값이 상쇄된다.

따라서, 우리는 다음과 같은 관계를 생각할 수 있다.

$$\oint_C\vec{F}\cdot d\vec{r} = \oint_{C_1}\vec{F}\cdot d\vec{r} + \oint_{C_2}\vec{F}\cdot d\vec{r}$$

이번엔 아래와 같이 곡면 $S$를 4등분 해보자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic4.mp4">
  </video>
  <br>
  그림 4. 곡면 S를 네 개의 페곡선으로 나누어 표현한 것.
</p>

위 그림 4를 위쪽에서 조감해보면 아래와 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic5.png">
  <br>
  그림 5. 곡면 S를 2개의 폐곡선으로 나누었을 때의 선적분 경로
</p>

앞서 곡면을 두 개로 쪼갰을 때와 마찬가지의 논리로 내부의 경로에서는 선적분 시 길이는 같고 방향은 반대이므로 $C_1$에서 $C_4$까지의 네 개의 닫힌 경로에 대한 선적분을 모두 더해주면 기존의 최외각 경로에 대한 선적분의 값과 같아진다.

$$\oint_C\vec{F}\cdot d\vec{r} = \sum_{k=1}^4\oint_{C_k}\vec{F}\cdot d\vec{r}$$

그렇다면 곡면 $S$를 $N$ 등분하면 어떻게 될까?

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-22-stokes_theorem/pic6.mp4">
  </video>
  <br>
  그림 6. 곡면 S를 많은 페곡선으로 나누어 표현한 것.
</p>

지금까지의 논리와 같이 아무리 많은 폐곡선으로 쪼개더라도 아래의 식이 성립하게 된다.

$$\oint_C\vec{F}\cdot d\vec{r} = \sum_{k=1}^N\oint_{C_k}\vec{F}\cdot d\vec{r}$$


<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/O1PrrBpbVjo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/6SanOG3cSjA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
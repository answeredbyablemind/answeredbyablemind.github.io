---
title: 고윳값과 고유벡터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190717
tags: 선형대수
---

<p align="center">
  <iframe width = "380" height = "380" src="https://angeloyeo.github.io/p5/2019-07-17-preview_eigshow/" frameborder = "0"></iframe>
  <br>
  <b>
  고유벡터와 고윳값이 물어보는 것:
  <br>
  “벡터 x에 어떠한 선형변환 A를 했을 때, 그 크기만 변하고 원래 벡터와 평행한 벡터 x는 무엇인가요?”
  <br>
  “그렇다면, 그 크기는 얼마만큼 변했나요?”
  </b>
</p>


# 벡터에 행렬 연산을 취해준다는 것은?

행렬은 선형 변환 연산이다. '선형'이라는 말이 어렵게 들릴 수 있으니, 일단 변환이라고 하자. 무엇을 변환시켜 준 것일까? 행렬은 벡터를 변환시켜 다른 벡터를 출력해준다[^1].

<p align = "center">
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic1.png">
<br>
그림 1. 행렬은 벡터를 변환시켜주는 연산자이다.
</p>

그림 1에서 볼 수 있듯이 행렬을 이용해 벡터를 변환 시켜 주면, 변환 후의 벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq1.png">)는 변환 전의 벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq2.png">)와 비교했을 때, 크기도 방향도 모두 변할 수 있다. 아래의 애플릿을 이용해 임의의 벡터와 행렬을 이용한 선형 변환 결과를 확인해보자.

<p align="center">
<iframe width = "370" height = "450" src="https://angeloyeo.github.io/p5/2019-07-17-eig_applet1/" frameborder="0"></iframe>
</p>

# 고윳값과 고유벡터의 의미

그림 1과 위 애플릿이 말하는 것은, 벡터에 행렬 연산을 취해주면 원래 것과 다른 벡터가 나온다는 것이었다. 그런데, 특정한 벡터와 행렬은 선형 변환을 취해주었을 때, 크기만 바뀌고 방향은 바뀌지 않을 수도 있다[^2]. 예를 들어, 위의 애플릿에서 vector에는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq3.png"> </p>

을 입력으로 넣어주고, matrix에는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq4.png"> </p>

를 입력으로 넣어준 뒤 결과를 확인해보자.


<p align = "center">
<img width = "300" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic2.png">
<br>
그림 2. 어떤 벡터와 행렬은 변환시키면 평행하지만 크기만 바뀐 벡터를 출력한다.
</p>

즉, 입력 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq5.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq6.png">로 선형변환 시킨 결과(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq7.png">)가 상수배라는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq8.png"> </p>

<p align = "center">
<img width = "300" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic3.png">
<br>
그림 3. 어떤 벡터와 행렬은 변환시키면 평행하지만 크기만 바뀐 벡터를 출력한다.
</p>


# 고윳값, 고유벡터의 정의

임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq9.png"> 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq10.png"> 에 대하여, 0이 아닌 솔루션 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq11.png"> 가 존재한다면 숫자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq12.png"> 는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq13.png"> 의 고윳값라고 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq14.png"> <br> 식 (2) </p>

이 때, 솔루션 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq15.png"> 는 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq16.png"> 에 대응하는 고유벡터이다.


이 때, 식 (2)는 행렬의 성질에 의해서 다음과 같이 바꿀 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq17.png"> <br> 식 (3) </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq18.png"> 는 identity matrix이다.

여기서 식 (3)이 성립하기 위한 조건은 두 가지인데 괄호 안의 식이 0이 되는 경우와  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq19.png">인 경우이다. 첫 번째 조건만 성립하는 경우라면 우리는 적절한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq20.png">와 0이 아닌 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq21.png">를 구할 수 있겠지만, 두 번째 조건이 만족되는 경우에는 아무런 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq22.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq23.png">이라는 솔루션을 얻게 된다.

따라서, 식 (3)의 괄호안에 있는 식으로 부터 얻는 행렬은 역행렬을 가지지 않아야만 아무런 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq24.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq25.png">라는 'trivial solution'을 얻게되는 결과를 피할 수 있다. 따라서, 가 nontrivial solution을 가지기 위한 필요충분 조건은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq26.png"> </p>

이다.

# 예시를 통한 고유벡터와 고윳값 계산하기

다음과 같은 행렬 A를 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq27.png"> </p>


이 행렬에 대해 고윳값과 고유벡터를 구해보도록 하자.

고윳값과 고유벡터의 정의에 따라, 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq28.png">와 고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq29.png">는 다음과 같은 식을 만족한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq30.png"> </p>

그러므로, 행렬의 성질에 의해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq31.png">이다. 또한, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq32.png">가 nontrivial solution을 갖기 위해서는 다음이 만족해야 한다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq33.png"> </p>

그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq34.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq36.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq37.png"> </p>

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq38.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq39.png">이다.

즉, 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq40.png">의 고윳값는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq41.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq42.png">이다. 바꿔 말하면, 선형 변환을 했을 때 그 크기는 변하고 방향이 변하지 않는 벡터가 있다고 할 때, 그 벡터의 크기는 각각 1배와 3배가 된다는 의미이다. 이제, 고유벡터를 찾아보도록 하자.

 다시 한번 식 (2)는 고윳값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq43.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq44.png">에 대해서 모두 만족해야 한다. 그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq45.png">인 경우에 대해,


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq46.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq47.png"> </p>


를 만족해야 하므로 아래의 연립방정식이 성립되어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq48.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq49.png"> </p>

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq50.png">인 경우의 고유벡터는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq51.png"> </p>

이며, 

같은 방식으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq52.png">인 경우의 고유벡터는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq53.png"> </p>

이다.

 그러므로 기하학적으로 이것을 다시 설명하면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq54.png"> 벡터는 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq55.png"> 를 취해주면 그 방향은 변하지 않고, 크기가 3배가 된다. 또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq56.png"> 벡터는 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-17-eigen_vector/eq57.png"> 를 취해주게 되면 그 방향은 변하지 않고 크기는 1배가 된다는 의미이다.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/7dmV3p3Iy90" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  
</center>

[^1]: 일반적으로는 벡터공간에 대한 선형 변환 연산이라고 할 수 있다.

[^2]: 여기서 크기는 음수를 포함한다.

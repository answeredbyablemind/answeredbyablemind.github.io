---
title: 상관계수는 벡터의 내적이다.
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190820
tags: 선형대수
---

# 상관 계수의 용도와 정의

상관 계수는 연속적으로 변하는 두 변수 간의 (상관) 관계를 확인하고 싶을 때 사용할 수 있다. 

가령 몸무게와 키의 상관 관계라던지, 수학 점수와 영어 점수 간의 상관관계 같은 것들을 확인할 수 있다.

 연속적으로 변하는 두 변수 간의 관계는 시각적으로도 확인할 수도 있는데 두 개의 연속적으로 변하는 n개의 변수 쌍을 각각 x 축과 y 축에 대입해서 그리면 산점도(scatter plot)를 그릴 수 있다.

예를 들어 아래는 500명 학생의 수학, 영어 점수의 산점도를 그린 것이다.



<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic1.png">
  <br>
  그림 1. 산점도의 예시 plot. 수학 점수와 영어 점수 간의 양의 상관 관계가 보인다.
</p>



상관 계수는 다음과 같이 정의할 수 있다.

n개의 dataset 에 대해서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq1.png"> </p>

그림 1에서와 같이 500명의 데이터에 대해 상관 관계를 확인하라고 하면 

이 식에 대입해서 숫자를 출력하면 되지만 이 식은 과연 어떤 의미가 있는 것일까? 

그것은 **벡터의 내적**과 관련되어 있다.


# 벡터의 내적

임의의 2차원 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq3.png">를 생각해보자.

두 벡터의 내적은 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq4.png"> </p>

가령, 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq5.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq6.png">를 각각 (2,3), (3,0)이라고 한다면 두 벡터의 내적은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq7.png"> </p>

이다.


<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic2.png">
  <br>
  그림 2. a = (2,3), b= (3,0)의 두 벡터를 2차원 평면상에 도시한 것
</p>

한편, 벡터의 내적은 기하학적으로 

\'<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq8.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq9.png">로의 정사영에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq10.png">의 크기를 곱한 것\'

이라는 의미도 가진다. 

즉, 아래의 그림 3에서 볼 수 있듯이 기하학적 의미로 두 벡터의 내적은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq11.png"> </p>

이다.

<p align = "center">
  <b>"벡터 a의 변화를 벡터 b가 얼마만큼 설명해줄 수 있는가?”</b> <br><br>
  라고 말이다.
  <br><br>

  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic3.png">
  <br>
  그림 3. 벡터 a에서 벡터 b로 향하는 정사영
</p>

그렇다면 두 벡터의 내적과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq12.png">의 크기를 이용하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq13.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq14.png">로의 정사영의 길이를 알 수 있다.

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq15.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq16.png">로의 정사영의 길이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq17.png"> 는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq18.png"> </p>


이 때 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq19.png">의 의미를 조금 다르게 해석해 볼 수도 있다.


한편, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq20.png">이다. 

즉, 내적의 순서는 상관없다. 다시 말하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq21.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq22.png">로의 정사영의 길이, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq23.png">는 다음과 같이 구할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq24.png"> </p>

마찬가지로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq25.png"> 또한 이렇게 해석해 볼 수 있겠다.

<p align = "center">
<b>"<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq26.png">의 변화를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq27.png">가 얼마만큼 설명해줄 수 있는가?”</b><br><br>

  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic4.png">
  <br>
  그림 4. 벡터 b에서 벡터 a로 향하는 정사영
</p>


종합하자면 다음과 같이 설명할 수 있을 것이다.

① <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq28.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq29.png">의 관계를 알고싶다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq30.png"> </p>

② <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq31.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq32.png">를 설명하는 정도를 파악하려면? 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq33.png"> </p>

③ <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq34.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq35.png">를 설명하는 정도를 파악하려면? 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq36.png"> </p>

따라서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq37.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq38.png">가 서로를 설명하려면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq39.png"> </p>

그러니까 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq40.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq41.png">가 서로를 설명하는 양은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq42.png"> </p>

라고 할 수 있다.

# 다시 상관 계수로 !

다시 상관 계수의 식을 보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq43.png"> </p>

이 중에서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq44.png"> </p>

와

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq45.png"> </p>

는 정규화 과정과 매우 관련이 있어 보이긴 한다. 하지만 이번에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq46.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq47.png">를 떼어서

생각해보자. 그리고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq48.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq49.png">는 본래의 정의를 이용해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq50.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq51.png">를 이용해서 풀어서 써보도록 하자.



<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic_eq1.png">
</p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq52.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq53.png">라 하자.

그러면 위 식은 다음과 같이 쓸 수 있다.

<p align = "center">
  <img width = "250" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic_eq2.png">
</p>


다시 말하면 상관 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq54.png">은

_**"<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq55.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq56.png">의 관계에 대해 서로가 얼마나 서로를 설명하는가?"**_

또는

_**"<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq57.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq58.png">의 관계에 대해 서로가 얼마나 서로를 설명하는가?"**_

라는 뜻이 라고 해석할 수 있겠다. 이 말은 다시 말하자면 dataset이 원점으로부터 얼마나 떨어져있는지는 무시하고 서로 퍼진 정도만 보겠다는 의미이다.


<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-20_correlation_and_inner_product/pic5.png">
  <br>
그림 5. 왼쪽 그림에서는 산점도의 중심이 (3,2)이지만 상관 관계는 데이터 셋이 원점으로부터 얼마나 떨어져있는지 관계없는 양이다. 따라서 오른쪽 그림처럼 상관 관계의 식으로부터 원점으로만큼 떨어진 정도를 무시할 수 있게 한다.
</p>


또 한편,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq59.png"> </p>

이었는데,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq60.png"> </p>

이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-20-correlation_and_inner_product/eq61.png"> </p>

라고 말하는 것은 매우 자연스럽게 생각할 수 있다.

# 상관계수와 공분산의 차이에 대해서,

질문이 들어온 것을 다시 한번 글에서 설명하자면,

상관계수와 공분산 모두 공통적으로 벡터의 내적을 이용해 설명할 수 있고, 데이터 간의 (즉, 벡터 사이의) \'닮음\'과 연결 지을 수 있다.

다만, 둘 사이의 가장 두드러지는 차이점은 정규화의 방법인데, 상관계수는 벡터의 크기로 정규화해주는 반면 공분산은 벡터의 원소 수를 가지고 정규화해준다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/kzqTTCB-Luo" frameborder="0" allowfullscreen></iframe></center>

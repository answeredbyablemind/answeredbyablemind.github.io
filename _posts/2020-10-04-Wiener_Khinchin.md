---
title: 위너-킨친 정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201004
tags: 신호처리
---

# 1. Random Process와 Fourier Transform

[Continuous Time Fourier Transform](https://angeloyeo.github.io/2019/07/07/CTFT.html)(이하 CTFT)는 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq1.png"> </p>

where <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq2.png">

이 때, Fourier Transform <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq3.png">가 존재할 수 있는 조건은 Dirichlet Condition이라고 불리며, 그 조건은 다음과 같다.

1) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq4.png"> is absolutely integrable, that is,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq5.png"> </p>

2) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq6.png"> has only a finite number of discontinuouties in any finite interval

3) <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq7.png"> has only finite number of maxima and minima within any finite interval

이 때, 우리가 궁금한 것은 왜 wide sense stationary 한 random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq8.png">는 Fourier Transform이 될 수 없는지이다. 이 문제는 random process의 Fourier Transform은 왜 Dirichlet Condition을 만족할 수 없는지에 대한 문제로 귀결될 수 있다. 이 문제에 대한 핵심은 Dirichlet Condition 1번에 있다.

일반적으로 Stationary random process는 시간에 따라 random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq9.png">의 pdf가 변하지 않는 것을 조건으로 하고 있다. 그 말은, random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq10.png">의 realization 역시 시간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq11.png">에 따라 변하지 않는다는 것을 나타내며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq12.png">에 대해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq13.png">는 언제나 유한한 값을 가질 수 있다는 것을 의미한다. 그러므로, Dirichlet condition 1은 위반 될 수 있으며, 일반적으로 random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq14.png">의 Fourier Transform은 항상 존재하는 것은 아니다. 

간단한 예를 들자면 다음과 같다. 다음과 같은 random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq15.png">를 생각해보자.

random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq16.png">의 random variable의 realization은 0 또는 1인데, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq17.png"> 이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq18.png">인 random variable이 있다고 하자. 

그렇다면 random process 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq19.png">에 대해서 매우 낮은 확률로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq20.png">일 수 있다. 그러면, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq21.png"> </p>

이다. 이렇듯 간단한 예를 통해서도 random process의 Fourier Transform이 항상 존재하는 것은 아니라는 사실을 알 수 있다.

# 2. Power Spectral Density of a WSS process

※ WSS: Wide Sense Stationary

그렇다면, 위와 같은 문제를 해결해줄 수 있는 가장 간단한 방법은 무엇일까?

그것은 random process <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq22.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq23.png">축에 boundary를 지정해주는 것이다. 즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq24.png"> </p>

와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq25.png">를 놓고 생각해보는 것이다. 그 이후에, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq26.png">라고 만들면 Power Spectrum을 추정할 수 있게 되는 것이다. Power Spectral Density of a Wide Sense Stationary process의 증명과정은 다음과 같다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq27.png">의 푸리에 변환은 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq28.png"> </p>

여기서 Parseval 정리를 이용해 신호의 energy를 정의해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq29.png"> </p>

또, 신호의 power는 신호의 energy에 신호 전체 길이를 나눠준 것이므로, 신호의 power는 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq30.png"> </p>

그러면, power의 기댓값은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq33.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq34.png">는 주파수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq35.png">에서 파워의 기댓값에 기여한 기여도라고 볼 수 있으며, 이것이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq36.png">의 Power Spectral Density(PSD)를 의미한다.

따라서 우리는 Power Spectral Density를 다음과 같이 정의할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq37.png"> </p>

# 3. Autocorrelation과 Power Spectral Density의 관계

Autocorrelation과 PSD의 관계를 설명하는 이론은 Winer-Khinchin-Einstein 정리라고 불린다. 그 내용은 아래와 같으며 random process의 autocorrelation과 Power Spectral Density 간의 관계를 증명한다.

PSD의 식에서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq38.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq39.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq41.png"> <br> 식 (15)  </p>

[//]:# (식 15)

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-04-Wiener_Khinchin/pic1.png">
  <br>
  그림 1.
</p>

여기서 위의 식 (15)는 그림 1에서처럼 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq42.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq43.png">로 둘러싸인 정사각형 영역의 면적을 구하는 과정으로 볼 수 있다.

식 (15)를 보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq44.png">라는 식이 일괄적으로 들어가있기 때문에, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq45.png">와 같이 치환해서 적분식을 풀어줄 수 있다. 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq46.png">라는 식은 잘 생각해보면 기울기가 1인 일차함수 중 하나임을 알 수 있는데, 결국 그림 1의 정사각형을 구하는 과정을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq47.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq48.png">부터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq49.png">까지 변해가면서 그림 1에 shade 표시한 띠의 미소 면적을 적분해주는 과정이라고 볼 수 있는 것이다. 따라서, 그림 1에 shade 표시한 미소 면적을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq50.png">라고 한다면 식 (15)는 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq51.png"><br> 식 (16)  </p>

[//]:# (식 16)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq52.png">를 구하면 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq53.png"> </p>

이다. 이것은 두 삼각형의 넓이의 차를 이용해 구한 값이다.

따라서 식 (16)을 계속해서 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq54.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq55.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq56.png"> </p>


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq57.png"> <br> 식 (21) </p>

[//]:# (식 21)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq58.png">가 적분가능하다면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq59.png">가 무한히 커지게 되면 식 (21)은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq60.png"> </p>

따라서 아래와 같은 관계를 확인할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq61.png"> </p>

앞서 언급했듯이 위 식의 좌변은 Power Spectral Density <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq62.png">라고 부른다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq63.png"> </p>

그리고, 역푸리에 변환을 이용하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-04-Wiener_Khinchin/eq64.png"> </p>

임 또한 생각해볼 수 있다.

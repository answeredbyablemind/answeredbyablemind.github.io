---
title: 사비츠키-골레이(Savitzky-Golay) 필터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201021
tags: 신호처리
---

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-21-Savitzky_Golay/pic1.png">
  <br>
  그림 1. smoothing 효과가 있는 Savitzky-Golay 필터! (진지)
</p>

# Prerequisites

이번 포스팅을 이해하기 위해선 다음의 지식이 선행 학습되어야 합니다.

* [Discrete Time 신호의 Convolution](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)
  * Convolution 연산
  * impulse response에 대한 개념
* FIR 필터
* 행렬 연산에 관한 기초 지식 (행렬곱, 역행렬 등)

# impulse response와 신호의 합성곱(convolution)

본 포스팅을 이해하기 위해선 impulse response에 대한 이해가 매우 필수적이다.

필요한 경우 짧게나마 impulse response에 대해 이해한 뒤, 해당 posting을 계속 읽어보도록 하자.

impulse response에 대한 이해가 충분하다고 생각된다면 이 파트는 건너뛰어도 무관하다.

임의의 이산신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq1.png">가 다음과 같은 형태의 신호라고 생각해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-21-Savitzky_Golay/pic_discrete_time_signal.png">
  <br>
  그림 2. 임의의 이산신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq2.png">
</p>

참고로 빨간색의 파선은 시간샘플링이 수행되기 전의 원래 함수라고 생각하면 될 것이다.

이 이산신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq3.png">은 모든 정수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq4.png">에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq5.png">값을 나열한 것이라고도 볼 수 있다. 그런데, 이 값들은 시간 순서대로 나와야 하므로, 아래 그림과 같이 각각의 함수 값(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq6.png">)들을 가지는 impulse 들이 선형적으로 합해진 것으로도 볼 수 있을 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-21-Savitzky_Golay/pic.png">
  <br>
  그림 3. 임의의 이산신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq7.png">
</p>

그림 3을 수식으로 표현하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq8.png"> <br> 식 (1) </p>

[//]:# (식 1)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq9.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq10.png">은 아래와 같이 정의되는 함수이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq11.png"> <br> 식 (3) </p>

[//]:# (식 3)

여기서 우리가 어떤 선형 시스템을 생각한다고 하자. 이 시스템의 입력이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq12.png">, 출력이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq13.png">이라고 해보자. 출력과 입력의 관계를 연결시켜주는 선형시스템을 선형연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq14.png">로 대체해 생각한다면 입출력 관계는 다음과 같이 생각할 수 있다. (여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq15.png">의 아랫첨자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq16.png">은 이 연산자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq17.png">에 대한 연산자라는 의미이다.)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq18.png"> <br> 식 (4) </p>

[//]:# (식 4)


식 (4)에 식 (1)을 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq19.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq20.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq21.png">에 대한 선형연산자이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq22.png">는 상수로 취급할 수 있다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq23.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq24.png">을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq25.png">이라고 정의하자.

이 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq26.png">을 impulse response라고 부른다.

그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq27.png"> <br> 식 (7) </p>

[//]:# (식 7)

만약 impulse response <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq28.png">의 길이가 다음과 같이 유한하다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq29.png"> </p>

그러면 다음과 같이 식 (7)의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq30.png">을 쓸 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq31.png"> <br> 식 (9) </p>

[//]:# (식 9)

이렇듯 Impulse Response의 길이가 유한한 경우의 시스템을 Finite Impulse Response (FIR) 시스템이라고 한다.


# 다항 회귀 모델을 이용한 신호 스무딩(smoothing)

신호의 smoothing 방법에는 여러가지가 있다.

대표적인 smoothing 방법은 moving average로 시계열이 나열되어 있을 때 전체 데이터의 평균이 아니라 windowing을 통해 전체 데이터의 일부분을 순차적으로 평균을 구해서 평균값을 해당 윈도우의 대푯값으로 표시해 줌으로써 데이터를 smoothing 하는 방법을 말한다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-21-Savitzky_Golay/pic2.png">
  <br>
  그림 2. moving average의 작동 원리
</p>

moving average를 취한다는 것은 아래와 같은 impulse response를 신호와 convolution 시켜준다는 것을 의미한다고도 생각할 수 있다. 가령 M차 moving average라면 impulse response는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq32.png"> </p>

여기서 moving average의 단점에 대해 금방 캐치할 수 있는 것은 moving average는 평균값을 이용한다는 점인데, 평균값은 outlier에 굉장히 취약하게 반응한다는 것이 잘 알려져 있다. 이런 이유로 어떤 application에서는 평균값 대신에 중위값(median)을 사용하는 경우도 왕왕 있다.

그래서 moving average는 구현이 쉽다는 장점이 있지만 순간적인 peak 등에 취약한 한계점을 보인다.

이를 보완하기 위한 방법 중 하나로 시계열에 적용시키는 window 내의 짧은 신호 구간에 대해 다항 회귀 모델을 구축함으로써 smoothing 하는 방법이 있을 수 있다.

<p align = "center">
  <img src ="https://upload.wikimedia.org/wikipedia/commons/8/89/Lissage_sg3_anim.gif">
  <br>
  그림 3. 다항 회귀모델을 이용한 신호의 smoothing 과정
  <br>
  <a href = "https://en.wikipedia.org/wiki/Savitzky%E2%80%93Golay_filter"> 그림 출처: 위키피디아 Savitzky Golay filter</a>
</p>

위 그림에서는 짧은 구간의 window 내에서 다항 회귀모델을 만들어 신호를 smoothing하는 과정을 보여주고 있다. 

아무리 다항회귀모델을 이용해서 신호를 smoothing 해준다는 것이 말인된다 한들 다항회귀모델을 이용한 smoothing의 경우 매 구간마다 회귀식을 계산해줘야한다는 매우 time-consuming한 과정일 것이고 매우 비효율적으로 보일지도 모르겠다.

Savitzky-Golay filter(S-G filter)는 이러한 회귀모델을 이용한 smoothing을 수행함에 있어 매 time step의 윈도우 내에서 회귀모델을 계산하지 않고도 특정한 impulse response를 마련함으로써 수학적으로 정확히 다항회귀모델을 이용한 smoothing을 대체할 수 있음을 말해주고 있다.

다시 말해, 적절히 계산된 impulse response를 이용하면 매 time step의 window 마다 회귀모델을 계산하는 것과 같은 효과를 얻을 수 있도록 필터를 설계할 수 있으며 이것이 S-G filter가 말해주고 있는 것이다.

# 유도 과정

지금부터 다루는 신호들은 모두 디지털 신호라고 가정하고, 시간 샘플을 앞으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq33.png">이라고 표현하도록 하자.

우리가 원하는 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq34.png">의 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq35.png">을 적절한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq36.png">차 회귀모델 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq37.png">으로 대체하는 것이다.

즉, 회귀모델을 이용해 smoothing 하게되어 나오게 되는 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq38.png">은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq39.png"> </p>

이게 무슨 말인가 하면, 시간 샘플 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq40.png">을 중심으로 왼쪽으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq41.png">개, 오른쪽으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq42.png">개의 신호를 획득하고, 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq43.png">의 길이의 신호를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq44.png">차 회귀모델로 대체하겠다는 것이다.

[//]:# (신호를 다항 회귀모델로 대체하는 그림 그릴 것)

굳이 시간 샘플이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq45.png">인 값을 중심으로 하는 신호에 대해 분석하고자 하는 것은 우리가 결국 하고 싶은 것은 회귀모델을 가지고 smoothing 해주려고 할 때 필요한 impulse response 이기 때문이다. impulse response를 이용해서 원래의 신호에 convolution을 해주면 결국 smoothing을 수행할 수 있다.

이제 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq46.png"> 길이의 신호를 모델링 해 줄 가장 적절한 회귀모델 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq47.png">은 아래와 같이 원래의 신호와의 에러를 가장 작게 해줄 수 있는 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq48.png">들로 구성될 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq49.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq50.png"> </p>

편미분을 통해 에러를 최소화 할 수 있는 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq51.png">을 찾을 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq52.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq53.png"> </p>

위 식을 조금 더 정리하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq54.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq55.png"> <br> 식 (15) </p>

[//]:# (식 15)

이제 식 (15)를 행렬을 이용해 표현하기 위해 아래와 같은 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq56.png">를 정의하자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq57.png">의 dimension을 갖는 어떤 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq58.png">를 다음과 같이 정의하도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq59.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq60.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq61.png">의 표시는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq62.png">번째 행 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq63.png">번째 열의 원소가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq64.png">와 같이 정의한다는 것을 의미한다.

참고로, 원소별로 쓰면 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq65.png">는 다음과 같다[^1].

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq66.png"> </p>

[^1]: 잘 보면 행렬 A는 전형적인 [반데르몽드 행렬](https://en.wikipedia.org/wiki/Vandermonde_matrix)이다.

또, 식 (15)를 행렬을 이용해 표현하기 위해 필요한 벡터들을 추가로 몇개 쓰자면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq67.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq68.png"> </p>

이다.

이제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq69.png">를 이용해 식 (x)를 행렬로 쓰면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq70.png">  <br> 식 (20)</p>

[//]:# (식 20)

이 과정을 잘 이해하기 위해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq71.png">를 계산해보면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq72.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq73.png">번째 행, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq74.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq75.png">번째 열은 각각

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq76.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq77.png"> </p>

이므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq78.png">의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq79.png">번째 행, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq80.png">번째 열의 원소는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq81.png"> </p>

임을 알 수 있고, 또 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq82.png">의 경우,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq83.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq84.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq85.png"> </p>

임을 알 수 있다.


그러면 식 (20)을 통해 계수 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq86.png">를 계산할 수 있다[^2].

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq87.png"> </p>

그리하여 얻은 결과를 다음과 같이 정리하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq88.png"> </p>

[^2]: 잘 보면 이 결과는 normal equation의 해와 같다.

따라서, 첫 번째 계수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq89.png">는 다음과 같이 계산할 수 있을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq90.png"> <br> 식 (29) </p>

[//]:# (식 29)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq91.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq92.png">의 첫 번째 행을 의미한다.

이제, 식 (29)에 대해 다시 한번 생각해보면 식 (29)는 결국 유한한 길이의 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq93.png">에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq94.png">일 때의 출력값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq95.png">과 같다는 것을 알 수 있다.

즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq96.png"> <br> 식 (30) </p>

[//]:# (식 30)

이다. 식 (30)과 Finite Impulse Response를 갖는 시스템의 입출력에 관한 식인 식(9)를 비교해보면 결국 우리가 구한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-21-Savitzky_Golay/eq97.png">의 첫번째 행이 결국 Savitzky-Golay 필터의 impulse response라는 것을 알 수 있다.

# MATLAB 코드

```MATLAB
clear; close all; clc;

M = 10; % 필터의 길이는 2M+1 = 21
N = 9; % 다항식의 차수는 9

% 테스트용 신호
load mtlb
t = (0:length(mtlb)-1)/Fs;

%% MATLAB으로 계수만 얻은 것
b = sgolay(N, 2*M+1);

sgolay_filter = b((size(b,1)+1)/2,:);

smtlb = conv(mtlb, sgolay_filter,'same');

%% MATLAB으로 직접 convolution까지 한 것
smtlb_MATLAB = sgolayfilt(mtlb, N, 2*M+1);

%% 직접 S-G filter의 계수까지도 계산
A = zeros(2*M+1, N+1);

n_range = -M:M; % 원래 논문에서 n
i_range = 0:N; % 원래 논문에서 i
for i = 1:size(A,1)
    for j = 1:size(A,2)
        A(i,j)= n_range(i)^i_range(j);
    end
end

% matrix H = (A^TA)^{-1}*A^T

H = (A'*A)\A';

sgolay_filter_calculated = H(1,:); % H의 첫번째 행이 S-G filter의 impulse response이다.

my_smtlb_calculated = conv(mtlb, sgolay_filter_calculated,'same');

figure;
h1 = plot(t, mtlb);
axis([0.2 0.22 -3 2])
hold on;
% plot(t, smtlb);
h2 = plot(t, my_smtlb_calculated,'r', 'linewidth',2);
% plot(t, smtlb_MATLAB);
legend([h1, h2], '원형 파형','S-G filter 적용')
```

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-21-Savitzky_Golay/pic3.png">
  <br>
  그림 4. 위 MATLAB 코드의 실행 결과
</p>

# Moving Average와의 비교

S-G filter는 moving average 필터에 비해서 파형의 전체적인 trend를 잘 살려주는 것으로 알려져 있다.

아래의 예시에서는 moving average 필터와 S-G filter의 smoothing 전후의 차이를 보여주고 있다.

아래의 그림에서 검은색 신호에 노이즈가 없었다면 box 형태의 함수가 원래의 함수일 것인데, S-G filter는 smoothing 후에 box 형태의 함수에 좀 더 가까운 결과를 내보인 것을 알 수 있다.

<p align = "center">
  <img src = "https://www.researchgate.net/profile/Gianfranco_Miele/publication/301888741/figure/fig6/AS:668524762656788@1536400132558/Comparison-of-the-filtering-effects-of-the-Moving-Aaverage-MA-and-Savitzky-Golay-SG.png">
  <br>
  그림 5. Moving Average와 S-G filter의 smoothing 결과 비교
  <br>
  그림 출처: <a href = "https://www.researchgate.net/publication/301888741_On_Employing_a_Savitzky-Golay_Filtering_Stage_to_Improve_Performance_of_Spectrum_Sensing_in_CR_Applications_Concerning_VDSA_Approach"> On Employing a Savitzky-Golay Filtering Stage to Improve Performance of Spectrum Sensing in CR Applications Concerning VDSA Approach </a>
</p>

# 참고자료

* [What is a Savitzky-Golay Filter, IEEE, 2011, Ronald W. Schafer](https://ieeexplore.ieee.org/document/5888646)
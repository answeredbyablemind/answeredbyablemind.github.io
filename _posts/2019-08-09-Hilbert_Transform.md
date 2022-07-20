---
title: 힐버트 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190809
tags: 신호처리
---
<style>
  @media screen and (max-width:500px){
    iframe {
        width: 100vw; 
        height: 80vw;
        background:white;  
    }
  }

  @media screen and (min-width:500px){
    iframe {
        width: 40vw; 
        height: 30vw;
        background:white;  
    }
  }
</style>

# 힐버트 변환이 필요한 이유

 힐버트 변환이 필요한 이유에 대해 설명하기 위해서는 힐버트 변환이 하는 역할이 무엇인지, 그리고 그 역할을 수행함으로써 얻을 수 있는 결과는 무엇인지 파악하는 것이 중요한 과정일 것이라는 생각이 든다.  먼저, 힐버트 변환의 역할은 일종의 선형 필터로써 신호의 amplitude는 유지하되, phase만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq1.png">만큼 shift 시켜주는 것이다. (음의 주파수의 경우에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq2.png">만큼 phase shift 시켜준다.) 

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-09_Hilbert_Transform/pic1.png">
  <br>
  그림 1. 힐버트 변환은 원 신호의 amplitude는 유지하고 phase를 -90' shift 시킨다.
</p>


## 힐버트 변환의 특성

힐베르트 변환 필터의 특성은 모든 주파수에서 크기는 변하지 않고(all-pass filter) 위상만 음의 주파수에선 +90도, 양의 주파수에선 -90도로 변화시켜주는 필터이다. 즉 어떤 주파수의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq3.png"> 신호가 들어가면 항상 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq4.png"> 신호가 나오는 것이다.


 즉, 힐버트 변환을 정의함으로써 어떠한 실수 신호라도 그 신호를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq5.png"> 또는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq6.png"> phase shift 시켜줄 수 있게 되는데, 그렇게 되면 **실수 신호 를 복소수 차원으로 확장시킬 수 있게 되어서 amplitude와 phase의 분석이 쉬워지게 된다.** 

 즉, 어떠한 실수 신호를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq7.png">라 하고, 힐버트 변환 된 신호를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq8.png">라 했을 때, 복소수 차원으로 확장시켜 생각할 수 있는 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq9.png">를 생각할 수 있게 되는 것이다. 
 
 가령 이 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq10.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq11.png">인 경우에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq12.png">라고 생각 할 수 있다. 이미 잘 알다시피 위의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq13.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq14.png">로 표현할 수 있으며, 복소평면과 오일러 공식에 의해서 이 신호의 phase는 쉽게 구할 수 있게 된다. 이 처럼 실수차원의 신호를 복소수 차원으로 확장하여 해석하는 방법을 **‘해석적 표현(analytic signal)을 유도 한다’** 고 한다. 

 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq15.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq16.png">인 경우는 특별한 경우에 한하지만, 위와 같은 분석법은 어떠한 실수 신호에서라도 적용 가능하므로, 일반적인 실수 신호를 복소수 차원으로 확장해서 해석적 표현을 유도한다는 것은 매우 의미있는 과정이다. 


# 힐버트 변환의 유도

 힐버트 변환은 amplitude는 그대로 두고 phase만 변환시키는 역할을 한다. 따라서, 힐버트 변환은 일종의 all-pass 필터로 생각할 수 있으며, 위의 힐버트 변환의 특성을 만족시키는 transfer function은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq17.png"> </p>

이고

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq18.png"> </p>


그러므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq19.png">라고 일반화 시킬 수 있다[^1]. 그러므로 변환 kernel인 impulse function <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq20.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq21.png">를 inverse Fourier Transform을 취함으로써 얻을 수 있다.

[^1]: sgn()은 입력이 양수가 들어가면 +1, 음수가 들어가면 -1을 출력하는 함수다. '시그넘'이라고 발음함.

---

`PROOF`{:.info} 힐버트 변환 kernel의 유도

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq22.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq23.png">를 다음과 같이 근사시켜 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq24.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq25.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq26.png">로 근접할 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq27.png">와 매우 근사해진다는 것을 알 수 있다.


<p align = "center">
  <iframe src = "https://angeloyeo.github.io/p5/2019-08-09-Hilbert_Transform_sgn/" frameborder = "0"></iframe>
</p>


그러므로, 유도 과정에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq28.png">의 inverse Fourier transform을 생각하고, 이후 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq29.png">로 근접할 때의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq30.png">의 모양을 생각하도록 하자.

그러므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq31.png"> </p>

라고 할 수 있으며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq32.png">는 다음과 같이 유도할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq33.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq34.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq36.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq37.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq38.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq39.png"> </p>

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq41.png"> </p>

---

 일반적으로, 입력함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq42.png">에 대한 출력함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq43.png">는 시스템의 impulse response <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq44.png">에 대해서 

 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq45.png"> </p>
 
 로 표현할 수 있으며, 힐버트 변환의 출력을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq46.png"> 대신에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq47.png">라고 할 때, 다음이 성립한다.

 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq48.png"> </p>

 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq49.png"> </p>


# 힐버트 변환의 성질

신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq50.png">에 대한 힐버트 변환 결과를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq51.png">라고 할 때, 힐버트 변환은 다음과 같은 성질을 가진다.

## 힐버트 변환의 중복 적용

힐버트 변환을 두 번 취해주게 되면 원래 신호의 부호가 반전되는 결과를 가져온다. 이것은 phase shift를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq52.png"> 또는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq53.png">만큼 시켜주기 때문. 이것을 수식을 이용해 표현하자면 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq54.png"> </p>


이다.

즉, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq55.png"> </p>

## 삼각함수의 힐버트 변환

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq56.png">

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq57.png">

* <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq58.png">

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq59.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq60.png"> </p>


## <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq61.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq62.png">는 같은 양의 에너지(또는 파워)를 가진다.

 이것은 Parseval's theorem으로부터 유도할 수 있다. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq63.png">의 푸리에 변환을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq64.png">라고 했을 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq65.png">이므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq66.png"> </p>

가 성립한다.

 그러므로 아래와 같은 Parseval's theorem에 의해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq67.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq68.png">의 에너지 또는 파워는 같은 값을 가진다는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq69.png"> </p>

## <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq70.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq71.png">는 직교함수이다. 

다른 말로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq72.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq73.png">의 내적이 0이다. 즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq74.png"> </p>

이다.


 이것 또한 Parseval's theorem으로 증명할 수 있는데, 복소 신호에 대한 일반적인 Parseval's theorem을 적용하면 위의 내적 값은 다음과 같아진다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq75.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq76.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq77.png"> </p>


<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq78.png">는 0에 대해 symmetric function이기 때문

## Bedrosian identity (☆)

주파수 대역(spectra)가 겹치지 않는 두개의 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq79.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq80.png">를 생각해보자. 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq81.png">가 lowpass filter이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq82.png">가 highpass filter라고 할 수 있으며 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq83.png"> </p>

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq84.png">의 높은 주파수로 신호가 amplitude modulation된다고 했을 때, modulation되는 신호를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq85.png">라고 하고 carrier signal을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq86.png">라고 하면 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq87.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq88.png"> </p>

## Signal의 Envelope
<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-09_Hilbert_Transform/pic2.png">
  <br>
  그림 2. Signal의 envelope이 말하는 것.
  <br>
  (출처 : http://www.expertsmind.com/CMSImages/2091_Detection%20of%20AM%20signals.png)
</p>

Bedrosian identity를 통해 amplitude modulation된 신호의 envelope를 구할 때 힐버트 변환을 활용할 수 있다.

즉, lowpass filter <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq89.png">를 높은 주파수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq90.png">로 amplitude modulation 시킬 때, carrier signal을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq91.png">라고 하면 AM signal은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq92.png">이다.

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq93.png">를 힐버트 변환하여 다음의 신호를 생각 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq94.png"> </p>

where

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq95.png"> </p>


이므로 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq96.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq97.png"> </p>

이다.

그러므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq98.png"> </p>


이다. 따라서 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-08-09-Hilbert_Transform/eq99.png"> </p>

는 AM signal의 envelope이다.
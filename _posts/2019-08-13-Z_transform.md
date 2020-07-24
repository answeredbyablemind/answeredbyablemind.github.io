---
title: Z 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190813
tags: 신호처리
---

<p align = "center">
  <iframe width = "800" height = "400" src = "https://angeloyeo.github.io/p5/2019-08-13-Z_Transform_preview/" frameborder = "0"></iframe>
  <br>
  Z-변환이 말하는 것: 이산 신호(정확히는 시스템)의 특성을 Z-plane에 한번에 표현해보고 싶다.
  <br> 빨간색 마커를 마우스로 움직여 보세요 ^^
</p>

## Z-변환의 정의 및 유도 과정


| DEFINITION 1. Z-변환 |
| --------- |
| 이산신호 $x[n]$에 대하여 아래와 같은 변환을 Z-변환이라 한다.<br><center>$$Z\left[x[n]\right] = \sum_{n=-\infty}^{\infty}x[n]z^{-n}$$<br> 여기서 $z$ 는 복소수</center>|

Z-변환은 좁게는 선형 차분 방정식(Linear Difference Equation)을 쉽게 풀 수 있게 만들어 주는 테크닉이라고 할 수도 있고, 좀 더 넓은 의미에서는 Discrete Time Fourier Transform의 일반화된 형태라고 할 수도 있다. 

이것은 Continuous Time Domain에서의 CTFT와 라플라스 변환의 관계에 비유하는 것이 가장 알맞다. 즉, Z-Transform은 DTFT의 일반적인 형태이다. 혹은 DTFT는 Z-Transform의 특수한 경우라고 할 수 있다. 


## Z-변환과 푸리에 변환

Discrete Time Fourier Transform(DTFT)의 수식으로부터 Z-변환의 수식을 유도해보면, 수학적으로 DTFT와 Z-변환이 닮아있다는 것을 확인할 수 있다.

우리가 잘 알다시피 DTFT의 형태는 다음과 같다.

$$x[n] = \int_{-0.5}^{0.5}X_{DTFT}(f) \exp(2\pi fn) df$$

$$where\space X_{DTFT}(f) = \sum_{n=-\infty}^{\infty}x[n]\exp(-j2\pi fn)$$

여기서 $x[n]\exp(-\sigma n)$의 DTFT를 생각해보자.

$$\mathfrak{F}\left[x[n]\exp(-\sigma n)\right] = \sum_{n = -\infty}^{\infty} x[n] \exp\left(-(\sigma n + j 2\pi fn)\right)$$

여기서 $2\pi f = \omega$로 두면 식 (4)는 다음과 같이 쓸 수 있다.

$$식(4) \Rightarrow \sum_{n = -\infty}^{\infty}x[n] \exp\left(-(\sigma+j\omega)n\right)$$

여기서 복소수 $z$를 다음과 같이 정의하자.

$$z = \exp(-(\sigma + j \omega))$$

그러면 식 (5)는 다음과 같이 쓸 수 있다.

$$식 (5) \Rightarrow \sum_{n=-\infty}^{\infty}x[n]z^{-n}$$

위 유도 과정은 Z-Transform과 DTFT와의 관계에 대해서 보여준다. 또한 이 유도 과정은 Z-Transform과 DTFT가 Laplace Transform과 CTFT의 관계와 얼마나 닮아있는지를 보여준다는 의의가 있다. 그리고 DTFT는 Z-transform의 특수한 경우인데 그것은 원의 반지름이 1인 경우에 Z 변환을 취한 것과 같은 경우이다. 

 Laplace 변환과의 약간의 차이점이 있다면 Laplace 변환에서는 $s=\sigma+j\omega$로 설정한 것에 반해 Z 변환에서는 $z = \exp\left(-(\sigma + j\omega)\right)$로 설정했다는 점이다. 이것은 관례적인 이유 또는 개발자가 착안한 아이디어에 의한 차이로 보인다. 또한 이렇게 $s$와 $z$가 다른 약간의 차이를 가지고 설정되어 s plane과 z plane의 stability를 결정해주는 방식에 차이가 생기게 된다.

## Z-변환과 라플라스 변환

Z-변환은 라플라스 변환의 discrete time 버전이라고 할 수 있다.

라플라스 변환의 식에서 시간 sampling을 해줌으로써 Z-변환을 얻어보자.

연속시간 신호$x(t)$에 대해 라플라스 변환은 다음과 같이 정의된다.

$$\mathfrak{L}\left[x(t)\right] = X(s) = \int_{0^{-}}^{\infty}x(t) e^{-st}dt$$

여기서 연속시간 신호 $x(t)$를 시간 샘플링하기 위해, 샘플링 주기 $T$에 대해 $t\rightarrow nT$로 치환하도록 하자.

즉,

$$X(s) = \int_{0^{-}}^{\infty}x(t) e^{-st}dt \big |_{t\rightarrow nT}$$

와 같은 과정을 거치며 여기서 $x(nT)$는 discrete time signal로 볼 수 있다. 따라서,

$$X(z) = \sum_{n=0}^{\infty}x(nT)e^{-snT}$$

여기서 $z = e^{sT}$를 대입하면,

$$식(10) \Rightarrow \sum_{n=0}^{\infty}x[n]z^{-n}$$


위 유도과정을 통해서 Laplace와 Z-transform이 수식적으로 연관되어 있다는 사실을 확인할 수 있다. 결론적으로 Laplace 변환과 Z 변환은 각각의 복소수를 정의해주는 방법에 차이가 있을 뿐 모두 system의 특성을 확인하기 위한 테크닉이라고 할 수 있겠다. 

s-plane과 z-plane은 다음과 같은 형태학적 관계를 가지게 된다. 

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-13_Z_Transform/pic1.png">
  <br>
  그림 1. s-plane과 z-plane의 관계. z-plane은 s-plane을 말아 넣은 것 같은 형태를 띄고 있다.
</p>

그림 1에서 처럼 s-plane에서는 세로축 기준 왼쪽에 pole이 위치해야 stable system이고 z-plane에서는 단위원 기준 안쪽에 pole이 위치하면 stable system이다.

## Z-변환의 쓰임새에 대해서

Z-변환은 이산 시스템의 해석에 사용될 수 있다. 

즉, Laplace Transform이 연속 시간 시스템에 이용되었던 것과 마찬가지로 Z-변환은 이산 시스템의 해석에 사용될 수 있는 것이다. Z-변환에서도 마찬가지로 이산시간 전달함수에서 $z=\exp(j\omega)$를 대입하면 시스템의 주파수 응답을 확인할 수 있다. 예를 들어, $y[n] = 0.5 y[n-1] + x[n] $이라는 AR 시스템에 대하여, Z 변환을 해주게 되면, 

$$Y(z) = 0.5 \times z^{-1} \times Y(z) + X(z)$$

$$\therefore Y(z)(1-0.5\times z^{-1}) = X(z)$$

$$H(z) = \frac{Y(z)}{X(z)} = \frac{1}{1-0.5 \times z^{-1}}$$

이다. 이 때, 주파수 응답을 얻기 위해 $z = \exp(j\omega)$를 대입하면,

$$H(z)|_{z = \exp(j\omega)} = H(e^{j\omega}) = \frac{1}{1-0.5e^{-j\omega}}$$

를 얻게된다.

이를 도시하면,

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-13_Z_Transform/pic2.png">
  <br>
  그림 2. Z-변환을 통해 얻은 1차 AR system의 bode plot.
</p>

와 같게 됨을 확인할 수 있으며, 이것은 lowpass filter의 성질을 갖는 시스템임을 알 수 있다. 


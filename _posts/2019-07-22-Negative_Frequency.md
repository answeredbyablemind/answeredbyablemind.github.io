---
title: 음의 주파수
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190722
tags: 신호처리 푸리에
---
<style>
@media screen and (max-width:500px){
  iframe {
  width: 100vw;
  height: 50vw;
  background:white;
  }
}

@media screen and (min-width:500px){
  iframe {
  width: 50vw;
  height: 25vw;
  background:white;
  }
}
</style>

<p align="center"><iframe src="https://angeloyeo.github.io/p5/2019-07-22-preview_negative_frequency/" frameborder = "0"></iframe>

<br>
<b>음의 주파수가 의미하는 것: </b>
<br>
양의 주파수로 회전하는 벡터와 음의 주파수로 회전하는 벡터를 합치면
<br>
비로소 복소평면에서 실수 신호 하나를 표현할 수 있다.
</p>

## FFT 결과를 얻게되면 우리가 보는 것

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/negative_frequency/pic1.png">
  <br>
  그림 1. 10Hz 신호를 FFT 했을 때 얻게 되는 결과
</p>

10Hz cosine 함수를 고속 푸리에 변환을 적용해본다고 생각해보자.

어떤 결과를 얻게 되는가? 그림 1의 하단에서 보이듯이 10Hz와 -10Hz의 두 개의 주파수에 amplitude는 각각이 절반씩 가져가는 결과를 얻게 되지 않는가?

즉, 핵심 질문은 두 가지다.

- 왜 음의 주파수인가? 음의 주파수의 물리적인 의미는 무엇일까?
- 왜 사이즈는 절반이 될까?

이 질문에 대한 근본적인 이유는 실수 신호를 푸리에 변환해줬기 때문이고, 정답의 핵심은 오일러 공식과 정현파의 관계에 있다.

## $\cos\theta$, $\sin\theta$를 표현하는 또 다른 방법

삼각함수를 표현할 수 있는 여러가지 방법이 있다. 그 중에서도 신호를 공부하는 사람들이 익숙해져야 하는 방법은 오일러 공식을 이용한 삼각함수의 표현이다.

오일러 공식은 다음과 같이 쓸 수 있다.

$$e^{i\theta} = \cos\theta + i \sin\theta$$

$\cos$ 함수와 $\sin$ 함수는 각각 우함수, 기함수이므로 식 (1)의 $\theta$ 대신에 $-\theta$를 대입하면 다음과 같은 결과를 얻을 수 있다.

$$e^{-i\theta}=\cos\theta - i\sin\theta$$

식 (1)과 식 (2)를 더하거나 뺌으로써 $\cos$, $\sin$ 함수에 대한 새로운 표현 방식을 아래의 두 식과 같이 얻을 수 있다.

$$\cos(\theta) = \frac{e^{i\theta}+ e^{-i\theta}}{2}$$

$$\sin(\theta) = \frac{e^{i\theta} - e^{-i\theta}}{2i}$$

여기서 우리가 특별히 주목하고 싶은 식은 식(3)이다. 식 (3)을 자세히 뜯어보면 다음과 같다.


<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/negative_frequency/pic2.png">
  <br>
  그림 2. 코사인 함수를 생각할 수 있는 또 다른 방법
</p>

그림 2에서 $\cos\theta$를 실수 신호라고 표시한 것은 $\cos\theta$가 식(1)의 실수부이기 때문이라고도 볼 수 있다.

즉, 그림 1과 문서 맨 위의 애플릿에서 확인할 수 있었던 것 처럼 서로 반대 방향으로 회전하는 복소 공간의 신호(즉, 복소 평면 상의 벡터) 두 개를 합치고, 그 크기는 절반씩 취함으로써 실수 신호 하나를 표현할 수 있는 것이다.
---
title: 라플라스 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190812
tags: 신호처리
---

<p align = "center">
  <iframe width = "101%" height = "650" src = "https://mathlets.org/javascript/build/polesVibrations.html" frameborder = "0"></iframe>
  <br>
  pole의 위치와 입력 함수의 관계
  <br>
  출처: MIT Mathlets, 
  <a href = "https://mathlets.org/mathlets/poles-and-vibrations/">https://mathlets.org/mathlets/poles-and-vibrations/</a>
</p>

<p align = "center">
  <iframe width = "101%" height = "650" src = "https://mathlets.org/javascript/build/ampRespPoleDiagram.html" frameborder = "0"></iframe>
  <br>
  pole diagram과 주파수 응답의 관계
  <br>
  출처: MIT Mathlets, 
  <a href = "https://mathlets.org/mathlets/amplitude-response-pole-diagram/">https://mathlets.org/mathlets/amplitude-response-pole-diagram/</a>
</p>

# Prerequisites

이번 포스팅을 더 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [신호 공간(signal space)](https://angeloyeo.github.io/2022/01/12/signal_space.html)
* [푸리에 급수(Fourier Series)](https://angeloyeo.github.io/2019/06/23/Fourier_Series.html)
* [푸리에 변환(Fourier Transform)](https://angeloyeo.github.io/2019/07/07/CTFT.html)

# 라플라스 변환의 등장 배경

앞서 푸리에 급수와 푸리에 변환에 대해 공부하면서 연속 시간 신호에 대한 주파수 해석을 할 수 있게 되었다. 그 뿐만 아니라 푸리에 해석 방법은 LTI system에 아주 유용하게 적용할 수 있어서 시스템의 impulse response에 푸리에 변환을 적용하면 LTI system에 대한 주파수 응답 특성을 이해할 수 있었다.

그런데, 푸리에 급수 혹은 변환을 이용하기 위해선 조건이 붙는다. 일명 디리클레 조건이라고 하는 것인데, 말하자면 변환하고자 하는 신호가 absolutely integrable해야한다는 것이다. 만약 변환하고자 하는 것이 신호라면 발산하지 않는 신호여야 할 것이고 만약 impulse response라면 stable system의 impulse response만 푸리에 분석을 적용할 수 있다는 의미이다. 

가령 $x(t) = t u(t)$ 같은 신호 혹은 이와 같은 impulse response를 갖는 시스템은 푸리에 해석을 통해 분석할 수가 없다.

하지만 어떤 경우에는 불안정한 시스템을 분석하고, 어떤 입력 조건인 경우에 발산하는 출력을 내지 않게 제어해줄 수 있는지를 고려할 필요가 있다.다시 말해, 푸리에 변환의 개념을 더 확장시켜 안정 시스템이 아닌 경우에도 적용할 수 있는 변환 방법을 고려해보아야 한다는 뜻이다.

피에르 시몽 라플라스(Pierre Simon Laplace, 1749-1827)는 이런 한계를 극복할 수 있게 푸리에 변환을 일반화시킬 수 있는 변환을 생각해냈다[^1]. 

[^1]: Grattan-Guinness, I (1997), "Laplace's integral solutions to partial differential equations", in Gillispie, C. C. (ed.), Pierre Simon Laplace 1749–1827: A Life in Exact Science, Princeton: Princeton University Press, ISBN 978-0-691-01185-1

푸리에 변환의 한계점의 원인을 라플라스는 기저 함수가 진폭에 변화가 없는 주기함수로만 구성되어 있기 때문에 위와 같은 한계가 있다고 생각했다. 

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_fourier_summary.png">
  <br>
  그림 1. 푸리에 변환은 복소 정현파들과 닮은 정도를 각각의 각 주파수 $\omega$에 대해 계산한 것이다.
</p>

위 그림에서 볼 수 있듯이 푸리에 변환은 복소 정현파를 기저함수로 하는 변환이며, 푸리에 변환의 기저 함수들은 허수축 위에 나열할 수 있다.

라플라스는 이러한 관점에서 시간에 따라 크기가 작아지거나 커지는 함수들을 포함하여 기저로 삼을 수 있도록 허수 축 하나에 실수축을 덧대어 s-plane을 생각해냈다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_s_plane.png">
  <br>
  그림 2. 임의의 복소수에 대응되는 변수 $s=\sigma+j\omega$를 나타내는 $s$-plane
</p>

위 그림은 가로축은 $\sigma$, 세로축은 $j\omega$에 해당하는 값을 나타낸 것이다. 그리고 이 값들은 두개가 더해져

$$s=\sigma + j\omega$$

라는 임의의 복소수 값을 갖게 되며, 최종적으로는

$$\exp(st)=\exp((\sigma+j\omega)t)=\exp(\sigma t)\exp(j\omega t)$$

와 같이 자연상수의 지수로 올라가게 되는 값으로 보는 것이라 약속해보자. 여기서 $t$는 시간으로 해석하자.

그리고 라플라스는 아래의 그림과 같이 $s=\sigma+j\omega$와 같은 복소수에 대해 $s=j\omega$인 경우가 푸리에 변환이 담당해주는 주파수 대역이라고 해석했다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_laplace_summary.png">
  <br>
  그림 3. 라플라스 변환은 서서히 작아지거나 커지는 복소 정현파들과 닮은 정도를 각각의 decaying factor $\sigma$와 각 주파수 $\omega$에 대해 계산한 것이다.
</p>

위 그림에 대해 복소수 $s=\sigma+j\omega$의 위치에 따른 특성을 써보자면 다음과 같을 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic3.png">
  <br>
  그림 4. pole의 실수부 부호에 따른 입력 신호의 시간 stability. 
  <br>
  그림 출처: MATLAB in use, transfer function
  <br>
  (지금은 이 사이트가 사라졌더군요 ㅠㅠ 교주 LGS님 돌아오십시오...)
</p>

라플라스 변환의 식을 유도하기 위해 기존에 알고 있는 푸리에 변환을 이용해 라플라스 변환을 써보자.

푸리에 변환은

$$X(j\omega) = \int_{-\infty}^{\infty}x(t)\exp(-j\omega t)dt$$

인데, 여기서 $j\omega$를 $s=\sigma + j\omega$로 치환하자.

$$\Rightarrow X(\sigma+j\omega) = \int_{-\infty}^{\infty}x(t)\exp(-\sigma t)\exp(-j\omega t)dt$$

$$=\int_{-\infty}^{\infty}x(t)\exp(-st)dt$$

와 같다. 맨 마지막에 있는 식을 라플라스 변환(Laplace transform)이라고 부른다.

그런데, 보통 라플라스 변환은 시스템에 대한 분석에 많이 사용하며 분석에 이용되는 대부분의 시스템은 causal system이기 때문에 적분 구간을 다음과 같이 변경하여 정의하는 것이 일반적이다. 혹은 미분방정식의 풀이에 이용하기 때문에 초기값 문제에 적용하기 위해 아래와 같이 변경해서 정의하는 것이 일반적이기도 하다. (이를 unilateral Laplace transform이라고도 부른다.) 

$$\mathfrak{L}\lbrace x(t) \rbrace=\int_{0^-}^{\infty}x(t)\exp(-st)dt$$

여기서 $0^-$은 0에 대한 좌극한이다.

한편, 원래의 함수 $x(t)$를 기저함수들로 표현하면 다음과 같다. $X(\sigma+j\omega)$는 $x(t)\exp(-\sigma t)$를 푸리에 변환한 것이므로,

$$x(t)\exp(-\sigma t)=\frac{1}{2\pi}\int_{-\infty}^{\infty}X(\sigma+j\omega)\exp(\sigma+j\omega)t d\omega$$

여기서 변수 변환을 이용해 $s=\sigma + j\omega$라고 쓰면, $ds = jd\omega$이므로,

$$x(t) = \frac{1}{j2\pi}\int_{\sigma-j\infty}^{\sigma+j\infty}X(s)\exp(st)ds$$

와 같이 쓸 수 있다. 그리고 이 마지막 식을 라플라스 역변환(inverse Laplace transform)이라고 부른다. 이 적분은 복소 공간에서 선적분에 해당하게 된다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/line_integral_interval.png">
  <br>
  그림 5. 라플라스 역변환의 선적분구간
</p>

여기서 재밌는 점은 $\sigma_1 = 0$으로 선택하게 되면 푸리에 변환-역변환과 같은 결과를 얻게 된다는 것이다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic5.png">
  <br>
  그림 6. 복소평면(특히, s 평면) 상에 표현된 라플라스 변환과 푸리에 변환의 관계
  <br>
  <a href = "https://www.quora.com/Signal-Processing-What-are-the-differences-between-Laplace-and-Fourier-Transform"> 그림 출처: Quora의 라플라스 변환과 푸리에 변환의 차이점 </a>
</p>

라플라스 변환의 역변환을 구할 때는 실제 위와 같은 적분 식을 계산하기 보단 라플라스 변환의 변환쌍들을 가지고 역추적하는 방식을 더 많이 이용하기 때문에 위와 같은 적분을 수행할 일은 없다.

# 라플라스 변환의 예시와 시각화

## 예시 1

아주 간단한 신호부터 라플라스 변환을 수행해보자. 라플라스 변환이 어려운 이유는 배경에 대한 이해가 어렵기 때문인 것도 있지만 수식이 압도적이기 때문인 것도 있다.

하지만, 사실상 수행해주는 적분은 크게 어렵지 않으므로 한번 도전해보자.

다음과 같은 unit impulse 함수에 라플라스 변환을 수행해보자.

$$x(t) = \delta(t)$$

위 신호에 대해 라플라스 변환을 계산하면 아래와 같다.

$$X(s) = \int_{-\infty}^{\infty}\delta(t)\exp(-st)dt = \exp(-s(0))=1$$

## 예시 2

다음과 같은 사각펄스에 대해 라플라스 변환을 구해보자.

$$x(t) = \begin{cases} 1 && 0\lt t \lt \tau \\ 0 && \text{else}\end{cases}$$

위 신호에 대해 라플라스 변환을 계산하면 다음과 같다.

$$X(s) = \int_{0}^{\tau}(1)\exp(-st)dt=\frac{\exp(-st)}{-s}\big|_{0}^{\tau}=\frac{1-\exp(-s\tau)}{s}$$

잘 생각해보면 $s=\sigma+j\omega$이기 때문에 $X(s)$는 $X(\sigma, \omega)$라고 쓸 수도 있다. 다시 말해 입력 변수를 두 개 받는 함수라는 뜻이며 그 출력값이 복소수인 함수이다.

이 함수를 그리기 위해서는 $x, y$ 평면에 $\sigma$, $j\omega$가 오고 $z$축에 $\|X(\sigma,\omega)\|$와 같이 $X(s)$의 크기가 오는 방법으로 그리는 것이 좋다. (크기 외에도 위상 $\angle X(s)$도 고려할 수 있지만 여기서는 생략하자.)

이것을 그리면 다음과 같은 결과를 얻게 된다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_ex_visualization.png">
  <br>
  그림 7. 예시 문제에서 $X(s)$의 시각화. 이와 함께 $s=j\omega$인 경우에 해당하는 magnitude plot도 함께 확인할 수 있으며 이는 푸리에 변환의 주파수 응답이다.
  <br>
  코드 소스: Ex 7.7, Ch 7. Laplace Transform, Signals and Systems, Oktay Alkin
</p>

이 때, $s=j\omega$ 부분만 따로 떼서 그리면 아래 그림과 같으며, 이것은 사각펄스 $x(t)$의 푸리에 변환 결과에 대해 magnitude만 확인한 것과 같은 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_ex_visualization2.png">
  <br>
  그림 8. 푸리에 변환의 주파수 응답 부분만 따로 떼서 시각화 한 것
  <br>
  코드 소스: Ex 7.7, Ch 7. Laplace Transform, Signals and Systems, Oktay Alkin
</p>

## 예시 3

아래의 신호에 대해 라플라스 변환을 계산하시오.

$$x(t)=\exp(at)u(t)$$

여기서 $u(t)$는 unit step function으로 아래와 같은 함수이다.

$$u(t)=\begin{cases} 1 && t \geq 0 \\ 0 && \text{otherwise} \end{cases}$$

또, $a$는 임의의 복소수이다.

라플라스 변환은 다음과 같이 계산된다.

$$X(s) = \int_{-\infty}^{\infty}\exp(at)u(t)\exp(-st)dt$$

$$=\int_{0}^{\infty}\exp(at)\exp(-st)dt=\int_{0}^{\infty}\exp((a-s)t) dt=\frac{1}{a-s}\exp((a-s)t)\big|_{0}^{\infty}$$

여기서 $a$를 실수부 $a_r$과 허수부 $a_i$로 구별하여 $a=a_r+ja_i$로 쓰자. 그리고 $s=\sigma+j\omega$로 치환하여 써보면 다음과 같다.

$$\Rightarrow X(s) = \frac{1}{a_r+ja_i-\sigma-j\omega}\exp(a_r+ja_i-\sigma -j\omega)t\big|_{0}^{\infty}$$

$$=\frac{1}{a_r+ja_i-\sigma-j\omega}\exp((a_r-\sigma)t)\exp(j(a_i-\omega)t)\big|_{0}^{\infty}$$

여기서 $\exp((a_r-\sigma)t)$에 $t=\infty$를 넣는다고 하면 이 함수가 발산하지 않기 위해선 아래의 조건이 만족되어야 한다.

$$a_r-\sigma \lt 0 \Longrightarrow \sigma \gt a_r$$

즉,

$$\text{Re}\lbrace s \rbrace \gt \text{Re}\lbrace a \rbrace$$

인 조건을 만족해야 한다는 의미이다. 라플라스 변환을 수행할 때는 라플라스 변환 값이 수렴하기 위한 조건들이 따라붙는다. 영어로는 Region of Convergence(ROC)라고 많이 부른다. 동일한 라플라스 변환 결과를 얻게 되더라도 ROC가 다른 경우들도 있기 때문에 라플라스 변환을 구해준 뒤에는 ROC 조건을 함께 써주는 것이 일반적이다.

결론적으로 라플라스 변환 $X(s)$는 다음과 같다.

$$X(s) = \frac{1}{a-s}[0-1]=\frac{1}{s-a},\space \text{Re}\lbrace s\rbrace \gt \text{Re}\lbrace a\rbrace$$

# 라플라스 변환쌍

# 미분방정식의 풀이를 위한 용법

# 참고문헌

* Signals and systems, Oktay Alkin, CRC Press
* [7. Laplace transform, EEE2047S: Signals and Systems I, Fred Nicolls, University of Cape Town](https://www.dip.ee.uct.ac.za/~nicolls/lectures/eee2047s/notes/07_laplace_notes.pdf)

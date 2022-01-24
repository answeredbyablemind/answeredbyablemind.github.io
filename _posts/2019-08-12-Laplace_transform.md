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

가령 $x(t) = e^{at}\cos(\omega t)u(t),\space \text{ for }a>0$ 같은 신호 혹은 이와 같은 impulse response를 갖는 시스템은 푸리에 해석을 통해 분석할 수가 없다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic_diverging_cosine.png">
  <br>
  그림 1. 시간이 지남에 따라 발산하는 정현파
</p>

이유는 적분이 불가능하기 때문이다. 실제로 $x(t)$를 푸리에 변환해보면,

$$X(f)=\int_{-\infty}^{\infty}x(t)\exp(-j2\pi ft)dt = \int_{-\infty}^{\infty}\exp(t)\cos(2\pi 3 t)u(t)\exp(-j2\pi ft)dt$$

$$=\int_{0}^{\infty}\cos(6\pi t)\exp(t)\exp(-j2\pi ft)dt$$

$$=\left|\frac{1}{6\pi}\sin(6\pi t)\exp(t)\exp(-j2\pi ft)\right|_{0}^{\infty}\\-\int_{0}^{\infty}\frac{1}{6\pi}\sin(6\pi t)\left(\frac{1}{1-j2\pi f}\exp(t)\exp(-j2\pi ft)\right)dt$$

문제는 $\exp(\infty)$는 무한대이기 때문에 위 적분값은 발산하며 푸리에 변환이 존재하지 않는다. 다시 말해, 푸리에 변환의 주된 응용 분야인 주파수 분석이 불가능해진다는 뜻이다. 하지만 불안정한 시스템도 주파수 분석을 할 수만 있다면 유용한 점이 많을 것이다. 가령, 이 신호 혹은 임펄스 응답이 얼마나 빠른 속도로 발산하게 되는지, 그리고 어떤 주파수로 oscilating하는지 등에 대해 알 수 있게 된다는 것이다.

피에르 시몽 라플라스(Pierre Simon Laplace, 1749-1827)는 이런 한계를 극복할 수 있게 푸리에 변환을 일반화시킬 수 있는 변환을 생각해냈다[^1]. 

[^1]: Grattan-Guinness, I (1997), "Laplace's integral solutions to partial differential equations", in Gillispie, C. C. (ed.), Pierre Simon Laplace 1749–1827: A Life in Exact Science, Princeton: Princeton University Press, ISBN 978-0-691-01185-1

아이디어는 아주 간단하다. 임의의 실수 $\sigma$를 상정하고 oscilating term을 상쇄시킬 수 있는 적절한 $\exp(-\sigma t)$를 곱해서 푸리에 변환하는 것이다.

# 라플라스 변환의 예시와 시각화

## 예시 1

아주 간단한 신호부터 라플라스 변환을 수행해보자. 라플라스 변환이 어려운 이유는 배경에 대한 이해가 어렵기 때문인 것도 있지만 수식이 압도적이기 때문인 것도 있다.

하지만, 사실상 수행해주는 적분은 크게 어렵지 않으므로 한번 도전해보자.

다음과 같은 unit impulse 함수에 라플라스 변환을 수행해보자.

$$x(t) = \delta(t)$$

위 신호에 대해 라플라스 변환을 계산하면 아래와 같다.

$$X(s) = \int_{-\infty}^{\infty}\delta(t)\exp(-st)dt = \exp(-s(0))=1$$

## 예시 2

아래의 신호에 대해 라플라스 변환을 계산하시오.

$$x(t)=\exp(at)u(t)$$

여기서 $u(t)$는 unit step function으로 아래와 같은 함수이다.

$$u(t)=\begin{cases} 1 && t \geq 0 \\ 0 && \text{otherwise} \end{cases}$$

또, $a$는 임의의 실수이다.

라플라스 변환은 다음과 같이 계산된다.

$$X(s) = \int_{-\infty}^{\infty}\exp(at)u(t)\exp(-st)dt$$

$$=\int_{0}^{\infty}\exp(at)\exp(-st)dt=\int_{0}^{\infty}\exp((a-s)t) dt=\frac{1}{a-s}\exp((a-s)t)\big|_{0}^{\infty}$$

여기서 $s=\sigma+j\omega$로 치환하여 써보면 다음과 같다.

$$\Rightarrow X(s) = \frac{1}{a-\sigma-j\omega}\exp(a-\sigma -j\omega)t\big|_{0}^{\infty}$$

$$=\frac{1}{a-\sigma-j\omega}\exp((a-\sigma)t)\exp(j(a_i-\omega)t)\big|_{0}^{\infty}$$

여기서 $\exp((a-\sigma)t)$에 $t=\infty$를 넣는다고 하면 이 함수가 발산하지 않기 위해선 아래의 조건이 만족되어야 한다.

$$a-\sigma \lt 0 \Longrightarrow \sigma \gt a$$

즉,

$$\text{Re}\lbrace s \rbrace \gt a$$

인 조건을 만족해야 한다는 의미이다. 라플라스 변환을 수행할 때는 라플라스 변환 값이 수렴하기 위한 조건들이 따라붙는다. 영어로는 Region of Convergence(ROC)라고 많이 부른다. 동일한 라플라스 변환 결과를 얻게 되더라도 ROC가 다른 경우들도 있기 때문에 라플라스 변환을 구해준 뒤에는 ROC 조건을 함께 써주는 것이 일반적이다.

결론적으로 라플라스 변환 $X(s)$는 다음과 같다.

$$X(s) = \frac{1}{a-s}[0-1]=\frac{1}{s-a},\space \text{Re}\lbrace s\rbrace \gt \text{Re}\lbrace a\rbrace$$

## 예시 3

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
# 라플라스 변환쌍

# 미분방정식의 풀이를 위한 용법

# 참고문헌

* Signals and systems, Oktay Alkin, CRC Press
* [7. Laplace transform, EEE2047S: Signals and Systems I, Fred Nicolls, University of Cape Town](https://www.dip.ee.uct.ac.za/~nicolls/lectures/eee2047s/notes/07_laplace_notes.pdf)

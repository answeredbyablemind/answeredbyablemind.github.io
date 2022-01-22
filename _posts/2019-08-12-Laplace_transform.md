---
title: 라플라스 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190812
tags: 신호처리
---

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

푸리에 변환의 한계점의 원인을 라플라스는 다음과 같이 생각했다. 아래의 그림은 가로축은 $\sigma$, 세로축은 $j\omega$에 해당하는 값을 나타낸 것이다. 그리고 이 값들은 두개가 더해져

$$s=\sigma + j\omega$$

라는 값을 갖게 되며, 최종적으로는

$$\exp(st)=\exp((\sigma+j\omega)t)=\exp(\sigma t)\exp(j\omega t)$$

와 같이 자연상수의 지수로 올라가게 되는 값으로 보는 것이라 약속해보자. 여기서 $t$는 시간으로 해석하자.

그렇다면 $s$의 위치에 따라 $\exp(st)$의 형태 변화는 아래와 같이 달라진다. (실수부만 표현한 것)

<p align = "center">
  <iframe width = "810" height = "410" src = "https://angeloyeo.github.io/p5/2019-08-12-Laplace_Transform_preview/" frameborder = "0"></iframe>
  <br>
  라플라스 변환에서 $s$의 위치에 따른 기저 함수의 변화
  <br>
  빨간색 마커를 마우스로 움직여 보세요 ^^
</p>

그리고 라플라스는 아래의 그림과 같이 $s=\sigma+j\omega$와 같은 복소수에 대해 $s=j\omega$인 경우가 푸리에 변환이 담당해주는 주파수 대역이라고 해석했다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic4.png">
  <br>
  그림 1. pole의 실수부 부호에 따른 입력 신호의 시간 stability. 그림 출처: dsprelated.com
</p>


기존에 알고 있는 푸리에 변환을 이용해 라플라스 변환을 써보면 다음과 같다.

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

와 같이 쓸 수 있다. 그리고 이 마지막 식을 라플라스 역변환(inverse Laplace transform)이라고 부른다. 이 적분은 복소 공간에서 선적분에 해당하게 된다. 다만 라플라스 변환의 역변환을 구할 때는 실제 위와 같은 적분 식을 계산하기 보단 라플라스 변환의 변환쌍들을 가지고 역추적하는 방식을 더 많이 이용하기 때문에 위와 같은 적분을 수행할 일은 없다.

(편집중, 아래는 구 버전)

# 라플라스 변환의 활용

라플라스 변환은 연속시간 시스템 또는 아날로그 시스템에서 시스템의 안정성을 확인하기 위해서 주로 사용된다. 이 때, 특히 주목할 것은 s-plane 상의 pole의 위치이다. 일반적인 전달 함수는 다음과 같이 나타낼 수 있다.

$$H(s) = \frac
{b(s-z_0)(s-z_1)\cdots(s-z_{n-1})}
{a(s-p_0)(s-p_1)\cdots(s-p_{n-1})}$$

이 때, 문제를 단순화 시키기 위해 아래 식 (3)의 time-domain representation은 어떠한 것인지 생각해보자[^1]. 

[^1]: 다시 말해, 식 (3)과 같은 transfer function을 얻기 위해선 어떤 time-domain representation이 있었어야 하는지를 유추해보고자 하는데, 여기선 본래는 inverse Laplace transform을 사용해야 하지만 답을 알고있다고 생각하고 time-domain representation을 Laplace 변환해서 식 (3)과 같은 결과를 얻고자 한다.

$$H(s) = \frac{1}{s-p_l}$$

$$\Rightarrow \mathfrak{L}\left[k_l\exp(p_l t)\right] =\int_{0}^{\infty}k_l\exp(p_l t) \exp(-st) dt$$

$$=\int_{0}^{\infty}k_l \exp\left((p_l-s)t\right)dt$$

[//]:# (식 5)

$$=\lim_{b\rightarrow \infty}\frac{k_l}{p_l-s}\exp\left((p_l-s)t\right)|^{b}_{0}$$

$$=\lim_{b\rightarrow \infty}\frac{k_l}{p_l-s}\left\lbrace\exp\left((p_l-s)b\right)- 1\right\rbrace$$

$$=\lim_{b\rightarrow \infty}\frac{k_l}{p_l-s}\left\lbrace\exp\left(p_lb-sb\right)- 1\right\rbrace$$

$$=\lim_{b\rightarrow \infty}\frac{k_l}{p_l-s}\left\lbrace\exp(p_lb)\cdot \exp(-sb) - 1\right\rbrace$$

$$=\frac{k_l}{p_l-s}\left\lbrace 0 - 1\right\rbrace$$

[//]:# (식 10)

$$ = \frac{k_l}{s-p_l}$$

이 때, $p_l$은 pole의 위치를 의미하게 된다.

다시 한번 여기서 $p_l$을 실수부와 허수부로 나눠서 생각해보자.

$$p_l = \sigma_l + j\omega$$

$$\therefore \exp(p_l t) =\exp(\sigma_l t+ j\omega t) = \exp(\sigma_l t) \times \exp(j\omega t)$$

식 (13)에서 $\exp(j\omega t)$가 의미하는 것은 각속도 $\omega$로 회전하는 원의 표현이며, $\omega$의 크기가 커질 수록 빠르게 회전하는 것을 의미한다.


한편, $\exp(\sigma_l t)$는 원의 반지름이 시간에 따라 어떻게 변하는가를 의미하는데, $\sigma_l < 0$인 경우 원의 반지름은 시간이 지나갈 수록 줄어들게 되며, $\sigma_l = 0$인 경우 원의 반지름은 그대로 유지되며, $\sigma_l > 0$인 경우 원의 반지름은 시간이 지나갈수록 커진다는 뜻이다. 따라서 입력신호 $k_l \exp(p_l t)$의 $p_l$의 실수부의 값의 부호에 따라 입력 신호는 다음과 같이 표현될 수 있다. 

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic2.png">
  <br>
  그림 2. pole의 실수부 부호에 따른 입력 신호의 시간 domain 상 표현
</p>

그렇기 때문에 s-plane 상에서 stability를 결정하게 되는 요소는 pole의 실수부의 부호가 되고, 복소 평면 상에서 pole이 어디에 있는지에 따라 stability를 판단할 수 있게 된다. 그림으로 표현한 것은 다음과 같다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic3.png">
  <br>
  그림 3. pole의 실수부 부호에 따른 입력 신호의 시간 stability. 그림 출처: MATLAB in use, transfer function
</p>


# 푸리에 변환과 라플라스 변환

푸리에 변환(Fourier Transform)과 라플라스 변환(Laplace Transform)은 가장 널리 사용되는 두 개의 적분변환이다. 사실, ‘푸리에 변환(조금 더 정확하게 말하면 Continuous Time Fourier Transform)을 일반화 시킨 것을 라플라스 변환이다’라고 말할 수도 있는 것이고, 반대로 ‘라플라스 변환의 특별한 경우가 푸리에 변환이다’라고 말할 수도 있는 것이다. 

그것은 수식의 관계를 통해서 보면 더욱 명확해진다. 푸리에 변환의 수식은 다음과 같이 정의되어 있다는 것을 알고 있다.

$$\mathfrak{F}\left[f(t)\right] = \int_{-\infty}^{\infty}f(t)\exp(-j2\pi f t) dt = \int_{-\infty}^{\infty}f(t)\exp(-j\omega t) dt$$

그리고 라플라스 변환의 수식은 다음과 같이 정의되어 있다는 것도 알고 있다.

$$\mathfrak{L}\left[f(t)\right]=\int_{-\infty}^{\infty}f(t) \exp(-st) dt = \int_{-\infty}^{\infty}f(t)\exp(-(\sigma+j\omega)t) dt$$

$$=\int_{-\infty}^{\infty}f(t) \exp(-\sigma t) \exp(-j\omega t) dt$$

그러므로, 라플라스 변환과 푸리에 변환의 수식적 관계는 다음과 같다고 할 수 있다.

$$\mathfrak{L}\left[f(t)\right] = \mathfrak{F}\left[\exp(-\sigma t)f(t)\right]$$

즉, $f(t)$의 라플라스 변환은 $f(t)$에 감쇠함수 $\exp(-\sigma t)$를 곱해서 푸리에 변환한 것과 같다.이 작은 차이에 의해서 **푸리에 변환은 신호를 분석하는데 적절하게 이용** 되고, **라플라스 변환은 시스템을 분석하는데 적절하게 이용**된다. [^2]

[^2]: 그래서 우리가 배우는 과목 이름이 Signals and System이고 주인공들이 푸리에 변환과 라플라스 변환이다. 물론 Continuous Time Domain에 한해서...


그림 4에서는 s-plane과 Fourier transform domain과의 관계도 표현하고 있다. 즉, 전달함수 $X(s)$를 구한 뒤 $s=j\omega$를 대입하면 주파수 응답을 얻을 수 있다는 것이다. 그것을 그림으로 표현한 것은 다음과 같다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic5.png">
  <br>
  그림 5. 복소평면(특히, s 평면) 상에 표현된 라플라스 변환과 푸리에 변환의 관계
  <br>
  <a href = "https://www.quora.com/Signal-Processing-What-are-the-differences-between-Laplace-and-Fourier-Transform"> 그림 출처: Quora의 라플라스 변환과 푸리에 변환의 차이점 </a>
</p>

예를 들어 다음과 같은 lowpass filter의 transfer function을 얻었다고 하자.

$$H(s) = \frac{A_0\omega_0^2}{s^2+\alpha\omega_0 s +\omega_0^2}$$

이 때, $s=j\omega$를 대입해주면 이 시스템의 bode plot을 얻을 수 있게 되어서 주파수 응답을 확인할 수 있게 된다.

$$H(j\omega) = \frac{A_0\omega_0^2}{s^2 + \alpha \omega_0 s + \omega_0^2}\big|_{s=j\omega}$$

$$=\frac{A_0\omega_0^2}{-\omega^2+j\alpha\omega_0\omega+\omega_0^2}$$

$$=\frac{A_0\omega_0^2}{(\omega_0^2 - \omega^2)+j\alpha\omega_0\omega}$$

$$=\frac{A_0\omega_0^2\left((\omega_0^2-\omega^2)-j\alpha\omega_0\omega\right)}{(\omega_0^2-\omega^2)^2+(\alpha\omega_0\omega)^2}$$

따라서,

$$|H(j\omega)| = \frac{A_0\omega_0^2}{\sqrt{(\omega_0^2-\omega^2)^2 +(\alpha\omega_0\omega)^2}}$$

이고,

$$\angle H(j\omega) = \tan^{-1}\left(\frac{-\alpha\omega_0\omega}{\omega_0^2-\omega^2}\right)$$

가 된다.

# 참고문헌

* Signals and systems, Oktay Alkin, CRC Press
* [7. Laplace transform, EEE2047S: Signals and Systems I, Fred Nicolls, University of Cape Town](https://www.dip.ee.uct.ac.za/~nicolls/lectures/eee2047s/notes/07_laplace_notes.pdf)
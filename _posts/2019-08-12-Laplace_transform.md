---
title: 라플라스 변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190812
tags: 신호처리
---
<style>
  @media screen and (max-width:500px){
    iframe {
        width: 100vw; 
        height: 55vw;
        background:white;  
    }
  }

  @media screen and (min-width:500px){
    iframe {
        width: 55vw; 
        height: 30vw;
        background:white;  
    }
  }
</style>


<p align = "center">
  <iframe src = "https://angeloyeo.github.io/p5/2019-08-12-Laplace_Transform_preview/" frameborder = "0"></iframe>
  <br>
  라플라스 변환이 말하는 것: 신호(정확히는 시스템)의 특성을 s-plane에 한번에 표현해보고 싶다.
</p>

# 라플라스 변환

## 라플라스 변환의 정의

라플라스 변환은 라플라스가 1785년에 고안해낸 함수 변환 기법이고, 라플라스 변환 역시 푸리에 변환처럼 적분 변환의 일종이다. 

라플라스 변환의 수학적 정의를 보자.


| DEFINITION 1. 라플라스 변환 |
| --------- |
| 함수 $f$가 $t\geq 0$에 대해 정의된 함수라고 하자. 이 때, 아래의 적분 변환은 함수 $f$의 라플라스 변환이라 한다.<br><center> $$ \mathfrak{L} \left[f(t)\right] = \int_{0^{-}}^{\infty}\exp(-st)f(t) dt \space \text{where} \space s = \sigma + j\omega$$</center>|

사실 Laplace Transform은 정적분의 범위에 따라서 Double-Sided Laplace Transform, Single-sided Laplace Transform 등으로 나뉘기도 하며, 위의 Definition 1은 엄밀하게 말하자면 Single-Sided Laplace Transform이다. 

하지만, 대부분의 라플라스 변환과 관련된 문제를 풀 때에는 Single-Sided Laplace Transform을 사용하고, 공업수학 책 Advanced Engineering Mathematics / Dennis G. Zill et al./ Third Edition /Jones and Barlett
에서조차 Double-Sided Laplace Transform을 언급하지 않는다. 

왜 그럴까? 그 이유는 Laplace Transform을 고안하게 된 이유와 밀접한 관련이 있다.

원래 Laplace Transform은 비단 Ordinary Differential Equation을 풀기 위해서만 고안된 방법은 아니다. 

원래 라플라스 변환은 자연계의 운동들, 예를 들어 포락선(envelope)같은 감쇄현상을 설명하기 위해서 고안된 개념이다. DEFINITION 1의 복소수 $s= \sigma + j\omega$에 대해서 생각해보자. $s$는 자연상수 $e$의 지수 형태로 표현되어 있는데, 이를 분리해서 생각해보면 상수부와 허수부로 분리된다는 것을 알 수 있다. 

상수부분 $\exp(-\sigma t)$는 감쇄를, 허수부분 $\exp(-j\omega t)$는 오일러 공식에 의해 정현파 형태로 표현되게 된다. 이 실수부와 허수부를 곱하게 되면 감쇄하는 진동운동이 표현되는 것이다.

<p align = "center">
  <img width = "600" src = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/DampedSine.png/525px-DampedSine.png">
  <br>
  그림 1. 진동하며 감쇄하는 운동의 표현. y=(e^-x)(cos(2*pi*x))을 그린 것. 출처: Wikipedia
</p>

거기에 라플라스 변환을 이용해서 분석하게 되는 시스템은 대부분 causal system이다. Causal System이 의미하는 것은 무언인가? 그것은 input signal이 $t\geq 0$ 에서 시작된다는 것을 의미하거나 또는 $t<0$에서 input signal 값이 0인 경우를 의미한다. 

그리고 자연 현상은 대부분 causal system이다. 그러므로, 일반적으로 라플라스 변환은 single-sided 라플라스 변환을 의미하며, 그것은 자연현상을 해석하기 위한 라플라스 변환의 원래의 고안 의도에 부합한다고도 말 할 수 있다.

## 라플라스 변환의 활용

라플라스 변환은 연속시간 시스템 또는 아날로그 시스템에서 시스템의 안정성을 확인하기 위해서 주로 사용된다. 이 때, 특히 주목할 것은 s-plane 상의 pole의 위치이다. 일반적인 전달 함수는 다음과 같이 나타낼 수 있다.

$$H(s) = \frac
{b(s-z_0)(s-z_1)\cdots(s-z_{n-1})}
{a(s-p_0)(s-p_1)\cdots(s-p_{n-1})}$$

이 때, 문제를 단순화 시키기 위해 아래 식 (3)의 time-domain representation은 어떠한 것인지 생각해보자[^1]. 

[^1]: 다시 말해, 식 (3)과 같은 transfer function을 얻기 위해선 어떤 time-domain representation이 있었어야 하는지를 유추해보고자 하는데, 여기선 본래는 inverse Laplace transform을 사용해야 하지만 답을 알고있다고 생각하고 time-domain representation을 Laplace 변환해서 식 (3)과 같은 결과를 얻고자 한다.

$$H(s) = \frac{1}{s-p_l}$$

$$\Rightarrow \mathfrak{L}\left[k_l\exp(p_l t)\right] =\int_{0}^{\infty}k_l\exp(p_l t) \times \exp(-st)$$

$$=\int_{0}^{\infty}k_l \exp\left((p_l-s)t\right)dt$$

$$ = \frac{k_l}{p_l-s}\exp\left((p_l-s)t\right)\big|_{0}^{\infty}$$

$$=\frac{k_l}{p_l-s}(0-1) = \frac{k_l}{s-p_l}$$

여기서 $(p_l-s) < 0$임을 가정하였음.

이 때, $p_l$은 pole의 위치를 의미하게 된다.

다시 한번 여기서 $p_l$을 실수부와 허수부로 나눠서 생각해보자.

$$p_l = \sigma_l + j\omega$$

$$\therefore \exp(p_l t) =\exp(\sigma_l t+ j\omega t) = \exp(\sigma_l t) \times \exp(j\omega t)$$

식 (9)에서 $\exp(j\omega t)$가 의미하는 것은 각속도 $\omega$로 회전하는 원의 표현이며, $\omega$의 크기가 커질 수록 빠르게 회전하는 것을 의미한다.


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

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic4.png">
  <br>
  그림 4. pole의 실수부 부호에 따른 입력 신호의 시간 stability. 그림 출처: dsprelated.com
</p>

그림 4에서는 s-plane과 Fourier transform domain과의 관계도 표현하고 있다. 즉, 전달함수 $X(s)$를 구한 뒤 $s=j\omega$를 대입하면 주파수 응답을 얻을 수 있다는 것이다. 그것을 그림으로 표현한 것은 다음과 같다. 

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-12_Laplace_Transform/pic5.png">
  <br>
  그림 5. 복소평면(특히, s 평면) 상에 표현된 라플라스 변환과 푸리에 변환의 관계
  <br>
  출처: https://www.quora.com/Signal-Processing-What-are-the-differences-between-Laplace-and-Fourier-Transform
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
---
title: 시간 샘플링과 나이퀴스트 이론
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190711
tags: 신호처리
---

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Time_Sampling_Aliasing/" width="100%" height = "730"></iframe></p>


{% raw %}

## Sampling theorem의 증명과정

연속시간 신호 $x_c(t)$ 와 이산시간 신호 $x_d[n]$ 을 생각해보자.

이 연속시간 신호의 샘플링 된 sequence는 다음과 같이 표현할 수 있다.

$$x_d[n]=x_c(nT)$$

이 때, $T$ 는 샘플링 간격이다.

연속시간 신호 $x_c(t)$ 에 대하여, 다음과 같은 푸리에 변환을 가진다는 것을 알고 있다.

$$X_c(f) = \int_{-\infty}^{\infty}x_c(t) exp(-j2\pi f t)dt$$

이산시간 신호 $x_d[n]$ 에 대하여, 우리는 다음과 같은 푸리에 변환이 가능함을 알고 있다.

$$X_d(f) = \sum_{n=-\infty}^{\infty}x_d[n]exp(-j2\pi fn)$$

이 때, $X_c(f)$ 와 $X_d(f)$ 의 관계를 수학적으로 표현해보고자 한다.

***

이제  impulse train이라고 불리는 신호를 정의하도록 하자.

$$p_c(t) = \sum_{n=-\infty}^{\infty}\delta(t-nT)$$

<p align = "center">

<img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/4/49/Dirac_comb.svg">
<br>
<br>
그림 1. impulse train의 모습

</p>

impulse train을 이용하여 연속신호를 샘플링한 것을 수학적으로 표현할 수 있다.

따라서, 연속신호와 이산신호의 관계를 다음과 같이 생각할 수 있다.

$$y_c(t) = x_c(t)p_c(t) = \sum_{n=-\infty}^{\infty}x_d[n]\delta_c(t-nT)$$

$y_c(t)$ 는 비주기 연속신호이므로 푸리에변환 할 수 있다. $y_c(t)$ 의 푸리에 변환 $Y_c(f)$ 는 다음과 같이 쓸 수 있다.

$$Y_c(f) = \int_{-\infty}^{\infty}y_c(t) exp(-j2\pi ft)dt $$

$$=\int_{-\infty}^{\infty}\sum_{n=-\infty}^{\infty}x_d[n] \delta(t-nT) exp(-j2\pi ft)dt$$

$$=\sum_{n=-\infty}^{\infty}x_d[n]\int_{-\infty}^{\infty}\delta(t-nT) exp(-j2\pi ft)dt$$

$$=\sum_{n=-\infty}^{\infty}x_d[n] exp(-j2\pi f nT) = X_d(Tf)$$

여기서 식 (8) 에서 식 (9)로 넘어갈 때에는 다음과 같은 델타 함수의 성질을 이용한 것이다.

$$\int_{-\infty}^{\infty}\delta(t-k)f(t) dt = f(k)$$

동시에, $p_c(t)$ 는 주기를 $T$ 로 하는 연속시간 주기 신호이므로. $p_c(t)$ 는 CTFS를 통해 표현할 수 있다.

$$p_c(t) = \sum_{n=-\infty}^{\infty} \delta(t-nT)$$

$$=\sum_{k=-\infty}^{\infty} a_k exp\left(j \frac{2\pi k}{T}t\right)$$

<center> where </center>

$$a_k = \frac{1}{T}\int_{-T/2}^{T/2}\delta(t) exp\left(-j \frac{2\pi k}{T}t\right)dt = \frac{1}{T}$$

<center>(여기서도 식 (10)의 성질을 이용했다.)</center>
<br>

그런데, 동시에 CTFT는 주기 신호이던 아니던 관계없이 어떤 연속 신호라도 적용할 수 있으므로, $p_c(t)$ 에 CTFT를 적용해도 무방하다.

$$P_c(f) = \int_{-\infty}^{\infty}p_c(t) exp(-j2\pi ft) dt $$

$$=\int_{-\infty}^{\infty}\frac{1}{T} \sum_{k=-\infty}^{\infty} exp\left(j\frac{2\pi k}{T}t\right) exp(-j2\pi ft)dt$$

$$=\frac{1}{T} \sum_{k=-\infty}^{\infty}\int_{-\infty}^{\infty} exp\left(j\frac{2\pi k}{T}t\right) exp(-j2\pi ft)dt$$

여기서 식 (16) 내의 정적분 파트에 대해서 생각해보자. 이 식을 다시 쓰면 아래의 식 (17)과 같다.

$$\int_{-\infty}^{\infty}exp\left(j\frac{2\pi k}{T}t\right) exp(-j2\pi ft)dt$$

식 (17)은 $exp\left(j\frac{2\pi k}{T}t\right)$ 를 푸리에 변환한 것으로 해석할 수도 있다.

식 (17)을 이해하기 위해 다음의 두 푸리에 변환에 대해 생각해보자.

$$ \mathfrak{F}(1) = \int_{-\infty}^{\infty}1 \times exp\left(-j2\pi ft\right) = \delta(f)$$

또,  $\mathfrak{F}(f(t)) = F(f)$ 라고 했을 때

$$\mathfrak{F}\left(exp\left(j2\pi f_0 t\right)f(t)\right) = F(f-f_0)$$


즉, 식(17)은 1의 푸리에 변환인데, 그것이 $\frac{k}{T}$ 만큼 modulation 되었다고 생각할 수 있는 것이다.

따라서 식 (17)은 다음과 같이 쓸 수 있다.

$$식(17) = \delta(f-\frac{k}{T})$$

따라서, 식 (16)은 다음과 같이 쓸 수 있다.

$$P_c(f) = \frac{1}{T}\sum_{-\infty}^{\infty}\delta(f-\frac{k}{T})$$

또한, $y_c(t)=x_c(t)p_c(t)$ 로 생각 할 수 있다고 했는데,
컨볼루션과 푸리에 변환 사이의 관계를 생각하면 $Y_c(f)=X_c(f)\otimes P_c(f)$ 이다.
(여기서 '$\otimes$' 연산자는 컨볼루션 연산자를 의미함.)

따라서,

$$Y_c(f) = X_c(f) \otimes P_c(f) = P_c(f) \otimes X_c(f)$$

$$ = \int_{-\infty}^{\infty}P_c(\tau)X_c(f-\tau)d\tau$$

$$=\int_{-\infty}^{\infty}\frac{1}{T}\sum_{k=-\infty}^{\infty}
\delta\left(\tau-\frac{k}{T}\right)X_c\left(f-\tau\right)d\tau$$

$$=\frac{1}{T}\sum_{k=-\infty}^{\infty}\int_{-\infty}^{\infty}
\delta\left(\tau-\frac{k}{T}\right)X_c\left(f-\tau\right)d\tau$$


여기서 우리는 식 (25)의 $\int_{-\infty}^{\infty}{{\delta(\tau-\frac{k}{T})X_c(f-\tau)}d\tau}$ 를 다음과 같이 생각할 수 있다.

$$\int_{-\infty}^{\infty}{{\delta(\tau-\frac{k}{T})X_c(f-\tau)}d\tau}= \delta(f-\frac{k}{T})\otimes X_c(f)$$

> 왜냐하면, 다음과 같이 볼 수 있기 때문이다.
>
> 아래 식에서와 같이 $X(f)$ 와 $Y(f)$ 의 컨볼루션 연산은 $X(f)$ 의 $f$ 를 $\tau$ 로 바꿔주고 $Y(f)$ 의 $f$ 에서 $\tau$ 를 뺀 $f-\tau$ 로 바꿔준 것으로 볼 수 있는데,
>
> $$X(f)\otimes Y(f) = \int_{-\infty}^{\infty}X(\tau)Y(f-\tau)d\tau$$
>
> 마찬가지의  방식을 적용해서 $\delta(f-\frac{k}{T})\otimes X_c(f)$ 에서도 왼쪽의 델타함수에 있는 $f$ 는 $\tau$ 로 바꿔주고, $X_c$ 에 있는 $f$ 는 $f-\tau$로 바꿔주면  $\int_{-\infty}^{\infty}{{\delta(\tau-\frac{k}{T})X_c(f-\tau)}d\tau}$ 와 같기 때문이다.
>

따라서,

$$Y_c(f) =  P_c(f) \otimes X_c(f) $$

식 (26)에 의해서,

$$=\frac{1}{T}\sum_{k=-\infty}^{\infty}\delta\left(f-\frac{k}{T}\right)\otimes X_c(f)$$

델타함수의 성질에 의해서,

$$=\frac{1}{T}\sum_{k=-\infty}^{\infty}X_c\left(f-\frac{k}{T}\right)$$

그러므로 우리는 식 (6)~(9)와 식 (27)~(29)로부터 $X_c(f)$ 와 $X_d(f)$ 간의 관계를 다음과 같이 확인할 수 있다.

$$Y_c(f) = X_d(Tf) = \frac{1}{T}\sum_{-\infty}^{\infty}X_c\left(f-\frac{k}{T}\right)$$

이 때, $X_c(f)$ 의 주파수 스펙트럼이 $|f|>B$ 에서 0, 다른 말로는 $\frac{1}{T}>2B$ 이라면 (즉, 주파수 영역이 bounded),

<center>
<img src="http://bit.ly/1NrhrP4">
</center>

---


## ideal reconstruction

 지금까지 Frequency Domain에서 $X_c(f)$와 $X_d(f)$의 관계에 대해서 알아보았다. 그렇다면 둘의 관계에 대해서 아는 것은 어떤 의미를 갖는 것일까? 혹은 어떤 것을 파악하기 위해서 $X_c(f)$와 $X_d(f)$의 관계를 수식적으로 이해해야 하는 것일까?

 그것은 이 part의 제목인 ideal reconstruction이다. 즉, sampling한 신호(혹은 이산 신호)에 어떤 방법을 취하면 그것이 원래의 contiunous time signal로 완벽하게 복구 시킬 수 있는지를 알고싶은 것이다. 우리는 Sampling Theorem을 통해서 수식적인 관계를 다음과 같이 발견하게 되었다.
 연속시간 신호 와 그것을 샘플링 한 이산시간 신호 $x_d[n]=x_c(nT)$ where T=sampling period에 대해서, $y_c(t)=x_c(t)p_c(t)$ where $p_c(t)=\sum_{n=-\infty}^{\infty}{\delta(t-nT)}$라고 정의할 수 있다. 이 때, 다음과 같은 관계를 발견할 수 있다.

<center>
<img src="http://bit.ly/1Nrhs5A">
</center>

그렇다면, $x_c(t)$의 샘플링한 신호의 fourier transform의 형태인 $Y_c(f)$를 다시 $X_c(f)$로 바꾸기 위해선 어떤 조치를 취해야 할까? 그것은 $Y_c(f)=\frac{1}{T}X_c(f)$이기 때문에 다음과 같은 method를 통해서 를 다시 로 돌려 놓을 수 있다고 할 수 있다.     

<center>

<img src="http://bit.ly/1Nrhvyg">

where

<img src="http://bit.ly/1NrhsSU">

</center>
 즉, $H_c(f)$는 an ideal low pass filter라고 할 수 있다. 즉, 시간 영역(time domain)에서 우리는 $x_c(t)$를 $y_c(t)$에 대하여 다음과 같은 관계를 구할 수 있다.

<center><img src="http://bit.ly/1UhoKhE">

<img src="http://bit.ly/1SCtqB4"></center>
 여기서 우리는 time domain에서의 sinc function이 ideal reconstruction에 사용된다는 것을 알 수 있다.


---

PROOF 1.
impulse response function in ideal reconstruction transfer function


proof)

<center><img src="http://bit.ly/1Nria2F"></center>

$H_c(f)$에 inverse Fourier Transform을 취해보도록 하자.

<center>
<img src="http://bit.ly/1Uhp0NM">

<img src="http://bit.ly/1REObfo">

<img src="http://bit.ly/1REOcjk">

<img src="http://bit.ly/1NrieiO">

<img src="http://bit.ly/1REOd73">

<img src="http://bit.ly/1REOiYc">

<img src="http://bit.ly/1UhoZcJ">
</center>
Q.E.D.

---

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/5wyYgy6LPyQ" frameborder="0" allowfullscreen></iframe></center>

{% endraw %}

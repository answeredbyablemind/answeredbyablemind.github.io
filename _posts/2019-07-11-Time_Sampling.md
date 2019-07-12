---
title: 시간 샘플링과 나이퀴스트 이론
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190711
tags: 신호처리
---
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

여기서 식 () 에서 식 ()로 넘어갈 때에는 다음과 같은 델타 함수의 성질을 이용한 것이다.

$$\int_{-\infty}^{\infty}\delta(t-k)f(t) dt = f(k)$$

동시에, $p_c(t)$ 는 주기를 $T$ 로 하는 연속시간 주기 신호이므로. $p_c(t)$ 는 CTFS를 통해 표현할 수 있다.

$$p_c(t) = \sum_{n=-\infty}^{\infty} \delta(t-nT)$$

$$=\sum_{k=-\infty}^{\infty} a_k exp\left(j \frac{2\pi k}{T}t\right)$$

<center> where </center>

$$a_k = \frac{1}{T}\int_{-T/2}^{T/2}\delta(t) exp\left(-j \frac{2\pi k}{T}t\right)dt = \frac{1}{T}$$


<center>
<img src="http://bit.ly/1PGk3tW">

where <img src="http://bit.ly/1nz6d6f">

<img src="http://bit.ly/1nz6i9X">
</center>


그런데, 동시에 CTFT는 어떠한 연속 신호에도 적용할 수 있으므로, $p_c(t)$에 CTFT를 적용할 수 있다.

<center>
<img src="http://bit.ly/1nz6p5o">


<img src="http://bit.ly/1nz6A0o">


<img src="http://bit.ly/1nz6DcD">
</center>


여기서 우리는 <img src="http://bit.ly/1PGkowW">을 <img src="http://bit.ly/1PGksN7">의 CTFT로도 생각할 수 있는데, 1의 CTFT는 $\delta(f)$ 이며,


CTFT의 modulation property에 의해서,
$exp(j2\pi f_0 t)f(t)$의 푸리에 변환은 $F(f-f_0)$임을 알고 있다.

즉, <img src="http://bit.ly/1PGkowW">은 1의 푸리에 변환인데, 그것이 $\frac{k}{T}$ 만큼 modulation 되었다고 생각할 수 있는 것이다.


따라서, <img src="http://bit.ly/1PGkowW"> 는 <img src="http://bit.ly/1PGksN7">의 푸리에 변환이며 그것은  $\delta(f-\frac{k}{T})$이다..


<center><img src="http://bit.ly/1PGkDIi"></center>


또한, $y_c(t)=x_c(t)p_c(t)$로 생각 할 수 있다고 했는데,
컨볼루션과 푸리에 변환 사이의 관계를 생각하면 $Y_c(f)=X_c(f)\otimes P_c(f)$이다.
<center>
<img src="http://bit.ly/1REMLS2">

<img src="http://bit.ly/1Nrho5y">

<img src="http://bit.ly/1REMNcw">

<img src="http://bit.ly/1Nrhr1q">
</center>

여기서 우리는 $\int_{-\infty}^{\infty}{{\delta(\tau-\frac{k}{T})X_c(f-\tau)}d\tau}$를 $\delta(f-\frac{k}{T})\otimes X_c(f)$로 생각할 수 있다.

따라서,

<center>

<img src="http://bit.ly/1NrhrhR">

<img src="http://bit.ly/1NrhoCK">

</center>

그러므로 우리는 (1)과 (2)로부터 $X_c(f)$와 $X_d(f)$간의 관계를 확인할 수 있다.
<center>
<img src="http://bit.ly/1NrhoTp">
</center>

이 때, $X_c(f)$의 주파수 스펙트럼이 $|f|>B$에서 0, 다른 말로는 $\frac{1}{T}>2B$이라면 (즉, 주파수 영역이 bounded),

<center>
<img src="http://bit.ly/1NrhrP4">
</center>

---


##다. ideal reconstruction

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

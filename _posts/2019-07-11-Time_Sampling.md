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

# 1. 시작하면서
## 가. Sampling theorem의 의미

지금까지 푸리에 급수/변환에서는 다음과 같은 과정을 공부했다.

먼저, Continuous Time Domain에서 Fourier Series를 선두로 시작하였다. 그것을 통해서 Fourier Transform을 유도하였다.

두 번째로는 Discrete Time Domain의 신호에 대해서 Fourier Series와 Fourier Transform을 유도해보았다. 그렇다면, 지금 생각해보려는 시간 샘플링은 어떤 의미를 가지는 것이고 앞서 배운 Fourier Analysis와의 관계는 무엇인가?

그것은 Continuous Time Fourier Analysis와 Discrete Time Fourier Analysis의 연결성이라고 할 수 있는데, 먼저는 연속시간-이산시간의 관계에 대해서 간단하게 생각해보고, 연속시간과 이산시간의 두 Frequency Response의 관계에 대해서 알아보고자 한다.


#2. Sampling theorem의 증명과정

##가. 그림으로 이해하는 Sampling Theorem

 Sampling Theorem은 연속 비주기신호 x(t)를 이산신호로 바꾸었을 때, 두 신호 간에 어떤 관계가 있는지 알아보고자 하는 theorem이다.

 즉, x(t)를 sampling 한 신호 $x_s(t)$는 $x_s(t)=x(t)p(t)$라고 생각할 수 있다.

##나. Sampling theorem

#########################################
# 시간 sampling을 왜 알아야 하는지에 대해 서술 필요     #
#########################################

이렇게 복잡한 이론까지 왜 필요할까?

--> 얼마나 빠른 속도로 sampling을 해야 원상복구할 수 있는지 알고싶음.

즉, aliasing에 관련된 interactive animation 만들 필요 있음.




연속시간 신호 $x_c(t)$를 생각해보자.

그러면 이 연속시간 신호의 샘플링 된 sequence는 다음과 같이 표현할 수 있다. $x_d[n]=x_c(nT)$. 이 때, T 는 샘플링 간격이고, 샘플율(sampling rate)는 $1/T$이다.


연속시간 신호 $x_c(t)$에 대하여, 다음과 같은 푸리에 변환을 가진다.


<center>
<img src="http://bit.ly/1PGjqka"></center>


시간 샘플된 신호 $x_d[n]$에 대하여, 우리는 다음과 같은 푸리에 변환을 가진다.

<center><img src="http://bit.ly/1PGjtfY">

이 때, _**$X_c(f)$와 $X_d(f)$는 서로 어떤 관계를 가지고 있는 것일까?**_

</center>


이제 uniform impulse train이라고 불리는 신호를 정의하도록 하자. <img src="http://bit.ly/1nz5tOr">

그러면 uniform impulse train을 이용하여 연속신호와 이산신호의 시간 영역에서의 관계를 다음과 같이 생각할 수 있다.

<center><img src="http://bit.ly/1PGjCje"></center>


$y_c(t)$는 비주기 연속신호이므로, $y_c(t)$의 푸리에 변환 $Y_c(f)$은 다음과 같이 쓸 수 있다.


<center>
<img src="http://bit.ly/1nz5LVu">

<img src="http://bit.ly/1PGjNeE">

<img src="http://bit.ly/1PGjQHl">

<img src="http://bit.ly/1PGjVuw">
</center>


동시에, $p_c(t)$는 주기를 T로 하는 연속시간 주기 신호이므로. $p_c(t)$는 CTFS를 통해 표현할 수 있다.


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

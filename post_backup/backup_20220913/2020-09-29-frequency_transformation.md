---
title: frequency transformation
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200929
tags: 신호처리
---

본 포스팅은 IIT의 [S. C. Duta Roy 교수님의 강의](https://www.youtube.com/watch?v=UTznDX7GgkQ&ab_channel=nptelhrd)를 정리한 것임을 먼저 밝힙니다.

# 목표

1. Normalized Lowpass Filter의 개념에 대해서 이해한다.

2. Filter간의 Transformation에 대하여 이해한다.

3. Bandpass Filter 또는 Bandstop Filter의 기하평균적 특징(Geometrically symmetric property)에 대해서 이해하고, 그것이 가져오는 문제와 해결책에 대해서 이해한다.

4. Filter Specification으로부터 Butterworth Filter, Chebyshev Filter를 이용하여 그 필터를 설계할 수 있다.

# 1. Frequency Transformation

## 가. Normalized Lowpass Filter

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-29-frequency_transformation/pic1.png">
  <br>
  그림 1. Normalized Lowpass Filter의 형태
</p>

Normalized Lowpass Filter는 위의 그림과 같이 생겼다. Normalized Lowpass Filter(이하 NLPF)는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq1.png">이라고 정해둔 일종의 Lowpass Filter이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq2.png">는 filter의 specification에 의해서 바꿀 수 있도록 변수로 설정되어있다. NLPF가 중요한 이유는 이 NLPF를 이용하여서 다른 어떤 형태의 필터로도 바꾸는 것이 가능하기 때문이다. 

## 나. 이론의 설명에 앞선 용어 정리

설명의 편의를 위해, 다른 어떤 형태의 필터는 Other Kinds of Filters라고 하기 때문에, OKF라고 하겠으며, OKF는 모두 NLPF에서 Denormalized 된 형태이기도 하기 때문에, Denormalized Filters라고 할 수도 있음을 알려둔다. 

그리고 다른 줄임말을 정리하자면, Lowpass Filter(LPF), Highpass Filter(HPF), Bandpass Filter(BPS), Bandstop Filter(BSP)라고 줄이도록 하겠다. 

또한 변형되기 전·후의 Laplace frequency <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq3.png">의 구분을 위해, NLPF의 s를 대문자 S로 적고, 변형 된 후의 s를 소문자 s로 적는다는 것을 밝혀둔다.

## 다. Frequency Transformation from NLPF to OKF

### 1) NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq4.png"> Denormalized LFP

일반적으로 NLPF에서 DLPF로 변형하기 위한 transformation은 다음과 같다.

---

Definition 1. Transformation

Normalized Lowpass Filter <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq5.png"> Denormalized Lowpass Filter

passband frequency <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq6.png">를 가지는 Denormalized Lowpass Filter를 Normalized Lowpass Filter로부터 얻으려면 다음과 같은 변형(transformation)을 적용할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq7.png"> </p>


---

노파심에 한번 정리하자면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq8.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq9.png">로 변형하라는 말은 곧 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq10.png"> 대신에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq11.png">를 대입하라는 말과 같은 말이다. 

이 transformation은 어렵지 않지만, frequency transformation의 타당성을 보여준다. 예를 들자면, transformation은 다음과 같은 과정을 통해서 이루어진다. 가령 다음과 같이 단순한 NLPF가 있다고 생각하자. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq12.png"> </p>

이 LPF는 위의 NLPF DLPF의 transformation을 통해서 다음과 같이 변형될 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq13.png"> </p>

### 2) NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq14.png"> Denormalized HPF

일반적으로, NLPF에서 DLPF로 변형하기 위한 transformation은 다음과 같다.

---

Definition2. Transformation

Normalized Lowpass Filter <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq15.png"> Denormalized Highpass Filter

passband frequency <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq16.png">를 가지는 Denormalized Highpass Filter를 Normalized Lowpass Filter로부터 얻으려면 다음과 같은 변형(transformation)을 적용할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq17.png"> </p>

---

이 transformation이 타당한지 몇 개의 함수값을 통해서 검토해보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq18.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq19.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq20.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq21.png">는 NLPF의 passband frequency를 가리킨다. 그것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq22.png">의 관계 때문이다. 즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq23.png">-axis의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq24.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq25.png">-domain에서의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq26.png">를 가리키기 때문이다. 

위의 검토를 통해서, Definition 2의 transformation은 NLPF에서 DHPF로의 변형이 알맞게 된다는 것을 확인할 수 있다. 이것 역시 간단한 예를 들어서 보여주자면, 다음과 같다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq27.png"> </p>

더불어, 또 생각해볼 것이, [negative frequency](https://angeloyeo.github.io/2019/07/22/Negative_Frequency.html)의 존재이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq28.png"> </p>

의 관계에서 볼 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq29.png">에 해당하는 DHPF의 주파수는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq30.png">이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq31.png">에 해당하는 DHPF의 주파수는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq32.png">임을 알 수 있다. 사실 수학적으로, 모든 filter에는 negative 주파수영역이 존재하고, 그것들의 amplitude는 y축을 중심으로 뒤집힌 모양을 하고 있다. 

하지만, 우리는 0~<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq33.png"> 사이의 주파수에 관심이 있고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq34.png">에 대응되어 양의 주파수<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq35.png">가 출력되기 때문에 이 transformation은 수학적으로도 실용적으로도 문제가 없다. 우리는 필요한 결과만 얻어내면 그것으로 충분하기 때문이다.

### 3) NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq36.png"> Denormalized BPF

일반적으로 NLPF에서 DBPF로 변형하기 위한 transformation은 다음과 같다.

---

Definition3. Transformation

Normalized Lowpass Filter <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq37.png"> Denormalized Bandpass Filter

center frequency <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq38.png">과 passband edge <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq39.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq40.png"> (<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq41.png">)를 가지는 Denormalized Bandpass Filter를 Normalized Lowpass Filter로부터 얻으려면 다음과 같은 변형(transformation)을 적용할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq42.png"> </p>

where <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq43.png"> and <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq44.png"> are defined as

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq45.png"> </p>

and

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq46.png"> </p>

---

위 NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq47.png"> DLPF, NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq48.png"> DHPF 의 변형과 마찬가지로, Def. 3의 변형(transformation)의 타당성을 몇 가지 s와 그 대응값을 통해서 살펴보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq49.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq50.png"> </p>


즉, NLPF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq51.png">이었을 때의 값이 DBPF의 center frequency의 값으로 옮겨지고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq52.png">의 값이 DBPF의 0과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq53.png">의 값으로 옮겨지게 된다. 

NLPF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq54.png">의 값은 0또는 neglibigle한 값을 가지고 있기 때문에 Def.3 의 transformation을 통해서 얻을 수 있는 bandpass filter의 모양은 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-29-frequency_transformation/pic2.png">
  <br> 그림 2. Bandpass filter의 모양
</p>

이제, Banspass Filter가 가지는 passband Frequency에 대해서 생각해보도록 하자. 참고로 이 부분은 Bandpass filter를 구현하는 데에 있어서 가장 중요한 부분을 차지한다고 할 수 있다. 

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq55.png">일 때,

---

Derivation 1. Finding passband frequency in bandpass filter fron NLPF

proof)

① <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq56.png">일 때,

Def. 3의 transformation 관계에 의해서, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq57.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq58.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq59.png"> </p>


2차 방정식의 근의 공식에 의해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq60.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq61.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq62.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq63.png">이라는 것은 명백하기 때문에, s의 한 근은 양수, 한 근은 음수라는 것을 알 수 있다.

② <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq64.png"> 일 때,

마찬가지로, transformation의 식에 의해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq65.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq66.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq67.png"> </p>

2차 방정식의 1차 항의 계수만 부호가 바뀌었다는 것을 알 수 있다. 그렇기 때문에 간단하게, algebra를 생략하고 s를 바로 적을 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq68.png"> </p>

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq69.png">일 때에도 한 근은 양수이고 다른 한 근은 음수인 두 개의 근이 나온다.

③ 중간 결론

결론적으로, NLPF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq70.png">(or<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq71.png">)에 의해서 DBPF는 네 개의 근이 발생한다는 것을 알 수 있다. 그리고 그 네 개의 근은 두 개의 양의 근과 두 개의 음의 근으로 구성되어 있다.

④ 근 사이의 관계(Relation between solutions)
이 때, 두 양의 근을 생각하면 다음과 같다. (우리는 양의 frequency만 생각해도 괜찮기 때문이다.)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq72.png"> </p>

즉, 다음과 같은 관계를 구할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq73.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq74.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq75.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq76.png">라는 사실을 알 수 있다.

---

위 Derivation을 통해서 알 수 있었던 사실은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq77.png">이라는 사실이며, 이 사실은 Bandpass filter의 Center frequency를 정하거나, 역으로 Center Frequency를 통해서 Passband Edges를 구할 때 있어서 매우 중요한 사실이다. 

다시 한번 정리하자면, center frequency는 두 passband edges의 산술평균이 아닌 기하평균이다. 

또한, 이 기하평균은 passband edges 만이 아니라 어떠한 대칭되는 두 frequency에 대해서도 성립한다. 그러므로, stopband edges <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq78.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq79.png">에 대해서도 성립한다. 따라서, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq80.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq81.png"> </p>

이고, passband edges와 stopband edges는 반드시 다음과 같은 관계가 성립되는 것들이어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq82.png"> </p>

그렇기 때문에, Butterworth filter를 설계할 때와 마찬가지로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq83.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq84.png">를 모두 만족시키는 N을 구할 수 없듯이, consumer 가 요구하는 filter의 spec을 모두 만족시킬 수 있는 Bandpass filter는 존재하지 않을 수 있다. 

그렇기 때문에, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq85.png">에 대해서는 exactly satisfy하면서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq86.png">에 대해서는 over satisfy하는 bandpass filter를 설계할 수 밖에 없다. 


### 4) NLPF <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq87.png"> Denormalized BSF

이번엔 Bandstop filter를 설계해보자.

---

Definition 4. Transformation

Normalized Lowpass Filter <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq88.png"> Denormalized Bandpass Filter

center frequency <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq89.png">과 passband edge <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq90.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq91.png"> (<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq92.png">)를 가지는 Denormalized Bandstop Filter를 Normalized Lowpass Filter로부터 얻으려면 다음과 같은 변형(transformation)을 적용할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq93.png"> </p>

where <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq94.png"> and <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq95.png"> are defined as 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq96.png"> </p>

and

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq97.png"> </p>


---

Bandstop Filter는 Bandpass Filter의 역수를 취한 값을 대입했다고 볼 수 있다. 위의 과정에서와 마찬가지로 몇 가지 값을 가지고 transformation의 타당성을 검증해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq98.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq99.png"> </p>

그러므로, 다음과 같은 모양의 결과가 나온다는 것을 수식을 통해서 알 수 있다.

<p align = "center">
  <img src= "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-29-frequency_transformation/pic3.png">
  <br>
</p>

BPF에서와 마찬가지로 BSF에서도 기하평균 property가 적용된다. 즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq100.png"> <br> 식 (37) </p>

[//]:# (식 37)

이다.

# 2. Practical problems that arise in making BPF or BSF

 우리는 지금까지 LPF외에 다른 종류의 필터를 설계 할 때에는 Normalized LPF를 통해서 설계가 가능하다는 사실을 공부했다. 그 방법은 Frequency Transformation이라는 방법이고 구체적인 내용은 다음과 같았다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-29-frequency_transformation/pic4.png">
  <br>
</p>

여기서 Bandpass Filter와 Bandstop Filter는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq101.png"> </p>

을 만족해야한다. 이 관계는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq102.png">일 때의 값을 찾는 2차 방정식의 해를 푸는 것과 관련이 있었다.

이 때, Filter의 설계를 요구 받을 때에는 대부분 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq103.png">는 주어지지 않고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq104.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq105.png">가 주어진다. 

이 때, 식(38)을 만족시킬 수 없는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq106.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq107.png">라면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq108.png"> or <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq109.png">를 조절하여 stopband frequency에 대해서는 oversatisfying 하는 정상적인 (식 (38)을 만족시키는) Bandpass Filter 또는 Bandstop Filter를 구할 수 있다.

## 가. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq110.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq111.png">인 경우

이 때, 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq112.png">의 크기를 줄여주는 작업을 해주어야 한다. 

그렇다면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq113.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq114.png">중에서 어떤 것을 작게 만들어야 할까? 아래의 그림을 보면서 생각해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-29-frequency_transformation/pic5.png">
</p>

다시 한번 말하자면, 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq115.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq116.png">인 경우에 처해있다. 

이 때, Filter의 Specification을 oversatisfying 하기 위해서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq117.png">를 줄여주어야 한다. 

왜냐면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq118.png">을 작게 만들어주게 된다면 그것은 filter의 specification을 만족시켜주지 못하는 필터가 되기 때문이다. 

그러므로, 새로 만들어지는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq119.png">는 다음과 같이 될 것이다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq120.png"> </p>


## 나. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq121.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq122.png">인 경우

이 경우는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq123.png">의 크기를 키워주는 작업을 해야한다. 

이 때 Filter의 Specification을 oversatisfying 하기 위해서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq124.png">의 크기를 키워주어야 한다. 마찬가지로 새로 만들어지는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq125.png">은 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq126.png"> <br> 식 (40) </p>

[//]:# (식 40)

## 다. Modifying <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq127.png"> in NLPF

이제 Bandpass Filter의 Stopband edges를 조절했다면, 문제는 해당되는 NLPF의 Spec에는 어떤 영향을 미치는지 생각해보는 것이다. 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq128.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq129.png">가 주어져 있고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq130.png">에 대한 정보도 충분하기 때문에, 그것들을 이용해서 NLPF에서의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq131.png">에 대해서도 생각해볼 수 있다.

NLPF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq132.png">는 BPF로의 Transformation에 의해서 결정될 수 있다. 그것은, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq133.png"> </p>

와 같은 관계였다. 

이 때, NLPF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq134.png">는, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq135.png">와 같은 관계에 의해서 찾을 수 있다. 그리고, BPF의 stopband edges <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq136.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq137.png">와 같은 관계에 의해서 구할 수 있을 것이다. 

그러므로, 다음의 식이 성립된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq138.png"> </p>

또는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq139.png"> </p>

따라서 여기서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq140.png"> <br> 식 (44)  </p>

[//]:# (식 44)

또는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq141.png"> <br> 식 (45)  </p>

[//]:# (식 45)

라는 것을 알 수 있다. 하지만 이 두 식에는 negative frequency를 말하고 있다는 것을 알 수 있다. 우리는 이 때, 조금 직관적인 방법을 통해서 positive frequency와 negative frequency는 그 부호만 반대일 뿐, 그 크기는 같은 값인 frequency라는 것을 알고 있다. 

그렇기 때문에, 식 (44) 혹은 식 (45)와 같이 써도 무방하다. 다시 한번 상기시키자면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq142.png">에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq143.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq144.png">의 총 4개의 frequency가 mapping 된다. 그렇기 때문에 위와 같은 방법으로 양의 frequency를 찾는 것은 수학적으로 오류가 없다고 할 수 있다.

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq145.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq146.png">중 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq147.png">만 생각해보자면, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq148.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq149.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq150.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq151.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq152.png"> </p>


이다.

# 3. 필터를 설계하는 순서

① Other Kind of Filter (NLPF 외의 필터)의 스펙을 받는다.

② 그 스펙을 NLPF의 스펙으로 변환시킨다. (Transformation이나 2-다.에서 구한 방식으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq153.png">를 찾는다.)

③ NLPF를 디자인한다.

④ Transformation <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq154.png">를 사용하여 필터를 변환시킨다.

⑤ OKF의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-29-frequency_transformation/eq155.png">를 구할 수 있다.
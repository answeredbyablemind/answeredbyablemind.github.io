---
title: 섀넌의 샘플링 정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190711
tags: 신호처리
---

[//]:# (섀넌의 샘플링 정리라는 수정된 제목에 맞춰 내용 수정할 것. )

<p align="center"><iframe width = "802" height = "302" src="https://angeloyeo.github.io/p5/2019-07-11-Shannon_sampling_theorem/" frameborder="0"></iframe></p>

시간 샘플링 이론이 말해주는 것:
<center>

<b>"얼마나 빼곡히 샘플링을 해야 원래 신호로 복구하는데 어려움이 없을까?"</b>

</center>


## 시간 샘플링?

물리적인 (아날로그) 신호를 디지털 화면 상에 표시해주기 위해선 샘플링이 필요하다. 대개 신호처리에서 샘플링이라고 하면 시간 샘플링을 말하는 것 같다.

시간 샘플링이란 원래의 아날로그 신호 (포스트 맨 위 애플릿의 흰색 실선)를 디지털 신호로 바꿔주는 과정이라고 할 수 있다. (드디어 아날로그 세계와 디지털 세계가...!) 포스트 맨 위 애플릿에서는 '어느 정도의' 주기를 갖고 아날로그 신호를 샘플링 해주는데, '어느 정도의' 샘플링 속도 이상이 되면 샘플된 시간과 신호 값들을 가지고 원래의 신호로 거의 비슷하게 복구할 수 있다.

그러면, 이론적으로 '어느 정도의' 주기를 갖고 아날로그 신호를 샘플링 해줘야 원래 신호로 복구 가능한 것일까? (즉, ideal reconstruction).  이 질문에 대한 해답을 sampling theorem에서 구할 수 있다.

## Sampling theorem의 증명과정

연속시간 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq1.png"> 와 이산시간 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq2.png"> 을 생각해보자.

이 연속시간 신호의 샘플링 된 sequence는 다음과 같이 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq3.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq4.png"> 는 샘플링 간격이다.

연속시간 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq5.png"> 에 대하여, 다음과 같은 푸리에 변환을 가진다는 것을 알고 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq6.png"> </p>

이산시간 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq7.png"> 에 대하여, 우리는 다음과 같은 푸리에 변환이 가능함을 알고 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq8.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq9.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq10.png"> 의 관계를 수학적으로 표현해보고자 한다.

***

이제  impulse train이라고 불리는 신호를 정의하도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq11.png"> </p>

<p align = "center">
<img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/4/49/Dirac_comb.svg">
<br>
그림 1. impulse train의 모습
</p>

impulse train을 이용하여 연속신호를 샘플링한 것을 수학적으로 표현할 수 있다.

따라서, 연속신호와 이산신호의 관계를 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq12.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq13.png"> 는 비주기 연속신호이므로 푸리에변환 할 수 있다. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq14.png"> 의 푸리에 변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq15.png"> 는 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq16.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq17.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq18.png"> <br> 식 (8)</p>

[//]:# (식 8)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq19.png"> <br> 식 (9)</p>

[//]:# (식 9)

여기서 식 (8) 에서 식 (9)로 넘어갈 때에는 다음과 같은 델타 함수의 성질을 이용한 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq20.png"> <br> 식 (10) </p>

[//]:# (식 10)

동시에, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq21.png"> 는 주기를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq22.png"> 로 하는 연속시간 주기 신호이므로. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq23.png"> 는 CTFS를 통해 표현할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq24.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq25.png"> </p>

<center> where </center>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq26.png"> </p>

<center>(여기서도 식 (10)의 성질을 이용했다.)</center>
<br>

그런데, 동시에 CTFT는 주기 신호이던 아니던 관계없이 어떤 연속 신호라도 적용할 수 있으므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq27.png"> 에 CTFT를 적용해도 무방하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq28.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq29.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq30.png"> <br> 식 (16) </p>

[//]:# (식 16)

여기서 식 (16) 내의 정적분 파트에 대해서 생각해보자. 이 식을 다시 쓰면 아래의 식 (17)과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq31.png"> <br> 식 (17) </p>

[//]:# (식 17)

식 (17)은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq32.png"> 를 푸리에 변환한 것으로 해석할 수도 있다.

식 (17)을 이해하기 위해 다음의 두 푸리에 변환에 대해 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq33.png"> </p>

또,  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq34.png"> 라고 했을 때

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq35.png"> </p>


즉, 식(17)은 1의 푸리에 변환인데, 그것이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq36.png"> 만큼 modulation 되었다고 생각할 수 있는 것이다.

따라서 식 (17)은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq37.png"> </p>

따라서, 식 (16)은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq38.png"> </p>

또한, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq39.png"> 로 생각 할 수 있다고 했는데,
컨볼루션과 푸리에 변환 사이의 관계를 생각하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq40.png"> 이다.
(여기서 '<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq41.png">' 연산자는 컨볼루션 연산자를 의미함.)

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq42.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq43.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq44.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq45.png"> <br> 식 (25) </p>

[//]:# (식 25)


여기서 우리는 식 (25)의 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq46.png"> <br> 식 (26) </p>

[//]:# (식 26)

 를 다음과 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq47.png"> </p>

> 왜냐하면, 다음과 같이 볼 수 있기 때문이다.
>
> 아래 식에서와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq48.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq49.png"> 의 컨볼루션 연산은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq50.png"> 의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq51.png"> 를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq52.png"> 로 바꿔주고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq53.png"> 의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq54.png"> 에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq55.png"> 를 뺀 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq56.png"> 로 바꿔준 것으로 볼 수 있는데,
>
> <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq57.png"> </p>
>
> 마찬가지의  방식을 적용해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq58.png"> 에서도 왼쪽의 델타함수에 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq59.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq60.png"> 로 바꿔주고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq61.png"> 에 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq62.png"> 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq63.png">로 바꿔주면  
> 
> <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq64.png"> </p>
> 
> 와 같기 때문이다.
>

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq65.png"> </p>

식 (26)에 의해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq66.png"> </p>

델타함수의 성질에 의해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq67.png"> </p>

그러므로 우리는 식 (6)~(9)와 식 (27)~(29)로부터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq68.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq69.png"> 간의 관계를 다음과 같이 확인할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq70.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq71.png"> 의 주파수 스펙트럼이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq72.png"> 에서 0, 다른 말로는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq73.png"> 이라면 (즉, 주파수 영역이 bounded),

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq74.png"> </p>

---


## ideal reconstruction

 지금까지 Frequency Domain에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq75.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq76.png"> 의 관계에 대해서 알아보았다. 그렇다면 둘의 관계에 대해서 아는 것은 어떤 의미를 갖는 것일까? 혹은 어떤 것을 파악하기 위해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq77.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq78.png"> 의 관계를 수식적으로 이해해야 하는 것일까?

 우리는 sampling한 신호(혹은 이산 신호)에 어떤 방법을 취하면 그것이 원래의 contiunous time signal로 완벽하게 복구 시킬 수 있는지를 알고싶은 것이다. 우리는 Sampling Theorem을 통해서 수식적인 관계를 식(32)와 같이 발견하게 되었다.

그렇다면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq79.png"> 의 샘플링한 신호의 fourier transform의 형태인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq80.png"> 를 다시 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq81.png"> 로 바꾸기 위해선 어떤 조치를 취해야 할까? 그것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq82.png"> 이기 때문에 다음과 같은 method를 통해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq83.png"> 를 다시 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq84.png"> 로 돌려 놓을 수 있다고 할 수 있다.     

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq85.png"> </p>

<center>where</center>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq86.png"> </p>

 즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq87.png"> 는 an ideal low pass filter라고 할 수 있다. (특정 주파수보다 낮은 신호들은 모두 내보내고, 특정 주파수보다 높은 대역의 신호들은 모두 통과시키지 않으니까.)

 시간 영역(time domain)에서 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq88.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq89.png"> 에 대하여 다음과 같은 관계를 구할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq90.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq91.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq92.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq93.png"> </p>

 여기서 우리는 주파수 도메인에서 ideal lowpass filter는 time domain에서 sinc function으로 표현된다는 사실까지 확인할 수 있다. 아래는 위의 sinc function의 유도과정을 증명한 것이다.


`PROOF`{:.info} impulse response function in ideal reconstruction transfer function

아래와 같은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq94.png"> 에 대하여 역 푸리에 변환을 취해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq95.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq96.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq97.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq98.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq99.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq100.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq101.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-11-Shannon_sampling_theorem/eq102.png"> </p>

Q.E.D.

---

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/5wyYgy6LPyQ" frameborder="0" allowfullscreen></iframe></center>

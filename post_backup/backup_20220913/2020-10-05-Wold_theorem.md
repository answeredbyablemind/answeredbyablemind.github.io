---
title: Wold's theorem
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201005
tags: 신호처리
---

※ Wold's theorem은 [위너-킨친 정리](https://angeloyeo.github.io/2020/10/04/Wiener_Khinchin.html)의 Discrete Time Random Signal 버전이라고 할 수 있다.

# 1. Discrete Time Random Signal의 Power Spectrum Density (PSD)

※ 해당 내용은 [Richard Shiavi의 Introduction to applied statistical signal analysis, 3e.](https://www.amazon.com/Introduction-Applied-Statistical-Signal-Analysis/dp/0120885816)pp.203 - 205 의 내용을 옮겨 적은 것임.

Wide-sense stationary random signal의 푸리에 변환을 생각할 때의 가장 큰 문제점은 푸리에 변환이 존재하지 않는다는 것이다. 다시 말해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq1.png">가 존재하기 위해서는 신호의 에너지가 유한해야 한다. 다시 말해 아래와 같은 식을 만족해야 한다는 뜻이다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq2.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq3.png">은 최소한 wide-sense stationary 하므로 모든 sample function의 energy는 양의 무한대로 발산하게 된다(Priestly, 1981)[^1]. 실제로 평균 에너지 역시 양의 무한대로 발산하게 된다.

[^1]: 해당 내용에 대한 조금 더 구체적인 설명은 [위너-킨친 정리](https://angeloyeo.github.io/2020/10/04/Wiener_Khinchin.html)의 내용을 참고


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq4.png"> </p>

그런데, 평균 energy 대신에 평균 power는 유한한 양이므로 frequency transformation의 정의에 기반이 될 값으로 사용될 수 있을 것이다. 평균 파워는 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq5.png"> </p>

여기서, 주파수 변수를 위 식에 포함 시키기 위해 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq6.png">을 정의하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq7.png"> </p>

여기서 Parseval's theorem에 따라 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq8.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq9.png">의 sequence는 유한하기 때문에 위의 summation limits 는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq10.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq11.png">까지로 변경될 수 있다. 따라서 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq12.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq13.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq14.png"> </p>

여기서 피적분함수를 power spectral density (PSD)라고 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq15.png"><br> 식 (9) </p>

[//]:# (식 9)

# 2. Wold's Theorem의 증명

Wold's theorem의 결과는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq16.png"> <br> 식 (10) </p>

[//]:# (식 10)

위의 식 (9)와 같은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq17.png">의 정의를 이용해 이를 증명해보도록 하자.

식 (9)에서 극한 내의 값에 대해 조금 더 자세히 살펴보도록 하자.

DTFT의 정의에 의해 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq18.png"> </p>

여기서 선형 연산자를 정리하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq19.png"> </p>

Discrete time signal <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq20.png">이 wide-sense stationary 하다고 가정한다면 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq21.png"> <br> 식 (13) </p>

[//]:# (식 13)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq22.png">은 autocorrelation function이다.

이제 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq23.png"> <br> 식 (14) </p>

[//]:# (식 14)

을 계산하는 방법에 대해 다음과 같이 생각해보도록 하자. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq24.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq25.png">을 독립변수라고 생각해보자. 이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq26.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq27.png">은 다음과 같은 범위를 갖는다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq28.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq29.png"> </p>

또한, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq30.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq31.png">은 discrete 변수이고 interval은 1이다.

따라서, 아래의 그림처럼 식 (14)를 생각할 수 있다. 이 때, 각각의 점들은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq32.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq33.png">의 값이 얼망리 때 대응되는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq34.png">의 값이다. 

즉, 아래 그림에서 검은 동그라미를 모두 그리지는 않았지만 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq35.png"> </p>, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq36.png">의 내부에 검은 동그라미가 모두 꽉 찬 상태가 될 것이다. 

그리고 각 검은 동그라미에 해당되는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq37.png">의 값을 모두 더한 것이 식 (14)를 구한 것과 같은 결과를 얻을 수 있게 되는 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-05-Wold_theorem/pic1.png">
  <br>
  그림 1.
</p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq38.png">이라고 하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq39.png">가 되는 것이고 이것은 기울기가 1인 1차 함수가 된다. 그림에 따르면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq40.png">의 범위는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq41.png">이라는 것을 알 수 있다.

그리고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq42.png">의 값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq43.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq44.png">으로 변하는 동안 더해야 할 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq45.png">의 값을 확인해보면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq46.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq47.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq48.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq49.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq50.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq51.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq52.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq53.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq54.png"> </p>

따라서 모든 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq55.png">에 대하여 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq56.png">일 때 식 (14)의 값은 아래와 같이 표현할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq57.png"> </p>

그러므로, 우리가 구하고자 하는 식 (13)은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq58.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq59.png"> </p>

이 된다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq60.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq61.png"> </p>

가 된다.

또한, DTFT의 정의에 따라

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-10-05-Wold_theorem/eq62.png"> </p>

이다.
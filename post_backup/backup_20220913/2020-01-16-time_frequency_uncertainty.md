---
title: 시간-주파수 불확정도
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200116
tags: 푸리에 신호처리
---

# 가우시안 함수

가우시안 함수(Gaussian function)은 다음과 같은 수식으로 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq1.png"> </p>

가우시안 함수는 complex Morlet wavelet의 envelope 또는 시간 영역에서 보면 time window의 역할을 하게 되는 함수이다. 위의 식 중 상수 a, b,c를 적절히 변형시키면 평균 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq2.png">, 표준편차가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq3.png">인 가우시안 함수를 상정할 수 있다.

가우시안 함수를 이용하는 이유는 양자역학의 코펜하겐 해석을 빌려와 설명할 수 있을 것 같은데, freely moving quantum의 위치(position) 또는 운동량(momentum)이 각자의 space에서 확률적으로 정해진다고 할 때 평균값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq4.png">를 중심으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq5.png">만큼의 표준편차를 가지고 존재한다고 말 할 수 있다면 그 quantum의 위치를 표현하는 확률 분포는 정규 분포를 통해 표현할 수 있기 때문이다[^1].

[^1]: 이러한 가정을 가지고 어떻게 정규분포가 유도되는지 궁금한 사람은 내 유투브의 영상 중 <정규 분포 공식 유도> 편을 보기 바람. https://www.youtube.com/watch?v=vQghF8hjwbw

우리의 경우는 하나의 시간 신호에 대해 시간-주파수 분석을 시행 했을 때 시간-주파수 domain에서 신호가 가지고 있는 시간-주파수 특성을 정확한 좌표로써 알 수 없으며 이것이 어떤 평균적인 위치를 중심으로 어느 정도의 표준편차를 가지고 확률적으로 존재한다고 가정할 때, 시간-주파수 공간의 확률적인 위치는 정규 분포를 통해 표현하는 것이 수학적으로 가장 타당하기 때문이다.

이제 가우시안 함수의 푸리에 변환을 확인해본 다음 불확정성의 원리를 적용시켜 시간-주파수 불확정도의 관계를 확인해보자.

# 가우시안 함수의 푸리에 변환

상수를 적절히 변형시켜 표본의 표준편차가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq6.png">이고, 평균이 0인 분포를 표현하는 Gaussian function은 다음과 같다. 이 함수는 소위 정규분포라고 불리는 함수와 동일하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq7.png"> </p>

이제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq8.png">에  CTFT를 적용하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq9.png"> </p>

조금 복잡하겠지만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq10.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq11.png">에 대해 미분한 다음 미분방정식을 풀어내는 방식으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq12.png">의 꼴을 확인할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq13.png"> </p>

여기서 부분적분을 적용해보도록 하자. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq14.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq15.png">로 두고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq16.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq17.png">로 두면 부분적분 공식을 활용하기 위해 다음과 같은 관계를 유도할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq18.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq19.png"> </p>

그리고 부분적분 공식을 이용하면 위의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq20.png">에 대하여

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq21.png"> </p>

이므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq22.png"> </p>

이다.

여기서 우변의 첫 번째 항인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq23.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq24.png">에서 0으로 수렴하므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq25.png"> </p>

가 된다.

따라서 우리는 다음의 미분방정식을 얻을 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq26.png"> </p>


이 식은 다음과 같이 변경할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq27.png"> </p>

양변에 적분기호를 씌우면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq28.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq29.png"> </p>


따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq30.png"> </p>

이다.

이 때, 적분상수 C를 구해보면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq32.png"> </p>


이며, 이것은 소위 말하는 가우스 적분을 해결함으로써 얻을 수 있다. 가우스 적분을 풀어내는 방법은 내 유튜브 영상 중 가우스 적분 편을 참고하길 바란다 (https://www.youtube.com/watch?v=iLW-CgzA-NU). 

일반적인 가우스 적분의 해는 다음과 같으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq33.png"> </p>

따라서 변수 치환을 활용하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq34.png"> </p>

이고, 이것을 통해서 다음을 확인할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq35.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq36.png"> </p>


따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq37.png"> </p>

이기 때문에

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq38.png"> </p>

임을 알 수 있다.

그러므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq39.png"> </p>

의 푸리에 변환은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq40.png"> </p>

임을 알 수 있다.

즉, 가우시안 함수의 푸리에 변환도 가우시안 함수임을 확인할 수 있다.


# 시간, 주파수 영역에서의 불확정도와 그들의 관계

이때 다시 한 번 정규 분포의 성질을 생각해보면 시간 영역에서 보았을 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq41.png">의 시간 불확정도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq42.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq43.png">이고, 주파수 영역에서 보았을 때 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq44.png">의 주파수 불확정도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq45.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq46.png">라는 것을 알 수 있다. 

따라서 시간, 주파수 불확정도의 관계는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-01-16-time_frequency_uncertainty/eq47.png"> </p>
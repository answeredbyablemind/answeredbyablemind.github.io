---
title: 정규분포의 공식 유도
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200914
tags: 통계학
---

이번 포스트에서는 정규 분포(혹은 가우스 분포)의 공식을 유도해보고자 한다.

정규 분포의 공식은 꽤 복잡하기 때문에 아래의 그림과 같이 세 가지 파트로 나누어 유도해보도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-14-normal_distribution_derivation/pic1.png">
  <br> 그림 1. 정규 분포의 공식과 포스팅에서의 유도 순서
</p>

# prerequisites

이 포스팅에 대해 이해하시려면 아래의 내용에 대해 알고오시는 것이 좋습니다.

* 확률밀도함수의 개념과 특성
* [가우스 적분](https://angeloyeo.github.io/2020/01/17/Gaussian_Integral.html)

# <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq1.png">의 꼴의 유도

우선은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq2.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq3.png">의 꼴을 따른다는 것을 유도해보고자 한다.

## 필요 가정

이를 위해 아래와 같이 중심을 직교좌표계의 원점에 일치시킨 원형 다트 판에 다트 던지기를 하는 과정을 상상해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-14-normal_distribution_derivation/pic2.png">
  <br> 그림 2. 중심을 원점에 일치시킨 원형다트판
</p>

필요한 가정

1. 다트판 상에서 점수를 등고선으로 나타낸다고 했을 때, 동일한 점수의 등고선 상에 맞춘 다트는 모두 점수가 같다. 즉, 확률밀도 함수는 회전에 독립적이다.

2. 다트를 던져서 사각형 안에 맞추는 상황을 가정했을 때, 목표로 하는 사각형의 넓이가 같다면 원점으로부터 사각형까지의 거리가 가까울수록그 사각형에 맞을 확률이 높다.

3. 사각형까지의 거리가 같을 때 사각형의 넓이가 넓을 수록 맞을 확률이 높다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-14-normal_distribution_derivation/pic3.png">
  <br> 그림 3. (좌) 사각형의 크기가 같다면 거리가 가까울 수록 사각형에 맞을 확률이 높음. 즉, 사각형 A, B, C 순서로 다트가 맞을 확률이 높다. (우) 사각형까지의 거리가 같을 때 사각형의 넓이가 넓을 수록 맞을 확률이 높다. 즉, F, E, D 순서로 사각형에 맞을 확률이 높다.
</p>


## 유도 과정

앞서 언급한 세 가지의 가정을 생각하면서, 직교 좌표 상에 임의의 위치 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq4.png">에서 너비가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq5.png">이고 높이가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq6.png">인 사각형 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq7.png">에 다트가 맞을 기댓값을 생각해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-14-normal_distribution_derivation/pic4.png">
  <br> 그림 4. 기댓값을 계산해볼 사각형 A
</p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq8.png">축과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq9.png">축에서 다트가 안착할 확률에 대한 확률밀도 함수를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq10.png">라고 하자.

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq11.png">축과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq12.png">축에 다트가 안착할 확률은 서로 독립적이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq13.png">축과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq14.png">축에 대한 다트가 안착할 확률밀도함수는 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq15.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq16.png">이다.

따라서, 사각형 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq17.png">에 다트가 안착할 기댓값은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq18.png"> <br> 식 (1) </p>

[//]:# (식 1)

한편, 위의 가정 중 회전에 관한 가정을 이용하기 위해 극좌표계를 이용해 같은 확률밀도를 서술해보자.

극좌표계에서 표현한 확률밀도함수를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq19.png">라고 했을 때, 가정 1번에 따라 이 확률밀도함수는 회전에 독립적이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq20.png">이라고 써도 무관하다.

따라서, 사각형 A에 다트가 안착할 기댓값을 극좌표계를 이용해 서술하면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq21.png"> <br> 식 (2) </p>

[//]:# (식 2)

이 때, 식 (1)과 식 (2)는 같은 값이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq22.png"> <br> 식 (3) </p>

[//]:# (식 3)

이며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq23.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq24.png">를 소거하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq25.png"> <br> 식 (4)  </p>

[//]:# (식 4)

이다.

여기서 가정 1을 한번 더 이용해 식 (4)를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq26.png">에 대해 미분해주도록 하자.

그러면 확률밀도함수는 회전에 독립적이므로 회전에 대한 미분의 결과는 0이 되어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq27.png"> </p>

이 식은 아래와 같이 써주어도 무관하다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq28.png"> <br> 식 (6) </p>

[//]:# (식 6)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq29.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq30.png">이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq31.png"> <br> 식 (7) </p>

[//]:# (식 7)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq32.png"> <br> 식 (8)  </p>

[//]:# (식 8)

이다.

따라서, 식 (7)과 식 (8)을 식 (6)에 대입해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq33.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq34.png">이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq35.png">이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq36.png"> </p>

여기서 첫번째 항을 우변으로 넘겨 정리해주면 아래와 같다.

이 때 시각적인 편의를 위해, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq37.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq38.png">로 적어주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq39.png"> </p>

이제 이 식은 상미분방정식임이 확실히 보이는데, [변수분리법](https://angeloyeo.github.io/2021/05/06/separable_differential_equations.html)으로 풀어주기 위해 좌변과 우변을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq40.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq41.png">에 대한 식으로만 나타내보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq42.png"> <br> 식 (12) </p>

[//]: # (위는 식 12)

식 (12)를 잘 보면 식 (12)가 의미하는 것은 양변에서 분자, 분모의 비율이 모두 일정하다는 것을 의미한다. 따라서 식 (12)의 양변의 값은 모두 어떤 상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq43.png">와 같다고 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq44.png"> <br> 식 (13) </p>

[//]: # (위는 식 13)

이제 식 (13)에서 미분 방정식을 풀어주도록 하자. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq45.png">나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq46.png">나 같은 결과를 내기 때문에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq47.png">에 대해서만 풀어주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq48.png"> </p>

여기서 좌변에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq49.png">만 남기도록 식을 한번 정리해주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq50.png"> </p>

여기서 양변을 적분해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq51.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq52.png">은 적분에 의해 생긴 또 다른 상수이다.

따라서 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq53.png">를 다음과 같이 쓸 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq54.png"> <br> 식 (17) </p>

[//]: # (위는 식 17)

그런데, 가정 2번에 따르면 표적 중앙으로부터 거리가 가까울수록 맞을 확률이 높다고 하였기 때문에 식 (17)의 exponential term 내부의 값은 음수가 되어야 한다.

따라서, 식 (17)을 다음과 같이 서술하여 내부의 값이 음수임을 강조하도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq55.png"> <br> 식 (18) </p>

[//]: # (위는 식 18)

# <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq56.png">의 유도

이번 꼭지에서는 앞서 유도한 식 (18)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq57.png">의 값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq58.png">라는 것을 유도해보고자 한다.

확률밀도함수의 특성을 생각해보면 확률밀도함수의 전체면적은 1이 되어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq59.png"> </p>

따라서 다음 식이 만족되어야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq60.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq61.png">는 상수이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq62.png"> <br> 식 (21) </p>

[//]: # (위는 식 21)

식 (21)의 값을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq63.png">라고 하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq64.png"> <br> 식 (22) </p>

[//]: # (위는 식 22)

인데, 중적분의 적분 domain을 직교좌표계에서 극좌표계로 바꿔써주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq65.png"><br> 식 (23)  </p>

[//]: # (위는 식 23)

이 된다[^1].

여기서 다음과 같이 치환해주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq66.png"> </p>

그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq67.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq68.png"> </p>

이다.

따라서 식 (23)은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq69.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq70.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq71.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq72.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq73.png">이므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq74.png"><br> 식 (30)  </p>

[//]: # (위는 식 30)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq75.png"> </p>

따라서, 이 값은 원래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq76.png">과 같으므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq77.png">의 값은 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq78.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq79.png">의 값은 확률밀도함수의 넓이와 관련된 것이므로 항상 양수이기 때문에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq80.png"> 의 값은 양의 값만을 가지게 된다.

또, 식 (21)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq81.png">의 값은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq82.png">와도 같았으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq83.png"> </p>

이다.

따라서, 식 (18)을 다시 쓰면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq84.png"> <br> 식 (34) </p>

[//]:# (식 34)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq85.png">에 대한 답을 얻어야 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq86.png">임을 알 수 있으므로 아래의 exponential 내부의 식 유도 부분에서 계속해서 식을 전개해보도록 하자.

# exponential 내부의 식 유도

그림 1에 있는 정규 분포의 공식에서 exponential term 안에 있는 내부의 식을 유도하기 위해선 확률밀도함수의 moment 개념을 이용해야 한다.

어려운 것은 아니고 다음과 같이 확률밀도 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq87.png">가 주어져있을 때 평균과 분산은 다음과 같이 계산할 수 있다는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq88.png"><br> 식 (35)  </p>

[//]: # (위는 식 35)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq89.png"> <br> 식 (36) </p>

[//]: # (위는 식 36)


우리는 식 (34)까지 구했던 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq90.png">의 식을 이용해서 평균과 분산 값을 적어보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq91.png"> <br> 식 (37) </p>

[//]:# (식 37)

식 (37)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq92.png"> term은 기함수이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq93.png"> term은 우함수이다. 따라서, 기함수 곱하기 우함수는 기함수이므로, 위의 식 (37)의 결과값은 0이 된다.

또, 분산 값을 적어보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq94.png"><br> 식 (38)  </p>

[//]:# (식 38)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq95.png"><br> 식 (39)  </p>

[//]:# (식 39)

여기서 식 (39)를 다음과 같이 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq96.png"> <br> 식 (40) </p>

[//]:# (식 40)

여기서 부분적분을 이용해 식 (40)을 적분해보자.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq97.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq98.png"> 라고 하고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq99.png">을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq100.png">라고 하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq101.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq102.png"> </p>

임을 알 수 있다.

따라서, 식 (40)의 적분 값은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq103.png"><br> 식 (43)  </p>

[//]: # (위는 식 43)

식 (43)에서 대괄호([])안에 있는 term에 대해 먼저 생각해보면 무한대 값에 대해서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq104.png">는 무한대로 발산하고 exponential term은 0으로 수렴하게 되는데, 수렴 속도는 exponential이 0으로 수렴하는 속도가 더 빠르다. 이는 음의 무한대 값에 대해서도 마찬가지로 exponential term이 0으로 수렴하는 속도가 더 빠르다. 따라서 대괄호 안에 있는 term은 결국 0이 되게 된다.

따라서 식 (43)은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq105.png"><br> 식 (44)  </p>

[//]: # (위는 식 44)

여기서 식 (44) 중괄호(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq106.png">)안에 있는 값은 식 (32)로부터 알 수 있는 값이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq107.png"> </p>

그리고 이 값은 원래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq108.png"> 였으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq109.png"> </p>

이다.

다시 식 (34)에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq110.png">값을 대입해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq111.png"> </p>

이 되며, 이 수식은 정규 분포의 수식에서 평균값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq112.png">인 경우를 의미하며 평균값이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq113.png">인 경우에는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq114.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq115.png">로 평행 이동 시켜주면 되기 때문에 최종적인 정규 분포의 공식은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-14-normal_distribution_derivation/eq116.png"> </p>

# reference

* The Normal Distribution: A derivation from basic principles, Dan Teague, The North Carolina School of Science and Mathematics
(https://www.alternatievewiskunde.nl/QED/normal.pdf)

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/vQghF8hjwbw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/EViv-7oHuvw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>


[^1]: 해당 과정의 자세한 설명은 [가우스 적분](https://angeloyeo.github.io/2020/01/17/Gaussian_Integral.html)편을 참고하길 바람.
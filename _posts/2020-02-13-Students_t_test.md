---
title: 스튜던트의 T 테스트
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200213
tags: 통계학
---

# 평균을 이용한 두 집단의 비교

실험을 하거나 특별한 이유로 검증을 해야할 때 두 집단을 비교하는 경우가 왕왕있다.

비교할 두 집단의 특성은 여러가지가 될 수 있겠지만 우리는 주로 두 집단의 평균값을 비교한다.

아래 그림과 같이 두 집단의 분포를 생각해보자.

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic1.png">
    <br>
    그림 1. 임의로 표시한 두 집단의 분포. <br> 두 집단의 평균값의 차이를 보기 위해선 어떤 수학적 조치가 필요할까?
</p>

이 두 집단의 평균적으로 다르다는 것을 확인하기 위해선 어떤 지표를 봐야할까?

상식적으로 생각해보면 두 평균값을 뺀 뒤 그 결과값이 0 보다 크거나 작은지 확인해보면 된다.

하지만, 통계학에서는 이보다 조금 더 엄밀한 방법으로 두 집단의 차이를 비교한다.

## 평균값을 "통계적으로" 비교하기 위한 지표 1: 편차(deviation)

통계학에서 집단간의 평균값을 통계적으로 비교하기 위해서는 편차라는 개념을 사용한다.

우리는 두 가지 편차에 대해 생각해보아야 하는데, 첫 번째는 그룹간 평균의 편차(이하 "그룹 간 편차")이고 두 번째는 그룹 내 평균의 편차[^1](이하 "그룹 내 편차")이다.

[^1]: 사실은 그룹 내 평균의 편차라는 말 보다는 평균의 표준 오차(Standard Error of Mean)라고 부르는 것이 더 정확한 용어이지만, 쉬운 이해를 위해 그룹 내 평균의 편차라고 부르고자 한다. 표준 오차에 대해선 다음 article에서 다루도록 하겠다.

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic2.png">
    <br>
    그림 2. 두 그룹의 그룹 간 편차와 각 그룹의 그룹 내 편차. <br> 각각 빨간색과 초록색으로 표시.
</p>

이 두 가지의 편차(그룹 간 편차와 그룹 내 편차)를 생각해보았을 때, 두 그룹이 차이가 나게 되려면 두 편차들이 어떻게 되어야 할까?

그룹 간 편차는 커야하고 그룹 내 편차(이 경우 두 그룹의 평균적 그룹 내 편차)는 작아야 한다.

그림으로 나타내면 아래의 그림 3과 같다.

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic3.png">
    <br>
    그림 3. 두 그룹의 차이가 평균적으로 커질 수 있는 방법 2가지
</p>

즉, 우선 편차만을 생각했을 때, 두 편차를 모두 이용해 두 그룹간의 차이를 나타낼 수 있는 지표를 하나 만들어본다면 다음과 같이 상정해볼 수 있다.

지표값을 $t$라고 이름 붙여보자.

<p align = "center">
    <img width = "300" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic4.png">
    <br>
    그림 4. 두 그룹의 차이를 나타낼 수 있는 지표. <br> 그룹 간 편차가 커지거나 그룹 내 편차가 작아질 수록 t는 커진다.
</p>


## 평균값을 "통계적으로" 비교하기 위한 지표 2: 표본 개수

우리가 두 그룹의 평균값을 비교하고자 할 때에 실제로는 그림 1~3과 같이 연속적인 두 함수를 비교하는 것이 아니라 샘플들을 추출하여 비교하게 된다.

가령, 어떤 약을 개발했다고 하고 10명의 사람들을 모아 임의로 두 그룹으로 나눈 다음 한 그룹에는 플라시보 약을 주고 다른 한 그룹에는 개발한 약을 주었다고 해보자. 그 때, 그 결과가 그림 5의 왼쪽과 같았다고 하면, 우리가 느끼기에는 과연 이게 약에 의한 효과인지, 아니면 두 그룹으로 나눌 때 우연히 잘못 나누어져서 그룹 간 차이를 보이는 것인지 확신하기 어렵다.

반면에, 30명의 사람들을 추가로 확보해서 마찬가지 방법으로 두 그룹으로 나눈 다음 플라시보 약과 개발한 약을 나누어주어 실험 효과를 추가로 확인해서 이전 실험 결과를 보완했다고 생각해보자. 그 때, 그 결과는 그림 5의 오른쪽이라고 하자. 오른쪽 그림의 각 그룹의 그룹 간 편차와 그룹 내 편차는 거의 같아 보이지만 샘플 수가 더 늘어나게 되어서 더 확실히 약의 효과에 의해 그룹 간 차이를 보였다고 생각하는 것은 타당해보인다.

..... 아무리 생각해도 표준 오차에 대해서 먼저 얘기가 다루어져야할 듯.....

<p align = "center">
    <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic5.png">
    <br>
    그림 5. 표본
</p>

# 참고문헌

* Primer of biostatistics 6th edition, Stanton A Glantz, McGraw-Hill Medical Publishing Division
---
title: 선형 시불변(LTI) 시스템
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220111
tags: 신호처리
---

지금껏 우리는 [정현파 기초](https://angeloyeo.github.io/2022/01/04/sinusoids.html), [복소수 기초](https://angeloyeo.github.io/2022/01/05/complex_number_basic.html), [Phasor](https://angeloyeo.github.io/2019/06/18/phasor.html)에 대해 다루면서 '신호의 표현'에 대해 다루었다고 할 수 있다.

지금부터는 가장 기초적인 시스템 특성인 선형성과 시불변성에 대해 알아보고자 한다. 이 두 특성을 동시에 가지는 시스템을 선형 시불변(Linear Time-Invariant) 시스템이라고 부른다. 

# Prerequisites

이 포스팅을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [신호 처리 서론](https://angeloyeo.github.io/2022/01/03/signal_processing_introduction.html)
* [정현파 기초](https://angeloyeo.github.io/2022/01/04/sinusoids.html)
* [Phasor](https://angeloyeo.github.io/2022/01/04/sinusoids.html)

# 어떤 신호라도 정현파의 조합으로 표현할 수 있다.

신호 시스템을 공부함에 있어 가장 핵심 포인트를 하나 꼽으라면 "어떤 신호라도 정현파의 조합으로 표현할 수 있다"는 말이다.

우리는 이 말에 대해서 점점 더 공부해가게 될 것이다. 당장은 이해하기 어려울 수 있지만, 예시를 확인해가면서 조금씩 익숙해져보자.

참고로 이 말을 수학적으로 증명하는 것은 매우 어렵기 때문에 깊이 이해하려 하기 보다는 받아들이는 편이 낫다.

아래의 그림을 보면 사각파를 정현파의 조합으로 어떻게 표현할 수 있는지를 나타내었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-11-LTI_system/dEe9227.gif">
  <br>
  그림 1. 사각파를 정현파로 분해하여 표현한 그림
  <br>
  출처: <a href = "https://ralasun.github.io/signal%20analysis/2021/06/18/ft-vs-wt/">Rala Sun Blog</a>
</p>

신호의 범주는 단순 사각파에서 그치지 않고 그림마저도 포함된다. 그림도 2차원 평면 상에 그려지는 신호로 볼 수 있기 때문인데, 2차원 평면 상의 신호라도 다양한 주기의 원을 이용해 표현할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-11-LTI_system/AnguishedEarnestIguanodon-size_restricted.gif">
  <br>
  그림 2. 어떤 신호라도 정현파의 조합으로 구성해낼 수 있다.
  <br>
  출처: <a href = "https://gfycat.com/ko/anguishedearnestiguanodon">@gfycat by spolanski</a>
</p>

그럼, 어떤 주파수를 가지는 정현파들을 얼마나 조합할것인가? 라는 질문이 생길 수도 있지만, 이것에 관해서는 "푸리에 시리즈"나 "푸리에 변환" 편에서 더 자세하게 알아보고,

지금 말하고자 하는 핵심 포인트는 "어떤 신호라도 정현파의 조합으로 표현할 수 있다"는 점이다[^1].

[^1]: 왜 꼭 정현파여야만 하나요?라고 물어볼 수도 있다. 아주 좋은 질문. 꼭 정현파일 필요는 없다. 다만, 무수한 정현파들의 조합으로 거의 모든 신호들을 표현할 수 있다는 것이다. 다시 말해 충분 조건이다. 그리고 정현파 세트가 아닌 다른 형태의 "신호 세트들"을 이용해 볼 수도 있다. 이 방법은 푸리에 변환을 "웨이블렛 변환"이라는 개념으로 확장시킬 때 이용될 수 있다.

이제 임의의 신호를 아래의 그림처럼 쪼개서 생각해보자.

신호는 시간에 따른 변화 뿐만 아니라 주파수 성분별로도 구별할 수 있다고 보자는 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-01-11-LTI_system/fourier-transform.png">
  <br>
  그림 3. 임의의 신호를 주파수 성분별로 생각하면, 시간 축, 주파수 축의 여러 요소로 분해해 볼 수 있다.
</p>

어떻게 생각하면 가로 줄 한 줄짜리로 생각했던 신호가 사실은 하나의 테이블로 구성되는 것이라고 생각할 수도 있는 것이다. 그리고, 가로, 세로 축은 시간과 주파수 축을 의미한다고 볼 수 있는 것이다.

[신호 처리 서론](https://angeloyeo.github.io/2022/01/03/signal_processing_introduction.html)에서는 시스템(system)이란 입력 신호를 받고 출력 신호를 내보내는 함수와 유사한 것이라고 한 바 있다.

그리고, 출력 신호는 입력 신호를 특정한 "규칙"으로 변형해 내보내게 된다.

만약 신호가 주파수, 시간의 두 축을 가지는 테이블로 표현되는 것이라고 한다면, 이 "규칙"이 어떤 시간, 어떤 주파수 성분에 대해 동일하게 적용되지 않는다면 연산이 굉장히 복잡해질 것임은 뻔하다.

다시 말해, 단순한 시스템은 시간의 변화에 따라 불변하는 것이어야 한다.

또, 각 주파수 성분별로 쪼개서 동일한 "규칙"을 적용해볼 수 있어야 단순한 시스템이다. 즉, 각 주파수 성분별로 "규칙"을 적용해 합치는 것이 이미 합쳐진 신호에 "규칙"을 적용한 것과 차이가 없어야 한다.


단순한 것이 최고다. 글도 어렵게 쓰는 것보다 쉽게 쓸 수 있어야 하고, 어렵고 복잡한 설명보다는 단순하게 설명하는 것이 더 프로페셔널 한 것이라고 생각한다.

그런 의미에서 시스템도 단순한 것 부터 공부하기 시작한다. 이렇게 "단순한" 시스템을 선형-시불변 시스템(Linear Time-Invariant system)이라고 부른다.

# 선형-시불변 시스템(Linear Time Invariant System)

## 시불변성

시간이 바뀌면서 시스템이 바뀌어 버리면 시스템이 복잡해진다. 매 시간 포인트마다 다른 시스템을 생각해야 하는 것이니 말이다.

시불변성은 다음과 같이 표현할 수 있다. 입력이 $n_0$만큼 지연되었을 대 출력도 같은 정도로 지연된다면 시불변 시스템이라고 할 수 있다.

$$x[n-n_0] \longmapsto $y[n-n_0]$$

## 선형성

중첩의 원리

거의 모든 신호는 정현파의 중첩으로 표현할 수 있다. (몇 가지 조건들이 붙긴 하지만)


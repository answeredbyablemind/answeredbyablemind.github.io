---
title: 귀무가설, 대립가설, 1종/2종 오류
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200325
tags: 통계학
---

분야를 막론하고 새로운 것을 공부하다보면 맞닥뜨리는 어려움 중 하나는 용어이다.

그래서 용어에 대해 친숙해지고 나서야 비로소 해당 분야에 대해서 공부가 풀려가기 시작하는 경우도 많다.

통계학에서 처음 접하는 용어 중 어려운 것들을 꼽으라면 가설에 관한 것이다.

귀무가설, 대립가설, 1종/2종 오류가 대표적인데, 한자 용어라 어려운가 싶어서 영문으로 봐도 전혀 도움이 되지 않는 아주 불친절한 용어들이다. (각각은 null hypothesis, alternative hypothesis, type-1 error, type-2 error로 번역할 수 있다)

필자의 경우 대학원에 들어가서야 통계학을 독학으로 공부했는데 이 용어들에 익숙해지는데까지 1년 넘는 시간이 걸렸던 것 같다.

이번 article에서는 해당 가설과 관련된 용어들을 짚어보면서 어떤 의미를 갖고 있고 어떤 이유로 이런 개념들이 필요한지 알아보도록 하자.

# 귀무가설과 대립가설

우리는 연구/개발을 통해 새로운 사실을 발견했다는 사실을 입증하고자 한다. 

이 때, 귀무가설과 대립가설이 사용되는데,귀무가설과 대립가설은 각각 '새로울 게 없다'는 가설과 '새로운 것이 있다'는 가설로 생각할 수 있다.

가령, 귀무가설과 대립가설은 다음과 같은 것이다.

예) 흡연 여부가 뇌 질환 발생 증가에 영향을 미치는지 연구한다고 하면,

* 귀무가설: 흡연 여부는 뇌혈관 질환의 발생에 영향을 미치지 않는다.
* 대립가설: 흡연 여부는 뇌혈관 질환의 발생에 영향을 미친다.

그런데, 상식적인 수준에서 생각했을 때 쉽게 이해되지 않는 것이 하나 있다.

<p align = "center"> <b>"새로울 것이 있다"는 가설인 대립가설만 사용하면 될 것을 <br>왜 굳이 "귀무가설"이라는 불필요해보이는 개념을 추가로 도입하는 것일까?</b></p>

귀무가설을 굳이 도입하는 본질적인 이유는 우리는 **모수에 대해서 알 수 없으므로** 귀류법[^1] [^2]으로 새로운 가설이 사실임을 간접적으로 증명하려고 하기 때문이다.

[^1]: 귀류법은 어떤 명제를 간접적으로 증명하는 방법이다. 어떤 명제가 참이라고 직접 증명하기 어려우므로 그 부정이 참이라고 가정한 뒤 증명을 해나가다가 모순을 발견하고 이를 통해 해당 명제를 증명한다. 

[^2]: 의외로 귀류법은 평소 생활에서도 종종 쓴다. "자, 니 말이 맞다고 쳐보자~" 라는 식의 화법이 귀류법을 이용한 화법이라고 할 수 있다.

다시 말해, 조사나 연구에서 어떤 변화가 있다는 가설을 검증하고자한다면 역으로 가설이 없다고 가정한 뒤 실험을 진행한다.

그런 다음 변화가 없다는 가설에 모순이 있다는 것을 발견하게 될 수만 있다면 이것을 근거로 변화가 있다는 사실을 간접적으로 증명할 수 있게 되는 것이다.

따라서, 귀무가설을 이용한 가설검증 과정을 다시 정리하면 다음과 같다.

<p align = "center">
    <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-03-25-hypothesis/pic1.png"><br>
    그림 1. 귀무가설을 이용한 가설 검증 프로세스
</p>

The concept of a null hypothesis is used differently in two approaches to statistical inference. In the significance testing approach of Ronald Fisher, a null hypothesis is rejected if the observed data is significantly unlikely to have occurred if the null hypothesis were true. In this case, the null hypothesis is rejected and an alternative hypothesis is accepted in its place. If the data is consistent with the null hypothesis, then the null hypothesis is not rejected. In neither case is the null hypothesis or its alternative proven; the null hypothesis is tested with data and a decision is made based on how likely or unlikely the data is.
This is analogous to the legal principle of presumption of innocence, in which a suspect or defendant is assumed to be innocent (null is not rejected) until proven guilty (null is rejected) beyond a reasonable doubt (to a statistically significant degree).[3]

## 모수에 대해 알지 못하므로 귀류법을 쓴다니?

의미없는 고민일 수도 있지만, 두 그룹의 비교를 수행할 때 우리가 모수를 안다고 가정한 뒤, 검정통계량을 어떻게 정의하면 좋을지 생각해보자.

이것에 대해 생각해보면 왜 귀류법(즉, 귀무가설 기각)을 사용한 가설검증이 필요한지 좀더 이해할 수 있게 된다.

(모평균이 다른 두 모집단에서 샘플을 추출하는 경우에 대한 그림. discrete 하게 그릴 것)

(모평균을 알지 못한다고 가정하는 경우와 안다고 가정하는 경우의 t-value의 정의 차이)

(두 샘플을 당겨와서 비교해야한다)

## 가설 검증 시에는 귀무가설만 이용할 수 있고, 대립가설은 쓸 수 없다?

그렇지 않다.

가설 검증 시 어떤 이유로 대립가설을 사용할 수 없어서 귀무가설 만을 이용할 수 있다고 생각할 수도 있는데 이는 사실이 아니다.

대립 가설을 (간접적으로) 이용한 통계적 추론 방법이 있는데, 이 방법이 바로 신뢰구간을 이용한 검정이다.


# 1종 오류와 2종 오류

모든 가설과 추론을 통한 검증에는 오류가 있을 수 있다.

1종 오류는 false alarm

2종 오류는 


# 참고문헌

* 닥터배의 술술 보건의학통계, 배정민, 한나래 아카데미
* Null hypothesis, Wikipedia
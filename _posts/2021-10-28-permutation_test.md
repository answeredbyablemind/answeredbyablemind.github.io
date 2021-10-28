---
title: 순열 검정법(permutation test)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20211028
tags: 통계학
---

# Prerequisites

본 포스팅을 더 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [표본과 표본 통계량](https://angeloyeo.github.io/2020/02/12/standard_error.html#%ED%91%9C%EB%B3%B8%EC%A7%91%EB%8B%A8%EA%B3%BC-%ED%91%9C%EB%B3%B8-%ED%86%B5%EA%B3%84%EB%9F%89)
* [스튜던트의 t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)
* [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html)
* [중심극한정리의 의미](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)
* [귀무가설](https://angeloyeo.github.io/2020/03/25/hypothesis.html)

# Motivation

두 그룹 간에 통계적으로 유의한 차이가 있는지 확인해보고 싶을 때가 있다.

그런데 어떤 경우에는 기존의 모수 통계 기법을 이용하기 어려운 경우가 있다. 이럴 때 우리는 비모수 검정법 중 하나인 순열 검정법(permutation test)을 고려해볼 수 있다.

우리는 모수 통계 기법을 이용해 분석할 때 생길 수 있는 두 가지 한계점에 대해 생각해보고자 한다.

일단, 임의의 두 그룹에 대해 [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html) 혹은 [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html) 를 이용하는 경우를 상정해보자.

언급한 두 개의 method는 모수 통계 기법(parametric test)이다. 모수 통계기법을 이용할 때는 데이터의 분포가 정규분포라는 것을 가정한다.

혹시나 데이터의 분포가 어떤 형태인지는 모르지만 표본 수가 충분한 경우에는 [중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)에 따라 표본 평균의 분포가 정규분포를 따른다고 볼 수 있으므로 모수 검정법을 시행할 수 있다.

첫 번째 핵심 포인트를 정리하면 모수 통계 기법을 사용할 때는 **데이터의 분포가 정규분포를 따른다고 가정할 수 있어야 한다.**

또, 모수 검정법을 사용해 귀무가설을 검증하는 경우 잘 알려진 [통계량](https://angeloyeo.github.io/2020/02/12/standard_error.html#%ED%91%9C%EB%B3%B8%EC%A7%91%EB%8B%A8%EA%B3%BC-%ED%91%9C%EB%B3%B8-%ED%86%B5%EA%B3%84%EB%9F%89)에 대한 확률 분포를 이용하게 되는데, 이것 역시 한계점으로 작용할 수 있다.

가령, [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)에서는 t-value라는 통계량을 이용해 통계적으로 유의한 차이가 있는지 여부를 판단한다.

이것이 가능한 것은 t-분포가 이론적으로 알려져있기 때문이다. 다시 말해 지금 주어진 두 그룹의 샘플로부터 t-value를 계산했을 때 t-분포 상 어느 정도의 percentile을 점유하고 있는지를 확인함으로써 통계적으로 유의한지를 판가름 할 수 있는 것이다.

두 번째 핵심 포인트를 정리하면 모수 통계 기법을 사용해 귀무가설을 검증하면 **분포가 알려지지 않은 통계량은 사용하기 어렵다.**

이에 반해 비모수 통계 기법 중 순열 검정(permutation test)을 이용하면 데이터의 분포가 정규분포를 따르지 않거나 분포가 알려지지 않은 특이한 통계량을 사용하더라도 귀무가설을 검증할 수 있다.

이번 포스팅에서는 순열 검정의 배경 이론과 실제적인 사용 방법에 대해 알아보도록 하자.

# 순열 검정의 배경 이론

순열 검정의 배경 이론을 이해하기에 앞서 '두 그룹 간 차이가 있다'라고 말하는 것이 어떤 것을 말하는지 다시 한번 복습해보도록 하자.

[귀무가설](https://angeloyeo.github.io/2020/03/25/hypothesis.html), [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html) 등을 공부하면서 귀에 딱지가 앉게 듣는 말이 있다. 바로,

"두 표본 집단이 하나의 모집단에서 나왔다고 하자"

는 귀무가설이다. 이 말은 그림으로 표현해보면 아래와 같이 볼 수도 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-28-permutation_test/pic1.png">
  <br>
  그림 1. 두 표본 그룹이 동일한 모집단에서 추출되었다고 볼 수 있는 경우
</p>

위 그림은 모든 표본이 같은 값이라는 부분은 많이 과장되어 있지만, 본질적으로 짚고자 하는 내용은 다음과 같다.

만약 두 표본 그룹이 동일한 모집단에서 추출되었다고 한다면, 두 그룹 안에 있는 샘플들을 교환한 뒤 통계적으로 검증해도 여전히 두 그룹간에는 차이가 없어야 한다.

이 부분이 permutation test를 생각해내는 가장 핵심적인 아이디어이다. 그리고 이러한 가정이 새로운 귀무가설이 되는데 말하자면 null hypothesis of exchangeability이다.

즉, 정말로 두 그룹의 샘플들이 동일한 모집단에서 나왔다고 한다면 샘플들을 교환해서 통계량을 계산하더라도 두 그룹간의 차이를 볼 수 없어야 한다는 것이다.

그런데, 만약 아래 그림과 같이 두 표본 그룹이 전혀 다른 모집단에서부터 추출되었다면 샘플 간 교환을 수행할 때 통계량의 산출값이 많이 바뀔 것이라는 것을 예상할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-28-permutation_test/pic2.png">
  <br>
  그림 2. 두 표본 그룹이 다른 모집단에서 추출된 경우
</p>

# 순열 검정의 사용 절차

우리는 이제부터 샘플들을 한 쌍 씩 섞어주는 것이 아니라 무작위로 섞은 뒤 그룹을 나눌 것이다. 다시 말해 원래의 데이터들을 순서는 고려한 채 선별하겠다는 의미이다.

이 개념이 바로 고등학교 확률 시간에 배우는 순열(permutation)이다. 그런 다음 통계량을 계산하고 histogram을 그려보자.

일단 우리에게 다음과 같이 두 그룹의 샘플 데이터가 주어져 있다고 생각해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-28-permutation_test/pic3.png">
  <br>
  그림 3. 주어진 두 그룹의 샘플 데이터와 관찰하고자 하는 통계량(평균의 차이)
</p>



<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-28-permutation_test/perm_vid.mp4">
  </video>
  <br>
  그림 
</p>

# Bootstrap과의 차이점?

1. Bootstrap은 estimator의 Confidence interval을 확인하기 위한 목적으로 주로 사용되는 반면 Permutation test는 null hypothesis를 test하기 위해 만들어졌다. 
2. 수행 과정 상에서는 Bootstrap은 중복을 허용하는 resampling을 수행하는 반면 permutation test는 중복없는 재배열을 수행한다는 차이점이 있다.

# 참고 문헌

* [Mass univariate analysis of event-related brain potentials/field I: A critical tutorial review, David M. Groppe et al., Psychophysiology, 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4060794/pdf/nihms449395.pdf)
* [StackExchange: bootstrap vs permutation hypothesis test](https://stats.stackexchange.com/questions/20217/bootstrap-vs-permutation-hypothesis-testing)
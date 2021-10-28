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

또, 모수 검정법을 사용하는 경우에는 잘 알려진 [통계량](https://angeloyeo.github.io/2020/02/12/standard_error.html#%ED%91%9C%EB%B3%B8%EC%A7%91%EB%8B%A8%EA%B3%BC-%ED%91%9C%EB%B3%B8-%ED%86%B5%EA%B3%84%EB%9F%89)에 대한 확률 분포를 이용하게 되는데, 이것 역시 한계점으로 작용할 수 있다.

가령, [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)에서는 t-value라는 통계량을 이용해 통계적으로 유의한 차이가 있는지 여부를 판단한다.

이것이 가능한 것은 t-분포가 이론적으로 알려져있기 때문이다. 다시 말해 지금 주어진 두 그룹의 샘플로부터 t-value를 계산했을 때 t-분포 상 어느 정도의 percentile을 점유하고 있는지를 확인함으로써 통계적으로 유의한지를 판가름 할 수 있는 것이다.

두 번째 핵심 포인트를 정리하면 모수 통계 기법을 사용할 때는 **분포가 알려지지 않은 통계량은 사용할 수 없다.**

이에 반해 비모수 통계 기법 중 


<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-28-permutation_test/perm_vid.mp4">
  </video>
  <br>
  그림 
</p>
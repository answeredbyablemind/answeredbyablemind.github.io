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

일단, 임의의 두 그룹에 대해 [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html) 혹은 [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html) 를 이용하는 경우를 상정해보자.

언급한 두 개의 method는 모수 통계 기법(parametric test)이다. 모수 통계기법을 이용할 때는 데이터의 분포가 정규분포라는 것을 가정한다.

그리고 이런 가정을 세울 수 있는 근간은 [중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)에 있으며, 중심극한정리에 따르면 표본이 무수히 많으면 표본 평균의 분포가 정규분포를 따르기 때문이다.

두 단계를 거쳐 생각해보았을 때, t-test나 ANOVA 등의 모수 통계 기법을 사용하기 위해선 첫번째로 **표본의 숫자가 충분히 많아야 한다.**






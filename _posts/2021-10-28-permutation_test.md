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

바로 생각이 드는 것은 [t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html) 혹은 [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html) 정도일 것 같다.

언급한 두 개의 method의 공통점 중 하나는 둘 다 모수 통계 기법(parametric test)이라는 것이다.

모수 통계라는 것은 다르게 표현하면 데이터의 분포가 정규분포라는 것을 가정한다는 것이다. 

한번 더 깊게 들어가보면 이런 가정을 세우는 것은 [중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)에 따라 표본이 무수히 많아질 때는 표본 평균의 분포가 정규분포를 따르기 때문이다.

두 단계를 거쳐 생각해보았을 때, t-test나 ANOVA 등의 모수 통계 기법을 사용하기 위해선 기본적으로 **표본의 숫자가 충분히 많아야 한다.**




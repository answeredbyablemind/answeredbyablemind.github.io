---
title: 신뢰 구간의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210105
tags: 통계학
---

# Prerequisites

해당 post를 잘 이해하기 위해서는 다음의 내용에 대해 알고 오시는 것을 추천드립니다.

* [중심극한정리의 의미](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)
* [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)
* [귀무가설과 대립가설의 의미](https://angeloyeo.github.io/2020/03/25/hypothesis.html)
* [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)

# p-value 만으로는 충분하지 않다.

앞서 공부한 통계 기법([t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html), [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html) 등...)에서 주요하게 사용되는 통계적 결과 처리 기법은 귀무가설의 기각 여부를 나타내는 것이다.

귀무가설을 기각할 수 있다는 것은 귀무가설과 현재 얻은 결과가 서로 양립할 수 없음을 의미하고, 우리는 p-value으로 양립할 수 있는 정도를 표현한다.

즉, p-value는 확률값으로써 귀무가설과 현재 얻은 결과가 얼마나 일치(compatible)한다고 할 수 있는지에 관해 말해주고 있다고 할 수 있다.

그래서 낮은 p-value (통상 0.05 이하)를 얻었다는 것은 귀무 가설과 현재의 실험 결과가 그만큼 일치하지 않는다는 것을 말하는 것이고, 그에 따라 귀무가설을 기각한다.

그런데, p-value의 문제점이 무엇이었던가? p-value는 귀무가설 기각 여부를 확인하기 위해 편리하게 만들어 놓은 도구이다.

p-value는 treatment effect의 size 뿐만 아니라 sample size에도 영향을 받는 값이라는 점을 [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)편에서 다룬 적이 있다.


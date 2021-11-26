---
title: 윌콕슨 부호 순위 검정
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20211126
tags: 통계학
---

※ 이 포스팅의 내용은 Stanton Glantz의 Primer of biostatistics 교재를 참고하여 작성되었습니다.

# Prerequisites

이 포스팅의 내용을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [대응표본 t-검정](https://angeloyeo.github.io/2021/10/29/paired_t_test.html)
* [윌콕슨 순위합 검정](https://angeloyeo.github.io/2021/11/17/ranksum.html)

# Motivation

이전 [대응표본 t-검정](https://angeloyeo.github.io/2021/10/29/paired_t_test.html) 편에서는 각 피험자가 처치를 받기 전과 후를 비교할 수 있도록 하는 paired t-test에 대해 알아본 바 있다.

독립표본 t-검정에서와 마찬가지로 대응표본 t-검정에서도 샘플들이 정규 분포를 띄는 모집단에서 나왔을 것이라 가정하고 있다. 

이번 포스팅에서는 대응표본 t-검정의 비모수 버전인 윌콕슨 부호 순위 검정(Wilcoxon's signed rank test)을 알아보고자 한다. '비모수'라는 말에서부터 알 수 있듯이 이 검정은 정규성에 대한 가정을 하지 않는다.

# 부호 순위 검정

## 부호 순위 검정의 원리 소개

부호 순위 검정의 방식은 부호합 검정을 약간 업그레이드 한 것이라고 볼 수 있다.

주요한 포인트는 부호 순위 검정에 사용되는 데이터들은 before / after가 나눠지는 데이터들이라는 점이다. 따라서, 우리는 이 데이터들을 보면 처치 전, 후의 차이를 알 수 있다.

우리는 이 '차이'값의 순위를 매기고, 부호가 포함된 순위를 매길 것이다.

그리고, 부호가 포함된 순위의 합을 통계량으로 사용해보려고 한다. t-test에서나 부호합 검정에서와 마찬가지로 가능한 통계량에 대해 모두 조사한 뒤 우리가 얻게 된 통계량이 얼마나 유의한 값인지 확인해볼 수 있을 것이다.

예시를 통해 조금 더 자세하게 이해해 보도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic1.png">
  <br>
</p>

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic2.png">
  <br>
</p>


## 부호 순위 검정의 정규 근사


# 참고문헌

* Primer of biostatistics, 7th ed., S. Glantz / Ch. 10 Alternatives to Analysis of Variance and the t Test Based on Ranks

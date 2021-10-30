---
title: 대응 표본 t 검정(paired t-test)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20211029
tags: 통계학
---

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-29-paired_t_test/pic0.png">
  <br>
  어떤 집단의 before / after를 비교하려고 할 때는 어떤 통계 기법을 사용할 수 있을까?
</p>

이 포스팅은 Primer of Biostatistics, S. Glantz, 7판을 참고하여 작성하였습니다.

# Prerequisites

이 포스팅을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [t-value의 의미와 스튜던트의 t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)

# Motivation

이전의 포스팅 중 [t-value의 의미와 스튜던트의 t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)에서는 두 표본 그룹을 통계적으로 비교하는 방법 중 하나로 t-test를 소개한 바 있다. 이 때 소개한 t-test를 독립 표본 t-검정(independent sample t-test)이라고도 부르는데, 그 이유는 서로 독립적으로 추출한 두 샘플 그룹 간의 비교를 수행하기 때문이다.

그런데, 간혹 실험을 수행하다보면 동일 피험자에 대해 before / after를 비교해보고 싶은 때가 생긴다. 가령, 다이어트 약의 효능이라던가 금연 효과 같은 실험이 그렇다고 할 수 있다. 만약 동일 피험자에 대해 before / after를 통계적으로 비교할 수 있다면, 각 사람에 대한 효과를 확인할 수 있으므로 더 민감하게 처치 효과를 확인해볼 수 있을 것이다.

이렇듯 동일 피험자들에 대한 before / after 를 통계적으로 비교해볼 수 있게 하는 모수 통계 기법으로 대응 표본 t-검정(paired t-test)를 소개하고자 한다.

# paired t-test

앞서 Motivation 파트에서는 동일 피험자에게 수행한 처치에 대해 before / after 비교가 가능하다면 더 효과적으로 처치 효과에 대한 검증이 가능하다고 하였는데, 이 말의 의미가 어떤 것인지 예시를 들어가며 구체적으로 더 알아보도록 하자.

아래의 그림 1은 이뇨제(소변이 더 잘나오게 하는 약)의 효과를 확인해보기 위한 실험 결과를 도시해놓은 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-10-29-paired_t_test/pic1.png">
  <br>
  그림 1. 이뇨제의 처치 효과를 관찰하기 위한 실험 결과
  <br>
  이 그림은 Primer of biostatistics, 7th ed., S. Glantz의 Figure 9-1을 참고하여 만든 것 입니다.
</p>

그림 1을 보면 왼쪽(A) 그림과 오른쪽(B) 그림에서 차이점을 쉽게 확인할 수 있다. 줄이 그어져있는지 여부이다. 왼쪽(A) 그림은 플라시보(placebo)와 약물(drug) 그룹이 서로 독립적으로 추출된 표본 그룹임을 상정한 경우이다. 반면, 오른쪽(B) 그림은 동일한 표본 그룹의 피험자들에게 플라시보(placebo)와 약물(drug)을 한번씩 처치하여 실험이 진행된 것을 상정하고 있다.



# 참고문헌

* Primer of biostatistics, 7th ed., S. Glantz / Ch. 9 Experiments when each subject receives more than one treatment
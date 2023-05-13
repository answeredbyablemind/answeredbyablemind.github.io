---
title: 윌콕슨 부호 순위 검정
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20211126
tags: 통계학
lang: ko
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

아래 그림은 6명의 사람에게 이뇨제를 투약시킨 뒤 소변량이 얼마나 변했는지를 실험한 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic1.png">
  <br>
  그림 1. 6명의 사람에게 이뇨제를 투약 한 뒤 소변량의 변화를 관찰한 실험
  <br>
  출처: Primer of Biostatistics 7th ed., Stanton A. Glantz
</p>

그림 1에서 볼 수 있듯이 부호 순위 검정을 수행하기 위해서는 각 피험자별로 before, after 조건의 결괏값을 빼주어야 한다.

그리고 차이의 크기를 가지고 순위를 매겨준다. 주의할 점은 여기서는 차이의 부호에 관한 것은 생각하지 않는다는 점이다. 그래서 만약 차이값이 100인 경우와 -100인 경우는 동일 순위로 간주해야 한다.

순위가 다 매겨지면 차이의 부호에 맞게 순위에 부호를 덧붙여준다.

그리고 모든 사람들에 대해 얻은 부호 순위의 합을 구해주면 그림 1의 가장 오른쪽 밑에 있는 통계량 W를 구할 수 있게 되는 것이다.

자, 이제는 우리가 얻은 통계량 W가 얼마나 유의하게 크거나 작은 값인지 알아볼 차례이다.

순위합 검정에서 시행했던 것 처럼 우리는 가능한 모든 부호와 순위에 관한 조합들로 얻을 수 있는 W 값을 시뮬레이션하고 분포를 얻은 다음, 우리가 얻은 W값이 충분히 크거나 작은지 알아볼 것이다.

따라서, 아래의 그림과 같이 1~6의 순위에 대해 + 혹은 - 부호가 붙는 모든 경우의 수에 대해 W값을 구해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic2.png">
  <br>
  그림 2. 6개의 순위와 2개의 부호를 이용해 얻을 수 있는 가능한 모든 조합에 대해 W의 값을 계산한 것
</p>

총 $2^6=64$개의 조합이 나오며 이 때 얻은 $W$의 값을 히스토그램으로 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic3.png">
  <br>
  그림 3. 가능한 W의 모든 조합을 histogram으로 그린 것
</p>

이렇게 보면 양측의 두 개씩(즉, W는 19이상 혹은 -19이하)의 W 값이 4/64 = 0.0625 즉, 6%를 차지한다는 것을 알 수 있다.

그런데, 우리가 얻은 W의 값은 -13이므로 양측 6%를 차지하는 -19보다 그 값이 더 크다. 따라서, 그룹 간 차이가 없을 것이라는 귀무가설을 기각할만큼 W의 크기가 크지 않다는 것을 알 수 있다.

이와 같은 방법으로 n이 꽤 작을 때에는 가능한 모든 조합에 대해 W를 계산해봄으로써 critical value를 쉽게 구할 수 있다. 아래의 그림에서는 n = 5, 6, 7, 8 일 때의 유의한 W 의 크기와 p-value를 보여주고 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-11-26-signed_rank/pic4.png">
  <br>
  그림 4. n=5~8일 때의 유의하게 큰 W와 p-value
  <br>
  출처: Mosteller F, Rourke R, Sturdy Statistics: Nonparametrics and Order Statistics, Reading, MA: Addison-Wesley; 1973
</p>

## 부호 순위 검정의 정규 근사

부호 순위 검정을 수행할 때 n 수가 꽤 커진다면 어떨까?

가능한 조합의 수는 $2^n$ 개이므로 n = 10 이상이라면 기하급수적으로 생각해볼 수 있는 조합의 수가 꽤 커지게 된다.

따라서, 부호합 검정에서 사용한 접근법과 마찬가지의 접근법으로 정규 근사를 통해 부호 순위 검정의 결과를 간접적으로 얻어낼 수 있다.

n수가 커졌을 때 $W$는 다음과 같은 모수를 가지는 정규 분포에 근사한다고 알려져 있다.

$$\mu_W = 0$$

$$\sigma_W = \sqrt{\frac{n(n+1)(2n+1)}{6}}$$

여기서 $n$은 실험 피험자의 숫자이다.

그러므로 우리는 아래와 같은 변수 $Z$를 생각해 볼 수 있다. 이 변수 $Z$는 정규분포를 따를 것이다.

$$Z_W = \frac{W-\mu_W}{\sigma_W}=\frac{W}{\sqrt{[n(n+1)(2n+1)]/6}}$$

부호합 검정에서의 연속 수정(continuity correction)과 마찬가지 방법으로 $Z_W$는 다음과 같이 수정될 수 있다.

$$Z_W = \frac{|W|-1/2}{\sqrt{[n(n+1)(2n+1)]/6}}$$

# 참고문헌

* Primer of biostatistics, 7th ed., S. Glantz / Ch. 10 Alternatives to Analysis of Variance and the t Test Based on Ranks

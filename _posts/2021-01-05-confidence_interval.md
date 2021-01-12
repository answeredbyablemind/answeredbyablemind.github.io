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

# 모평균과 표본 평균 간의 관계

본격적으로 신뢰 구간(confidence interval)에 대해 다루기 위해 모평균과 표본 평균에 대해 다시 한번 짚고 넘어가보도록 하자.

이 내용은 [표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)에서 본 내용과 본질적으로 같지만, 약간은 다른 관점으로 접근하게 될 것이다.

아래의 그림을 보도록 하자.

<p align = "center">
  <img  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic1.png">
  <br>
  그림 1. 
</p>


한편, 정규분포에서 평균값을 중심으로 2 * 표준편차의 범위는 약 95%의 면적을 차지한다[^1]. 

<p align = "center">
  <img src = "https://loonylabs.files.wordpress.com/2019/09/variance-2.png?w=590">
  <br>
  그림 6. 정규분포는 평균으로부터 ±2 SD 만큼 떨어진 곳 까지의 넓이는 약 0.95이다.
  <br>
  <a href = "https://loonylabs.org/2019/09/12/day24-365doa/">그림 출처 </a>
</p>

이를 바탕으로 위 세 가지 사실을 종합하면 다음과 같은 결론을 이끌어낼 수 있다.

"내가 지금 추출한 표본 평균은 모평균으로부터 2 * 표준 오차 (SEM) 범위 안에 95% 확률로 들어오게 된다." 

[^1]: 정확히는 2가 아니라 1.96으로 쓰는게 맞으며, 1.96이라는 숫자도 표본의 크기가 대략 20이상일 때 이 말이 성립한다. 그 이유는 표본의 크기가 그 보다 작으면 t-분포를 사용해야 하기 때문이다. 표본의 크기가 20보다 작을 때 엄밀한 계산을 위해서는 자유도에 맞는 적절한 t-value를 선택해서 곱해주어야 한다.

[//]:# (모평균과 표본평균의 관계?)

[//]:# (졸라맨 그림 + 평균들 그림으로 설명할 것)

[//]:# (근데, 우리는 모평균은 모른다는 얘기 넣을 것.)


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic7.png">
  <br>
  그림 7. 모평균은 ± 2 * 표준 오차 범위 안에 95% 확률로 포함되어 있다.
</p>

조금 더 풀어서 생각해보았을 때, 95% 확률로 들어오게 된다는 말은 무슨 의미일까?

그것은 100번 정도 반복 샘플링을 해 보았을 때 95번 가량은 2 * 표준 오차안에 모평균이 들어있다는 뜻이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic8.png">
  <br>
  그림 8. 95% 확률로 모평균이 ± 2 SEM 안에 들어있다는 것은 100번 반복 샘플링 시 95번 가량은 모평균이 ± 2 SEM 안에 포함되어 있다는 것을 의미한다.
</p>

여기서 "이 구간 (평균 ± 2 SEM) 안에 95% 확률로 모평균이 들어있다"라는 말을 조금 어려운 말로 "이 구간 (평균 ± 2 SEM)은 95% 신뢰구간이다"라고 한다.

# 신뢰도란 무엇일까?

통계학을 공부할 때 어려운 점 중 하나는 용어에 관한 문제이다. 어떤 용어는 너무 생소해서(가령 귀무가설) 어려운 경우도 있고, 어떤 용어는 다른 분야에서는 다른 방식으로 쓰여서(가령 샘플링) 이해하는데 시간이 걸린 경우도 있다.

한편, 통계학에서 어떤 용어는 일상 생활에서 널리 쓰이는데도 불구하고 정 반대의 의미를 가지거나 전혀 생각지 못한 의미를 가지는 경우가 있어 이해에 곤란을 겪는 경우가 있는데, 그 좋은 예시 중 하나가 '신뢰도'이다.



# t-test 시 신뢰구간 설정의 논리 전개

지금까지 t-value의 정의 방식으로는 신뢰 구간을 설정할 수 없음 --> 대립가설을 인정하는 방법으로 t-value를 재정의

귀무가설을 사용하는 이유가 여기서 한번 더 드러남. 즉, 참이 아님을 증명하는 것이 참임을 증명하는 것 보다 쉽고 간편하다. --> p-value를 이용하는 이유이기도 함.

그래서 대립가설을 인정하고 t-value를 정의해 신뢰구간을 설정하는 방법은 번거롭고 복잡해보임. 하지만 더 많은 유용한 정보를 담고 있을 수 있음.

# p-value 만으로는 충분하지 않다.

앞서 공부한 통계 기법([t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html), [ANOVA](https://angeloyeo.github.io/2020/02/29/ANOVA.html) 등...)에서 주요하게 사용되는 통계적 결과 처리 기법은 귀무가설의 기각 여부를 나타내는 것이다.

귀무가설을 기각할 수 있다는 것은 귀무가설과 현재 얻은 결과가 서로 양립할 수 없음을 의미하고, 우리는 p-value으로 양립할 수 있는 정도를 표현한다.

즉, p-value는 확률값으로써 귀무가설과 현재 얻은 결과가 얼마나 일치(compatible)한다고 할 수 있는지에 관해 말해주고 있다고 할 수 있다.

그래서 낮은 p-value (통상 0.05 이하)를 얻었다는 것은 귀무 가설과 현재의 실험 결과가 그만큼 일치하지 않는다는 것을 말하는 것이고, 그에 따라 귀무가설을 기각한다.

그런데, p-value의 문제점이 무엇이었던가? p-value는 귀무가설 기각 여부를 확인하기 위해 편리하게 만들어 놓은 도구이다.

p-value는 treatment effect의 size 뿐만 아니라 sample size에도 영향을 받는 값이라는 점을 [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)편에서 다룬 적이 있다.

아래의 두 그림은 p-value의 의미편에서 보았던 그림과 동일한 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-03-29-p_value/pic1.png">
  <br>
  그림 1. 동일한 n수에 대해 effect size가 변함으로써 p-value가 변한다.
</p>

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-03-29-p_value/pic2.png">
  <br>
  그림 2. 동일한 effect size 대해 n수가 변함으로써 p-value가 변한다.
</p>

그림 1에서는 effect size가 커지면서 p-value가 작아지는 "바람직한" 상황을 보여주고 있지만,

그림 2에서는 effect size는 크지 않은데도 n수(즉, sample size)가 커짐으로써 p-value가 작아지는 "바람직하지 않은" 상황을 보여주고 있다. 즉, 어떤 연구 실험의 경우에는 단순히 sample size가 크다 보니 "유의한 차이"를 보이는 결과를 얻을 수 있다는 것이다. 그러니까, 임상적 혹은 과학적인 의미는 없는 연구 결과임에도 p-value는 낮게 얻어질 수 있다는 것이다.

그래서, 연구 결과에 대해 통계적으로 해석할 때에는 '기각/수용' 관점에서만 해석하면 안되고 treatment effect size에 대해서도 함께 볼 수 있도록 하는 것이 더 바람직한 해석 방법이라고 할 수 있다.

그런데, treatment effect size를 정확하게 알 수 있을까? 그건 불가능할 것이다. 즉, "불확실성"을 내포한다. 왜냐하면 우리가 얻는 데이터들은 모두 모집단에서 "샘플" 되어 나온 것(즉, 추출된 표본)이기 때문이다.
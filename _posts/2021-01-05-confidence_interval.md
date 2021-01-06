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

# 표본과 표준 오차

## 표본과 표준 오차의 의미 복습

"불확실성"에 대해 우리는 여러 번 다룬 적이 있다. 다시 한번 생각해보자면, 필자가 말하는 통계학에서의 불확실성은 어떤것이고 어디서 기인하는가?

통계학의 "불확실성"은 우리가 얻는 데이터들은 모집단에서 추출한 샘플이기 때문에 생기는 것이다.

[표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html) 편에서 보았던 예시를 다시 가져와 살펴보도록 하자.

아래 그림은 150명의 금성 외계인의 키(회색)를 표시한 것이고, 임의로 6명 외계인을 선별하여 키를 조사한 것을 표시(빨간색)한 그림이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic2.png">
  <br>
  그림 3. 150명의 모집단에서 6명의 표본을 추출한 경우. (표본은 빨간색으로 표시)
</p>

그런데, 그림 3에서 볼 수 있는 표본 (빨간색)이 유일하게 우리가 뽑을 수 있는 표본일까?

그렇지 않다. 표본은 추출할 때 마다 다르게 뽑힐 수 있다. 가령, 아래의 그림 4에서 처럼 말이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic3.png">
  <br>
  그림 4. 세 번 표본을 추출해보고 그 때 마다 얻게되는 표본 분포를 그린 것  
</p>

그럼, 세 번이 아니라 100번 추출해보면 어떨까?

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic4.gif">
  <br>
  그림 5. 100 번 표본을 추출해보고 그 때 마다 얻게되는 표본 평균을 그린 것
</p>

100번 추출해보면 세 가지 사실을 알 수 있다.

첫 번째로 매 번 얻어지는 평균값이 조금씩 다르다는 것이다. 이는 표본 평균은 랜덤변수이기 때문이다. 

두 번째로 100개의 평균값의 분포는 정규분포를 따른다는 점이다. 이는 [중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)에 따른 결과인데, 표본의 크기가 충분히 클 경우 평균의 분포는 정규분포가 되기 때문이다.

세 번째로 평균값의 분포의 너비는 원래의 모집단의 너비보다 작다. 이 사실을 확인하기 위해선 [표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html) 편을 한번 더 복습해보는 것이 좋은데,

한마디로 표본의 크기가 커질 수록 표본 평균의 표준편차 값이 작아지기 때문이다. 표본 평균의 표준 편차, 즉 표본 평균 표준 오차는 다음과 같이 정의된다.

$$SEM = \sqrt{Var[\bar{X}]} = \frac{s}{\sqrt{n}}$$

## 샘플링과 신뢰구간 설정

한편, 정규분포에서 평균값을 중심으로 2 * 표준편차의 범위는 약 95%의 면적을 차지한다. 

[//]:# (정규분포 2SD 넓이 보여주는 그림 그릴 것)

이를 바탕으로 위 세 가지 사실을 종합하면 다음과 같은 결론을 이끌어낼 수 있다.

"모평균은 2 * 표준 오차 범위 안에 95% 확률로 들어오게 된다."

[//]:# (샘플 추출 --> 샘플 평균과 SEM * 2 의 범의 그려주고 --> 이 안에 모평균이 들어있을 확률 95%라는 것을 그림으로 그려줄 것)

조금 더 풀어서 생각해보았을 때, 95% 확률로 들어오게 된다는 말은 무슨 의미일까?

그것은 100번 정도 반복 샘플링을 해 보았을 때 95번 가량은 2 * 표준 오차안에 모평균이 들어있다는 뜻이다.





---
title: 나이브 베이즈 분류기
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200804
tags: 통계학
---

<style>
    iframe {
        display: block;
        border-style: none;
        margin: 0 auto;
    }
</style>

{% raw %}

# 시작하기에 앞서...

본 article에서는 최대한 베이즈 정리 없이 나이브 베이즈 분류기를 이해해보고자 한다.

이에 따라, 나이브 베이즈 분류기의 작동 원리를 우선 파악하고, 그 수식을 얻게해준 배경 이론에 대해 추가적으로 이해해보고자 한다.

나이브 베이즈(naive Bayes) 분류기는 베이즈 정리를 이용해 만든 확률 분류기의 일종이라고 할 수 있다.

나이브 베이즈는 사실 이름이 너무 어려워 보이는데다가 복잡해보이는 수식이 주는 압박이 크기 때문에 선뜻 이해하려 들기 어렵게 보인다.

그러나, 나이브 베이즈 분류기는 실제로는 각 클래스에 대한 가능도 비교를 통한 분류기에 불과할 뿐이다.

다시 말해, likelihood에 대한 이해가 가장 핵심적이며, 베이즈 정리 없이도 나이브 베이즈 분류기의 동작 방식을 이해하는 데에는 무리가 없다.

즉, 베이즈 정리는 조건부 확률이라는 배경 이론을 설명해주는 것에 지나지 않다고 본다.


본 article을 더 잘 이해하기 위해선 아래의 내용에 대해 숙지하고 오는 것이 좋다.

* likelihood에 관한 이론: [최대우도법 소개 편](https://angeloyeo.github.io/2020/07/17/MLE.html)

베이즈 정리 없이 이해해보자고 하였지만, 그래도 베이즈 정리에 대해 알고오면 더 도움이 될것이다.

* Bayes' Rule에 대한 내용: [베이즈 정리의 의미 편](https://angeloyeo.github.io/2020/01/09/Bayes_rule.html)

# 사전 지식을 이용한 분류: prior

확률적인 배경 지식을 가지고 특별한 추가 정보 없이 어떤 샘플을 분류하는 예시를 생각해보자.

가령 아무 사람이나 데리고 와서 어떤 정보도 없이 이 사람이 남자인지 여자인지 분류하라고 하면 어떻게 생각할 수 있을까?

세상에 절반은 남자고, 절반은 여자라고 생각한다면 50% 확률로 어림짐작 할 수 밖에 없다. 

아마 랜덤하게 두 성별 중 하나를 얘기할 수 밖에 없을 것이다.

그런데, 가령 삼색이 고양이를 데리고 와서 고양이의 성별이 암컷인지 수컷인지 물어본다고 하자.

자세한 이유는 몰라도, 삼색이 고양이는 성염색체와 관련된 이유로 거의 대부분이 암컷이라고 알려져있다.

그렇다면, 삼색이 고양이를 봤다고 하면 높은 확률로 암컷이라고 생각하지 않을까?

(사실 고양이 사진이을 올려보고 싶어서 이 예시를 추가해보았다)

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-04-naive_bayes/pic1.jpg">
  <br>
  그림 1. 성염색체와 관련된 이유로 삼색이 고양이는 99%가 암컷이라 알려져 있다.
</p>

이와 같이 test data sample에 대한 어떠한 정보(즉, feature)없이도 사전 지식만을 가지고 test data sample을 

판별할 수도 있으며, 이러한 판별에 도움을 주는 확률값을 사전 확률(prior probability)이라고 한다.

참고로, 이러한 사전 확률은 실제 데이터에서는 training data에서 class간 비율을 가지고 미리 계산할 수 있다.

가령 100건의 training data에서 30:30:40의 비율로 class A, B, C가 주어져 있다면 각 클래스에 대한 사전확률 값은 0.3, 0.3, 0.4가 되는 것이다.


하지만, 실제로 어떤 데이터를 분류한다고 할 때에는 최소한의 판단 근거가 될만한 데이터를 제공하지 않을까?

# 특정 정보가 추가되는 경우: likelihood

키(즉, 특정 정보)에 따라 이 사람이 남자인지, 여자인지 판별하는 문제에 맞딱드렸다고 생각해보자.

우리는 주어진 training sample들을 통해 다음과 같이 남자와 여자의 키 분포가 다르다는 것을 알고 있다고 해보자.

(이러한 분포 모델링은 정규 분포를 가정하는 경우 training sample들의 평균과 분산을 계산함으로써 쉽게 구축할 수 있다.)

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-04-naive_bayes/pic2.png">
  <br>
  그림 2. training sample들을 통해 얻은 남자, 여자의 키 확률 분포
</p>

이 때, 우리가 분류하고자 하는 사람의 키가 가령 175cm라고 해보자. 그러면 175 cm에 대해 우리가 구축해놓은 확률밀도함수의 분포는 뭐라 말할까?

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-04-naive_bayes/pic3.png">
  <br>
  그림 3. 미리 구축해둔 남자, 여자의 키 확률 분포에 test data sample의 값을 대입시켜 본 경우
</p>

위의 그림 3을 보면 그 해답을 알 수 있다. 여자라고 생각하는 것 보다 남자라고 생각하는 것이 더 "가능성"이 커보인다는 것을 알 수 있다.

여기서 말하는 "가능성"이 바로 [최대우도법 소개 편](https://angeloyeo.github.io/2020/07/17/MLE.html)에서 언급한 "likelihood 기여도"이다.

이번 예시에서는 특징 정보가 하나밖에 없기 때문에 이 "likelihood 기여도"를 곧바로 likelihood라고 보자.

우리는 이 likelihood를 다음과 같이 생각할 수 있다.

남자라고 판단했을 때의 키가 175cm일 likelihood는 다음과 같이 쓸 수 있다.

$$P(키=175cm | 성별 = 남자)$$

반면, 여자라고 판단했을 때 키가 175cm일 likelihood는 다음과 같이 쓸 수 있다.

$$P(키=175cm | 성별 = 여자)$$

이번 예시에서는 식(1)과 식(2)의 두 likelihood의 값이 다음과 같다는 것 또한 알 수 있었다.

$$P(키=175cm | 성별 = 남자) > P(키=175cm | 성별 = 여자)$$

우리는 식 (3)이 이 test data 사람의 성별이 남자라고 판단할 좋은 근거라는 것을 쉽게 이해할 수 있다.

그렇다면, 식(3)과 같은 likelihood 비교만으로 이 사람이 남자라고 판단할 충분한 근거가 될까?

그렇지는 않다.

왜냐하면 likelihood는 앞서 말했듯 '추가 정보'이기 때문이다. 즉, 우리가 기존에 알고있던 prior에 추가된 정보이므로

우리가 이 사람이 남자인지, 여자인지 판단하려면 기존의 배경 지식에다가 이번에 추가된 정보인 likelihood를 곱해주는 방식으로 "판단 근거"를 찾을 수 있다.

(즉, 사전지식을 완전히 무시할 수 없다.)

정리하자면, 남자라고 판단할 수 있는 판단 근거 $\text{prior} \times \text{likelihood}$는 다음과 같다.

$$P(성별 = 남자) \times P(키=175cm | 성별 = 남자)$$

그리고, 여자라고 판단할 수 있는 근거에 관한 $prior \times likelihood$는 다음과 같다.

$$ P(성별 = 여자) \times P(키=175cm | 성별 = 여자)$$

우리는 이 두 $prior \times likelihood$를 비교함으로써 test data 사람의 성별을 비교할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-04-naive_bayes/pic3.png">
  <br>
  그림 4. 주어진 데이터를 판별(혹은 판단)하기 위해 사전 지식(prior)에 추가정보(likelihood)를 곱한 값을 판단근거로 삼을 수 있다.
</p>

# 정보가 더 추가된다면?



# 배경 이론 소개

## 조건부 확률: 베이즈 정리

## feature들 간의 독립성 가정

## 분모는 왜 무시하는 것인가?

{% endraw %}

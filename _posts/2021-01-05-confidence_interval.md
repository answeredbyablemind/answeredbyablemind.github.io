---
title: 신뢰 구간의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210105
tags: 통계학
---

[//]:# (교과서가 아니고서야 쉬운 설명이 더 좋은 설명이다.)

<p align = "center">
  <img  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic0.png">
  <br>
  일상 생활에서도 종종 사용되는 신뢰 구간의 예시
</p>

신뢰 구간은 처음 보기에 복잡해 보이는 개념이지만, 일상에서도 많이 쓰고 있는 것이기도 하다.

가령, 버스를 타고 집에가는 길에 "언제쯤 도착이야?"라는 카톡에 대한 답변으로 "10-15분 정도 걸릴 것 같아"라고 답변했다면,

우리는 10에서 15사이라는 신뢰구간을 사용하고 있는 것이다.

10에서 15사이라는 값은 지금까지 내가 여러번 이 버스를 타봤을 때 걸리는 시간의 평균값으로부터 얻어졌을 것이다.

그럼 왜 12.5분이라는 정확한 값을 말하지 않고 "10-15분 정도 걸린다"라고 말할까? 그것은 불확실성이 내포되어 있기 때문일 것이다. 따라서, 내가 그나마 확실히 말할 수 있는 정도를 구간으로 표현한 것이다.

수학적으로 표본에 대한 불확실성이라는걸 어떻게 정의하더라? 그리고, 신뢰 구간이라는걸 굳이 정의해야 하는 이유는 뭘까?

# Prerequisites

신뢰 구간의 개념에 대해 잘 이해하려면 통계학에 관한 많은 배경지식이 필요합니다.

다음의 내용에 대해 알고 오시는 것을 추천드립니다.

* [중심극한정리의 의미](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)
* [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)
* [귀무가설과 대립가설의 의미](https://angeloyeo.github.io/2020/03/25/hypothesis.html)
* [t-value와 스튜던트의 t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)
* [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)

# 모평균과 표본 평균 간의 관계

이번 post에서는 신뢰 구간에 대해 다룬다. 앞서 카카오톡의 예시에서 보여주었듯이 신뢰구간이란 "그나마 내가 확실히 말할 수 있는 정도"를 구간으로 표현해준 것이다. 불확실성은 sampling에서 기인한다. 이를 조금 더 자세하게 이해하기 위해 모평균과 표본 평균에 대해 다시 한번 짚고 넘어가보도록 하자.

이 내용은 [표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)에서 본 내용과 본질적으로 같지만, 약간은 다른 관점으로 접근하게 될 것이다.

아래의 그림을 보도록 하자. 아래의 그림 6은 모집단에서 표본을 추출해 표본 평균을 획득한 과정을 나타낸 것이다.

<p align = "center">
  <img  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic1.png">
  <br>
  그림 1. 모집단에서 표본을 추출해 표본의 통계량을 계산하는 과정
</p>

그림 1의 왼쪽에서는 모집단이 표현되어 있다. 모집단은 가령 수백명 사람의 키라고 할 수 있다.

우리는 이 때 왼쪽 모집단에서 임의의 표본(sample)을 선택할 수 있고 이 키 값들의 평균값을 계산할 수 있다.

이 때 생각해볼 수 있는 것은 '우리가 임의로 선정한 표본의 평균(오른쪽 분포에서 빨간색)이 특별한 의미를 가지는 것인가'라는 것인데, 절대 특별한 의미를 가지는 표본 평균 값은 아니다. 표본의 선정은 랜덤했기 때문이다.

따라서, 표본 선정에 관한 무수한 경우의 수가 있을 것이며, 해당 다른 경우에 대한 평균값을 모두 모아보면 그림 1의 오른쪽에 있는 표본 평균의 분포와  모양을 띄게 될 것이다[^1].

[^1]: 해당 내용이 잘 이해되지 않는다면 [표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)의 내용을 한번 더 복습하고 오는 것을 추천한다.

그림 1의 표본 평균 분포 모양을 잘 보면 정규분포 모양을 하고 있는 것을 알 수 있는데[^2], 정규분포에서 평균값을 중심으로 2 * 표준편차의 범위는 약 95%의 면적을 차지한다는 것 또한 잘 알려진 사실이다[^3]. 

[^2]: 왜 표본 평균의 분포가 정규분포를 따르는지 알기 위해선 [중심극한정리의 의미](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)를 이해하는 것이 좋다.

[^3]: 정확히는 2가 아니라 1.96으로 쓰는게 맞으며, 정규분포를 이용하는 것도 표본의 크기가 대략 20이상일 때 가능하다. 표본의 크기가 20보다 작을 때는 자유도에 맞는 적절한 t-value를 선택해서 곱해주는 것이 더 엄밀한 계산 방법이다. 이에 대해선 글 후반부에서 조금 더 자세히 다루도록 하자.

<p align = "center">
  <img width = "500" src = "https://loonylabs.files.wordpress.com/2019/09/variance-2.png">
  <br>
  그림 2. 정규분포는 평균으로부터 ±2 SD 만큼 떨어진 곳 까지의 넓이는 약 0.95이다.
  <br>
  <a href = "https://loonylabs.org/2019/09/12/day24-365doa/">그림 출처: Loony Labs </a>
</p>

그러면 표본 평균 분포에서 표준 편차는 어떻게 계산되는가?

[표본과 표준오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)에서 보았던 것 처럼 표본 평균의 표준 편차는 "표준 오차(Standard Error of Mean, SEM)"라고 부르며, 그 값은 

$$SEM = \frac{\sigma}{\sqrt{n}}$$

이다.

여기서 $\sigma$는 모집단의 표준편차이고 $n$은 표본의 크기(몇 명을 뽑아서 계산한 평균값인가)이다.

즉, 다시 말해 우리는 이런 결론을 낼 수 있는 것이다.

"내가 지금 추출한 표본 평균은 모평균으로부터 2 * 표준 오차 (SEM) 범위 안에 95% 확률로 들어온다." 

<p align = "center">
  <img  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic3.png">
  <br>
  그림 3. 표본 평균은 모평균으로부터 ±2SEM 범위 안에 95% 확률로 포함되어 있다.
</p>

그런데, 여기서 아주 큰 문제가 있다. 우리는 모평균을 모른다는 것이다.

만약 우리가 모평균을 알았다면 굳이 이렇게 표본을 뽑아가면서 표본 평균을 계산해야 했을 이유도 없었을 것이다.

그래서 우리는 조금 색다른 방식의 관점에서 표본 평균과 모평균의 관계를 생각해 보도록 하자.

<p align = "center">
  <img  src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic4.png">
  <br>
  그림 4. 표본 평균으로부터 ±2 표준오차 안에 모평균이 포함되어 있을 확률은 95%라고 말할 수 있다.
</p>

그림 4에서 볼 수 있듯이 우리가 만약 모평균으로부터 ±2 SEM 만큼 떨어진 구간을 표본 평균을 중심으로 할 수 있게 이동시킨다면, 모평균이 표본 평균으로부터 ±2 SEM 만큼 떨어진 곳에 95% 확률로 들어온다는 것을 알 수 있다. 

여기서 표본 평균 ± 2 SEM 구간 안에 95% 확률로 모평균이 들어온다는 것을 조금 다른 방식으로 생각해보면 아래와 같이 생각해볼 수도 있겠다.

표본 추출은 무수하게 많은 조합으로 추출할 수 있으므로, 100번 정도 반복 샘플링을 해 보았을 때 95번 가량은 2 * 표준 오차안에 모평균이 들어있다는 뜻이라고 생각할 수도 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic5.png">
  <br>
  그림 5. 95% 확률로 모평균이 ± 2 SEM 안에 들어있다는 것은 100번 반복 샘플링 시 95번 가량은 모평균이 ± 2 SEM 안에 포함되어 있다는 것을 의미한다.
  <br>
  여기서 빨간색 수평 점선은 모평균값을 의미하며, 수평선과 겹치는 검은색 수직 구간에는 모평균이 포함된다. 또, 빨간색 수직 구간에는 모평균이 포함되지 않는다.
</p>

# 신뢰 수준, 신뢰 구간이란 무엇일까?

<p align = "center">
  <img src = "https://thumb.mt.co.kr/06/2019/11/2019111809473930485_1.jpg/dims/optimize/">
  <br>
  그림 6. 선거가 있을 때 마다 보게 되는 문구. '신뢰 수준'
  <br>
  <a href = "https://news.mt.co.kr/mtview.php?no=2019111809473930485"> 그림 출처: 머니투데이 </a>
</p>

우리는 앞선 글 꼭지에서 '95% 확률' 이라는 용어를 썼지만, 어떤 경우에는 확률이라는 말을 '95% 신뢰 수준'이라는 말로 바꿔 쓰기도 한다. 즉, 신뢰 수준이라는 말은 확률이라는 말과 궤를 같이 한다고 할 수 있다.

예를 들어 그림 6에서처럼 신뢰 수준이 95%이고 표본 오차가 ±3%(즉, 2 x SEM = 3%)인 여론 조사에서 A 후보와 B 후보에 대한 지지율 조사를 했다고 해보자. 이 때, 100명의 사람에게 질문한 결과 A 후보와 B 후보에 대한 지지율이 각각 평균 40%, 36%가 나왔다고 하자. 여기서 우리에게 주어진 정보인 신뢰 수준 95%, 표본오차 ±3%에 따르면 A 후보 지지율의 모비율은 37-43% 사이에 존재할 확률이 95%이고, B 후보 모비율은 33-39% 사이에 존재할 확률이 95%일 것이다. 

여기서 A 후보와 B 후보에 대한 두 구간 37-43%와 33-39%이 A 후보와 B 후보에 대한 95% 신뢰 구간이다.

여기까지 잘 이해했다면 B 후보의 모비율이 더 높을 가능성도 존재한다는 것도 알 수 있다. 왜냐면 A 후보의 지지율에 대한 모비율이 37%, B 후보에 대한 지지율이 39%일 수도 있기 때문이다.

# 두 집단 비교 시 신뢰 구간 (t-value 이용)

## t-분포 복습

우리는 앞서 [t-value와 스튜던트의 t-test 편](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)에서 t-분포에 대해 알아본 바 있다.

이번 꼭지부터는 t-분포를 이용해 신뢰 구간에 대해 설명해보고자 한다. t-분포를 이용한 신뢰구간에 대해 이해할 수 있다면 표본의 크기가 작은 경우의 모평균 추정이나 두 표본 집단 간의 비교에 대해 이해할 수 있다. 이를 위해 t-분포의 특성에 대해 다시 한번 생각해보도록 하자. 

먼저, t-분포를 보면 바로 알 수 있는 것은 t-분포는 정규분포와 닮았다는 점이다. 왜 그럴까? 그 이유는 정규 분포나 t-분포나 모두 평균에 관련된 분포이기 때문이다. [중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html)에 따르면 표본의 크기가 커질 수록 표본 평균의 분포는 정규 분포에 가까워지게 된다. t-분포는 이 과정에서 표본의 크기가 매우 크지는 못한 경우에 해당하는 표본 평균의 분포라고 할 수 있다 (다만 모집단의 분포는 정규분포를 따르긴 해야 한다.). 정규분포와 t-분포의 모양을 직접 비교하면 아래와 같다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic01.png">
  <br>
  그림 01. 표준정규분포와 t-분포의 형태 비교
</p>

그림 01에서 볼 수 있듯이 표준정규분포와 t-분포의 형태를 보면 생긴건 별반 다를게 없다는 걸 알 수 있다. 다만 t-분포가 $x = 0$ 일 때의 peak 부분의 높이가 좀 낮은 대신 양 끝의 값(보통 tail이라고 부른다)이 조금 높아 보인다.

두 번째로, 그림 01의 우측 상단의 범례를 보면 알 수 있지만 '자유도'라는 개념이 있다. 자유도는 표본수와 직접적인 관련이 있는 값으로, t-분포의 형태를 결정한다. 그림 02에서 볼 수 있듯이 자유도 값이 클 수록 t-분포의 형태는 정규분포의 형태에 가까워진다.

<p align = "center">
  <img  width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic02.png">
  <br>
  그림 02. 표준정규분포와 t-분포의 형태 비교
</p>

마지막으로 t-분포에 대해 짚고 넘어가고자 하는 것은 t-분포의 넓이에 관한 것이다. 이 부분이 이번 t-분포 복습에 관한 내용 중 가장 중요한 부분이니 꼭 이해하고 넘어가길 바란다. 확률밀도함수를 가지고 특정 사건에 대한 확률을 계산할 때는 특정 정의역에 대한 확률밀도함수의 그래프 아래의 넓이를 이용해 계산할 수 있다.

가령, 자유도가 10인 t-분포에 대해서 t 값이 0~1 사이인 경우의 그래프 아래의 넓이를 표시하면 아래의 그림 03의 붉은색으로 표시한 영역과 같은데 이 영역의 넓이를 계산해보면 0.3296이다.

<p align = "center">
  <img  width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic03.png">
  <br>
  그림 03. 표준정규분포와 t-분포의 형태 비교
</p>

이 때, 이 넓이 0.3296이 의미하는 바는 자유도가 10인 경우에는 t-값이 0에서 1사이로 얻어질 확률이 0.3296이라는 의미이다.

(만약 't-값을 얻는다'라는 말의 의미를 잘 이해하지 못하고 있다면 [t-value와 스튜던트의 t-test 편](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)을 꼭 한번 보고 오는 것을 추천한다.)

보통 추정을 위한 통계학에서 사용하는 주요한 확률값(즉, 분포의 넓이)은 0.95와 0.99가 대표적이라고 할 수 있다. 따라서, t-분포에서 0을 중심으로 좌우로 어떤 t-value부터 어떤 t-value까지 함수를 적분해야 0.95나 0.99의 값을 얻을 수 있는지 알면 추정을 진행하는데 도움이 된다.

<p align = "center">
  <img  width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic04.png">
  <br>
  그림 04. 자유도가 10인 경우의 t-분포에 대해 넓이가 0.95 혹은 0.99인 경우에 해당하는 양끝의 t-value
</p>

그림 04에서 볼 수 있듯이 자유도가 10인 경우에 t-분포의 넓이가 0.95 혹은 0.99인 경우에 해당하는 t-value는 각각 ±2.228, ±3.169이다.

이와 같은 조사를 여러 자유도에 대해 작성해둔 것이 t-value table이다.

<p align = "center">
  <img  width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic05.png">
  <br>
  그림 05. t-value table. 주어진 degree of freedom 값과 원하는 넓이를 얻기 위한 t-value 값들을 확인할 수 있다.
  <br>
  <a href = "http://www.ttable.org/"> 그림 출처: ttable.org </a>
</p>

t-value table을 보면 가장 왼쪽에 df라고 되어 있고 1부터 1000까지 숫자가 쓰여 있다. 이것이 degree of freedom, 즉, 자유도 이다. 그림 03이나 그림 04에서 사용되었던 t-분포는 모두 자유도가 10인 경우였다. 따라서, 그림 05에 있는 t-value table을 이용해 우리가 찾고자하는 t-value를 찾으려면 df = 10인 경우에 해당하는 행(row)을 보아야 한다. 

그런 다음, 우리가 찾고자 하는 열(column)을 찾아야 하는데, 그림 5의 가장 윗쪽 행에 보면 t.975라고 되어 있고 two-tails 0.05라고 되어 있는 값을 하나 볼 수 있다. 이 값이 바로 넓이 0.95에 해당하는 t-value이다. two-tails라는 말은 좌우 대칭으로 크기는 같고 부호만 반대인 t-value를 설정하여 t-분포에 대해 적분한 넓이를 계산해주자는 의미이다.

그렇게 해서 적절한 자유도와 원하는 넓이에 대한 t-value를 확인하면 2.228과 3.169를 얻을 수 있다는 것을 알 수 있다.

지금까지 얘기한 것을 나열하면 다음과 같다. t-분포의 형태 특성과 t-분포의 특성 중 하나인 자유도에 대해 얘기했다. 또한, 확률밀도함수의 넓이를 계산하여 확률을 계산할 수 있다고도 얘기하였다.

또한, 이 post에서는 앞으로 "양 옆으로 tail을 잘라 0.95라는 넓이를 얻을 수 있는 t-value"를 $t_{0.95}$와 같이 쓰고자 한다. 또한, 이를 일반화하여 "양 옆으로 tail을 잘라내고 남는 넓이가 $A$인 t-value"를 $t_A$로 쓸 것이다.

## t-test에서 신뢰구간 설정

앞서 우리는 표본 평균의 개념을 생각할 때 모평균의 개념의 개념을 함께 생각해봄으로써 표본 평균의 모평균에 대한 신뢰 구간의 정의를 이끌어냈다.

우리가 통계적 분석으로 얻고자 하는 또 다른 결과 중 하나는 표본 집단 간의 비교이다. 

특히, 두 표본 집단의 평균 비교를 위해서 보통 많이 사용하는 모수적 통계 기법은 t-test이며 [t-value의 의미와 스튜던트의 t-test](https://angeloyeo.github.io/2020/02/13/Students_t_test.html)편에서 t-test에 관한 내용을 다룬 바 있다.

t-test에 대해 신뢰 구간의 개념을 구축하기 위해 눈여겨 봐야할 점은 t-test를 수행할 때의 가설 설정이라고 할 수 있다.

t-test를 수행할 때의 가설은 다음과 같았다.

<center><b>"두 표본 집단이 하나의 모집단에서 나왔을 것이다"</b></center>

그래서 우리가 얻은 결괏값은 t-value인데, t-value가 크다는 것은 두 표본집단이 하나의 모집단에서 나왔을 가능성이 희박함을 얘기해주고 있었다.

왜냐하면 t-value는 아래 그림 7과 같이 표본 평균간의 차이가 분자에 오도록 정의되어 있기 때문에 평균간의 거리가 멀 수록 t-value가 커지기 때문이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-13-Students_t_test/pic1.png">
  <br>
  그림 12. t-value의 기존 정의
</p>

그런데, 이번 시간에는 t-value에 대한 새로운 정의를 생각해보도록 하자. 두 표본이 서로 다른 모평균을 갖는 집단에서 추출되었다고 새롭게 가정해보는 것이다.

이런 식으로 t-test에 대한 기존의 가정을 뒤집는 것은 앞서 표본 평균의 신뢰 구간을 정할 때 모평균을 생각함으로써 신뢰 구간의 개념을 얻어낸 방식을 그대로 차용하기 위해서이다.

그러면 본격적으로 서로 다른 모집단에서부터 표본을 추출하고 표본 평균을 비교하는 과정을 생각해보도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic13.png">
  <br>
  그림 13. 두 표본집단의 평균을 비교하는 과정
</p>

그림 13에서는 서로 다른 두 모집단에서 표본을 추출한 뒤 각 표본 평균을 계산하였다. 그 뒤에 평균값의 차이에 관한 분포에 지금 뽑은 두 표본 평균의 차이를 표시하였다.

그림 14는 그림 3과 매우 유사하다. 즉, 우리의 두 표본의 차이는 모평균의 차이로부터 양 옆으로 어느 정도 크기의 확률로 들어온다는 것이라는 해석이 가능하다는 것을 말해준다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic14.png">
  <br>
  그림 14. 
</p>

앞서 t-분포 복습 파트에서 보았듯이 중심으로부터 $t_A$ 만큼 떨어져있을 확률은 $100A$라고 해석할 수 있고, 그림 12에서 볼 수 있듯이 t-value는 평균의 차이에 평균의 차이에 대한 표준오차를 나눠준 값으로 정의한다.

따라서, 우리의 표본평균의 차이는 모평균으로부터 $\pm t_A\times SEM$ 사이에 들어올 확률이 $100A$임을 알 수 있다.

그런데, 실제 모평균의 차이를 우리는 알지 못하므로, 표본 평균에 대해서 수행했던 방법을 그대로 적용하여 신뢰 구간을 표본 평균의 차이를 중심으로 옮겨주자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-01-05-confidence_interval/pic15.png">
  <br>
  그림 15. 
</p>

그러면 다음과 같은 결론을 얻을 수 있게 된다.

<center>두 모평균의 차이는 표본 평균으로부터 $\pm t_A SEM$ 안에 존재한다. </center>


위의 설명이 와닿지 않을 수 있으므로 예를 들어 생각해보도록 하자. 두 표본 집단을 비교한다고 하자. 가령 대한민국 성인 남자의 평균키와 대한민국 성인 여자의 평균키의 차이가 얼마나 차이가 날지 궁금했다고 생각해보자. 이 때, 우리는 랜덤하게 남자 6명, 여자 6명을 임의로 선택해 이 사람들의 알아냈다고 해보자. 

남자 표본 그룹(6명): [170, 165, 168, 180, 175, 173]

여자 표본 그룹(6명): [165, 162, 158, 170, 163, 152]

이 데이터로부터 표본 평균값들을 각각 계산하면,

남자 표본 표본 평균 

$$\bar{X}_1= 171.83$$

여자 표본 표분 평균 

$$\bar{X}_2= 161.67$$

남자 표본 표준 편차 

$$s_1 = 5.3448$$

여자 표본 표준 편차 

$$s_2 = 6.1536$$


두 표본의 표준 편차 값이 서로 같을 수는 없다. 하지만, t-test의 기본 가정은 두 표본이 같은 모집단에서 추출되었을 것이라는 가정이 바탕되어 있다. 따라서 두 표준 편차 값에 대한 하나의 대표값인 pooled standard deviation을 계산해야 한다. pooled variance는 다음과 같이 계산 가능하다.

$$s = \sqrt{\frac{1}{2} (s_1^2 + s_2^2)} = 5.7634$$

SEM은 다음과 같이 계산할 수 있다.

$$SEM = \sqrt{\frac{s^2}{n_1}+\frac{s^2}{n_2}} = 3.3275$$


이 t-test의 자유도는 6+6-2 = 10이다.








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
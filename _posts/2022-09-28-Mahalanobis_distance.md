---
title: 마할라노비스 거리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220928
tags: 선형대수학 통계학
---

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2022-09-28-Mahalanobis_distance/" width="650" height = "520" frameborder="0"></iframe></p>

# Prerequisites

본 포스트를 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)

공분산 행렬에 대한 더 친절한 설명이 필요한 경우 아래의 포스트를 확인하십시오.

* [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html)

# 맥락을 고려한 상대적인 거리

아래와 같이 두 벡터 $\vec x$와 $\vec y$를 생각해보자.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic2.png">
  <br>
  그림 1. 공간 상의 두 벡터 간의 거리는 벡터의 내적을 이용해 계산할 수 있다.
</p>

여기서 임의의 점 $\vec x$와 $\vec y$ 까지의 유클리드 거리를 계산하려면 어떤 식을 사용해야 할까? 두 벡터의 차와 내적을 이용해 계산할 수 있다. 이와 같은 거리를 유클리드 거리(Euclidean distance)라고 부른다.

$$d_E = \sqrt{(\vec x-\vec y)^T(\vec x-\vec y)} % 식 (1)$$

그런데 두 벡터 $\vec x$와 $\vec y$ 만을 생각하는 것이 아니라, 주변에 다른 데이터들을 고려한다면 두 점 사이의 거리는 항상 절대적인 거리를 사용해도 되는것일지 고민해보아야 한다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic3.png">
  <br>
  그림 2. 다른 데이터들의 맥락을 고려한 두 점 사이의 거리는 다르게 계산되어야 할 수도 있다.
</p>

위 그림을 보면 (a)는 파란색 데이터의 분포에서 상당히 벗어나있는 점들이라는 것을 알 수 있다. 반면에 (b)는 파란색 데이터의 분포에서 상대적으로 덜 벗어난 곳에 위치해있다. 즉, 다른 데이터들의 분포의 "맥락"을 고려하면 그림 2의 (a)에 있는 두 벡터 $\vec x$와 $\vec y$ 간의 거리가 그림 (b)에 있는 두 벡터 간의 거리보다 더 멀다고 볼 수도 있는 것이다. 

"맥락"이라는 모호한 표현을 조금 더 수학적으로 표현하면 "표준편차"라고도 할 수 있겠다. 만약 데이터의 분포를 정규분포의 형태라고 가정할 수 있다면 정규분포의 표준 편차의 성질을 이용해 다음과 같이 평균(중심)으로부터 1, 2, 3 표준편차 만큼 떨어진 곳에 68, 95, 99.7%만큼의 데이터가 들어온다는 사실을 이용해보자.

<p align = "center">
  <img width = "600" src = "https://upload.wikimedia.org/wikipedia/commons/2/22/Empirical_rule_histogram.svg">
 <br>
 그림 3. 정규 분포에서 중심으로부터 1, 2, 3 표준편차 만큼 멀어질 때 얼마만큼의 데이터가 포함되는가? (68–95–99.7 rule)
</p>

다시 말해, 아래의 그림과 같이 표준편차를 기준삼아 표준편차 등고선을 표시할 수 있다. 그리고 이 등고선이 "맥락을 고려한" 거리의 지표가 되는 것이다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic6.png">
 <br>
 그림 4. 평균으로부터 68, 95, 99.7% 등 표준편차 만큼 떨어진 거리를 등고선으로 표시한 그림
</p>

그리고 정규 분포 대신 표준 정규분포를 사용할 수 있는 것 처럼 그림 4의 (b)에 있는 타원의 형태를 그림 4의 (a)에 있는 단위원으로 축소시킨다면 "맥락" 즉, 표준 편차를 정규화 시킬 수 있다. 아래의 그림 5와 같이 표준편차 1, 2, 3 등에 해당하는 곳에 새로운 축을 고려한 뒤에 벡터 공간을 변형해 타원을 단위원 모양으로 다시 되돌려보자.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic7.png">
 <br>
 그림 5. 데이터의 "맥락"의 표현과 "맥락"을 "정규화" 하기 위한 데이터(벡터) 공간의 변형
</p>

이 과정은 이 포스팅의 가장 위에 있는 애플릿에서 수행하는 일이다. 아래의 그림 6의 왼쪽을 보자. 주어진 데이터의 "맥락"을 고려했을 때 주황색 점들보다는 노란색 점들이 더 먼 거리라고 판단해주어야 한다. 이것은 맥락을 생각한 채로 유클리드 거리를 계산해야 하므로 복잡한 일이다. 그런데, 그림 6의 오른쪽과 같이 "맥락"을 정규화시키면 단순히 유클리드 거리만 계산한 결과로도 노란색 점들 간의 거리가 더 멀다. "정규화" 과정에서 이미 주어진 데이터에 대한 "맥락"을 고려시켜 기존의 데이터(벡터) 공간을 변형시켰기 때문이다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic8.png">
 <br>
 그림 6. "맥락"을 정규화 시키고나서 측정한 유클리드 거리는 이미 맥락을 고려한 거리가 된다.
</p>

주어진 데이터들의 분포를 통해 맥락을 조사하고, 이를 정규화 한 뒤에 유클리드 거리를 계산하는 것이 마할라노비스(Mahalanobis) 거리이다.

$$d_M = \sqrt{(\vec x-\vec y)^T\Sigma^{-1}(\vec x-\vec y)} % 식 (2)$$

벡터 공간의 변형은 행렬로 표현할 수 있다. 특히, 데이터의 "맥락"을 표현하는 행렬은 공분산 행렬($\Sigma$)과 관련되어 있고, 그것을 다시 돌려 놓기 위한 행렬은 공분산 행렬의 역행렬($\Sigma^{-1}$)과 관련되어 있다. 지금부터는 수식적으로 데이터의 "맥락"을 파악하는 방법을 이해해보자. 또, "맥락"의 "정규화"를 수행하는 방법을 더 자세하게 다루어 보자.

# 공분산 행렬과 그 역행렬의 의미

## 주어진 데이터를 이해하는 또 다른 방법

화성에 사는 외계인 중 1000명을 임의로 선별해 키와 몸무게를 조사했고 이것을 표로 나타내보았다. 놀랍게도 평균키는 10cm이고 평균 몸무게는 5kg이었다고 한다. 표로 정리해보면 대략 아래와 같았다고 하자.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic_table.png">
 <br>
 그림 7. 화성 외계인들의 키와 몸무게를 정리한 표 (4번 외계인까지만 표시)
</p>

외계인들의 키와 몸무게 데이터는 [여기](https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/alien_height_weight.csv)서 받을 수 있다.




[//]:# (아래의 두 가지에 주목하면 글이 잘 진행될 수 있을 것 같다.)


[//]:# (왜 공분산 행렬은 "맥락" 이 될 수 있나?)


[//]:# (왜 공분산 행렬의 역행렬은 "맥락"을 정규화 해주는 것과 같은 기능을 할까?)

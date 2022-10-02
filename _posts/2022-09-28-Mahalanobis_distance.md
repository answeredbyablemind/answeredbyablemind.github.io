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
* [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html)

# 절대적 거리와 상대적 거리

공간 상의 두 점 사이의 거리를 재는 방법은 피타고라스 정리에서 출발한다고 볼 수 있다.

임의의 점 두 곳을 선택하면 직각 삼각형을 그릴 수 있고, 직각 삼각형의 빗변의 길이가 두 점간의 거리라고 볼 수 있기 때문이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic1.png">
  <br>
  그림 1. 공간 상의 두 점 간의 거리는 피타고라스 정리에서부터 얻을 수 있다.
</p>

그런데, 목적에 따라 거리를 정의하는 여러가지 방법이 있을 수 있다. 이번 포스팅에서는 "맥락"에 의거해 상대적인 거리를 측정하는 방법에 대해 얘기해보고자 한다. 여기서 말하는 "맥락" 이라는 모호한 말은 다른 데이터들의 "분포의 형태"라고도 고쳐 쓸 수 있다. 또, "분포의 형태"는 공분산 행렬(covariance matrix)로 서술된다. 마할라노비스 거리는 데이터들이 분포하는 맥락을 고려해 계산할 수 있는 상대적인 거리 측정 방법이다.

## 맥락을 고려한 상대적인 거리

아래와 같이 두 벡터 $\vec x$와 $\vec y$를 생각해보자.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic2.png">
  <br>
  그림 2. 공간 상의 두 벡터 간의 거리는 벡터의 내적을 이용해 계산할 수 있다.
</p>

여기서 임의의 점 $\vec x$와 $\vec y$ 까지의 유클리드 거리를 계산하려면 어떤 식을 사용해야 할까? 두 벡터의 차와 내적을 이용해 계산할 수 있다. 이와 같은 거리를 유클리드 거리(Euclidean distance)라고 부른다.

$$d_E = \sqrt{(\vec x-\vec y)^T(\vec x-\vec y)} % 식 (1)$$

그런데 두 벡터 $\vec x$와 $\vec y$ 만을 생각하는 것이 아니라, 주변에 다른 데이터들을 고려한다면 두 점 사이의 거리는 다르게 생각해야 할 수도 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic3.png">
  <br>
  그림 3. 다른 데이터들의 맥락을 고려한 두 점 사이의 거리는 다르게 계산되어야 할 수도 있다.
</p>

위 그림을 보면 (a)는 파란색 데이터들이 보여주고 있는 기존의 분포에서 상당히 벗어나있는 점들이라는 것을 알 수 있다. 반면에 (b)는 파란색 데이터들이 보여주고 있는 기존의 분포에서 상대적으로 덜 벗어난 곳에 위치해있다. 말하자면 산의 모양을 고려한 등고선을 그려서 거리를 책정한다고나 할까. 분명 종이 위의 $\vec x$와 $\vec y$의 거리는 같지만 작은 동산을 가로지르는 경우와 큰 산을 가로지르는 거리는 아마 다를것이다. 그림 4의 (a)에서 보면 $\vec x$와 $\vec y$ 사이를 통과하는 등고선의 개수가 그림 4의 (b) 보다 더 많다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic4.png">
  <br>
  그림 4. 다른 데이터들의 맥락을 고려한 두 점 사이의 거리는 다르게 계산되어야 할 수도 있다.
</p>

여기서는 "맥락", "등고선" 등의 모호한 표현을 사용했지만 이 개념을 조금 더 수학적으로 다듬어보자. 만약 데이터의 분포를 정규분포의 형태라고 가정할 수 있다면 정규분포의 표준 편차의 성질을 이용해 다음과 같이 평균(중심)으로부터 1, 2, 3 표준편차 만큼 떨어진 곳에 68, 95, 99.7%만큼의 데이터가 들어온다는 사실을 이용해보자.

<p align = "center">
  <img width = "600" src = "https://upload.wikimedia.org/wikipedia/commons/2/22/Empirical_rule_histogram.svg">
 <br>
 그림 5. 정규 분포에서 중심으로부터 1, 2, 3 표준편차 만큼 멀어질 때 얼마만큼의 데이터가 포함되는가? (68–95–99.7 rule)
</p>

다시 말해, 아래의 그림과 같이 표준편차를 기준삼아 등고선을 표시할 수 있다. 그리고 이 등고선이 "맥락을 고려한" 거리의 지표가 되는 것이다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic6.png">
 <br>
 그림 6. 평균으로부터 68, 95, 99.7% 등 표준편차 만큼 떨어진 거리를 등고선으로 표시한 그림
</p>

그런데, 우리가 가지고 있는 가장 간단한 거리의 지표는 유클리드 거리이다. 만약, 모든 "맥락"을 정규화 시킬 수 있다면 어떤 방법을 취해야 할까? 그것은 아래 그림과 같이 데이터가 표시 되어 있는 벡터 공간을 변형함으로써 가능할 것이다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic7.png">
 <br>
 그림 7. 데이터의 "맥락"의 표현과 "맥락"을 "정규화" 하기 위한 데이터(벡터) 공간의 변형
</p>

본 포스팅 맨 처음의 애플릿을 다시 한번 생각해보자. 아래의 그림 8의 왼쪽을 보면, 주어진 데이터의 "맥락"을 고려했을 때 주황색 점들보다는 노란색 점들이 더 먼 거리라고 판단해주어야 한다. 이것은 데이터가 어떻게 분포되어 있는지를 곰곰히 생각해보고 얻어지는 결과이다. 그런데, 그림 8의 오른쪽과 같이 "맥락"을 정규화시키면 단순히 유클리드 거리만 계산한 결과로도 노란색 점들 간의 거리가 더 멀다. "정규화" 과정으로 이미 주어진 데이터에 대한 "맥락"을 고려시켜 기존의 데이터(벡터) 공간을 변형시켰기 때문이다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic8.png">
 <br>
 그림 8. "맥락"을 정규화 시키고나서 측정한 유클리드 거리는 이미 맥락을 고려한 거리가 된다.
</p>

벡터 공간의 변형은 행렬로 표현할 수 있다. 특히, 데이터의 "맥락"을 표현하는 행렬은 공분산 행렬($\Sigma$)과 관련되어 있고, 그것을 다시 돌려 놓기 위한 행렬은 공분산 행렬의 역행렬($\Sigma^{-1}$)과 관련되어 있다.

아래의 수식은 마할라노비스 거리 공식이다. 식 (1)과 다르게 공분산 행렬의 역행렬이 들어있는 것에 주목할 필요가 있다. 지금부터는 행렬의 의미에 대해 조금 더 자세히 설명하고, "맥락"의 "정규화"를 수행하는 것과 식 (2)의 형태의 관계에 대해 더 자세하게 설명하도록 하겠다.

$$d_M = \sqrt{(\vec x-\vec y)^T\Sigma^{-1}(\vec x-\vec y)} % 식 (2)$$

# 공분산 행렬과 그 역행렬의 의미

데이터 샘플의 수가 $n$이고 feature의 개수가 $d$라고 했을 때 데이터를 n by d 행렬 $X$로 표시하자. 이 때, 각 열의 평균은 0이라고 가정하자. 공분산 행렬을 계산하기 위해선 아래와 같은 수식을 적용함으로써 얻어낼 수 있다[^1].

[^1]: 불편향 공분산을 얻기 위해선 n 대신에 n-1로 나눌 수도 있다.

$$\Sigma=\frac{1}{n}X^TX % 식 (3)$$

실제 샘플 [데이터](https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/covariance_matrix_data.csv)를 직접 도시해보고 공분산도 계산해보면 아래 그림과 같다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic12.png">
 <br>
 그림 9. 예시 샘플 데이터의 분포와 공분산
</p>


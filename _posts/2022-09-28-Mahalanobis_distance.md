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

※ 본 포스팅에서는 벡터의 기본 방향을 "행벡터"로 보고 작성하였습니다. 이에 대한 더 자세한 설명은 첫 꼭지 "행벡터를 기본 방향으로 하는 데이터 표현" 챕터를 읽어주십시오.

# Prerequisites

본 포스트를 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)

공분산 행렬에 대한 더 친절한 설명이 필요한 경우 아래의 포스트를 확인하십시오.

* [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html)
  
# 행벡터를 기본 방향으로 하는 데이터 표현

수학에서 벡터를 표현할 때 열벡터를 기본 방향으로 보는 것이 더 통용되는 방법이다. 다시 말해, 임의의 $n$ 차원 벡터 $x$는 다음과 같이 표현하는 것이 일반적이다.

$$\vec{x}=\begin{bmatrix}x_1 \\ x_2 \\ \vdots \\x_n\end{bmatrix} % 식 (1)$$

이 경우 행렬은 벡터의 왼쪽으로 들어가야 한다. 임의의 $n\times n$ 차원의 행렬 $A$와 $n$ 차원 열벡터 $x$의 곱은 다음과 같이 표현된다.

$$Ax % 식 (2)$$

또한, 열벡터 간의 내적은 전치 연산을 이용해 다음과 같이 쓸 수 있다. 임의의 $n$ 차원 벡터 $\vec x$와 $\vec y$에 대해,

$$dot(\vec x, \vec y)=\vec x^T\vec y % 식 (3)$$

그런데, 데이터 사이언스에서는 이유는 알 수 없으나 보통 데이터 하나를 행벡터로 취급해서 사용한다. 즉, 임의의 $d$ 차원 벡터 $x$는 다음과 같이 쓴다.

$$\vec{x}=\begin{bmatrix}x_1 & x_2 & \cdots & x_d\end{bmatrix}% 식 (4) $$

이렇게 되면 행렬은 벡터의 오른쪽으로 와야 한다. 임의의 $d\times d$ 차원 행렬 $R$과 $d$ 차원 행벡터 $x$의 곱은 아래와 같이 쓸 수 있다.

$$x R % 식 (5) $$

또한, 행벡터 간의 내적은 마찬가지로 전치연산을 이용하나 전치 연산이 붙는 벡터는 오른쪽에 있는 것이다. 다시 말해, 임의의 $d$ 차원 행벡터 $\vec x$와 $\vec y$에 대해,

$$dot(\vec x, \vec y)=\vec x \vec y^T % 식 (6)$$

가 된다.

더 나아가 데이터 사이언스에서는 표본의 수가 $n$이고 특징(feature)의 수가 $d$라고 했을 때 데이터 셋 $\mathcal D$를 $n\times d$ 차원 행렬로 두는 것이 일반적이다. 즉, 표본 데이터가 더 추가 된다면 하나의 행이 더 늘어나는 것이다. 다시 말해 하나의 데이터를 "행벡터"로 취급하는 것이다.

본 포스팅에서는 벡터의 기본 방향이 "행벡터"로 설정되었다. 

# 맥락을 고려한 상대적인 거리

아래와 같이 두 벡터 $\vec x$와 $\vec y$를 생각해보자.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic2.png">
  <br>
  그림 1. 공간 상의 두 벡터 간의 거리는 벡터의 내적을 이용해 계산할 수 있다.
</p>

여기서 임의의 점 $\vec x$와 $\vec y$ 까지의 유클리드 거리를 계산하려면 어떤 식을 사용해야 할까? 두 벡터의 차와 내적을 이용해 계산할 수 있다. 이와 같은 거리를 유클리드 거리(Euclidean distance)라고 부른다.

$$d_E = \sqrt{(\vec x-\vec y)(\vec x-\vec y)^T} % 식 (7)$$

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

$$d_M = \sqrt{(\vec x-\vec y)\Sigma^{-1}(\vec x-\vec y)^T} % 식 (8)$$

벡터 공간의 변형은 행렬로 표현할 수 있다. 특히, 데이터의 "맥락"을 표현하는 행렬은 공분산 행렬($\Sigma$)과 관련되어 있고, 그것을 다시 돌려 놓기 위한 행렬은 공분산 행렬의 역행렬($\Sigma^{-1}$)과 관련되어 있다. 지금부터는 수식적으로 데이터의 "맥락"을 파악하는 방법을 이해해보자. 또, "맥락"의 "정규화"를 수행하는 방법을 더 자세하게 다루어 보자.

# 공분산 행렬과 그 역행렬의 의미

## iid 정규분포 샘플 대한 기초적인 이해

데이터의 구조에 대해 이해하기에 앞서 우선 iid(independent and identically distributed) 정규 분포 샘플의 성질에 대해 이해할 필요가 있다. 용어는 어려워 보이지만 차근히 들여다보면 어려울 것이 하나도 없다. iid는 랜덤 데이터 샘플을 추출해내는 가장 단순한 방법론 중 하나이다. 

iid를 풀어서 설명하자면 다음과 같은 가정(assumption)이다

* 추출된 데이터는 독립적으로 추출되었다. 
* 추출된 데이터는 모두 동일한 확률 분포에서 추출되었다.

또, 여기서 추출된 확률 분포가 정규 분포라고 가정할 수 있다면 추출된 샘플은 "indenepdent and identically distributed normal random variables다" 라고 말 할 수 있는 것이다.

이번에는 $Z\in\mathbb{R}^{n\times d}$ 와 같이 여러개의 iid normal randon variables $z_1, \cdots ,z_d$를 좌우로 쌓아보자. 특히, 계산의 편의를 위해 표준 정규분포를 가정하자.

$$Z =\begin{bmatrix} | & | & & |\\ z_1 & z_2 & \cdots & z_d\\ | & | & & |\end{bmatrix} % 식 (9)$$

$$\text{where } z_1, z_2, \cdots, z_n \text{ are i.i.d. normal random variables with mean 0 and variance 1}\notag$$

표준 정규분포에서 추출한 샘플들이므로 아래의 사실을 확인할 수 있다. 추출한 분포의 평균이 0이라는 점을 생각하면,

$$\mathbb{E}\left[z_i\right]=0 \text{ for } i = 1, 2, \cdots, d % 식 (10)$$

이다.

또한 추출한 분포의 분산이 1이라는 것을 생각하여 아래에 대해서도 생각해보자.

$$\mathbb{E}\left[Z^TZ\right]

= \mathbb{E}\left [\begin{bmatrix}
  z_1^T z_1 & z_1^T z_2 & \cdots & z_1^Tz_d \\ 
  z_2^T z_1 & z_2^T z_2 & \cdots & z_2^T z_d \\
  \vdots    & \vdots    & \ddots & \vdots \\
  z_d^T z_1 & z_d^T z_2 & \cdots & z_d^Tz_d
  \end{bmatrix}\right ] % 식 (11)$$

여기서 $i=1,2,\cdots, d$에 대해 $\mathbb{E}\left[z_i^T z_i \right]$는 분산 $1$이 $n$ 개 더해진 것과 같으므로 $\mathbb{E}\left[z_i^T z_i \right]=n$이다. 또, $z_i$는 독립적으로 추출되었으므로 서로 다른 $i$와 $j$에 대해 $\mathbb E \left[z_i^T z_j \right]=0$ 이다.

따라서 식 (11)은

$$식 (11) \Rightarrow \begin{bmatrix}
  n & 0 & \cdots & 0 \\ 
  0 & n & \cdots & 0 \\
  \vdots    & \vdots    & \ddots & \vdots \\
  0 & 0 & \cdots & n
  \end{bmatrix} = n I % 식 (12)$$

와 같다. 여기서 $I$는 $d\times d$ 차원의 단위행렬이다.

## 주어진 데이터를 이해하는 또 다른 방법

화성에 사는 외계인 중 1000명을 임의로 선별해 키와 몸무게를 조사했고 이것을 표로 나타내보았다. 놀랍게도 평균키는 10cm이고 평균 몸무게는 8kg이었다고 한다. 표로 정리해보면 대략 아래와 같았다고 하자.

<p align = "center">
  <img width = "300" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic_table1.png">
 <br>
 그림 8. 화성 외계인들의 키와 몸무게를 정리한 표 (4번 외계인까지만 반올림하여 표시함)
</p>

1000명 외계인들의 키와 몸무게 데이터는 [여기](https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/alien_height_weight.csv)서 받을 수 있다.

키와 몸무게를 정리한 데이터를 $\mathcal D$라고 하자. 또, 표본이 된 외계인의 수를 $n$이라고 하고 키와 몸무게와 같은 특징의 숫자를 $d$라고 하면 $\mathcal D$는 다음과 같은 행렬이라고도 볼 수 있다.

$$\mathcal D\in\mathbb{R}^{n\times d} % 식 (13)$$

이번에는 임의의 1000명 외계인의 키와 몸무게라는 데이터를 이용했지만 어떤 데이터든지 분포를 확인할 수 있다. "새로운" 관점에서 데이터 분포를 이해해보기 위해 데이터셋의 각 feature 별 평균값을 모두 0으로 이동시키자. 그리고 feature 별 평균값이 모두 0인 새로운 데이터를 데이터 $X$로 보자.

$\mathcal D$와 $X$의 분포를 그려보면 다음과 같다. 

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic_move_distribution.png">
 <br>
 그림 9. 화성 외계인들의 키와 몸무게 데이터의 분포
</p>

이제 우리는 데이터 $X$를 다음과 같이 "새롭게" 이해해보자. $X$는 원시 데이터 $Z$가 있으며 이것이 선형변환된 결과물이라고 보는 것이다. 여기서 선형변환 $R$ 행렬이 $Z$의 오른쪽에 붙는 것은 식 (5)에서 보여준 것과 같이 벡터의 기본 방향을 행벡터로 보기 때문이다.

$$X = ZR % 식 (14)$$

$$\text{ where }Z \in \mathbb{R}^{n\times d} \text{ and } R \in \mathbb{R}^{d\times d}\notag$$

그리고 $Z$의 모든 열은 iid(independent and identically distributed) 표준 정규분포에서부터 추출한 데이터셋이라고 보자.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic10.png">
 <br>
 그림 10. 주어진 데이터를 일부 수정한 $X$를 원시 형태의 데이터 $Z$로부터 선형변환 된 결과로 보자.
</p>

이제부터 feature 간의 닮음을 조사하자. feature의 닮음을 조사한다면 데이터의 "맥락" 혹은 형태 구조를 파악할 수 있다. 왜냐하면, 가령, feature 1과 feature 2가 많이 닮아있다면 서로 상관관계가 높은 것을 의미하기 때문이다.이를 위해 $X^TX$를 계산하자. $X^TX$는 $d\times d$ 차원을 가지게 될 것인데, 이는 feature들 간의 내적을 표현한 것임을 알 수 있다. 만약 $XX^T$를 계산한다면 이것은 데이터들 간의 닮음을 파악한 것임을 예상할 수 있다. $X^TX$를 계산하는 과정을 아래 그림에서 확인해보자.

<p align="center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-07-27_PCA/XTX.png">
  <br>
  그림 11. 공분산 행렬을 계산하기 위해 각 데이터 특징들의 변동이 서로 얼마나 닮았는지 계산하는 과정.
</p>

여기서 다시 한번 식 (14)을 이용해보면,

$$X^TX=(ZR)^TZR=R^TZ^TZR=R^T(Z^TZ)R % 식 (15)$$

여기서 식 (12)에 따라,

$$X^TX \approx R^T(nI)R=nR^TR % 식 (16)$$

가 성립하게 된다. 여기서 "$\approx$"를 쓴 것은 실제 데이터에서는 기댓값과 정확히 같은 값이 나오지 않기 때문에 사용하였다. 그리고 아래와 같은 사실을 확인할 수 있다.

$$R^TR\approx \frac{1}{n}X^TX % 식 (17)$$

결국 식 (17)이 의미하는 것은 무엇인가? 식 (17)은 데이터 $X$의 형태 구조 혹은 데이터의 "맥락"를 얻기 위한 방법이다. 이것은 원시 형태의 $Z$를 주어진 데이터 $X$ 로 변환하기 위한 선형변환 $R$에 대한 $R^TR$와 거의 같다. 그리고 식 (17)의 형태 구조를 표현하는 행렬을 공분산 행렬이라고 부른다. 여기서는 공분산 행렬을 $\Sigma$라고 쓰도록 하자.

$$\Sigma = \frac{1}{n}X^TX % 식 (18)$$

참고로 $n$ 대신 $n-1$로 나누는 방법도 있다. $n$ 대신 $n-1$로 나누어 얻게 되는 공분산 행렬은 표본 공분산 행렬이라고 한다.

공분산 행렬은 데이터 셋 전체의 전반적 구조에 대해 설명하기에 용이한 방법이며 특히 다변수 정규 분포와 밀접한 관련이 있다. 만약 feature 가 두 개인 데이터셋이 2변수 정규 분포를 따른다고 하면 크게 아래와 같은 세 종류 중 하나의 형태를 따른다고 볼 수 있다.

<p align = "center">
  <img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/types_of_bivariate_gaussian.png">
 <br>
 그림 12. 가장 대표적인 세 가지 형태의 2변수 정규 분포
</p>

공분산 행렬의 각 원소가 뜻하는 바는 각 feature들의 분산 혹은 공분산이다. 다시 말해, 그림 12와 같이 feature가 2개인 경우 1번 feature와 2번 feature가 각각 x 축 방향, y 축 방향으로 얼마나 데이터들이 퍼져서 분포하는지, 그리고 1번, 2번 feature가 얼마나 함께 변하는지를 나타내는 것이다. 

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/meaning_of_cov_mtx.png">
 <br>
 그림 13. 공분산 행렬의 각 원소가 의미하는 것
</p>

## 역행렬과 맥락의 정규화

주어진 임의의 데이터를 $x$라고 하고 이의 원시 형태를 $z$라고 했을 때, 식 (14)에 따르면 주어진 데이터의 "맥락"을 원시 데이터의 형태로 되돌려 놓기 위해선 아래와 같이 수행하여 가능하다는 것을 알 수 있다.

$$z=xR^{-1}$$

여기서 역행렬을 이용한 선형변환은 주어진 선형변환 $R$에 의해 변환된 벡터 공간을 원래 형태로 돌려 놓는 것이다. 즉 그림 10에서 왼쪽으로부터 오른쪽으로 변하는 과정이 원래의 선형 변환 $R$이 수행해주는 변환이라고 하면, 역변환인 $R^{-1}$은 그림 10의 오른족에서 왼쪽으로의 변환이라고 볼 수 있는 것이다.

여기서, 식 (7)을 적용해 원시 데이터의 벡터 공간에서 원점과의 거리 $d_z$를 구하면 다음과 같다.

$$d_z=\sqrt{zz^T}=\sqrt{(xR^{-1})(xR^{-1})^T}$$

$$=\sqrt{xR^{-1}(R^{-1})^Tx^T}=\sqrt{x(R^TR)^{-1}x^T}=\sqrt{x\Sigma^{-1}x^T}$$

여기서 $\Sigma$는 주어진 전체 데이터 행렬의 공분산행렬이다. 

만약 위와 같은 과정을 임의의 벡터 $x$와 $y$ 사이의 거리에 대해 수행한다고 하면 아래와 같이 식을 수정할 수 있으며 이것은 원래 언급했던 마할라노비스 거리와 같다.

$$\Rightarrow \sqrt{(x-y)\Sigma^{-1}(x-y)^T}$$

# 등고선과 주축: 고윳값, 고유벡터

※ 마지막 챕터는 다소 심화된 내용이며 꼭 이해하지 않아도 마할라노비스의 큰 의미를 이해하는데에는 문제 없습니다.

※ 아래의 내용을 더 잘 이해하기 위해선 아래의 내용을 이해하고 오는 것이 좋습니다.

* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [고윳값 분해](https://angeloyeo.github.io/2020/11/19/eigen_decomposition.html)
  
이번에는 그림 3, 4 에서 소개한 바와 같이 데이터의 "맥락"을 파악하기 위한 표준 편차와 "등고선" 애기를 더 해보도록 하자. 마할라노비스 거리를 이해하는데 있어서 "등고선" 얘기는 아주 중요한 핵심 중 하나이다.

우선, 그림 12을 다시 살펴보자. 그림 12는 2변수 정규 분포가 가질 수 있는 대표적인 세 가지 분포 형태를 나타낸 그림이다. 그런데, 분포의 형태가 꼭 이렇게 세 가지 뿐일까? 아마 그렇지 않을 것이다. 분포의 모양이 얼마나 회전했는지, 얼마나 늘어져있는지 두 가지를 가지고 표현한다면 무수하게 많은 분포의 형태가 나올 것이라는 것을 알 수 있다. 다시 말해, 다변수 정규분포로 표현할 수 있는 임의의 분포는 표준 정규 분포를 늘리고 회전해서 얻어낼 수 있다고도 볼 수 있는 것이다.

주어진 선형변환을 얼마나 회전했는지와 얼마나 늘어났는지로 표현하는 방법은 바로 [고윳값 분해](https://angeloyeo.github.io/2020/11/19/eigen_decomposition.html)이다. 그리고 회전한 양은 그림 5의 오른쪽에서 보여주는 새로운 축의 방향을 나타내 줄 것이고 늘어난 양은 새로운 축들의 눈금 한 칸의 길이를 나타내 줄 것이다. 또한, [고윳값 분해](https://angeloyeo.github.io/2020/11/19/eigen_decomposition.html) 편에서 논의한 것 처럼 회전 방향은 고유벡터로, 늘어난 양은 고윳값으로 표현될 것이다.

공분산 행렬을 다음과 같이 고윳값 분해해보자.

$$\Sigma = Q\Lambda Q^{-1}=Q\Lambda Q^T$$

여기서 공분산 행렬은 항상 대칭행렬이므로 $Q^{-1}$은 $Q^T$로 쓸 수 있다는 점을 이용해 $Q^{-1}$ 을 $Q^T$로 대체했다.

여기서 $Q$와 $\Lambda$는 각각 고유벡터, 고윳값을 가지고 있는 행렬이다. 

예를 들어 그림 12의 첫 번째 그림에 있는 공분산 행렬을 고윳값 분해하면 다음과 같은 결과를 얻을 수 있다.

$$\begin{bmatrix}1 & 0.5\\0.5 & 1.5\end{bmatrix}=\begin{bmatrix}-0.8507 & 0.5257 \\ 0.5257 & 0.8507\end{bmatrix}\begin{bmatrix}0.6910 & 0 \\ 0 & 1.8090\end{bmatrix}\begin{bmatrix}-0.8507 & 0.5257 \\ 0.5257 & 0.8507\end{bmatrix}^T$$

그리고 $Q$의 각 열은 얼마만큼 표준 정규 분포를 회전했는지에 관한 정보를 보여주며, 좀 더 정확하게는 주성분(principal component, PC)의 방향을 나타내준다. 또, $\Lambda$의 대각성분들은 각 주성분 방향으로 얼마만큼 분포가 늘어져있는지를 보여준다. 아래의 그림 14를 참고하여 더 시각적으로 이해해보자.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/principal_axis.png">
 <br>
 그림 14. 공분산 행렬의 고윳값 분해 결과는 표준 정규 분포를 얼마나 늘리고 회전했는지를 벡터로 표현해줄 수 있게 해준다. 여기서 $\sigma_1$과 $\sigma_2$는 각각 PC1과 PC2가 늘어난 정도를 의미한다.
</p>

이 결과를 다시 한번 설명하자면 그림 3에서 그림 5까지의 내용을 더 수학적으로 표현해준 것과 같다. $Q$의 주성분 방향은 표준편차를 계산할 가장 대표적인 방향 두 가지가 되는 것이며, $\Lambda$의 대각성분은 다시 말해 주성분 방향으로의 표준편차를 의미하게 된다. 

따라서, 주축 상에 있는 데이터들을 중심으로 마할라노비스 거리를 이해한다면 (혹은 데이터들을 주축에 정사영 시키는 경우를 가정한다면) 주축을 원래의 xy 축으로 역 회전시키고 $\Lambda$로부터 얻은 표준편차 값으로 나눠주어 정규화시킨 거리를 의미한다고도 볼 수 있는 것이다. 
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

# 거리를 재는 방법

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

$$d_E = \sqrt{(\vec x-\vec y)^T(\vec x-\vec y)}$$

그런데 두 벡터 $\vec x$와 $\vec y$ 만을 생각하는 것이 아니라, 주변에 다른 데이터들을 고려한다면 두 점 사이의 거리는 다르게 생각해야 할 수도 있다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic3.png">
  <br>
  그림 3. 다른 데이터들의 맥락을 고려한 두 점 사이의 거리는 다르게 계산되어야 할 수도 있다.
</p>

위 그림을 보면 (a)는 파란색 데이터들이 보여주고 있는 기존의 분포에서 상당히 벗어나있는 점들이라는 것을 알 수 있다. 반면에 (b)는 파란색 데이터들이 보여주고 있는 기존의 분포에서 상대적으로 덜 벗어난 곳에 위치해있다. 말하자면 산의 모양을 고려한 등고선을 그려서 거리를 책정한다고나 할까. 분명 종이 위의 $\vec x$와 $\vec y$의 거리는 같지만 작은 동산을 가로지르는 경우와 큰 산을 가로지르는 거리는 아마 다를것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic4.png">
  <br>
  그림 4. 다른 데이터들의 맥락을 고려한 두 점 사이의 거리는 다르게 계산되어야 할 수도 있다.
</p>

여기서는 "맥락", "등고선" 등의 모호한 표현을 사용했지만 데이터의 분포 형태를 설명하는 것은 공분산 행렬을 이용해 가능하다. 공분산 행렬은 여기서는 $\Sigma$로 표현하고자 하며 이를 이용해 정의하는 상대적 거리인 마할라노비스 거리(Mahalanobis)는 임의의 벡터 $\vec x$, $\vec y$에 대해 다음과 같이 정의한다.

$$d_M = \sqrt{(\vec x-\vec y)^T\Sigma^{-1}(\vec x-\vec y)}$$

$d_E$와 비교했을 때 $\Sigma$의 역행렬 $\Sigma^{-1}$이 가운데 곱해져 있다는 점에 주목하자. 

# 공분산 행렬의 의미

※ 이 글 꼭지는 [주성분분석(PCA) 편](https://angeloyeo.github.io/2019/07/27/PCA.html)에서 가져와 해당 포스팅에 맞게 수정한 것입니다.

공분산 행렬은 일종의 행렬로써, 데이터의 구조를 설명해주며, 특히 특징 쌍(feature pairs)들의 변동이 얼마나 닮았는가(다른 말로는 얼마만큼이나 함께 변하는가)를 행렬에 나타내고 있다.

## 공분산 행렬의 기하학적 의미

우선 공분산 행렬을 기하학적으로 파악해보도록 하자. [행렬이란 선형 변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)이고 하나의 벡터 공간을 선형적으로 다른 벡터 공간으로 mapping 하는 기능을 가진다.

즉, 조금 다르게 말하면 우리는 지금의 데이터의 분포에 대해 "원래의 원의 형태로 주어졌던 데이터가 선형변환에 의해 변환된 결과로써 보자"라는 관점에서 데이터를 보고자 한다. 다음과 같이 어떤 행렬에 의해[^note] mapping 되는 mapping 전 단계의 데이터의 분포를 생각해보자. 

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-07-27_PCA/pic4.png">
<br>
그림 5. 2차원 벡터공간에 bivariate Gaussian distribution을 통해 random values를 원형으로 뿌려보았음
</p>

그림 5과 같은 데이터에 대해 행렬을 적용하여 선형 변환을 시켜주면[^note] 어떤 일이 일어나는지 알아보자. 그림 3에서 데이터가 자리잡고 있는 2차원 벡터공간에 대한 선형 변환은 그림 아래의 애플릿과 같이 나타난다.

[^note]: 실제로 곱해지는 행렬은 공분산 행렬이 아닌 공분산 행렬을 숄레스키 분해하여 얻은 삼각행렬이다.

<p align="center">
  <iframe width = "400" height = "400" src="https://angeloyeo.github.io/p5/2019-07-27-PCA_applet1/" frameborder = "0"></iframe>
</p>

각 버튼을 눌렀을 때 얻게 되는 결과들의 공분산 행렬은 아래와 같다.

<center>

Matrix 1: $
\begin{bmatrix}
3 & 2 \\
2 & 4
\end{bmatrix}
$, Matrix 2: $
\begin{bmatrix}
3 & -2 \\
-2 & 4
\end{bmatrix}
$, Matrix 3: $
\begin{bmatrix}
5 & 0 \\
0 & 1
\end{bmatrix}
$, Matrix 4: $
\begin{bmatrix}
1 & 0 \\
0 & 5
\end{bmatrix}
$

</center>

4개의 행렬 중, Matrix 1에 대해서만 설명하자면, Matrix 1에서 보여주는 것은 다음과 같다.

Matrix 1의 1행 1열의 원소는 1번 feature의 variance를 나타낸다. 즉, x축 방향으로 얼마만큼 퍼지게 할 것인가를 말해준다. 

1행 2열의 원소와 2행 1열의 원소는 각각 x, y축으로 함께 얼마만큼 퍼지게 할 것인가를 말해준다. 

2행 2열의 원소는 y축 방향으로 얼마만큼 퍼지게 할 것인가를 말해준다.


<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-07-27_PCA/pics_mtx1.png">
<br>
그림 6. 공분산행렬 Matrix 1의 각 원소들이 의미하는 것
</p>

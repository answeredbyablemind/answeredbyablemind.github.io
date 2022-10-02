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
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic6.png">
 <br>
 그림 6. 평균으로부터 68, 95, 99.7% 등 표준편차 만큼 떨어진 거리를 등고선으로 표시한 그림
</p>

그런데, 우리가 가지고 있는 가장 간단한 거리의 지표는 유클리드 거리이다. 만약, 모든 "맥락"을 정규화 시킬 수 있다면 어떤 방법을 취해야 할까? 그것은 아래 그림과 같이 데이터가 표시 되어 있는 벡터 공간을 변형함으로써 가능할 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic7.png">
 <br>
 그림 7. 데이터의 "맥락"의 표현과 "맥락"을 "정규화" 하기 위한 데이터(벡터) 공간의 변형
</p>

본 포스팅 맨 처음의 애플릿을 다시 한번 생각해보자. "맥락"을 고려하면 아래 그림의 왼쪽과 같이 주황색 점들보다는 노란색 점들이 더 거리가 먼 거리다. 이것은 데이터가 어떻게 분포되어 있는지를 곰곰히 생각해보고 얻어지는 결과이다. 그런데, 아래 그림의 오른쪽과 같이 "맥락"을 정규화시키면 단순히 유클리드 거리만 계산한 결과를 보기만 하면 이미 "맥락"이 고려된 결과를 얻는 것과 같다. 왜냐하면 "정규화" 과정에서 "맥락"이 고려되어 데이터(벡터) 공간을 변형시켰기 때문이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2022-09-28-Mahalanobis_distance/pic8.png">
 <br>
 그림 8. "맥락"을 정규화 시키고나서 측정한 유클리드 거리는 이미 맥락을 고려한 거리가 된다.
</p>

벡터 공간의 변형은 행렬로 표현할 수 있다. 특히, 데이터의 "맥락"을 표현하는 행렬은 공분산 행렬($\Sigma$)이고, 그것을 다시 돌려 놓기 위한 행렬은 공분산 행렬의 역행렬($\Sigma^{-1}$)로 표현가능하다.

아래의 수식은 마할라노비스 거리 공식이다. 식 (1)과 다르게 공분산 행렬의 역행렬이 들어있는 것에 주목할 필요가 있다. 지금부터는 행렬의 의미에 대해 조금 더 자세히 설명하고, "맥락"의 "정규화"를 수행하는 것과 식 (2)의 형태의 관계에 대해 더 자세하게 설명하도록 하겠다.

$$d_M = \sqrt{(\vec x-\vec y)^T\Sigma^{-1}(\vec x-\vec y)} % 식 (2)$$

# 공분산 행렬과 역행렬의 의미

마할라노비스 거리의 의미를 잘 이해하기 위해서는 행렬이 갖는 기하학적 의미에 대해 아는 것이 중요하다. [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html) 편에서는 행렬이 벡터 공간을 선형적으로 변환시키는 기능을 한다고 소개한 바 있다. 

## 행렬은 선형 변환이다.

벡터 공간을 선형 변환한다는 것은 공간의 변환 전 후에 1) 원점의 위치가 변하지 않고 2) 격자들의 형태가 직선이며 3) 격자 간의 간격이 동일하다는 것을 의미한다. 아래의 Applet은 행렬 

$$A=\begin{bmatrix}2 & -3 \\ 1 & 1\end{bmatrix} % 식 (3)$$

이 보여주는 선형 변환이다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/transformation1/" width="650" height = "520" frameborder="0"></iframe></p>

위 애플릿의 슬라이드를 가장 오른쪽으로 옮겼을 때의 결과는 다음과 같은데,

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/matrix_as_a_transformation/pic1.png">
  <br>
  그림 9. 식 (3)의 행렬이 취해주는 선형 변환의 최종 결과
</p>

위 그림의 빨간색 화살표와 초록색 화살표는 행렬 $A$를 구성하고 있는 열벡터들

$$\begin{bmatrix}2\\1\end{bmatrix}, \begin{bmatrix}-3\\1\end{bmatrix}$$

에 대응되는 것이다. 이 시각화를 통해 확인할 수 있듯이 선형 변환의 변환 대상은 벡터이다. 벡터는 화살표 뿐만 아니라 점으로도 표현할 수 있다. 만약, 수 많은 벡터들이 벡터 공간상에 놓여있다고 했을 때 이것들을 한꺼번에 식 (3)의 행렬로 변환 시켜주면 어떤 결과를 얻게 될까?

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2022-09-28-Mahalanobis_distance/example2/" width="650" height = "520" frameborder="0"></iframe></p>

그림 4의 (b)에서 보여주는 데이터의 형태를 다시 생각해보자. 위 애플릿의 선형 변환 결과물과 비교해 우리가 얻을 수 있는 인사이트는 무엇일까?

## 주어진 데이터를 보는 새로운 관점

$$x=Az$$

$$x^Tx=z^TA^TAz$$

반대로

$$z=A^{-1}x$$

$$z^Tz=x^T(A^{-1})^TA^{-1}x$$

$$=x^T(AA^T)^{-1}x$$

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

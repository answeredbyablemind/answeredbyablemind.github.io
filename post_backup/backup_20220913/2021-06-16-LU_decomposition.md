---
title: LU 분해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210616
tags: 선형대수학
---

# Prerequisites

이번 포스팅의 내용을 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)

# 삼각행렬 소개

이번 LU 분해를 이해하기 위해선 아래의 삼각행렬이라는 용어를 조금 다루고 가는 것이 좋을 것 같아 짧게 소개한다.

선형대수학에서 종종 보이는 특이한 형태의 행렬 중 삼각행렬이라는 행렬이 있다. 이 행렬은 주대각선을 기준으로 대각 성분의 윗쪽이나 아랫쪽 항들의 값이 모두 0인 행렬을 말한다.

그래서 대각성분의 윗쪽 항들이 모두 0인 행렬을 하삼각행렬(lower triangular matrix)라고 하고, 대각 성분 아랫쪽 항들이 모두 0인 행렬을 상삼각행렬이라고 한다.

* 하삼각행렬(lower triangular matrix)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq1.png"> </p>


* 상삼각행렬(upper triangular matrix)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq2.png"> </p>

# 연립 방정식의 풀이 다시 생각해보기

연립 방정식의 풀이 과정에 들어가는 기본 행 연산들을 행렬로 표현해주기 위해 우리는 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)에 대해 생각해보았다.

잠깐 복습하면 기본행렬은 총 세 가지 종류가 있었는데 각각은

1. Row multiplication
2. Row switching
3. Row addition

이었다. 

그리고 이런 기본 행 연산들을 통해서 해를 얻어주는 과정을 우리가 다시 잘 생각해보면 가장 아랫쪽에 있던 방정식에서는 가장 마지막 미지수에 대한 식만을 남기고, 그 위에 있는 방정식은 마지막 두 개의 미지수만을 남기는 식으로 미지수를 소거해 나가면 가장 아래에 있는 식으로부터 마지막 미지수에 대한 값을 얻고, 그 위에 있는 식에 대입하는 과정을 통해 그 다음 미지수에 대한 값을 얻고... 등의 순서로 미지수의 값들을 차례대로 얻어낼 수 있게 된다는 사실을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq3.png"> <br> 식 (3) </p>

[//]:# (식 3)

아래와 같은 연산을 수행하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq4.png"> <br> 식 (4) </p>

[//]:# (식 4)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq5.png"> <br> 식 (5) </p>

[//]:# (식 5)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq6.png"> <br> 식 (6) </p>

[//]:# (식 6)

아래와 같은 연산을 수행하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq7.png"> <br> 식 (7) </p>

[//]:# (식 7)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq8.png"> <br> 식 (8) </p>

[//]:# (식 8)

그러면 아래에서부터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq9.png">이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq10.png">임을 알 수 있고,

이 값을 두 번째 식에 대입해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq11.png"> 임을 알 수 있고,

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq12.png">을 첫번째 식에 대입하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq13.png">임을 알 수 있게 된다.

가장 마지막 미지수부터 처음 미지수로 계산해 나간다고 해서 이런 과정을 back substitution이라고 부른다.

# Back substituion을 행렬로 표현해보자.

위에서 계산했던 해를 구하는 과정을 행렬로 표현해보면 어떨까?

즉, 식 (3) 방정식을 표현한 행렬

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq14.png"> </p>

에 식 (4), (5), (7)과 같은 기본 행 연산들을 수행해줌으로써 식 (8)의 방정식을 표현한 행렬

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq15.png"> </p>

을 얻게 된 과정을 기본 행렬로 기본 행 연산들을 표현해 써보자는 것이다.

기본 행 연산들을 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html)을 이용해 표현하면 다음과 같이 요약해서 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq16.png"> </p>

원래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq17.png"> 행렬 왼쪽에 붙은 기본 행렬들의 의미를 생각해본다면 다음과 같은 기본 행 연산들이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-16-LU_decomposition/pic1.png">
  <br>
  그림 1. 기본 행렬 연산을 통해서 얻게 된 최종 결과물로 back substitution을 수행할 수 있게 된다.
</p>

그러면 위에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq18.png">에 대한 해를 구한 방법과 마찬가지로 결과로써의 우변의 행렬로부터 동일하게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq19.png">라는 결과를 통해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq20.png">임을 알 수 있고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq21.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq22.png">도 차례대로 알 수 있는 것이다.

그런데, 이 아이디어를 적용해서 조금 다른 시도를 생각해보자. 우리는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq23.png"> 대신에 방정식의 계수만 붙어있는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq24.png">에 대해서도 동일한 방법으로 기본 행렬을 곱해주면 우변의 행렬을 첨가(augment) 시키지 않은 꼴을 얻을 수 있다. 이 때, 얻게 되는 결과물은 앞서 소개한 상삼각행렬(upper triangular matrix)의 꼴일 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-16-LU_decomposition/pic2.png">
  <br>
  그림 2. 기본 행렬 연산을 통해서 계수 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq25.png">를 상삼각행렬의 꼴로 바꿀 수 있다.
</p>

# 기본 행렬의 역행렬을 곱하기: LU 분해

그리고 [기본 행렬](https://angeloyeo.github.io/2021/06/15/elementary_square_matrices.html) 시간에 배웠던 것 처럼 기본 행렬들의 역행렬은 아주 간단한 형태를 띄고 있다. 간단하게 복습해보면 아래와 같다.

가령 아래와 같은 Row multiplication 행렬과 그 역행렬의 관계는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq26.png"> </p>

와 같다.

또, 가령 아래와 같은 Row addition을 수행해주는 기본 행렬과 그 역행렬의 관계는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq27.png"> </p>

와 같다.

또, 행의 순서를 바꿔주는 기능을 수행해주는 기본 행렬과 그 역행렬의 관계는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq28.png"> </p>

그러므로 그림 2에서 볼 수 있었던 계수 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq29.png">를 상삼각행렬로 만들어주는 연산에 대해 계수 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq30.png">앞에 곱했던 기본행렬들의 역행렬을 순서대로 곱해주면 아래와 같이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq31.png">를 다시 써줄 수 있게 된다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-16-LU_decomposition/pic3.png">
  <br>
  그림 3. 기본행렬들의 역행렬을 순서대로 다시 곱해줌으로써 좌변에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq32.png">만 남겨놓을 수 있게 된다.
</p>

그런 다음 기본 행렬의 역행렬들을 직접 계산해주고 행렬 곱을 통해 이들을 하나의 행렬로 합쳐주면 아래 그림과 같이 하삼각행렬로 합쳐질 수 있음을 알 수 있다.

따라서, 우리는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq33.png">를 하삼각행렬과 상삼각행렬의 곱으로 나눠줄 수 있다는 것을 알 수 있게 된다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-16-LU_decomposition/pic4.png">
  <br>
  그림 4. 기본행렬들의 역행렬을 계산해주고 합쳐주면 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq34.png">를 하삼각행렬과 상삼각행렬의 곱으로 나타내줄 수 있게 된다.
</p>

# 치환 행렬의 이용: PLU 분해

어떤 행렬은 행교환을 해주지 않으면 LU 분해가 바로 되지 않을 수 있다. 앞서 소개한 LU 분해의 예시에서는 사실 행 교환 연산은 이용하지 않은 경우였다. 이번에는 행 교환 연산까지도 포함되는 LU 분해를 생각해보자.

가령 아래와 같은 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq35.png">를 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq36.png"> </p>

이런 행렬은 하삼각행렬 꼴의 기본행렬 중 row addition이나 row scaling 만을 이용해서는 최종 출력물이 상삼각행렬이 될 수 없다.

왜냐면 첫 번째 행에 첫 번째 두 번째 원소가 모두 0으로 이미 기정사실화 되어 있기 때문이다.

따라서, 하삼각행렬의 row addition과 row scaling에 해당하는 기본행렬만을 이용할 수 있도록 하기 위해선 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq37.png">의 행을 바꿔놓고 시작해야만 한다.

이번 예시에서는 먼저 1행과 3행을 치환한 뒤 LU 분해를 생각해보자. 따라서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq38.png"> </p>

이라는 행렬을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq39.png">에 곱해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq40.png"> </p>

이 된다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq41.png"> 연산을 수행해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq42.png"> </p>

와 같이 되는 것을 알 수 있으며 이 결과는 상삼각행렬임을 알 수 있다.

따라서, 기본 행연산의 역행렬을 취해 다음과 같이 써줄 수 있음을 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq43.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq44.png"> </p>

즉, 이와 같이 분해하고자 하는 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq45.png">의 행순서를 미리 바꿔놓고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq46.png"> 분해를 수행하는 경우를 PLU 분해를 수행한다고 한다.

앞서 언급했듯이 행 치환 행렬의 역행렬은 자기자신이므로 원래 계수행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq47.png">는 다음과 같이 분해할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq48.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq49.png"> </p>

# LU 분해의 이용

LU 분해를 이용하면 어떤 이점이 있는지 생각해보자.

## Ax=b의 해 구하기

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq50.png">가 정방행렬이고 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq51.png"> </p>와 같이분해 가능하다고 하면 다음과 같이 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq52.png"> </p>

에서 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq53.png"> </p>라고 쓸 수 있으므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq54.png"> </p>

이다. 이 때, 만약 이 식을 다음과 같이 괄호의 위치를 바꿔서 생각해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq55.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq56.png"> 역시도 일종의 열벡터라고 생각할 수 있다는 것을 알 수 있다. 따라서, <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq57.png"> </p>라는 이름의 열벡터로 치환해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq58.png"> </p>

와 같은 꼴의 문제가 된다.

그런데, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq59.png">은 잘 생각해보면 하삼각행렬이고 하삼각행렬은 forward substitution을 활용하면 solution을 수월하게 얻을 수 있다.

그런 다음 우리는 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq60.png"> </p>

라는 문제를 풀어주면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq61.png">에 대한 답을 얻을 수 있게 되는 것이다. 이 때는 backward substitution을 써주면 해를 쉽게 얻을 수 있게 된다.

예를 들어, 위에서 보았던 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq62.png">에 대해 LU 분해하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq63.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq64.png"> </p>

와 같은데, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq65.png"> </p>에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq66.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq67.png"> 였다고 하면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq68.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq69.png"> </p>

과 같고, 위 식을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq70.png">의 꼴로 바꿔주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq71.png"> </p>

그러면 손쉽게 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq72.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq73.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq74.png">라는 것을 알 수 있으므로 우리가 추가로 풀어야 할 문제는 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq75.png"> </p>라는 점을 생각해보았을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq76.png"> </p>

따라서, 이번엔 back-substitution을 이용하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq77.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq78.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq79.png"> 임을 알 수 있다.

## 행렬식을 수월하게 구하기

마찬가지 원리로 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq80.png">라는 행렬이 LU 분해 가능하다고 하면 다음을 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq81.png"> </p>

라고 했을 때, 행렬식의 성질에 의해

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq82.png"> </p>

일 것이다. 그런데 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq83.png">이나 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq84.png">는 모두 삼각행렬이므로 대각성분의 곱만으로 행렬식이 계산된다는 점을 생각하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq85.png">의 행렬식을 쉽게 구할 수 있게 된다.

다시 말해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq86.png">를 분해한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq87.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq88.png">가 식 (1), (2)와 같다고 하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq89.png">의 행렬식은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-06-16-LU_decomposition/eq90.png"> </p>

와 같이 간단하게 계산할 수 있게 된다.
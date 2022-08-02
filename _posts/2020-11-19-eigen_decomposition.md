---
title: 고윳값 분해(eigen-value decomposition)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201119
tags: 선형대수
---

※ 시각화와 이해의 편의를 도모하기 위해 벡터와 행렬이 정의되는 체(field)는 실수(real number)로 한정함.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_A/" width="300" height = "240" frameborder="0"></iframe> <br> 원래의 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq1.png"> <br> <iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_A_preview/" width="300" height = "240" frameborder="0"></iframe><br>EVD를 이용해 세 개의 단계로 분해한 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq2.png"><br><br><b>EVD는 기존의 선형변환을 '돌리기','늘리기','돌리기'의 세 과정으로 분해해서 생각할 수 있게 해준다.</b><br>
</p>
# Prerequisites

해당 post를 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)

# 배경 지식

## 행렬은 벡터들의 모음

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq3.png">개의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq4.png">차원 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq5.png">이 있다고 생각해보자.

그러면 우리는 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq6.png">개의 벡터들을 모아 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq7.png"> 차원의 행렬을 구성할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq8.png"> <br> 식(1) </p>

[//]:# (식 1)

## 행렬의 각 열의 상수를 인수분해 하는 방법

어떤 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq9.png"> 차원 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq10.png">가 다음과 같이 구성되어 있다고 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq11.png"> <br> 식(2) </p>

[//]:# (식 2)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq12.png"> 은 임의의 실수이다.

그렇다면 식 (2)의 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq13.png">는 다음과 같이 인수분해 할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq14.png"> <br> 식(3) </p>

[//]:# (식 3)

이 곱셈이 어렵다고 생각하지 말고, 왼쪽에 곱해지는 행렬의 각각의 벡터를 숫자처럼 생각하고 연산하면 쉽게 식 (3)이 옳다는 것을 알 수 있다.

# 고윳값 분해

임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq15.png"> 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq16.png">에 대해 여러개의 고윳값과 고유벡터를 얻었다고 해보자.

다시 말해, 아래의 식을 만족하는 고윳값과 고유벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq17.png">개 씩을 획득할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq18.png"> <br> 식(4) </p>

[//]:# (식 4)

그러면 우리는 고유벡터들을 모아둔 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq19.png">를 아래와 같이 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq20.png"> <br> 식(5) </p>

[//]:# (식 5)

이 때, 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq21.png">와 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq22.png">의 관계를 식 (4)를 이용해 한꺼번에 표현하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq23.png"> <br> 식(6) </p>

[//]:# (식 6)

또 고윳값들을 대각성분에 모아둔 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq24.png">을 아래와 같이 생각해본다면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq25.png"> <br> 식(7) </p>

[//]:# (식 7)

식 (2)와 식 (3)에서 본 관계를 이용해 식 (6)을 아래와 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq26.png"> <br> 식(8) </p>

[//]:# (식 8)

만약 모든 고유벡터들이 선형독립이라면 식 (8)로부터 아래와 같이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq27.png">를 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq28.png"> <br> 식(9) </p>

[//]:# (식 9)

## 고윳값 분해의 기하학적 의미

고윳값 분해는 기하학적으로 행렬로 표현되는 선형변환은 '돌리고', '늘리고', '돌리고' 하는 세 가지의 과정을 통해 분해할 수 있음을 보여준다.

고윳값 분해의 기하학적 의미를 이해하기 위해 아래와 같은 행렬 A를 고윳값 분해 해보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq29.png"> </p>

우선 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq30.png">의 선형변환을 시각화하면 아래와 같다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_A/" width="300" height = "240" frameborder="0"></iframe><br>
애니메이션 1. 행렬 A의 선형변환</p>

위 행렬의 고윳값 고유벡터는 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq31.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq32.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq33.png"> </p>

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq34.png">의 고윳값과 고유벡터를 이용해 식 (10)과 같이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq35.png">를 분해하기 위한 행렬들을 써보면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq36.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq37.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq38.png"> </p>

그리고 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq39.png">는 아래와 같이 쪼개서 생각해줄 수 있는 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq40.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq41.png"> </p>

아래는 고유벡터로 구성된 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq42.png">의 선형 변환이다.

자세히 보면 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq43.png">의 선형변환은 회전과 유사한 형태를 보인다. 

왜냐하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq44.png">에 들어간 열벡터들은 모두 고유벡터인데 고유벡터는 방향만을 표시하므로 그 길이는 1이 되기 때문이다.

따라서, 원점에서부터 시작하는 길이가 1인 벡터들이 두 개가 서로 다른 방향을 보여주고 있으니 회전 변환과 유사한 역할을 할 수 있다.

다만 변환 후의 기저 벡터의 길이가 모두 같은 것은 아니라는 점과 변환 시 뒤집어 지면서 변환 할 가능성이 있기 때문에 완전히 회전 변환과 같다고는 할 수 없다.

또, V의 변환 후 기저벡터들의 각도가 90도를 이루지 않는다는 점도 주의해야 할 점이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq45.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_V/" width="300" height = "240" frameborder="0"></iframe><br> 애니메이션 2. 선형변환 V</p>

아래는 고윳값을 대각성분에 구성한 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq46.png">의 선형변환이다. 대각성분만 존재하기 때문에 위 아래 혹은 양 옆으로 늘어나거나 줄어드는 변환만 보이는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq47.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_D/" width="300" height = "240" frameborder="0"></iframe><br> 애니메이션 3. 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq48.png"></p>

아래는 고유벡터로 구성된 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq49.png">의 역행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq50.png">의 선형 변환이다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq51.png">의 선형변환도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq52.png">와 비슷하게 회전과 유사한 형태를 보인다. 다만 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq53.png">와의 회전 방향과는 반대인 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq54.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_Vinv/" width="300" height = "240" frameborder="0"></iframe> <br> 애니메이션 4. 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq55.png"></p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq56.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq57.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq58.png">의 각각의 선형 변환을 차례대로 적용하면 원래의 선형 변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq59.png">와 같은 것을 알 수 있다.

아래의 Applet에서 세 개의 슬라이드는 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq60.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq61.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq62.png">에 해당한다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_A_decomposed/" width="320" height = "265" frameborder="0"></iframe><br> 애니메이션 5. 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq63.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq64.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq65.png">을 독립적으로 적용 시켜보자.</p>


# 대칭 행렬의 고윳값 분해

대칭 행렬의 고윳값 분해는 일반 정방 행렬의 고윳값 분해와 비교했을 때 약간 특이한 점이 있다. 대칭 행렬의 경우 고유벡터가 서로 직교하는 성질을 보이기 때문이다.

대칭 행렬은 아래와 같은 성질을 만족하는 행렬이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq66.png"> </p>

만약, 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq67.png">가 식 (9)에서와 같이 고윳값 분해할 수 있다면 아래의 내용이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq68.png"> </p>

여기서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq69.png">는 대각행렬이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq70.png">이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq71.png">이므로 식 (12)는 다음과 같이 쓸 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq72.png"> </p>

따라서, 대칭 행렬의 고유벡터를 모아둔 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq73.png">는 직교행렬이다. 다시 말해 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq74.png"> </p>

이고,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq75.png"> </p>

이다.

따라서, 대칭행렬은 아래와 같이 고윳값 분해할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq76.png"> </p>

일반적으로 대칭행렬의 고윳값을 모아둔 행렬은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq77.png"> 대신에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq78.png">로 종종 쓴다.

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq79.png">가 대칭행렬인 경우

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq80.png"> </p>

로 행렬을 분해할 수 있다.

## 대칭 행렬 고윳값 분해의 기하학적 의미

대칭 행렬 고윳값 분해의 기하학적 의미를 이해하기 위해 아래와 같은 행렬 A를 고윳값 분해 해보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq81.png"> </p>

우선 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq82.png">의 선형변환을 시각화하면 아래와 같다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_sym_A/" width="300" height = "240" frameborder="0"></iframe><br>
애니메이션 6. 행렬 A의 선형변환</p>

위 행렬의 고윳값 고유벡터는 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq83.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq84.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq85.png"> </p>

행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq86.png">의 고윳값과 고유벡터를 이용해 식 (9)와 같이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq87.png">를 분해하기 위한 행렬들을 써보면 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq88.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq89.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq90.png"> </p>

고윳값, 고유벡터 관점에서 봤을 때 일반적인 정방 행렬과 대칭 행렬의 차이는 고유벡터들이 서로 직교한다는 것이다.

따라서, 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq91.png">에 의해서 선형 변환되었을 때는 선형 변환 후에도 여전히 기저 벡터들의 길이는 1이면서 동시에 직교하기 때문에 벡터 공간을 회전 시켜놓은 것 같은 결과를 확인할 수 있다.

(여기서 '회전 시켜 놓은 것 같은'이라고 말하는 것은 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq92.png">의 열벡터의 위치에 따라 기저벡터가 뒤집혀서 선형변환 될 수도 있기 때문이다.)

따라서, 대칭 행렬의 고유벡터를 모아 얻은 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq93.png">는 회전행렬과 유사한 의미를 갖는다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq94.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq95.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq96.png">의 선형 변환을 차례대로 적용하면 원래의 선형 변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq97.png">와 같은 것을 알 수 있다.

아래의 Applet에서 세 개의 슬라이드는 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq98.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq99.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq100.png">에 해당한다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/2020-11-19-eigen_decomposition/linear_transformation_sym_A_decomposed/" width="320" height = "265" frameborder="0"></iframe><br> 애니메이션 7. 선형변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq101.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq102.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-11-19-eigen_decomposition/eq103.png">을 독립적으로 적용 시켜보자.</p>

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/VUHihs_ClFA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

---
title: 벡터장의 면적분
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200821
tags: 미적분학
---

# preprequisites

면적분을 이해하기 위해선 다음의 내용에 대해 알고 오시는 것이 좋습니다.

* [미소곡면의 법선 벡터](https://angeloyeo.github.io/2020/08/20/normal_vector.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [벡터장의 flux(2D)](https://angeloyeo.github.io/2020/08/18/flux_2D.html)

# 면적분의 수식

우선 면적분의 수식을 바로 적어보자면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq1.png"> <br> 식 (1) </p>

[//]:# (식 1)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq2.png">는 벡터장이다. 또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq3.png">는 면벡터로써 쪼개보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq4.png">로 쓸 수 있다. 즉, 크기는 곡면상의 미소 곡면의 넓이(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq5.png">)이고 방향은 [법선 벡터](https://angeloyeo.github.io/2020/08/20/normal_vector.html)(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq6.png">)인 벡터이다.

면적분의 수식을 잘 살펴보면 [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)의 수식과 굉장히 닮아있다는 것 또한 알 수 있다.

참고로, [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)의 수식은 다음과 같았다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq7.png"> </p>

벡터장의 선적분과 면적분의 차이점은 적분해주는 정의역의 범위가 1차원인 곡선인지 아니면 정의역의 범위가 2차원인 곡면인지에 따른 차이라고 할 수 있겠다.

## 미소곡면의 넓이 dS

식 (1)을 보면 벡터장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq8.png">는 문제에서 주어질 것이고, [미소 곡면의 법선벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq9.png">](https://angeloyeo.github.io/2020/08/20/normal_vector.html)은 저번 article에서 다루었기 때문에 미소곡면의 넓이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq10.png">에 대해서만 더 알게된다면 면적분을 계산할 수 있을 것이다.

[미소 곡면의 법선 벡터 편](https://angeloyeo.github.io/2020/08/20/normal_vector.html)에서는 2차원 입력 공간에 대응되는 3차원 출력 공간이 있고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq11.png">라는 매핑(즉, 함수)에 따라 3차원 곡면이 결정된다고 하였다.

또한, 이 때 아래의 그림 1과 같이 임의의 점 위에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq12.png">방향으로의 작은 변화 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq13.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq14.png"> 방향으로의 작은 변화 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq15.png">에 대한 변화율은 각각 아래와 같은 벡터로 표현할 수 있다.

<center>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq16.png"> 의 작은 변화에 따른 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq17.png"> 의 변화율 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq18.png">

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq19.png"> 의 작은 변화에 따른 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq20.png"> 의 변화율 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq21.png">


</center>
<p align="center">
  <img src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-21-surface_integral/pic1.png"> <br>
  그림 1. 입력 공간의 작은 변화에 따라 얻어지는 출력 공간에서의 변화율
</p>

그림 1에서의 논의를 이어 아래의 그림 2와 같이 그림 1에 표시된 벡터들만을 따로 그리면 그림 2와 같다.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-21-surface_integral/pic2.png"> <br>
  그림 2. 입력 공간의 작은 변화에 따라 얻어지는 출력 공간에서의 변화율
</p>

그림 2에서 출력 공간에 해당하는 부분의 그림을 잘 보면 곡면상의 빨간 점에서의 미소 면적 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq22.png">를 표시해 둔 것을 알 수 있다.

미소면적 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq23.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq24.png"> 벡터의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq25.png">방향으로의 변화에 따른 변화량과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq26.png"> 벡터의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq27.png">방향으로의 변화에 따른 변화량을 통해서 얻을 수 있다. 두 변화량에서 편미분으로 표시된 두 개의 값은 모두 벡터이므로 미소면적의 크기 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq28.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq29.png"> </p>

이 때, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq30.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq31.png">는 스칼라 값이므로 절대값 기호 밖으로 꺼내주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq32.png"> </p>

## 면적분의 식을 다시 전개해보면,

이전 시간에 미소곡면의 법선벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq33.png">은 다음과 같이 쓸 수 있음을 알게 되었다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq34.png"> </p>

따라서, 식 (1)을 다시 쓰면 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq35.png"> </p>

위 식에서 이중적분 기호의 아랫첨자가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq36.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq37.png">로 바뀐 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq38.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq39.png">에 대해 적분해주기 때문인데, 그것은 정의역의 영어 표현이 Domain 이기 때문이다.

즉, 치역에서 계산할 것을 정의역에서 계산할 수 있게 식을 변형시켜 주는 것이다.

# 면적분의 의미: 3D flux

면적분의 값은 미소 곡면의 유량의 의미를 갖는다.

[벡터장의 flux(2D)](https://angeloyeo.github.io/2020/08/18/flux_2D.html)편에서는 미소 경로를 따라 얻을 수 있는 유량에 대해 알아보았는데, 미소 경로에 따른 유량과 미소 곡면에 따른 유량을 비교하면 아래의 그림 3과 같다.

<p align="center">
  <img src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-21-surface_integral/pic3.png"> <br>
  그림 3. 미소 경로의 유량과 미소 곡면의 유량 비교
</p>

미소 곡면의 면적 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq40.png">에 대해서 벡터장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq41.png">가 주어져 있다고 하자. 

여기서의 가정은 미소 곡면의 네 변은 매우 길이가 작기 때문에 미소 곡면 상에 있는 벡터장은 모두 같다고 가정해보자.

여기서 유량이라 함은, 벡터장이 물의 유속을 의미한다고 할 때 단위 시간동안 빠져나간 물의 총 양을 의미한다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq42.png">라는 시간동안 물이 빠져나간다고 했을 때 그 물의 양은 그림 3의 우측 그림에서 보는 평행육면체의 부피와 같다.

물이 빠져나가는 속도가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq43.png">이므로 경사면의 길이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq44.png">와 같고, 평행육면체의 높이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq45.png">를 법선벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq46.png">에 내적해줌으로써 얻을 수 있다.

따라서, 물이 시간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq47.png"> 동안 빠져나간 총 양은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq48.png"> </p>

이며, 단위시간동안 빠져나간 물의 양은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq49.png"> </p>

이다.

이 단위 시간동안 빠져나간 물의 총 양을 모든 곡면에 대해 [중적분](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)해주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq50.png"> </p>

가 되며 이것은 식 (1)의 면적분과 동일하다.

따라서, 면적분이 의미하는 것은 곡면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-21-surface_integral/eq51.png">를 따라 빠져나간 유량(flux)의 총 양을 의미한다고 할 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/DqUIcWUGCoA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
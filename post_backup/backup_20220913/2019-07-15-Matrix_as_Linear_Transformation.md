---
title: 행렬과 선형변환
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190715
tags: 선형대수
---


## 행렬은 선형 변환이다.

임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq1.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq2.png">와 스칼라 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq3.png"> 에 대하여 변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq4.png"> 가 다음의 두 조건을 만족한다면 이 변환 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq5.png"> 는 선형변환이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq6.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq7.png"> </p>

따라서, 위의 선형 변환의 성질에 따라, 임의의 벡터

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq8.png"> </p>

에 대해 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq9.png"> </p>

-----

여기서 눈여겨 볼 점은, 원래의 기저 벡터 두 개를 아래와 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq10.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq11.png"> 라 하고,


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq12.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq13.png"> </p>



새로운 기저 벡터를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq14.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq15.png"> 라 했을 때,


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq16.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq17.png"> </p>



<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq18.png"> 가 선형변환이라면, 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq19.png"> 는 선형 변환 후에

새로운 기저 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq20.png"> 와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq21.png"> 의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq22.png"> 배와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq23.png"> 배의 합으로 표현되어야 한다는 것이다.

-----


예를 들어, 행렬

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq24.png"> </p>

 를 이용해 벡터

 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq25.png"> </p>

 를 변환시켜 보면,


 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq26.png"> </p>


 임을 알 수 있는데, 아래의 영상에서 처럼 이 값은 새로운 두 기저벡터의 1배와 1배의 합으로
 표현될 수 있다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/transformation1/" width="650" height = "520" frameborder="0"></iframe></p>


위 애플릿의 슬라이드를 가장 오른쪽으로 옮겼을 때의 결과는 다음과 같은데, 

<p align = "center">
  <img width ="600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/matrix_as_a_transformation/pic1.png">
</p>

이를 보면 선형 변환의 결과로써의 빨간 점은 원래 기저 벡터의 -1, 2 배로 표현되었지만,

선형 변환 이후의 새로운 기저 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq27.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq28.png">에 대해서는 각각 1,1 배로 표현되는
것을 알 수 있다.


일반적으로, 선형대수학의 기본 정리에 따르면 벡터 공간의 선형 변환과 행렬은 본질적으로 같다.

## 여러 선형 변환의 시각적 예시



위 영상 및 그림에서 또 한가지 눈여겨 볼 점은 선형 변환이라는 것은 기하학적으로 표현하자면, 격자들이 변환 후에도

선의 형태이고, 격자 간의 간격도 균등하게 넓어야 한다는 것이다.

여러가지 선형 변환(즉, 행렬)을 기하학적으로 시각화 하였으니,

이를 확인해봄으로써 격자들이 변환 후에도 선의 형태를 유지하면서도, 격자 간의 간격이 균등하게 넓은지 확인해보자.


-----


### shearing

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq29.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/shear/" width="325" height = "260" frameborder="0"></iframe></p>


### rotation

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq30.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/rotation/" width="325" height = "260" frameborder="0"></iframe></p>

### permutation

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq31.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/permutation/" width="325" height = "260" frameborder="0"></iframe></p>


### projection on x-axis

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq32.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/projection_on_x/" width="325" height = "260" frameborder="0"></iframe></p>

### projection on a vector <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq33.png">

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2019-07-15-Matrix_as_Linear_Transformation/eq34.png"> </p>

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/projection_on_vector/" width="325" height = "260" frameborder="0"></iframe></p>

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/euMsKPfj_Ss" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

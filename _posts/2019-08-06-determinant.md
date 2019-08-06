---
title: 행렬식의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190806
tags: 선형대수
---
<style>
  @media screen and (max-width:500px){
    iframe {
        width: 100vw; 
        height: 110vw;
        background:white;  
    }
    .my_iframe {
        width: 100vw;
        height: 120vw;
        background: white;
    }
    .iframe_picApplet {
        width: 520px;
        height: 545px;
        background: white;
    }
  }

  @media screen and (min-width:500px){
    iframe {
        width: 40vw; 
        height: 40vw;
        background:white;  
    }
    .my_iframe {
        width: 35vw;
        height: 43.75vw;
        background: white;
    }
    .iframe_picApplet {
        width: 520px;
        height: 545px;
        background: white;
    }
  }
</style>

<p align="center">
  <iframe src = "https://angeloyeo.github.io/p5/2019-08-06-preview_determinant/" frameborder = "0">
  <br>
  행렬식이 의미하는 것: 선형변환 될 때 단위 면적이 얼마만큼 늘어나는가?
</p>
# 행렬식

역행렬을 구할 때 사용되는 행렬식(determinant)는 $2\times 2$ 행렬에서 다음과 같이 정의된다.


| DEFINITION 1. 행렬식 |
| --------- |
| 행렬 <br><center>$\begin{pmatrix}a& b \\ c & d \end{pmatrix}$</center><br>에 대하여 <br><center>$det(a) = ad-bd$ </center><br>로 정의된다.|


또, 역행렬은 다음과 같이 정의된다.

| DEFINITION 2. 2 x 2 행렬의 역행렬 |
| --------- |
| 행렬 <br><center>$A=\begin{pmatrix} a& b \\ c & d \\\end{pmatrix}$</center><br><br>에 대하여 <br> <center> $A^-1 = \frac{1}{det(A)} \begin{pmatrix}d& -b \\ -c & a \end{pmatrix}$</center><br><br>로 정의된다.|


대수적으로 $AA^{-1} = A^{-1}A = I$는 라는 것을 보일 수는 있지만, 선형 대수학을 너머 행렬을 사용하는 수많은 수학 분야에서 행렬식은 등장한다. 특히 기하학에서 행렬식은 그 역할을 톡톡히 하는데 과연 행렬의 행렬식은 기하학적으로는 어떤 의미를 가지고 있는 것일까?

# $2\times 2$ 행렬의 행렬식은 두 벡터가 이루고 있는 평행사변형의 넓이

임의의 행렬 

$$A=\begin{pmatrix} a& b \\ c & d \\end{pmatrix}$$

에 대하여, 이 행렬은 두 벡터를 한꺼번에 표현한 것이라고 해보도록 하자. 이 때, 두 벡터 $\vec{u}=(a,c)$와 $\vec{v}=(b,d)$를 생각해보자. 임의의 벡터 $\vec{u}$와 $\vec{v}$는 좌표평면상에 그림 1과 같이 그릴 수도 있다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-06_determinant/pic1.png">
</p>

 이 때, 그림 2에서 설명하듯 두 벡터를 통해 만든 평행사변형 AVOU의 넓이는 $det(A)$이다. 평행사변형 AVOU의 넓이는 삼각형 VOU의 넓이의 두배 값을 가진다. 그러므로 삼각형 VOU의 넓이를 구한 뒤, 두배를 해주면 평행사변형 AVOU의 넓이를 구할 수 있다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-06_determinant/pic2.png">
</p>

 삼각형 VOU의 넓이는 사각형 PORQ에서 삼각형 POV, UOR, VUQ의 넓이를 빼준 빗금친 부분의 넓이와 같다.
 그러므로, 

$$◇AVOU = $$

$$=2\times\left\{□PORQ - △POV - △UOR - △VUQ\right\}$$

$$=2\times \left\{ad-\frac{1}{2}bd -\frac{1}{2}ac - \frac{1}{2}(a-b)(d-c)\right\}$$

$$=2\times\left\{
  ad-\frac{1}{2}bd-\frac{1}{2}ac-\frac{1}{2}(ad-bd-ac+bd)
  \right\}
  $$

$$=2\times\left\{\frac{1}{2}ad-\frac{1}{2}bc\right\}$$

$$=ad-bc = det(A)$$

# 행렬식과 역행렬의 기하학적 관계

행렬식이 평행사변형의 넓이를 의미한다는 것을 통해서 행렬식 자체 역시도 평행사변형 형태와 연관되어서 기하학적인 의미를 갖는 다는 것 또한 알 수 있다.
 일반적으로  $2\times 2$행렬은 2차원 공간에서 선형 변환을 의미한다. 일반적으로는  $n\times n$행렬은 n차원 공간에서의 선형 변환을 의미하게 된다. 그림 3에서 확인할 수 있듯이 행렬식은 기하학적으로는 선형 변환을 의미한다.

![](https://wikidocs.net/images/page/4049/20160201_102919.png)

# 행렬과 역행렬, 그리고 행렬식의 기하학적 관계

 3에서 행렬은 기하학적으로는 선형 변환을 의미한다고 하였다. 이러한 의미에서 역행렬도 하나의 행렬로 취급하는 것이기 때문에 역행렬 또한 기존의 행렬과 연관되어 있는 선형 변환을 의미한다.

 기하학적으로 봤을 때, 역행렬은 원래 행렬을 이용한 선형변환의 역-선형변환이라고 할 수 있다. 다시 말하자면, 위 설명의 행렬을 통한 선형 변환은 한 변의 길이가 1인 정사각형을 넓이가 ad-bc인 평행사변형꼴로 바꾼 선형변환이며, 같은 행렬의 역행렬은 평행사변형 꼴로 바뀐 도형을 다시 한 변의 길이가 1인 정사각형으로 되돌려주는 역-선행변환이다.

 그러므로, 역행렬에서는 <img src="http://bit.ly/1NKvz6b">의 요소가 들어가게 되는 것이다.

* 원래 행렬에 역행렬을 곱해서 identity matrix가 되는 과정은 생략.

<center><iframe width="420" height="315" src="https://www.youtube.com/embed/EI1btogsxZA" frameborder="0" allowfullscreen></iframe></center>







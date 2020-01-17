---
title: 그린정리
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200118
tags: 미적분학
---

# 부제 : Curl을 통한 그린 정리의 직관적 이해


그린 정리는 평면에서의 이중 적분과, 그 영역의 경계선에서의 선적분 사이의 관계에 대한 정리이다. 스토크스 정리 (Stoke’s theorem)의 특수한 경우이다.

그린 정리는 curl의 의미로부터 그 직관적 의미를 파악할 수 있다. Curl과 divergence는 모두 벡터장 위에서 파악되는 것임을 다시 생각해두자.

다음과 같이 어떤 벡터장 위에 넓이를 갖는 영역 R이 있다고 하자.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-18-Green_theorem/pic1.png"> <br>
  그림 1 xy 평면 위에 임의의 벡터장 $f$와 폐곡선 C가 있다.
</p>

벡터장 $\vec{f}$를

$$\vec{f}(x,y) = P(x,y)\hat{i}+Q(x,y)\hat{j}$$


라고 하면, 그린 정리에 의해 다음이 성립한다.

$$\oint_C\vec{f}\cdot d\vec{r} 

= \iint_R\left(\frac{\partial P}{\partial y}-\frac{\partial Q}{\partial x}\right)dA$$


식 (2)의 좌변은 curve C를 따라 벡터장 에 대해 선적분 한 것이다. 

선적분 값은 curve를 따라 벡터장이 curve를 따라 CCW로 흐르면 양의 값이 나올 것이고 curve를 따라 벡터장이 대부분 CW로 흐르면 음의 값이 나온다.

이제 식 (2)의 좌변으로부터 식 (2)의 우변을 유도해보자. 영역 R을 아래와 같이 반으로 쪼개서 보도록 하자.


<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-18-Green_theorem/pic2.png"> <br>
  그림 2 영역 R을 이등분 해보자. 세로로 쪼개든 가로로 쪼개든 어떻게 쪼개도 상관없다.
</p>


그럼 $R_1$영역의 폐곡선을 $C_1$, $R_2$영역의 폐곡선을 $C_2$라고 해보자. 그러면 다음이 성립한다.

$$\oint_{C_1}\vec{f}\cdot d\vec{r} + \oint_{C_2}\vec{f}\cdot d\vec{r} = \oint_{C}\vec{f}\cdot d\vec{r}$$

왜 그런가? $R_1$과 $R_2$사이의 boundary 에서는 $C_1$에서 구하게 되는 선적분과 $C_2$에서 구하게 되는 선적분의 값이 상쇄되기 때문이다. 

그것은 선적분은 기본적으로 벡터장이 얼마나 CCW 방향으로 닮았는지 확인하는 것이기 때문이다.

이제 $R$을 아래와 같이 사등분 해보자.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-18-Green_theorem/pic3.png"> <br>
  그림 3 영역 R을 4등분했다. 어떤 모양으로 쪼개든지 큰 상관은 없다만 편하게 생각하기 위해 위와 같이 쪼개보자.
</p>


앞에서와 같은 논리로 다음이 성립한다.


$$\oint_{C_1}\vec{f}\cdot d\vec{r} 

+ \oint_{C_2}\vec{f}\cdot d\vec{r} 

+ \oint_{C_3}\vec{f}\cdot d\vec{r} 

+ \oint_{C_4}\vec{f}\cdot d\vec{r} = \oint_{C}\vec{f}\cdot d\vec{r}$$

--

그렇다면 영역 R을 N등분하면 어떻게 될까? 다음의 식을 성립시킬 수 있다.

$$\sum_{k=1}^{N}\oint_{C_k}\vec{f}\cdot d\vec{r} = \oint_{C}\vec{f}\cdot d\vec{r}$$

이제 식 (5)에 대해 고민해보기 위해 영역 $R$을 N 개로 쪼갰을 때, 임의의 $k$ 번째 영역에 대해 잠시 고려해보자.

<p align="center">
  <img width="500" src="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-01-18-Green_theorem/pic4.png"> <br>
  그림 4 영역 R을 N개로 나누었다고 했을 때 k 번째 영역 $R_k$.
</p>


Curl 편에서 확인했듯이 curl은 단위 영역이 받는 회전력이다. 

그렇다면 $N\rightarrow \infty$일 때 이 $R_k$영역은 미소 영역으로 생각할 수 있을 것이다. 

그러면 넓이가 $\|R_k\|$인 영역 $R_k$의 회전량은 얼마인가?


그것은 

$$\text{2d-curl}\left\{F(x_k,y_k)\right\}|R_k|$$


가 된다.


즉, 이것은 

$$\oint_{C_k}\vec{f}\cdot d\vec{r}$$


과 같은 의미를 갖는다. 왜냐하면 회전에 관여하는 벡터만 고려하여 선적분 해주는 것이 curl을 생각하는 방법이었기 때문이다.

(바로 이해되지 않는다면 curl 편을 보기를 강력 추천한다.)

따라서 식 (5)는 다음과 같이 고려해줄 수 있다.

$$식(5) \Rightarrow \oint_C\vec{f}\cdot d\vec{r}=\sum_{k=1}^{N}\oint_{C_k}\vec{f}\cdot d\vec{r}\approx \sum_{k=1}^{N}\text{2d-curl}\left\{F(x_k, y_k)\right\}|R_k|$$

이 때 $N$을 무한하게 크게 만들면 $\|R_k\|\rightarrow dA$가 되고,


따라서,

$$\oint_C\vec{f}\cdot d\vec{r} = \iint_R\text{2d-curl}\left\{\vec{f}\right\}dA 

= \iint_R\left(\frac{\partial P}{\partial y} - \frac{\partial Q}{\partial x}\right)dA$$

가 된다.

<center>

<iframe width="560" height="315" src="https://www.youtube.com/embed/yGTnjLLxQSM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>
---
title: 고유값과 고유벡터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190717
tags: 선형대수
---


<p align="center"><iframe  src="https://angeloyeo.github.io/p5/eigshow/" width="520" height = "520" frameborder="0"></iframe>
<br>
<b>
고유벡터와 고유값이 물어보는 것:
<br>
“벡터 x에 어떠한 선형변환 A를 했을 때, 그 크기만 변하고 원래 벡터에 평행하게 변하는 벡터 x는 무엇인가요?”
<br>
“그렇다면, 그 크기는 얼마만큼 변했나요?”
</b>
</p>


# 벡터에 행렬 연산을 취해준다는 것은?

행렬은 선형 변환 연산이다. '선형'이라는 말이 어렵게 들릴 수 있으니, 일단 변환이라고 하자. 무엇을 변환시켜 준 것일까? 행렬은 벡터를 변환시켜 준다[^1].

# 고유값, 고유벡터의 정의

먼저, eigenvalues와 eigenvectors를 설명하기 가장 성의없지만 완벽하고, 가장 간단한 방법으로 수학적 정의로부터 설명을 시작해보도록 하자.


| DEFINITION 1. 고유값, 고유벡터 |
| --------- |
| <center>임의의 $n\times n$ 행렬 $A$ 에 대하여, 0이 아닌 솔루션 벡터 $k$ 가 존재한다면 숫자 $\lambda$ 는 행렬 $A$ 의 eigenvalue라고 할 수 있다.<br>$$Ak=\lambda k$$<br>이 때, 솔루션 벡터 $k$ 는 eigenvalue $\lambda$ 에 대응하는 eigenvector이다.</center>|


이 때, 식 (1)은 행렬의 성질에 의해서 다음과 같이 바꿀 수 있다.

$$(A-\lambda I)k=0$$

이 때, $I$ 는 identity matrix이다.

그리고 벡터 $k=[k_1,k_2,\cdots,k_n]^T$ 에 대해 벡터 $k$ 가 nontrivial solution을 가지기 위한 필요충분 조건은 

$$det(A-\lambda I)=0$$

이다.

# 고유값과 고유벡터의 의미

고유값과 고유벡터의 숨겨진 의미를 이해하기 위해선 기하학적인 방법을 동원하는 것이 가장 좋은 방법이라고 할 수 있겠다. 

Definition 1에서의 내용들을 기하학적인 실수 2차원 평면으로 옮겨보도록 하자. 

$\lambda$ 와 벡터 $k$ 는 직교 좌표계에서 쉽게 옮길 수 있을 것이라고 생각된다. 즉, 식 (1)의 우항부터 그 기하학적 의미에 대해 생각해보자. 아래의 그림 1을 보게 되면 어떠한 0이 아닌 벡터 $x$에 대해서, $\lambda$ 배만큼 크기가 커진 경우라고 할 수 있다. ($x\rightarrow \lambda x$). 벡터에 대해 공부했다면 기초적인 내용이다. 

![](https://wikidocs.net/images/page/4050/20160201_104311.png)

그렇다면 식 (1)의 좌항은 어떻게 해석해야 할까? 식 (1)의 좌항을 이해하기 위해선 평면상에서 행렬은 기하학적으로 선형변환을 의미한다는 것을 알아야 한다. 선형 변환이란 무엇인지에 대해서는 엄밀한 수학적 정의보다는 예시들을 통해서 감각적으로 받아들이는 것이 좋을 것 같다. 

![](https://wikidocs.net/images/page/4050/20160201_104416.png)

Wikipedia에 있는 선형 변환의 예시는 그림 2와 같다. 즉, 고유값과 고유벡터 다음과 같은 의미를 가지고 있다.



“어떠한 선형변환 A를 했을 때, 그 크기만 변하고 방향이 변하지 않는 벡터가 있나요?”

“그렇다면, 그 벡터의 크기는 얼마만큼 변했나요?”




# 3. 예시를 통한 Eigenvector와 Eigenvalue, 그리고 선형 변환에 대한 간략한 이해

다음과 같은 행렬 A를 생각해보자.



![](https://wikidocs.net/images/page/4050/20160201_114243.png)



이 행렬에 대해 고유값과 Eigenvector를 구해보도록 하자.

정의에 따라, eigenvalue $\lambda$와 eigenvector $k$는 다음과 같은 식을 만족한다.

<img src="http://bit.ly/1QRAN6t">

그러므로, 행렬의 성질에 의해 $(A-\lambda I)k=0$이다. 또한, 벡터 $k$가 nontrivial solution을 갖기 위해서는 다음이 만족해야 한다. 

<img src="http://bit.ly/1VAuYcN">

그러므로,


<img src="http://bit.ly/1QRAXLb">

<img src="http://bit.ly/1QRB2hV">



그러므로, $\lambda_1=1$, $\lambda_2=3$이다.

즉, 선형변환 $A$의 Eigenvalue는 1과 3이다. 바꿔 말하면, 선형 변환을 했을 때 그 크기는 변하고 방향이 변하지 않는 벡터가 있다고 할 때, 그 벡터의 크기는 각각 1배와 3배가 된다는 의미이다. 이제, Eigenvector를 찾아보도록 하자.

 다시 한번 식 (1)은 eigenvalue $\lambda_1=1$, $\lambda_2=3$에 대해서 모두 만족해야 한다. 그러므로, $\lambda_1=1$인 경우에 대해,


<img src="http://bit.ly/1VAvnMx">



를 만족해야 하며, $2v_1+v_2=v_1$과 $v_1+2v_2=v_2$를 만족해야 한다. 그러므로, $\lambda_1$에 대한 고유벡터 <img src="http://bit.ly/1QRBk8s">이다. $\lambda_2=3$인 경우의 eigenvector를 구하면 <img src="http://bit.ly/1QRBm00">이다.

 그러므로 기하학적으로 이것을 다시 설명하면, <img src="http://bit.ly/1VAvHL5"> 벡터는 선형변환 <img src="http://bit.ly/1QRBuwB">를 취해주면 그 방향은 변하지 않고, 크기가 3배가 된다. 또, <img src="http://bit.ly/1VAvR5h"> 벡터는 선형변환 <img src="http://bit.ly/1QRBuwB">를 취해주게 되면 그 방향은 변하지 않고 크기는 1배가 된다는 의미이다.

 그림 3과 그림4를 보게 되면, 선형변환 <img src="http://bit.ly/1QRBuwB">는 그림 3을 그림 4와 같이 변형시켜주는 선형변환이다. 


![](https://wikidocs.net/images/page/4050/20160201_113644.png)

![](https://wikidocs.net/images/page/4050/20160201_113713.png)

![](https://upload.wikimedia.org/wikipedia/commons/0/06/Eigenvectors.gif)


이 때, 우리가 구한 $w$벡터는 그림 3에서 파란색 벡터에 해당되고, $v$벡터는 그림 3에서 magenta색 벡터에 해당된다. 

다시 한번 그림 4를 보게 되면 그림 3에서의 파란색 벡터가 그 크기는 증가했지만 방향이 변하지 않았다는 것을 알 수 있고, 마찬가지로 magenta 색 벡터 역시 그 크기는 증가(이 때의 경우는 1배로 증가했다고 할 수 있겠다.)했지만 그 방향은 유지하고 있다는 것을 알 수 있다. 또한 빨간색 벡터들은 그 크기와 방향이 모두 바뀌기 때문에 eigenvector가 아니라는 사실 역시도 알 수 있다.

#4. 선형변환과 고유벡터의 확장적 의미

그렇다면 선형변환과 eigenvector간의 관계는 어떻게 그 의미를 확장할 수 있을까? 사실 이 문제에 대한 해답은 eigenvector가 연구되기 시작한 목적이었다. 위키피다아[^2]에 따르면 고유벡터 강체(rigid body)의 회전에 관한 연구를 하던 중 발견되었다고 한다. 즉, 회전에 대한 주축(principal axis)을 찾는 문제에서 시작되었다고 한다. 

이 문제는 18세기 Euler로부터 시작되었고, 그 후 Lagrange와 Fourier가 이론을 발전시켰으며, Cauchy가 수학적인 이론을 선형대수학적으로 확립시킨 것 같다. 

이러한 관점으로 봤을 때, 기본적으로 고유벡터 선형 변환에 대한 주축을 찾는 문제를 해결할 수 있게 해줄 것이다. 주축(principal axis)을 찾는 문제는 PCA등의 분석법에서 굉장히 중요한 issue가 되게 된다.  또한, eigen-시리즈는 더 나아가서 양자역학에서 굉장히 중요한 역할을 한다고 한다.

$<iframe width="420" height="315" src="https://www.youtube.com/embed/Nvc7ZRVjciM" frameborder="0" $allowfullscreen></iframe>

[^1]: 일반적으로는 벡터공간에 대한 변환 연산이라고 할 수 있다.

[^2]: https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors

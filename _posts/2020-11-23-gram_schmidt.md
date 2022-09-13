---
title: QR 분해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201123
tags: 선형대수
---

※ 시각화와 이해의 편의를 도모하기 위해 벡터와 행렬이 정의되는 체(field)는 실수(real number)로 한정함.

# Prerequisites

본 post를 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* 벡터의 정사영

# 배경 지식

## 벡터의 정사영

우리는 중고등학교 수학에서 벡터의 정사영에 대해 배운 적이 있다.

정사영의 개념이 성립하기 위해선 두 개의 벡터가 필요하다.

아래의 그림에서는 벡터 $a$와 벡터 $b$ 사이의 관계에 대해 표현하고 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic1.png">
  <br>
  그림 1. 두 벡터 중 하나의 벡터에 대해, 또 다른 벡터로 향하는 방향으로의 컴포넌트는 코사인 값을 이용해 표현할 수 있다.
</p>

가령, 그림 1에서 처럼 벡터 $\vec{b}$를 표현할 때 벡터 $\vec{a}$를 이용한다고 하면 벡터 $\vec{b}$의 $\vec{a}$ 방향의 컴포넌트는 두 벡터 사이의 사잇각을 이용해서 다음과 같이 표현할 수 있다.

$$\text{comp}_{\vec{a}}\vec{b}=|\vec{b}|\cos\theta$$

한편, 두 벡터 간의 내적은 다음과 같은데,

$$\vec{a}\cdot\vec{b} = |\vec{a}||\vec{b}|\cos\theta$$

여기서 $\|\vec{b}\|\cos\theta$의 값은 다음과도 같이 표현할 수 있다는 것을 확인할 수 있다.

$$|\vec{b}|\cos\theta = \frac{\vec{a}\cdot\vec{b}}{|\vec{a}|}=\text{comp}_{\vec{a}}\vec{b}$$

[//]:# (식 3)

한편 $\text{comp}_{\vec{a}}\vec{b}$는 스칼라 값이다. $\|\vec{b}\|$나 $\cos\theta$ 모두 스칼라 값인것을 보아도 그렇다는 사실을 알 수 있다.

만약 우리가 $\vec{b}$의 $\vec{a}$ 방향 컴포넌트를 구하되, 스칼라가 아니라 벡터 값을 얻고 싶다면 어떻게 하는게 좋을까?

바로 $\text{comp}_{\vec{a}}\vec{b}$ 뒤에 $\vec{a}$ 방향으로의 단위 벡터만을 곱해주면 된다.

만약 $\vec{b}$의 $\vec{a}$ 방향으로의 정사영 벡터를 $\text{proj}_{\vec{a}}\vec{b}$라고 한다면, 그 값은 다음과 같다.

$$\text{proj}_{\vec{a}}\vec{b} = \text{comp}_{\vec{a}}\vec{b} \cdot \frac{\vec{a}}{|\vec{a}|} = |\vec{b}|\cos\theta\cdot \frac{\vec{a}}{|\vec{a}|}$$

한편, 식 (3)에 의해서,

$$\Rightarrow \text{proj}_{\vec{a}}\vec{b}=\frac{\vec{a}\cdot\vec{b}}{|\vec{a}|}\cdot \frac{\vec{a}}{|\vec{a}|}$$

$$=\frac{\vec{a}\cdot\vec{b}}{|\vec{a}|^2}\vec{a}=\frac{\vec{a}\cdot\vec{b}}{\vec{a}\cdot\vec{a}}\vec{a}$$

와 같다는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic2.png">
  <br>
  그림 2. 두 벡터 중 하나의 벡터에 대해, 또 다른 벡터로 향하는 방향으로의 컴포넌트는 코사인 값을 이용해 표현할 수 있다.
</p>

# Gram-Schmidt 과정

[//]:# (그람-슈미트 과정에 대해 소개할 때 미리 주어진 벡터셋 a1~a_n에 대해 다시 차근히 소개할 것)

## Gram-Schmidt 과정의 목표 의식

Gram-Schmidt 과정이 수행해주는 일은 기본적으로 다음과 같다.

"linearly independent한 벡터들이 주어졌을 때 이들을 적절히 변형하여 orthogonal basis로 만들어주자"

그림을 곁들여 설명하면 이런 내용이라고 할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic3.png">
  <br>
  그림 3. Gram-Schmidt 과정은 왼쪽 그림과 같이 주어진 두 개의 벡터를 오른쪽 그림과 같이 직교하는 두 벡터로 변형시키는 과정이다.
</p>

직교하는 벡터셋을 얻게 되면 여러가지로 편리한 점이 많지만 특히 중요한 것은 직교하지 않는 기저에 비해 직교하는 기저를 얻게 되면 얻는 이점이 있기 때문이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic4.png">
  <br>
  그림 4. 왼쪽: 직교하지 않는 기저를 이용해 생성한 벡터 공간. 오른쪽: 직교하는 기저를 이용해 생성한 벡터 공간
</p>

만약 선형독립인 두 벡터 $\lbrace v_1, v_2 \rbrace$가 2차원 실수 공간 상의 기저라고 해보자. 이 때, 두 벡터는 서로 직교하지 않아도 된다. 

그렇다면, 2차원 실수 공간 안에 있는 임의의 벡터 $v\in \Bbb{R}^2$는 $v_1$과 $v_2$의 선형 결합으로 표현될 수 있다. 다시 말해,

$$v = x_1v_1 + x_2 v_2 \text{ where } x_1, x_2 \in \Bbb{R}$$

와 같이 $v_1$과 $v_2$를 이용해 $v$를 표현할 수 있게 된다.

그런데, 만약 두 벡터 $\lbrace w_1, w_2\rbrace$가 2차원 실수 공간 상의 직교하는 기저라고 한다면, 2차원 실수 공간 상에 있는 임의의 벡터 $v \in \Bbb{R}^2$는 다음과 같이 쓸 수 있게 된다.

$$v = (v\cdot w_1)w_1 + (v\cdot w_2)w_2$$

이로써 $v$를 $v_1$과 $v_2$의 선형결합으로 표현하기 위한 계수를 쉽게 얻을 수 있게 된다.

## Gram-Schmidt 과정의 프로세스

<p align = "center">
  <img src = "https://upload.wikimedia.org/wikipedia/commons/e/ee/Gram-Schmidt_orthonormalization_process.gif">
  <br>
  그림 4. Gram-Schmidt 직교화 과정을 표현한 animation
  <br>
  <a href = "https://ko.wikipedia.org/wiki/%EA%B7%B8%EB%9E%8C-%EC%8A%88%EB%AF%B8%ED%8A%B8_%EA%B3%BC%EC%A0%95"> 출처: 위키피디아, 그람-슈미트 과정</a>
</p>

Gram-schmidt 직교화 과정을 수식으로 표현하면 아래와 같다.

벡터 공간 $V$상에서 주어진 일차 독립인 벡터 $a_1, \cdots, a_k$를 이용하여 다음과 같이 정규직교기저를 구할 수 있다.

$$u_1 = a_1$$

$$u_2 = a_2 - \text{proj}_{u_1}(a_2)$$

$$u_3 = a_3 - \text{proj}_{u_1}(a_3) - \text{proj}_{u_2}(a_3)$$

$$\vdots \notag$$

$$u_k = a_k -\sum_{j=1}^{k-1}\text{proj}_{u_j}(a_k)$$

이렇게 생성한 벡터의 집합 $\lbrace u_1, u_2, \cdots, u_k \rbrace$는 직교적인데, 여기서 각각의 벡터들의 크기(norm)로 나누어주어 정규직교화 시키자.

즉, 

$$q_i = \frac{u_i}{||u_i||}$$

로 정의하면 벡터 공간 $V$의 정규 직교 기저 $\lbrace q_1, q_2, \cdots, q_k \rbrace$를 얻을 수 있다.

수식으로 쓰면 조금 어려워 보이지만, 수식의 본질적인 의미는 아래와 같다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic5.png">
  <br>
  그림 5. 그람 슈미트 과정의 수식이 말해주는 것
</p>

서로 직교하는 벡터를 구성해내기 위해서는 각각이 차지하고 있는 성분만큼을 빼주어야 한다는 말이다.

다시 한번 그림으로 보면 아래의 그림 6과 같다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic6.png">
  <br>
  그림 6. 그람 슈미트 과정의 기본 원리
</p>

그람-슈미트 과정은 이런 방식으로 iterative하게 주어진 벡터 집합에 대한 새로운 정규직교기저 벡터를 찾아낼 수 있게 해준다.

# QR 분해

QR 분해는 그람-슈미트 과정을 이용해 찾아낸 정규직교기저 벡터를 이용해 행렬을 분해하는 과정이다.

그람-슈미트 과정을 통해 얻어낸 정규직교기저를 $q_1, \cdots, q_n$이라고 하고 이들을 모아둔 행렬을 $Q$라고 하면 다음이 성립한다.

$$A = QR$$

$$\begin{bmatrix}
  | & | & \text{ } & | \\ 
  a_1 & a_2 &\cdots & a_n \\ 
  | & | & \text{ } & | \end{bmatrix} =
  \begin{bmatrix}
  | & | & \text{ } & | \\ 
  q_1 & q_2 &\cdots & q_n \\ 
  | & | & \text{ } & | \end{bmatrix}
  \begin{bmatrix}
  a_1\cdot q_1 & a_2\cdot q_1 & \cdots & a_n\cdot q_1 \\
  a_1\cdot q_2 & a_2\cdot q_2 & \cdots & a_n\cdot q_2 \\
  \vdots & \vdots & \ddots & \vdots \\
  a_1\cdot q_n & a_2\cdot q_n & \cdots & a_n\cdot q_n \\
  \end{bmatrix}$$

여기서 $a_1\cdot q_2$를 생각해보면 $q_2$는 $a_1$ 혹은 $q_1$의 성분이 모두 제거되었기 대문에 값이 0이다.

마찬가지 이유로 $a_i\cdot q_j$에 대해 $i\lt j$인 경우 $a_i\cdot q_j=0$이다. 

왜냐면 $j$ 번째 정규직교기저 $q_j$에서는 $a_i \text{ where } i\lt j$의 성분들을 모두 다 빼버렸기 때문이다.

따라서 아래의 식이 성립한다.

$$=\begin{bmatrix}
  | & | & \text{ } & | \\ 
  q_1 & q_2 &\cdots & q_n \\ 
  | & | & \text{ } & | \end{bmatrix}
  \begin{bmatrix}
  a_1\cdot q_1 & a_2\cdot q_1 & \cdots & a_n\cdot q_1 \\
  0 & a_2\cdot q_2 & \cdots & a_n\cdot q_2 \\
  \vdots & \vdots & \ddots & \vdots \\
  0 & 0 & \cdots & a_n\cdot q_n \\
  \end{bmatrix}$$

이것을 QR 분해라고 부른다.

# 예제 문제

QR 분해에 대해서 글로만 설명하는 것을 보면 이해하기 어려울 수 있기 때문에 아래의 예시를 통해 그람-슈미트 정규화 과정과 QR 분해를 실습해보도록 하자.

문제. 아래의 행렬 $A$를 QR 분해 하시오.

$$A = \begin{bmatrix}1 & 1 & 0\\ 1 &  0 & 1 \\ 0 & 1 & 1 \end{bmatrix}$$

행렬 $A$의 각 열 벡터를 $a_1$, $a_2$, $a_3$이라고 하면 다음과 같다.

$$a_1 = \begin{bmatrix}1\\1\\0\end{bmatrix}, a_2 = \begin{bmatrix}1\\0\\1\end{bmatrix}, a_3 = \begin{bmatrix}0\\1\\1\end{bmatrix}$$

이 때, 각각의 열벡터들은 표기상의 편의를 위해 $a_1 = (1, 1, 0)$과 같이 쓰도록 하자.

QR분해를 하기 위해 세 벡터들에 대해 Gram-Schmidt process를 적용해보자.

여기서 정규화되지는 않고 직교화만 시킨 벡터들은 $u_1$, $u_2$ 등과 같이 쓰고, 정규직교화 된 벡터들은 $e_1$, $e_2$등과 같이 쓰도록 하자.

우선 $a_1$에 대하여, 

$$a_1 = (1, 1, 0)$$

Gram-Schmidt과정에 의하면 첫 번째 벡터는 그 벡터를 그대로 사용하면 된다.

$$u_1 = a_1=(1, 1, 0)$$

이제 $u_2$를 계산해보자. $u_2$는 $a_2$벡터에서 $u_1$ 방향으로의 성분을 제외해준 벡터이다.

$$u_2 = a_2 - \text{proj}_{u_1}a_2$$

$$=(1, 0, 1) - \left(\frac{u_1\cdot a_2}{u_1\cdot u_1}\right)u_1$$

$$=(1, 0, 1) - \frac{1\cdot1 + 1\cdot 0 + 0\cdot 1}{1^2+1^2+0^2}(1, 1, 0)$$

$$=\left(\frac{1}{2}, -\frac{1}{2}, 1\right)$$

또, $u_3$을 계산해보자. $u_3$은 $a_3$ 벡터에서 $u_1$ 방향으로의 성분과 $u_2$ 방향으로의 성분을 제외해준 벡터이다.

$$u_3 = a_3 - \text{proj}_{u_1}a_3 - \text{proj}_{u_2}a_3$$

$$=(0, 1, 1) - \left(\frac{u_1\cdot a_3}{u_1\cdot u_1}\right)u_1-\left(\frac{u_1\cdot a_3}{u_2\cdot u_2}\right)u_2$$

$$=(0, 1, 1) -\left(\frac{0+1+0}{1^2+1^2+0^2}\right)(1, 1, 0) - \left(\frac{(-1/2+1)}{1/4+1/4+1}\right)\left(\frac{1}{2}, -\frac{1}{2}, 1\right)$$

$$(0, 1, 1) - \frac{1}{2}(1, 1, 0) -\frac{1}{3}\left(\frac{1}{2}, -\frac{1}{2}, 1\right)$$

$$=\left(-\frac{2}{3},\frac{2}{3},\frac{2}{3}\right)$$

정리하면 $u_1$, $u_2$, $u_3$은 다음과 같다.

$$u_1 = (1, 1, 0), u_2 = \left(\frac{1}{2}, -\frac{1}{2}, 1\right), u_3 = \left(-\frac{2}{3},\frac{2}{3},\frac{2}{3}\right)$$

위의 세 벡터를 정규화하면 다음과 같다.

$$e_1 = \frac{u_1}{\|u_1\|}=\frac{1}{\sqrt{2}}(1, 1, 0)=\left(\frac{1}{\sqrt{2}},\frac{1}{\sqrt{2}}, 0\right)$$

$$e_2 = \frac{u_2}{\|u_2\|}=\sqrt{\frac{2}{3}}\left(\frac{1}{2},-\frac{1}{2}, 1\right)=\left(\frac{1}{\sqrt{6}},-\frac{1}{\sqrt{6}},\frac{2}{\sqrt{6}}\right)$$

$$e_3 = \frac{u_3}{\|u_3\|}=\frac{1}{\sqrt{3\cdot(2/3)^2}}\left(-\frac{2}{3},\frac{2}{3},\frac{2}{3}\right)=\left(-\frac{1}{\sqrt{3}}, \frac{1}{\sqrt{3}},\frac{1}{\sqrt{3}}\right)$$

따라서, $e_1$, $e_2$, $e_3$을 $A=QR$에서의 $q_1$, $q_2$, $q_3$에 대응시켜 생각하면 아래와 같이 QR 분해할 수 있다.

$$A = QR =\begin{bmatrix}
  1/\sqrt{2} & 1/\sqrt{6}  & -1/\sqrt{3} \\
  1/\sqrt{2} & -1/\sqrt{6} & 1/\sqrt{3} \\
  0          & 2/\sqrt{6}  & 1/\sqrt{3}\end{bmatrix}
\begin{bmatrix}
2/\sqrt{2} & 1/\sqrt{2} & 1/\sqrt{2} \\
0          & 3/\sqrt{6} & 1/\sqrt{6} \\
0          & 0          & 2/\sqrt{3}\end{bmatrix}$$
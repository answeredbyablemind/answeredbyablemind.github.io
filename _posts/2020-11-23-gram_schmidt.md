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

* [벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)
* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html)

# 배경 지식

## 기저의 변경

[벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html) 편에서는 벡터의 특성에 대해 잠깐 언급한 적이 있었다.

그 중 처음 두 가지는 '벡터란 화살표 같은 것'이라는 점과 '벡터란 숫자를 순서대로 나열한 것'이었다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-07-basic_vector_operation/pic1.png">
  <br>
  그림 1. 좌표계의 변화에 대해 불변하는 벡터의 기하학적 특성
</p>

그림 1을 통해서 알 수 있는 것은 하나의 벡터를 표현하기 위해 전혀 다른 좌표계를 이용해서 표현할 수 있다는 것이다.

또, 어떤 좌표계를 이용하면 벡터를 표현하는 숫자의 나열들이 간결한데 비해, 또 어떤 좌표계를 선택하면 숫자의 나열들이 복잡해진다.

그래서 우리는 적절한 좌표계를 선정함으로써 쉽게 데이터(즉, 벡터)를 다룰 수 있다.

또 한가지 그림을 보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-11-23-gram_schmidt/pic2.png">
  <br>
  그림 2. 직교 기저와 비직교 기저
  <br>
  <a href = "https://en.wikipedia.org/wiki/Vector_space"> 그림 출처: 위키피디아, Vector space </a>
</p>

위의 그림 2를 보면 동일한 벡터 $v$를 직교 좌표계와 비직교 좌표계를 이용해 표현하였다.

우리에게 익숙한 좌표계는 직교좌표계이다. 그 중에서도 정규 표준 기저를 기반으로 하는 좌표계를 이용할 때 가장 편하게 데이터를 표현할 수 있을 것이다.

그렇다면, 우리가 비직교 좌표계의 기저벡터(그림 2에서 $f_1$과 $f_2$)를 받았을 때 이를 이용해 직교 좌표계로 변환시킬 수 있다면 편리한 점들이 많이 있을 것이다.

[//]:# (위의 내용을 조금 더 풀어서 써줘야 함.)

## 직교 행렬

직교 행렬은 앞서 [고윳값 분해(EVD)](https://angeloyeo.github.io/2020/11/19/eigen_decomposition.html) 편에서 대각행렬의 고윳값 분해를 다룰 때 잠깐 언급된 적이 있었다.

직교 행렬은 다음과 같이 모든 열벡터의 크기는 1이면서 서로 다른 열벡터 간의 내적이 0인 행렬을 말한다.

다시 말해, 아래와 같은 행렬 $Q$에 대해서,

$$ Q = \begin{bmatrix}| & \text{ } & | \\ q_1 & \cdots & q_n \\ | & \text{ } & | \end{bmatrix}$$

[//]:# (식 1)

다음이 성립하여야 한다.

$$Q^TQ = \begin{bmatrix}- & q_1^T & - \\ \text{ } & \vdots & \text{ } \\ - & q_n^T & -\end{bmatrix}\begin{bmatrix}| & \text{ } & | \\ q_1 & \cdots & q_n \\ | & \text{ } & | \end{bmatrix} 

= \begin{bmatrix}1 & \cdots & 0 \\ \vdots & \ddots & \vdots \\ 0 & \cdots & 1 \end{bmatrix}$$

[//]:# (식 2)

조금 잘 생각해보면 $Q$의 모든 열의 크기는 1이기 때문에 $Q$의 모든 열들은 소로 "orthonormal" 함에도 불구하고,

orthonormal matrix라고 부르지는 않고 orthogonal matrix(직교 행렬)이라고 부른다.

또 여기서 만약 $Q$가 정방 행렬(square matrix)이면

$$Q^T = Q^{-1}$$

[//]:# (식 3)

이다.

## projection 행렬

앞서 [선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html) 편에서는 $Ax=b$라는 식으로 표현된 선형연립방정식을 풀 때, 식의 개수가 변수의 개수보다 많은 경우(즉 $A$의 행의 개수가 열의 개수보다 많을 때) 해를 구하는 방법에 대해 알아보았다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic5.png">
<br>
그림 3. 행렬 $A$의 열공간과 그 공간에 속하지 않는 벡터 $b$, 그리고, 벡터 $b$를 열공간에 정사영하여 얻은 벡터 $p$
</p>

[선형회귀(선형대수학의 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html) 편에서는 그림 3의 $p$ 벡터 보다는 행렬 $A$와 벡터 $e$의 관계에 대해 관심을 가졌지만, 이번에는 벡터 $p$에 좀 더 관심을 가져보자.

행렬 $A$의 행의 개수가 열의 개수보다 많은 경우 우리는 최적의 해를 다음과 같이 찾을 수 있었다.

$$\hat{x} = (A^T A)^{-1}A^Tb$$

[//]:# (식 4)

이 최적의 해 $\hat{x}$는 행렬 $A$의 열벡터들을 이용해 정사영 벡터 $p$를 계산할 수 있게 해주는 열벡터들의 조합비율이었다.

다시 말해,

$$\vec{p} = A\hat{x}$$

[//]:# (식 5)

이며, 식 (4)를 식 (5)에 대입하면

$$\vec{p} = A\hat{x} = A(A^TA)^{-1}A^Tb$$

[//]:# (식 6)

라고도 쓸 수 있게 된다.

다시 말해, 식 (6)에 따르면 벡터 $b$가 벡터 $p$로 변환된 것이며, 벡터 $b$ 앞에 곱해진 행렬의 역할은 벡터 $b$를 벡터 $p$로 선형변환 시켜준 것임을 알 수 있다. 이 때의 선형변환은 행렬 $A$의 열공간으로의 projection이다.

일반적으로, 임의의 벡터 $\vec{b}$를 $A$의 열공간으로 투영(projection)해주는 행렬은

$$\text{proj}_A = A(A^TA)^{-1}A^T$$

이다.

만약 $A$가 열벡터 하나라면 다음과 같이 쓸 수도 있을 것이다.

$$\text{proj}_a = \frac{aa^T}{a^Ta}$$


여기서 $aa^T$의 의미가 무엇인지 생각해보자.

사실 $aa^T$의 의미는 뒤에 정사영 당할 벡터를 더 적어놓고 보아야 의미를 찾을 수 있다.

가령, $b$ 벡터를 $a$ 벡터에 정사영 한다고 했을 때에는 다음과 같이 쓸 수 있다.

$$\text{proj}_ab=\frac{aa^T}{a^Ta}b$$

여기서 식을 조금 바꿔 생각해보면 다음과 같다.

$$\Rightarrow a\frac{a^Tb}{a^Ta}$$

즉, $aa^T$에 있던 $a^T$는 내적을 위한 연산자의 역할이라는 것이다. 이것은 원래의 $\text{proj}A=A(A^TA)^{-1}A^T$에서 맨 오른쪽에 있던 $A^T$가 뒤에 올 벡터에 곱해질 행렬인 것과 같은 역할인 것이다.

projection에 대해 예를 들어 다음과 같이 $b = (2,1)$이라는 벡터를 $a = (1,0)$이라는 x축 위의 단위 벡터에 정사영 한다고 생각해보면 다음과 같다.

$$\text{proj}_ab = \frac{a^Tb}{a^Ta}a = \frac{(1,0)\cdot(2,1)}{(1,0)\cdot (1,0)}(1,0) = 2\cdot(1, 0)=(2, 0)$$

# Gram-Schmidt 과정

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

$$A = \begin{bmatrix}3 & 2 &  4\\ 5 &  1 & 3 \\ 2 & 3 & 4 \end{bmatrix}$$
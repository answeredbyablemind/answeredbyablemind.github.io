---
title: 행렬 곱에 대한 새로운 이해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200908
tags: 선형대수
---

# 행렬이란 무엇인가?

행렬의 연산인 행렬의 곱에 대해 이야기 하기 전에 행렬이란 무엇인지 생각해보도록 하자.

우선 행렬은 다음과 같이 숫자를 써서 큰 괄호안에 모아둔 것임을 시각적으로 확인할 수 있다.

$$\begin{bmatrix}5 && 7 && 8\\ 3 && 10 && 8 \\7 && 1 && 2\end{bmatrix}$$

이 때 행렬은 행의 개수와 열의 개수가 꼭 같을 필요는 없고, 일반적인 경우에는 행렬 내의 모든 요소들이

숫자로 채워져 있어야 한다. 

(실제 필드에서는 데이터를 다루다보면 어떤 데이터는 기재되지 않은 것들도 있을 수도 있다.)

일반적으로 행렬은 대문자($A, B, C,\cdots$)로 표현하고 그 구성요소들은 소문자로 표현하는 것이 원칙이다.

예를 들어, $m\times n$ 행렬 $A$는 다음과 같이 표현할 수 있다.

$$A =
\begin{bmatrix}
  a_{11} && a_{12} && \cdots && a_{1n} \\
  a_{21} && a_{22} && \cdots && a_{2n} \\
  \vdots && \vdots && \ddots && \vdots \\
  a_{m1} && a_{m2} && \cdots && a_{mn}
\end{bmatrix}$$

## 1) 데이터를 모아둔 것

행렬을 왜 배우는지에 대해 물어보면, 고등학교 시절에는 "데이터를 모아둔거야"라는 답변을 들을 수 있었다.

이러한 관점은 데이터 사이언스의 관점에서 일리가 있다.

그럼 행렬에서 말하는 '데이터'라는 것은 무엇일까?

여기서 말하는 '데이터'는 하나의 특징(feature)을 여러번 관찰한 것을 의미하고, 하나의 특징을 여러번 관찰한 것은 보통 열벡터로 표시한다.

이러한 관점에서 행렬은 열벡터들을 좌우로 쌓아둔 것을 의미한다고 할 수 있다.

$$A = 
\begin{bmatrix}
\begin{bmatrix}a_{11} \\ a_{21}\\ \vdots \\ a_{m2}\end{bmatrix} &
\begin{bmatrix}a_{12} \\ a_{22}\\ \vdots \\ a_{m2}\end{bmatrix} &
\cdots &
\begin{bmatrix}a_{1n} \\ a_{2n}\\ \vdots \\ a_{mn}\end{bmatrix}
\end{bmatrix}$$

가령, 5명의 사람으로부터 키와 몸무게의 데이터를 획득했다고 하고 이를 행렬로 표현한다고 하면 다음과 같이 정리하는 것이 일반적이다.

$$D = \begin{bmatrix} 170 && 70 \\ 150 && 45 \\ 160 && 55 \\ 180 && 60 \\ 170 && 80 \end{bmatrix}$$

위의 데이터를 모아둔 행렬 $D$를 잘 보면, 왼쪽 열에 '키'에 관한 데이터들이 정리되어 있고, 오른쪽 열에 '몸무게'에 관한 데이터들이 정리되어 있음을 알 수 있다.

또, 1번 행부터 5번 행까지가 각 사람의 특성들을 나열해둔 것임을 알 수 있다.

헷갈릴 수도 있지만, 일반적으로 '데이터'라고 부르는 것은 한 사람으로부터 얻은 키와 몸무게의 feature에 대한 관점 보다는 "키에 관한 5명의 정보"와 "몸무게에 관한 5명의 정보"와 같이 **각 feature를 여러번 관찰한 것**을 언급한다는데에 익숙해지도록 하자.

## 2) 함수를 모아둔 것

행렬이 함수라는게 과연 무슨 말일까?

함수의 의미에 대해 다시 생각해보자.

함수란 입력과 출력의 관계에 대한 것이라고 할 수 있다. 즉, $x$라는 값을 넣었을 때 어떤 값 $y$를 내줄것인가($f(x)$)?에 대한 얘기를 하는 것이 함수라고 할 수 있다.

<p align = "center">
  <img width = "400" src ="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Function_machine2.svg/1024px-Function_machine2.svg.png">
  <br>
  그림 1. 함수를 상자에 비유한 그림
  <br>
  그림 출처: <a href ="https://ko.wikipedia.org/wiki/%ED%95%A8%EC%88%98"> 위키피디아, 함수 </a>
</p>

행렬에서는 행벡터에 함수의 역할을 맡기자고 "약속"했다.

이 포스트에서 곧 설명하겠지만, 행벡터와 열벡터를 곱하면 스칼라 값이 출력된다. 다시 말해 데이터로 볼 수 있는 '열벡터'를 행벡터에 입력하면 스칼라 값이 출력되는 것이다. 

즉, 행렬은 행벡터들을 모아둠으로 함수로써의 기능을 수행하고 있는 것을 알 수 있다.

$$A = \begin{bmatrix}
\begin{bmatrix}a_{11} && a_{12} && \cdots && a_{1n}\end{bmatrix}\\\\
\begin{bmatrix}a_{21} && a_{22} && \cdots && a_{2n}\end{bmatrix}\\\\
\vdots \\\\
\begin{bmatrix}a_{m1} && a_{m2} && \cdots && a_{mn}\end{bmatrix}
\end{bmatrix}$$

이에 대한 조금 더 자세한 내용은 [행벡터의 의미와 벡터의 내적 편](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)에서 더 자세히 다루었으니, 흥미가 간다면 추가로 확인해보는 것도 좋을 듯 하다.

## 이렇게도 볼 수 있고 저렇게도 볼 수 있다?

행렬은 데이터로 작동하기도 하고, 함수로도 작동한다고 언급했다.

한마디로 이렇게도 볼 수 있고, 저렇게도 볼 수 있고 내가 필요한 관점에 맞춰 해석하면 그만이다.

그만큼 행렬에 대한 이해를 할 때는 지금 이 행렬이 어떤 역할을 수행하고 있는지에 대해 잘 이해할 필요가 있다.

어려운 수학적인 용어를 조금만 곁들여 설명하자면, 이렇게도 볼 수 있고 저렇게도 볼 수 있다는 것을 어려운 말로 **쌍대성(duality)**을 가진다라고 한다.

쌍대성에 대해선 일단은 '그냥 이런 용어가 있구나' 하는 정도로 듣고 흘리면 될 것 같다. 중요한 용어이기 때문에 한번 언급하는 것은 필요할 것 같아 적어둔 것이다.


# 일반적으로 이용하는 행렬곱의 방법

필자는 고등학교 시절 7차 교육과정을 거치면서 고등학교 시절 행렬에 대해 배운 적이 있다.

그때 처음 배운 행렬의 곱셈 방식은 너무나도 독특했는데, 지금 생각해도 익숙하지 않다면 행렬의 곱은 "왜 이렇게 계산하지?"라고 생각이 들 정도로 이상하다.

행렬의 곱은 일반적으로 다음과 같이 생각한다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-08-matrix_multiplication/pic2.png">  <br>
  그림 2. 행렬의 일반적인 곱셈 방법
</p>

수식을 이용해 조금 더 정확하게 쓰면 다음과 같다.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a & b \\ c & d\end{bmatrix} = 

\begin{bmatrix}
  1 \cdot a +2\cdot c && 1\cdot b + 2\cdot d \\ 
  3\cdot a + 4\cdot c && 3\cdot b + 4 \cdot d
\end{bmatrix}$$

이것을 잘 뜯어 생각해보면, 왼쪽에 있는 행렬에서 행 하나를 가져오고 오른쪽에 있는 행렬에서 열 하나를 가져와서 계산하게 된다는 것을 알 수 있다.

또, 가져온 행 혹은 열을 벡터로 생각한다면 계산된 행렬의 각 원소값은 ***벡터의 내적을 표현한 것***임을 알 수 있다.

즉, 식(2)의 계산 결과에서 1행 1열의 원소값은 계산 되기 전 두 행렬 중 왼쪽 행렬의 1행의 행벡터와 오른쪽 행렬의 1열의 열벡터를 가져와 계산한 것임을 알 수 있다.

$$\begin{bmatrix}1 & 2\end{bmatrix}\begin{bmatrix}a\\c\end{bmatrix} = 1\cdot a + 2\cdot c$$

즉, 일반적으로 이용하는 행렬곱의 관점은 행벡터와 열벡터 간의 내적(inner product)을 계산함으로써 행렬곱이 이루어진다는 것을 알 수 있다.

여기서 행벡터와 행벡터, 혹은 열벡터와 열벡터가 아닌, "행벡터와 열벡터 간의 연산"이 이루어진다는 점이 중요한데, 이 점에 대해서는 다음 포스트인 [행벡터의 의미와 벡터의 내적 편](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)을 참고하기를 추천한다.

참고로 이러한 관점을 응용한 개념으로는 [공분산 행렬](https://angeloyeo.github.io/2019/07/27/PCA.html#%EA%B3%B5%EB%B6%84%EC%82%B0-%ED%96%89%EB%A0%AC%EC%9D%98-%EC%9D%98%EB%AF%B8)이 있으며, 공분산 행렬의 의미는 여러 종류의 feature들이 서로 얼마나 닮았는가(즉, 내적을 이용)를 의미한다.

# 열벡터의 선형 결합

또 다른 방식으로 행렬의 곱을 이해하는 방법은 [열벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9)으로 이해하는 방법이다.

이번에는 행렬과 벡터의 곱에 대해 생각해보자. 다시 말해 식 (1)에서 두 행렬을 곱했던 경우에서 오른쪽에 곱해지는 행렬의 한 열만 가져와서 결과를 확인해보자.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a \\ c \end{bmatrix} = 

\begin{bmatrix}
  1 \cdot a +2\cdot c  \\ 
  3\cdot a + 4\cdot c
\end{bmatrix}$$

이 결과를 보면 다음과 같이 생각할 수도 있다는 점을 알 수 있다.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}\begin{bmatrix}a \\ c \end{bmatrix} = 

a\cdot\begin{bmatrix}
  1\\ 
  3
\end{bmatrix}
+

c\cdot\begin{bmatrix}
  2\\ 
  4
\end{bmatrix}
$$

다시 말해 행렬과 벡터의 곱은 행렬을 구성하고 있는 [두 열벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9)을 다른 방식으로 표현한 것이라고 할 수 있는 것이다.

## 열공간을 기반한 해석

[벡터의 선형결합](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html#%EB%B2%A1%ED%84%B0-%EA%B0%84%EC%9D%98-%EC%84%A0%ED%98%95-%EA%B2%B0%ED%95%A9) 부분에서 설명했던 것 처럼 벡터의 선형결합이 의미하는 것은 벡터 공간의 생성이다. 즉, 행렬과 벡터의 곱이라는 수식이 우리에게 묻는것은 "주어진 열벡터들을 이용해 만들 수 있는 벡터 공간(즉, 열공간(column space))에 대한 탐구"라는 점에서 매우 중요하다고 할 수 있다.

이런 관점에서 다음의 수식의 의미를 생각해보자.

$$A\vec{x} = \vec{b}$$

예를 들어 아래와 같은 문제를 생각해보자.

$$\begin{bmatrix}1 & 2 \\ 3 & 4\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}=\begin{bmatrix}3\\5\end{bmatrix}$$

이 문제의 해답은 아래와 같다는 것은 연립방정식을 풀면 쉽게 알 수 있다.

$$\begin{cases}
x+2y = 3 \\
3x+4y = 5
\end{cases}$$

$$\Rightarrow x=-1, \text{ }y=2$$

하지만, 이번엔 이 식을 아래와 같이 생각해보자.

$$x\begin{bmatrix}1\\3\end{bmatrix}+y\begin{bmatrix}2\\4\end{bmatrix}=\begin{bmatrix}3\\5\end{bmatrix}$$

위 식을 필자는 이렇게 해석하고 싶다. 

<center>

  "두 벡터 $\begin{bmatrix}1\\3\end{bmatrix}$과 $\begin{bmatrix}2\\4\end{bmatrix}$로부터 생성된  벡터공간 내에 벡터 $\begin{bmatrix}3\\5\end{bmatrix}$가 존재하는가? 

</center>

<center>

  만약 그렇다면,  $\begin{bmatrix}1\\3\end{bmatrix}$과 $\begin{bmatrix}2\\4\end{bmatrix}$을 어떻게 조합해야 $\begin{bmatrix}3\\5\end{bmatrix}$을 구할 수 있을까??"

</center>

이러한 관점을 이용한 선형대수학에서의 응용은 [선형연립방정식의 풀이](https://angeloyeo.github.io/2019/09/09/Gauss_Jordan.html)와 [선형 회귀](https://angeloyeo.github.io/2020/08/24/linear_regression.html)가 있다.

## 선형 변환을 기반한 해석

이 뿐 아니라, 행렬과 벡터의 곱이 열벡터의 선형결합이라는 해석이 우리에게 주는 또 다른 관점은 행렬과 벡터의 곱을 기저 벡터의 변형을 통한 **벡터의 선형 변환**으로 해석할 수 있도록 도움을 주기 때문이다. 

예를 들어, 행렬

$$A=\begin{bmatrix}
 2 & -3 \\
 1 & 1
 \end{bmatrix} $$

 를 이용해 벡터

 $$\vec x=\begin{bmatrix} 1 \\ 1 \end{bmatrix}$$

 를 변환시켜 보면,


 $$A\vec x =\begin{bmatrix}
 2 & -3 \\
 1 & 1
 \end{bmatrix} \begin{bmatrix} 1 \\ 1 \end{bmatrix}=\begin{bmatrix} -1 \\ 2 \end{bmatrix}$$


 임을 알 수 있는데, 아래의 영상에서 처럼 이 값은 새로운 두 기저벡터의 1배와 1배의 합으로
 표현될 수 있다.

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/transformation1/" width="650" height = "520" frameborder="0"></iframe></p>

이 내용에 대해서는 [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)편에서 자세히 다루었으므로 해당 포스트를 참고하는 것도 좋을 것 같다.

이러한 관점을 이용한 선형대수학에서의 응용은 [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html), [주성분 분석(PCA)](https://angeloyeo.github.io/2019/07/27/PCA.html), [특이값 분해(SVD)](https://angeloyeo.github.io/2019/08/01/SVD.html) 등이 있다.
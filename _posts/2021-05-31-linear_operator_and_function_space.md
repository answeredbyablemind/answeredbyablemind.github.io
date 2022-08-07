---
title: 선형 연산자와 함수 공간
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210531
tags: 미분방정식
---

# 미분방정식을 보는 또 다른 관점

지금까지 미분방정식을 해석하는 여러가지 관점에 대해 알아보았다.

[미분방정식을 이용한 현상 모델링](https://angeloyeo.github.io/2021/05/01/modeling_with_differential_equation.html)편에서는 미분계수가 포함된 방정식을 미분방정식이라고 보았다.

또, [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html) 편에서는 좌표 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq1.png">에 매핑된 기울기로 미분방정식을 기하학적으로 해석했으며,

[자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서는 미분방정식이란 연속성장의 관점에서 시시각각 변화율이 바뀌는 시스템의 관점에서 미분방정식을 해석하였다.

위의 세 가지 해석은 미분방정식을 수치적으로나 해석적(analytic)으로나 매우 유용한 관점이었으며, 1계 미분방정식 뿐만 아니라 그 이상의 degree의 미분방정식의 해 특성을 파악하는데에도 중요한 역할을 하는 주춧돌이었다.

---

지금부터는 미분방정식을 보는 또 다른 관점으로 바라보고자 한다. 여기서는 선형대수학에서 사용되던 벡터, 행렬의 개념을 함수에 도입할 것이다.

이제부터는 함수를 일종의 벡터로 취급할 수 있다는 것을 알 수 있게 되며, 선형대수학에서 행렬에 해당하는 연산이 \'선형 연산자(linear operator)\'라는 이름으로 개념이 확장된다.

또, 벡터들의 집합인 벡터 공간을 함수들의 집합인 함수 공간으로 개념을 확장시켜 사용할 것이다.

이런 논리가 아주 자세하게 학문으로 정립된 것이 \'함수해석학\'인데 이번 글에서는 기본적인 내용만 간단히 짚고 넘어가고자 한다.

# Prerequisites

이번 포스팅을 이해하기 위해선 아래의 내용에 대해 자세히 알고 오시는 것을 추천드립니다. (사실상 선형대수학의 기초 전반은 모두 알아야 잘 이해할 수 있습니다.)

* [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)
* [행렬 곱에 대한 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)
* [행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html)
* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [4개 주요 부분 공간 간의 관계](https://angeloyeo.github.io/2020/11/17/four_fundamental_subspaces.html)
  
# functions as vectors

이전 포스팅 중 선형대수학의 기초 부분인 [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)에서는 세 가지 관점으로 벡터를 생각했다.

각각은 벡터란 화살표 같은 것, 숫자의 나열, 벡터 공간의 원소라는 정의였다.

그 중 벡터란 벡터 공간의 원소라는 정의가 가장 수학적인 정의라고 말한 바 있는데, 이 정의가 중요한 이유는 \'이런 방식으로 벡터를 정의하는 것은 이러한 특성을 가진 것들은 모두 벡터로 취급해서 다룰 수 있다는 점을 강조한다\'라고 언급했다.

다시 말해, 벡터의 특성을 가지는 개념을 발견한다면, 선형대수학에서 적용해볼 수 있었던 테크닉들과 개념들을 확장해 적용해볼 수 있게 되는 것이다.

조금 더 구체적으로 말하자면 어떤 수학적 object(가령, 벡터, 행렬, 함수, 등등...)가 벡터이기 위해선 다음의 두 가지 연산에 대해 닫혀있어야 한다.

* 벡터의 상수배
* 벡터의 합

너무 단순한가?

마치 쿠팡에서 로켓와우 멤버십 가입비 2900원만내면 쿠팡에서 제공하는 모든 로켓배송 서비스를 누릴 수 있는 것 처럼, 어떤 수학적 object가 위의 두 개의 법칙만 잘 만족하는 것이라고 확인된다면 \'벡터\'라는 멤버십을 받게 되는 것이다.

그리고 이에 따라 선형대수학에서 열심히 일궈놓은 개념들과 테크닉들을 적용받을 수 있게 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic1.png">
  <br>
  그림 1. 쿠팡에서 로켓와우 멤버십에 가입해 누릴 수 있는 혜택들 (출처: 쿠팡)
</p>

엄밀한 증명은 아니지만 간단하게만 생각해봐도 함수는 벡터로 볼 수 있는 자격을 갖췄다.

아래는 함수의 상수배와 함수끼리의 합을 표현한 것이다. 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq2.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq3.png"> </p>

다시 말해 어떤 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq4.png">에 임의의 상수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq5.png">를 곱하더라도 여전히 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq6.png">는 함수이고,

어떤 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq7.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq8.png">를 더하더라도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq9.png"> 역시 함수다.

<p align = "center">
  <img src = "https://upload.wikimedia.org/wikipedia/commons/d/d7/Example_for_addition_of_functions.svg">
  <br>
  그림 2. 두 함수의 합
  <br>
  <a href = "https://en.wikipedia.org/wiki/Function_space"> 그림 출처: Function space, Wikipeda </a>
</p>

이렇게 되면 벡터가 벡터 공간의 원소로 정의되었던 것 처럼, 함수도 벡터 공간의 원소로 정의될 수 있는 벡터가 되며, 이 때 함수가 포함되어 있는 벡터 공간을 <span style="color:red"><b>"함수 공간(function space)"</b></span>이라고 부른다.

---

우리는 벡터의 개념을 확장해서 함수 공간이라는 개념을 얻어낼 수 있음을 알게되었다.

이제 중요한 점은 어떻게 벡터에 적용되는 선형대수학의 개념들과 테크닉들을 함수에 적용할 것인가 라는 점이다.

개념의 확장이 있고 난 뒤에는 아무 의심없이 적용했던 모든 것들을 의심해봐야 한다.

이 개념이 어디서부터 나왔는지, 이 개념이 가졌던 근본적인 의미가 뭐였는지 생각해본 뒤에 비로소 확장된 버전의 테크닉들을 생각해낼 수 있기 때문이다.

여기서는 총 세 가지의 선형대수학의 개념에 대해 함수해석학에서 "확장된" 버전의 개념이 어떤 것인지 알아볼 것이다.

## 벡터 간의 내적 → 함수의 내적

첫 번째는 내적(inner product) 연산이다.

선형대수학에서 벡터의 내적은 다음과 같이 정의되었다.

임의의 아래와 같은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq10.png">차원 실수 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq11.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq12.png">에 대하여,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq13.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq14.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq15.png"> </p>

만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq16.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq17.png">가 복소 벡터였다고 하면 내적은 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq18.png"><br> 식 (6)  </p>

[//]:# (식 6)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq19.png">은 복소 켤레(complex conjugate) 연산이다.

왜 복소 벡터는 복소 켤레 연산이 들어가는지 생각해본다면 내적을 통해 복소 벡터에서 길이를 정의하기 위해서이다.

어떤 실수 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq20.png">의 크기(보통 L2-norm)는 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq21.png"> </p>

즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq22.png"> </p>

이 개념을 복소벡터에까지 확장시키면, 복소 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq23.png">에 대해서

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq24.png"> </p>

이어야 하므로 복소벡터의 내적연산은 식 (6)과 같이 정의되어야 하는 것이다.

이제 식 (6)의 방식을 확장해 함수의 내적을 정의해보도록 하자.

미분방정식을 다룰 때 사용되는 함수들은 실수 함수 범위에서 그치지않고 함수값이 복소수가 될 수 도 있기 때문에 다음과 같이 복소 벡터의 내적의 정의를 확장해 다음과 같이 정의한다.

실수 입력 복소수 출력을 갖는 구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq25.png">에서 정의된 임의의 복소함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq26.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq27.png">에 대해 두 함수의 inner product <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq28.png">은 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq29.png"> </p>

이다. 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq30.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq31.png">의 complex conjugate이다.

## 행렬과 벡터의 곱 → 연산자와 함수의 관계

[행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html) 편에서는 행렬은 벡터에 적용되는 일종의 함수라고 말한 바 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic1.png">
  <br>
  그림 3. 행렬은 벡터를 입력으로 받고 또 다른 벡터를 출력으로 내주는 일종의 함수 역할을 한다.
</p>

우리가 만약 일반적인 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq32.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq33.png">를 벡터로 생각할 수 있다면 선형대수학에서의 행렬의 개념을 확장시킨 함수를 입력으로 받고 다른 함수를 출력해주는 개념을 생각할 수 있다.

그러한 개념을 우리는 함수에 적용되는 \'연산자(operator)\'라고 부르자. 선형대수학의 행렬처럼 연산자는 함수를 입력받고 다른 함수를 출력해준다.

그리고, 특히 아래와 같은 특성을 만족하는 연산자라면 그 연산자는 \'선형 연산자\'라고 부른다. 어떤 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq34.png">에 대해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq35.png"> </p>

이며, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq36.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq37.png">는 임의의 복소수이고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq38.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq39.png">는 임의의 복소 함수이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic4.png">
  <br>
  그림 4. 연산자(operator)란 함수를 입력으로 받고 또 다른 함수를 출력해주는 함수이다.
</p>

---

계속 추상적인 표현으로 \'연산자\'라고만 하면 이해하기 어렵기 때문에 아래와 같이 연산자의 쉬운 예시를 몇 가지 생각해보자.

연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq40.png">과 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq41.png">에 대해,

### (1) 스칼라배 연산

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq42.png"> </p>

### (2) 미분 연산자. 

미분 차수는 몇 차(order)여도 상관없다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq43.png"> </p> 

또는 여러 개의 미분연산이 결합된 것도 하나의 연산자로 볼 수 있으며 다른 함수를 곱하고 미분을 취해주는 방식도 가능하다.

가령, 아래와 같은 연산자도 생각할 수 있으며 선형 연산자이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq44.png"> </p>

즉, 연산자는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq45.png"> </p>

이다.

### (3) 적분 연산자. 

일반적인 적분 뿐만 아니라 다른 어떤 함수를 곱하고 적분을 취해주는 방식도 가능하다. 마찬가지로 선형연산자이다.

임의의 복소함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq46.png">에 대해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq47.png"> </p>

가령 convolution 연산도 적분 연산자의 일종이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq48.png"> </p>

또는 푸리에 변환도 적분 연산자의 일종이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq49.png"> </p>

## 전치 연산 → adjoint 연산

이번에는 전치 연산에 대해 생각해보자.

벡터의 전치 연산은 매우 간단하다. 아래와 같이 행과 열을 뒤집어 주면 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq50.png"> </p>

그럼 선형대수학에서 전치 연산의 역할은 무엇이었던가?

전치 연산은 열벡터를 행벡터로, 혹은 행벡터를 열벡터로 바꿔주는 역할을 해주었다.

[행벡터의 의미와 벡터의 내적](https://angeloyeo.github.io/2020/09/09/row_vector_and_inner_product.html) 편에서 보았던 것 처럼 행벡터는 열벡터에 적용되는 함수(functional)이다.

그리고 벡터의 전치 연산을 정의하고 행벡터를 열벡터에 작용하는 함수로 생각함으로써 두 벡터의 내적은 다음과 같이도 계산할 수 있게 되었다.

임의의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq51.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq52.png">에 대해서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq53.png"> </p>

와 같이 쓸 수 있게 되는 것이다.

(이런 배경을 바탕으로 수학자들은 행벡터와 열벡터 간의 연산을 내적으로 정의하였다. 이 정의는 자연스레 행렬과 벡터의 곱의 정의로 확장되게 된다.)

즉, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq54.png">에 전치연산을 취해줌으로써 원래의 열벡터를 행벡터로 바꿔놓았고, 이를 통해 벡터의 기능을 연산자로 작동할 수 있게 해준 것이다.

여기서 말하고자 하는 핵심 포인트는 \'전치 연산은 내적과 함께 생각해야 하는 것이며, 연산자에 작용시키기 위해 만든 연산\'이라는 것이다.

---

한편, 임의의 두 벡터의 내적 연산을 생각해보는데 두 벡터 중 두 번째 벡터는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq55.png">라는 행렬을 통해 선형변환 된 결과로써의 벡터라고 생각해보자. 

다시 말해, 임의의 두 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq56.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq57.png">에 대해,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq58.png"> <br> 식 (21) </p>

[//]:# (식 21)

와 같은 내적연산을 생각해보자. 

우리는 이 식을 통해 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq59.png">의 전치 연산에 대해 생각해볼 것이다. 식 (20)에 따르면 식 (21)은 전치연산을 활용해 쓸 수 있다.

즉, 식 (21)은

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq60.png"> <br> 식 (22) </p>

[//]:# (식 22)

가 된다.

여기서 괄호를 조금 다르게 묶어서 생각해보면 식 (22)는 이렇게도 볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq61.png"> <br> 식 (23) </p>

[//]:# (식 23)

만약 이 식을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq62.png">라는 벡터와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq63.png">라는 벡터의 내적으로 본다면, 식 (23)은 전치연산을 통해 다음과 같이 표현될 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq64.png"> </p>

여기까지 본 내용을 통해 벡터의 전치 연산을 함수 공간에 어떻게 확장시켰는지 알아보자[^1].

[^1]: 좀 더 자세하게는 우리가 생각하는 함수 공간의 함수는 모두 복소 함수이므로 transpose가 아니라 conjugate transpose에 대해 알아보는 것이 더 맞지만, 큰 흐름은 같다.

두 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq65.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq66.png">, 그리고 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq67.png">에 대해 다음이 성립하게 하는 것을 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq68.png">에 대한 adjoint 연산(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq69.png">, dagger라고 읽음)이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq70.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq71.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq72.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq73.png"> 간의 내적이다.

[//]:# (이렇게만 써두면 마치 Transpose의 특성 중 일부만을 만족시키는 연산인 것 같다.)

---

연산자를 설명할 때와 마찬가지로 추상적으로만 adjoint에 대해 설명하기 보단 몇 가지 예시를 들어서 확인해보도록 하자.

### (1) 스칼라배 연산자의 adjoint

구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq74.png">에서 정의된 복소함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq75.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq76.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq77.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq78.png">와 임의의 복소수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq79.png">에 대해, 아래와 같은 연산자를 생각하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq80.png"> </p>

그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq81.png">는 다음을 만족해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq82.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq83.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq84.png"> </p>

이다. 따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq85.png">는

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq86.png"> </p>

와 같은 연산자이다. (여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq87.png">는 complex conjugate)

### (2) 미분 연산자의 adjoint

구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq88.png">에서 정의된 복소함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq89.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq90.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq91.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq92.png">와 임의의 복소수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq93.png">에 대해, 아래와 같은 연산자를 생각하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq94.png"> </p>

그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq95.png">는 다음을 만족해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq96.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq97.png"> </p>

부분적분을 이용하면 다음과 같이 계산된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq98.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq99.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq100.png"> </p>

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq101.png">이라는 조건 하에 다음과 같이 미분 연산자의 adjoint를 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq102.png"> </p>

---

또, 만약 아래와 같은 2차 미분이 포함된 연산자인 경우도 한번 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq103.png"> </p>

그러면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq104.png">는 다음을 만족해야 한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq105.png"> </p>

여기서부터는 가독성을 위해 \'<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq106.png">\'라는 기호는 생략하여 수식을 조금 간략화하여 적도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq107.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq108.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq109.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq110.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq111.png">의 위치를 이동시키면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq112.png"> </p>

와 같이 된다.

위 식에서 덧셈으로 합쳐진 세 개의 식 중 앞의 두 개의 식을 각각 따로 계산해보면 다음과 같이 계산된다.

i) 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq113.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq114.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq115.png"> </p>

ii)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq116.png"> </p>

따라서, 원래의 식은 다음과 같이 묶어 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq117.png"> </p>

여기서 왼쪽의 식을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq118.png">라 하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq119.png"> </p>

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq120.png"> 이라는 조건 하에 다음과 같은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq121.png">를 찾을 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq122.png"> </p>

# <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq123.png"> in the world of functions

이번 포스팅에서 우리는 지금까지 함수를 일종의 벡터로 볼 수 있다는 사실을 통해 벡터로써의 함수와 그 함수에 가해질 수 있는 연산들의 특징을 살펴보았다.

그런데, 선형대수학이 행렬 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq124.png">와 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq125.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq126.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq127.png">를 놓고 해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq128.png">를 구하는 과정을 연구하는 과정에서 발전한 학문인 것과 같이,

우리는 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq129.png">과 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq130.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq131.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq132.png">의 해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq133.png">를 구하는 과정을 잘 이해하는 것이 함수를 벡터처럼 다루고자 하는 궁극적인 목표라고 할 수 있다.

그러면 선형대수학에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq134.png">의 해는 어떤 조건에서 존재했더라?

## Existence of solution of <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq135.png">

바로 [행렬 곱의 또 다른 시각](https://angeloyeo.github.io/2020/09/08/matrix_multiplication.html)편에서 보았던 것 처럼 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq136.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq137.png">의 열공간에 존재하고 있을 경우였다.

이것을 다른 시각에서 설명해보면 다음과 같이 설명할 수 있다. 우리는 주요 부분 공간(row space, column space, null space, left null space)의 관계를 이용해서 해의 존재 조건을 따져볼 것이다.

아래와 같은 조건을 만족하는 모종의 벡터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq138.png">를 생각해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq139.png"> </p>

그러면 원래의 식 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq140.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq141.png">와 내적을 취해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq142.png"> </p>

위 식에서 괄호를 조금 다르게 쳐주면 다음과 같이 생각할 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq143.png"> </p>

여기서 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq144.png"> </p>이라는 관계를 가진다고 하였으므로

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq145.png"> </p>

이다.

그런데, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq146.png">라는 관계에 의해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq147.png"> 이기도 하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq148.png">이라는 사실을 확인했으므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq149.png">이다. 따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq150.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq151.png">는 서로 직교하는 벡터라는걸 알 수 있다.

그런데, 조금만 생각해보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq152.png">는 left null space안에 있는 벡터라는 사실을 알 수 있다. left null space의 정의에 따라 그런 것이다.

그리고 [4개 주요 부분 공간 간의 관계](https://angeloyeo.github.io/2020/11/17/four_fundamental_subspaces.html) 편에서 배웠던 것 처럼 column space는 left null space와 항상 직교한다.

따라서 만약 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq153.png">벡터가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq154.png">에 직교한다면 이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq155.png">벡터는 left null space와 직교하는 벡터 공간 안에 있는 것이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq156.png">는 column space안에 있는 벡터임을 알 수 있는 것이다.

그러므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq157.png">의 해가 존재하는 조건은 <p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq158.png"> </p>인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq159.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq160.png">인 것이다.

## Solvability of <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq161.png">

우리는 함수 공간에서 연산자 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq162.png">의 adjoint <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq163.png">를 알아보았다.

위의 선형대수학에서의 논의를 함수 공간에 그대로 적용하면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq164.png">가 해를 가질 조건은 다음과 같다.

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq165.png">인 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq166.png">에 대하여 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq167.png">에 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq168.png">를 내적해보자.

그러면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq169.png"> </p>

이고, adjoint의 정의에 의해 위 식은 다음과 같다는 것을 알 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq170.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq171.png">이므로 위 식의 좌변은 0이 된다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq172.png"> </p>

이라는 사실을 알 수 있다.

따라서, 위 선형대수학에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq173.png">의 해의 존재조건과 유사하게 함수 공간에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq174.png">의 해가 존재하기 위해서는 **<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq175.png">라는 함수가 adjoint 연산자의 영공간에 직교한다는 조건이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2021-05-31-linear_operator_and_function_space/eq176.png">가 해를 가지는 조건**이다.

이 이론을 프레드홀름 정리 중 하나인 Fredholm alternative 라고 부르기도 한다.

# 참고 문헌

* function space, Wikipedia (https://en.wikipedia.org/wiki/Function_space)
* Applied Mathematical Methods in Theoretical Physics, 2nd ed., Wiley-VCH, Michio Masujima
* Advanced Differential Equations: Asymptotics & Perturbations, Arxiv, 2020, J Nathan Kutz 
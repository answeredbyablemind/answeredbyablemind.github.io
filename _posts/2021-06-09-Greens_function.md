---
title: 그린 함수를 이용한 해법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210609
tags: 미분방정식
---

그린 함수는 연속적인 입력과 출력을 쪼개서 표현하게 되면 해를 얻기 쉬울 수 있다는 창의적이고도 천재적인 아이디어에서 출발합니다.

그린 함수의 그린은 영국의 수학자 George Green의 이름에서 따왔습니다. George Green이 생각해낸 아이디어가 어떤 것인지 알아보도록 합시다.

# Prerequisites

그린 함수를 이용한 미분방정식의 해법을 이해하기 위해서는 다음의 내용에 대해 이해하고 오시는 것이 좋습니다.

* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)

아래는 신호 및 시스템 과목에 관한 내용인데, 그린 함수를 이해하기 위해서 읽으면 좋은 optional prerequisites 입니다.

* [Discrete Time Convolution](https://angeloyeo.github.io/2019/06/18/Discrete_Time_Convolution.html)
* [Continuous Time Convolution](https://angeloyeo.github.io/2019/07/01/Continuous_Time_Convolution.html)

# 미분방정식을 보는 또 다른 관점

지금까지 네 가지 관점에서 미분방정식을 해석해보았다. (많이도 했다...)

[미분방정식을 이용한 현상 모델링](https://angeloyeo.github.io/2021/05/01/modeling_with_differential_equation.html)편에서는 미분계수가 포함된 방정식을 미분방정식이라고 보았다.

또, [방향장과 오일러 방법](https://angeloyeo.github.io/2021/04/30/direction_fields.html) 편에서는 좌표 (x,y )에 매핑된 기울기로 미분방정식을 기하학적으로 해석했으며,

[자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서는 미분방정식이란 연속성장의 관점에서 시시각각 변화율이 바뀌는 시스템의 관점에서 미분방정식을 해석하였다.

그리고, [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서는 함수를 벡터로 취급할 수 있음을 알아보았고 미분 연산자의 관점에서 미분 방정식을 해석했다.

이번 시간에는 미분방정식을 **시스템**의 관점에서 해석하고자 한다. 특히, 미분방정식은 closed-loop system으로 해석할 수 있다.

이 내용은 [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 본 되먹임에 관한 내용이나 [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)에서 확인한 연산자 이론의 내용과 궤를 같이 하는 것이다. 하지만 이런 관점의 전환을 통해 왜 그린 함수라는 아이디어가 나올 수 있었는지를 한번 더 이해할 수 있게 될 것이다.


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic1.png">
  <br>
  그림 1. 미분방정식은 closed-loop가 포함된 system으로 볼 수 있다.
</p>

---

기본적으로 시스템이라고 하는 것은 입력과 출력이 있는 것이다. 이것은 함수의 개념과도 유사하다고 할 수 있다.

그런데, closed-loop 시스템이라고 하는 것은 '피드백을 통한 내부적인 작동'과 '외부 입력에 의한 반응'을 동시에 확인할 수 있어야 한다는 점에서 일반적인 함수와 다르다.

여기서 말하는 '피드백을 통한 내부적인 작동'은 미분방정식의 제차해(homogeneous solution)을 말한다. 

즉, [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편과 [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 보았던 것 처럼 제차해(homogeneous solution)은 아무런 외부 입력이 없더라도 자체적으로 구동하는 동작 방법이 서술되어 있는것이다. 왜냐면 제차해는 피드백을 통한 연속 성장에 대한 서술이기 때문이다.

또, '외부 입력에 의한 반응'이라 함은 미분방정식의 비제차 해(particular solution)을 말한다. 이것은 [비제차 미분방정식의 의미](https://angeloyeo.github.io/2021/05/25/nonhomogeneous_equation.html) 편에서 다루었던 것 처럼 시간에 따라 추가적인 외부 입력이 들어올 때의 출력 변화를 의미한다. 거기다 이 출력 변화는 '자체적으로 구동하는' 미분방정식의 제차 시스템(homogeneous system or autonomous system)의 해 위에 얹어져서 작동하게 된다. 우리는 이것을 중첩의 원리라고 부르기도 한다. 

---

그럼 우리는 입력과 출력의 관점에서, 미분방정식으로 서술된 시스템의 출력이란 매 시간 포인트마다의 입력값에 반응하여 얻게 되는 시스템의 출력값들을 모두 모아 합친 것이라고 볼 수 있지는 않을까?

연속 시간의 관점에서 이 관계를 이해하기는 쉽지 않기 때문에 적절한 시간 간격을 두고 입력과 출력을 생각해보자.

가령, 1초 간격으로 한 포인트씩 입력을 넣는데 $[2, 3, 5, 1, 4]$와 같은 입력을 넣고 $[8, 5, 1, 2, 7]$이라는 출력을 얻었다고 생각해보자.

그러면 우리는 $[8, 5, 1, 2, 7]$이라는 출력값은 다음 그림과 같은 방법으로 얻은 것이라고 생각할 수도 있을 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic2.png">
  <br>
  그림 2. 시스템의 입출력 관계로 미분방정식을 생각할 때, 각각의 시간 step에 해당하는 입력은 각 시간 step에 해당하는 출력에만 관여한다고 볼 수 있다.
</p>

위의 그림 2에서 말하고자 하는 것은 이 시스템이 각 time step에서의 입력값이 각 time step의 출력값에만 영향을 준다고 하면 입력과 출력을 time step 구간 별로 나눠서 생각해볼 수 있다는 것이다.


<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic4.mp4">
  </video>
  <br>
  그림 3.
</p>

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-09-Greens_function/pic5.mp4">
  </video>
  <br>
  그림 4.
</p>
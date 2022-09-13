---
title: Momentum을 이용한 최적화기법 - ADAM
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200926
tags: 머신러닝
---

※ 본 포스팅은 [Andrew Ng 교수님의 강의](https://www.youtube.com/watch?v=JXQT_vxqwIs&ab_channel=Deeplearning.ai)를 정리한 것임을 밝힙니다.

Python 라이브러리를 이용한 딥러닝 학습 알고리즘에 관련된 tutorial들에서 거의 대부분 optimization을 수행할 때 Gradient Descent 대신에 ADAM Optimizer를 이용해 Optimziation을 하라고 한다.

과연 어떤 부분에서 ADAM이 Gradient Descent에 비해 좋길래 거의 대부분의 문헌에서 ADAM을 추천하고 있는지 그 배경에 대해 알아보도록 하자.

# Prerequisites

본 포스팅에 대해 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [경사하강법(Gradient Descent)](https://angeloyeo.github.io/2020/08/16/gradient_descent.html)

# Gradient Descent의 문제

Gradient descent를 이용해 비용함수(혹은 Error)를 최소화해주고자 하면 어떤 경우에는 수렴 속도가 굉장히 느릴 때가 있다.

이런 경우 step size(혹은 learning rate)을 키워주면 수렴 속도가 빨라지는 경우가 있지만, 어떤 경우는 종종 아래의 그림 1과 같이 비용함수의 형태 특성 상 특정 parameter에 대해 진동하면서 수렴하다보니 수렴 속도가 느려지는 경우가 있다. 이럴 때에는 자칫 잘못하면 비용함수가 발산해버리는 경우가 왕왕 생기기 때문에 학습 속도가 느리더라도 하는 수 없이 기다릴 수 밖에 없을 것이다.

(그림 1에서는 b라는 parameter에 대해 진동하면서 서서히 최솟값으로 수렴하고 있다.)

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/pic1.png">
  <br>
  그림 1. 비용함수 최소화 시 특정 parameter에 대해 진동하면서 수렴하는 경우
</p>

이렇듯 비용함수에 대한 진동이 발생하는 이유는 gradient의 개념 자체가 등고선에 수직한 방향으로 벡터가 만들어지기 때문이다.

그렇다면 이런 특성을 감안했을 때, 우리가 원하는 것을 다시 정리하자면 그림 1에서 세로 방향으로는 천천히 수렴하고 가로 방향으로는 빨리 수렴할 수 있도록 하는 것이다.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/pic2.png">
  <br>
  그림 2. 우리가 원하는 수렴 경로
</p>

# Gradient Descent with Momentum

Momentum의 개념을 도입한 Gradient Descent는 iteration에 따라 방향이 반대로 계속 바뀌어가는 형태의 경로를 거쳐왔을 때에는 해당 방향으로 update하는 변화량이 점차 작아지고, iteration에 따라 방향이 계속 유지되어가면 가속을 붙여주는 방식의 update method라고 할 수 있다.

이 method의 이름을 Momentum이라고 하고 pseudo-code를 통해 알고리즘을 우선 보도록 하자.

여기서는 모델의 파라미터가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq1.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq2.png"> 두 개라고 생각해보자.

또, subscript로 쓴 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq3.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq4.png"> 번째 iteration에서 계산한 것이라는 걸 말해준다고 하자.

---

[Momentum 알고리즘]

Initialize <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq5.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq6.png">

(여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq7.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq8.png">의 차원과 같고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq9.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq10.png">의 차원과 같음.)

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq11.png"> 번째 iteration에서:

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq12.png"> 현재 batch에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq13.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq14.png">을 계산함. 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq15.png"> 그 뒤 아래의 term들을 계산함.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq16.png"> <br> 식 (1)  </p>

[//]:# (식 1)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq17.png"> <br> 식 (2)  </p>

[//]:# (식 2)

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq18.png"> Weight, bias 업데이트:

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq19.png"> <br> 식 (3)  </p>

[//]:# (식 3)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq20.png"> <br> 식 (4)  </p>

[//]:# (식 4)

(여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq21.png">는 learning rate이다.)

---

Momentum 알고리즘의 핵심은 식 (1)과 식 (2)인데, 형태는 거의 같기 때문에 식 (1)을 조금 더 풀어서 생각해보도록 하자.

식 (1)은 재귀적으로 계산되는 term인데, iteration 1부터 차근히 살펴보면 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq22.png"> <br> 식 (5)  </p>

[//]:# (식 5)


두 번째 iteration에서는,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq23.png"> <br> 식 (6)  </p>

[//]:# (식 6)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq24.png"> <br> 식 (7)  </p>

[//]:# (식 7)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq25.png"> <br> 식 (8)  </p>

[//]:# (식 8)

세 번째 iteration에서는 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq26.png"> <br> 식 (9)  </p>

[//]:# (식 9)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq27.png"> <br> 식 (10)  </p>

[//]:# (식 10)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq28.png"> <br> 식 (11)  </p>

[//]:# (식 11)

이를 일반화해서 생각해보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq29.png"> 번째 iteration에서는 다음과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq30.png"> <br> 식 (12)  </p>

[//]:# (식 12)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq31.png"> <br> 식 (13)  </p>

[//]:# (식 13)

보통 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq32.png">은 0으로 초기화하므로,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq33.png"> <br> 식 (14)  </p>

이다.

[//]:# (식 14)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq34.png"> 값은 0.9 정도로 잡는게 보통이다.

이제, 이 Momentum의 의미를 다시 생각해보기 위해 식 (11)을 한번 다시 보도록 하자.

식 (11)을 보면 현재의 속도 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq35.png">은 과거의 속도들에 영향을 받는데, 현재 iteration 대비 이전 값일 수록 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq36.png"> 값이 더 많이 곱해져있어서 최근의 속도 값들이 더 큰 영향을 주는 것을 알 수 있다.

즉, Gradient의 진행이 그림 1에서와 같았다면 위 아래로 변하는 b축 gradient factor들은 더하기 빼기 해주게 되면서 서서히 속도가 0으로 가까워 질 것이고, 오른쪽으로 계속 진행되는 gradient의 W축 방향 factor들은 계속 더해주게 되어 관성이 작용하는 것 처럼 속도가 점점 붙을 것이다.

# RMSProp

RMSProp 알고리즘은 Root Mean Square Propagation의 줄임말로써 Geoffrey Hinton이 제안한 알고리즘이다. Coursera의 강의 도중 처음으로 제안된 알고리즘으로도 유명한데, Academic paper로 공식적으로 발표한 적은 없지만 상당히 유명한 알고리즘으로 자리매김하고 있다.

RMSProp은 Momentum을 이용한 Gradient와 사용 방식은 거의 유사한데, Gradient의 방향을 이용하지 않고 그 크기만을 이용해 업데이트 해주고자 하는 각 parameter에 대한 학습 속도를 조절한다.

우선 RMSProp 알고리즘을 보도록 하자.

---

[RMSProp 알고리즘]

Initialize <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq37.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq38.png">

(여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq39.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq40.png">의 차원과 같고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq41.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq42.png">의 차원과 같음.)

On iteration <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq43.png">:

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq44.png"> 현재 batch에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq45.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq46.png">을 계산함. 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq47.png"> 그 뒤 아래의 term들을 계산함.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq48.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq49.png"> </p>

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq50.png"> Weight, bias 업데이트:

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq51.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq52.png"> </p>

(여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq53.png">은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq54.png">가 매우 작아졌을 때 0으로 나누는 것을 방지하기 위한 값으로 1보다 매우 작은 양수이다.)

---

Momentum 알고리즘과 RMSProp 알고리즘의 차이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq55.png"> 혹은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq56.png">라는 term에 있다고 할 수 있다.

가령 그림 1과 같은 상황에서 RMSProp 알고리즘을 적용시켜준다고 하면, iteration이 진행됨에 따라 gradient의 크기가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq57.png"> 방향으로는 크지 않고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq58.png"> 방향으로는 큰 것을 알 수 있다.

따라서, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq59.png">는 값이 작을 것이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq60.png">는 값이 클 것임을 예상할 수 있다.

그래서 식 (17)과 식 (18)에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq61.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq62.png">로 나눠주는 과정은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq63.png"> 방향으로는 더 빨리 학습이 진행되고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq64.png"> 방향으로는 더 천천히 학습이 진행되도록 조정하는 과정인 것이다.

다시 말해 RMSProp이 가지는 의의는 각 parameter 별로 적절히 learning rate의 크기를 조절해줄 수 있다는데 있다.

# ADAM(Adaptive Moment Estimation)

ADAM은 Gradient Descent with Momentum과 RMSProp을 동시에 사용한 것이다.

ADAM의 알고리즘을 보면 바로 이 말이 무엇인지 이해할 수 있을 것이다.

---

[ADAM 알고리즘]

Initialize <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq65.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq66.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq67.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq68.png">

(여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq69.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq70.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq71.png">의 차원과 같고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq72.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq73.png">의 차원은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq74.png">의 차원과 같음.)

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq75.png"> 번째 iteration에서:

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq76.png"> 현재 batch에 대한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq77.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq78.png">을 계산함. 

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq79.png"> 그 뒤 아래의 term들을 계산함.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq80.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq81.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq82.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq83.png"> </p>


<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq84.png"> Weight, bias 업데이트:

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq85.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq86.png"> </p>

---

[ADAM의 원래 논문(King & Ba, 2015)](https://arxiv.org/pdf/1412.6980.pdf)에서는 다음과 같이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq87.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq88.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq89.png">의 값을 추천해주고 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq90.png"> </p>

# Bias Correction

앞서 확인한 Gradient Descent with Momentum, RMSProp, ADAM은 모두 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq91.png"> 값을 이용해 이전 값들을 서서히 잊어가는 Exponentially Weighted Moving Average (EWMA)의 일종이라고 할 수 있다.

EWMA는 일반적으로 아래와 같은 수식으로 쓸 수 있다.

데이터 포인트를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq92.png">라고 하고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq93.png">이라고 했을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq94.png"> </p>

이다.

일반적으로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq95.png">값은 1보다는 작은 값인데 1에 가까워질 수록 smoothing이 더 많이 된 것이라는 것을 알 수 있다.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/picN.mp4">
  </video>
  <br>
  그림 N. 여러가지 beta값에 따른 EWMA의 결과
</p>

위의 그림 N을 보면 알수있는 것이지만 smoothing이 많이 필요한 경우 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq96.png">값을 키워주게 되면 초기 time의 smoothing 결과가 원래의 데이터 포인트들에 비해 낮게 나온다는 것을 알 수 있다.

이 에러를 잡기 위해 각 iteration의 출력값 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq97.png">을 보정해줄 수 있으며, 보정 식은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq98.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-26-gradient_descent_with_momentum/eq99.png">는 현재 iteration 혹은 time 이다.

[//]:# (이런식으로 보정해주는 이유 적을 것.)

[//]:# (사실 시간이 길어지게 되면 보정 해주나마나 큰 차이가 없음에 대해서도 서술할 것.)

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-26-gradient_descent_with_momentum/picM.mp4">
  </video>
  <br>
  그림 M. 보정 전(빨강) 보정 후(초록)
</p>

# 참고 문헌

* ADAM: A Method for Stochastic Optimization, Kingma & Ba, ICLR, 2015


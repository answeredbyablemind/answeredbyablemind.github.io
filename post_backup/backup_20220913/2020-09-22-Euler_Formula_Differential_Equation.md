---
title: 미분방정식을 이용한 오일러 공식 유도
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200922
tags: 기초수학
---

임의의 복소수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq1.png">를 생각해보자.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq2.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq3.png">는 실수라고 하자.

이 값은 극좌표계를 이용해 표현하면 다음과 같이 표현할 수도 있다.

원점에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq4.png">까지의 거리가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq5.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq6.png">축과 이루는 각도가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq7.png">라고 했을 때,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq8.png"> <br> 식 (1)  </p>

[//]:# (식 1)

이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-22-Euler_Formula_Differential_Equation/pic1.png">
  <br>
  그림 1. 복소평면 상의 점 하나는 복소수 하나를 표현한다.
</p>


여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq9.png">인 경우를 상정해 이 값을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq10.png">라고 하도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq11.png"> <br> 식 (2)  </p>

[//]:# (식 2)

이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq12.png">라는 값은 반지름이 1인 단위 원 상의 점이 된다.


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-22-Euler_Formula_Differential_Equation/pic2.png">
  <br>
  그림 2. 복소평면 상의 단위원 위의 점 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq13.png">. <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq14.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq15.png">축 과의 각도가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq16.png">이다.
</p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq17.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq18.png">에 대해 미분해보면 그 값은 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq19.png"> <br> 식 (3)  </p>

[//]:# (식 3)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq20.png">를 양변에 곱해주자.

그러면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq21.png"> <br> 식 (4)  </p>

[//]:# (식 4)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq22.png"> <br> 식 (5)  </p>

[//]:# (식 5)

임을 알 수 있다.


그런데 식 (5)는 식 (2)와 같으므로, 

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq23.png"> <br> 식 (6)  </p>

[//]:# (식 6)

임을 알 수 있다.

여기서 식 (6)을 약간 변형하여 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq24.png">에 대한 식은 모두 좌변에, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq25.png">에 관한 식은 모두 우변에 모아보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq26.png"> <br> 식 (7)  </p>

[//]:# (식 7)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq27.png"> <br> 식 (8)  </p>

[//]:# (식 8)

 
이제 식 (8)의 양변을 적분시켜주면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq28.png"> <br> 식 (9)  </p>

[//]:# (식 9)

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq29.png"> <br> 식 (10)  </p>

[//]:# (식 10)

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq30.png">는 적분상수이다.

이 식을 다시 한번 쓰면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq31.png"> <br> 식 (11)  </p>

[//]:# (식 11)

라고 할 수 있다.

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq32.png">는 임의의 상수이다.


이제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq33.png">를 결정해보자.

식 (11)은 식 (2)와 같은 것이므로 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq34.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq35.png">인 경우를 생각해보면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq36.png"> </p>

임을 알 수 있다.

따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-09-22-Euler_Formula_Differential_Equation/eq37.png"> </p>

이다.

<center>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/GJspUkAsKF4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>



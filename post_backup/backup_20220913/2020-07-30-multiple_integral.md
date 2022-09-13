---
title: 중적분의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200730
tags: 미적분학
---

<style>
    iframe {
        display: block;
        border-style: none;
        margin: 0 auto;
    }
</style>

<center>
  <iframe width = "390" height = "390" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-07-30-multiple_integral_preview/"></iframe>
  <br>
  중적분의 의미. 함수 아래에 있는 부피들을 잘게 쪼개서 더해주자.
  <br>
  ※ 함수 곡면 아랫부분의 값만을 이용해 부피를 계산해주어 적분값보다는 추정 부피값이 작습니다.

</center>

# 정적분의 개념으로부터 출발

중적분의 개념은 여러가지 방식으로 이해할 수 있겠으나, 가장 시각적으로 이해하기 쉬운 넓이/부피의 계산에 관련된 내용으로부터 출발해보자.

고등학교 시절 구분구적법을 이용해 정적분의 개념을 익혔을 것이다.

그림 1은 구분구적법을 이용해 함수 곡선 아래의 넓이를 구해주는 과정을 보여주고 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/pic1.png">
  <br>
  그림 1. 구분구적법을 이용해 함수 f(x) 아래의 넓이를 구해주는 과정을 통해 정적분의 개념을 얻었다.
  <br>
  그림 출처: 참고문헌 1의 Boas 공업수학 교재 / p.242의 Fig 2.1
</p>

함수가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq1.png">라고 하면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq2.png">만큼의 길이를 곱해줘서 작은 사각형의 넓이를 생각해서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq3.png">부터 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq4.png">까지 더해준다.

수식으로 쓰면 아래와 같이 구분구적법을 이용해 추정된 넓이의 값을 계산할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq5.png"> <br> 식 (1) </p>

[//]:# (식 1)

식 (1)에서 쪼개주는 작은 사각형의 밑변의 길이를 매우 작게하여 얻어진 수없이 많은 사각형의 넓이를 합하면 아래와 같이 좀 더 참값에 가까운 곡선 아래의 넓이를 계산할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq6.png"> <br> 식 (2)  </p>

[//]:# (식 2)


여기서, 미적분의 기본정리를 이용하면

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq7.png"> </p>

이므로, 식 (2)의 적분값은 다음과 같이 계산할 수 있고 알려져 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq8.png"> </p>

# 중적분의 개념으로 확장

정적분의 개념을 확장해서 중적분의 개념으로 확장해보자.

구분구적법을 이용하면 2차원 곡면아래의 부피를 계산할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/pic2.png">
  <br>
  그림 2. 구분구적법을 이용해 함수 f(x, y) 아래의 부피를 구할 수 있다.
  <br>
  그림 출처: 참고문헌 1의 Boas 공업수학 교재 / p.242의 Fig 2.2
</p>

그림 2를 보면 3차원 데카르트 좌표 공간 상에 동그란 밑면을 가진 원통형 물체가 놓여있으며, 그 높이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq9.png">라는 함수로 주어져있다.

그림 1과 그림 2를 비교해보면, 정적분과 중적분의 여러가지 차이를 확인할 수 있는데, 우선 정적분에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq10.png">로 주어졌던 미소길이는 중적분에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq11.png">로 주어져있는 것을 알 수 있다.

또, 정적분에서 생각했던 '작은 사각형의 넓이'인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq12.png">는 중적분에서는 작은 나무 막대기의 부피인 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq13.png">로 개념이 확장된다.

표로 그 내용을 정리하면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/table1.png">
  <br>
  표 1. 정적분과 중적분의 개념 비교
</p>

정적분에서 작은 사각형들의 넓이를 합쳤던 것 처럼 중적분에서는 작은 막대기의 부피를 합쳐볼 것이다.

육면체 막대기의 높이는 (밑면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq14.png"> 높이)로 계산할 수 있다. 이 경우 높이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq15.png">로 주어져있고 거기에 밑면의 넓이는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq16.png">로 주어져 있기 때문에 다음과 같이 작은 막대기의 부피를 생각해볼 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq17.png"> </p>

그런 다음, 정적분 계산을 할 때 주어진 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq18.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq19.png">까지의 범위에 대해 작은 사각형의 넓이를 더해준 것 처럼, 중적분에서는 주어진 적절한 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq20.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq21.png">의 위치에 대해 작은 막대기들의 부피를 다 더해주도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq22.png"> </p>

그런 다음, 정적분에서와 마찬가지로 극한의 개념을 이용해 다음과 같이 부피값을 수렴시켜줄 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq23.png"> </p>

## 중적분에서 적절한 x, y의 위치란?

그림 1에서 정적분에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq24.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq25.png">까지 변했다.

그런데, 그림 2에서 볼 수 있듯이 중적분과 같이 밑면의 모양이 단순하지 않은 경우 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq26.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq27.png">의 범위를 어떻게 정해야 할까?

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq28.png"> <br> 식 (8) </p>

[//]:# (식 8)


그림 3과 같이 기둥의 밑면을 x축으로 정사영시켰다고 생각해보자. 그렇게 했을 때 결정되는 가장 양 끝에 있는 값들을 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq29.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq30.png">라고 하자.

또, 밑면의 가장자리를 x축과 수평한 선을 따라 절반으로 나누고 한쪽을 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq31.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq32.png">라고 각각 이름 붙이자.

글로 설명한 것을 아래 그림을 참고해 이해해보도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/pic3.png">
  <br>
  그림 3. xy 평면상에 있는 임의의 형태의 밑면에 대해 x, y의 범위를 결정하는 방법
  <br>
  그림 출처: 참고문헌 1의 Boas 공업수학 교재 / p.242의 Fig 2.2
</p>

정적분에서는 우리가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq33.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq34.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq35.png">까지 바꿔가면서 합을 계산했다고 하면,

중적분에서는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq36.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq37.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq38.png">까지 쌓여가고, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq39.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq40.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq41.png">까지 쌓여간다고 생각하면 위 식 (8)의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq42.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq43.png">의 적분 범위를 결정할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq44.png"> </p>

이렇게 구성된 식을 더 풀어 생각해보면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq45.png">에 대한 식이 모두 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq46.png">에 대한 함수로 결정되어 있기 때문에 결국 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq47.png">에 대한 적분으로 바뀌게 되어 중적분을 정적분 계산하듯이 풀어낼 수 있게 된다.

# 중적분 문제 예시

이번에는 실제로 중적분을 계산할 수 있도록 예제 문제를 하나 풀어보도록 하자.

아래 그림 4에서 처럼 평면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq48.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq49.png"> 평면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq50.png"> 평면, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq51.png"> 평면으로 둘러싸인 고형물의 부피를 계산해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/pic4.png">
  <br>
  그림 4. 중적분 계산 예제
  <br>
  그림 출처: 참고문헌 1의 Boas 공업수학 교재 / p.243의 Fig 2.3
</p>


위에서 구분구적법을 이용해 설명한 것 처럼 중적분 값을 한마디로 적으면 아래 식과 같을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq52.png"> <br> 식 (10) </p>

[//]:# (식 10)

여기서 이중적분 기호 아래 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq53.png">라고 표현한 것은 그림 4에 회색으로 칠해진 삼각형을 밑면으로하여 이중적분을 수행해주자는 의미이다.

그림 4에서 밑면의 삼각형은 x, y 좌표축과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq54.png">라는 평면으로 구성되어 있으므로, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq55.png">가 쌓이는 범위는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq56.png">이라고 할 수 있으며,

<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq57.png"> 축 방향으로 쌓일 때는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq58.png"> 값이 가장 작을 때는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq59.png">이며, 가장 클 때는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq60.png">라는 것을 알 수 있다.

따라서, 식 (10)은 다음과 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq61.png"> </p>

이중적분 중 내부에 있는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq62.png">에 대한 적분을 먼저 전개하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq63.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq64.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq65.png"> </p>

이제 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq66.png">에 대해 정적분 값을 계산해주자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq67.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-30-multiple_integral/eq68.png"> </p>

즉, 구해주고자하는 고형물의 부피는 5/3이라는 것을 이중적분을 통해서 계산할 수 있다.


# 참고 문헌

본 article에서 사용된 그림은 아래의 참고 문헌 1에서 가져왔습니다.

1. Mathematical Methods in the Physical Sciences / Mary L. Boas / 3e


<iframe width="560" height="315" src="https://www.youtube.com/embed/d_8UWJSqmpY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

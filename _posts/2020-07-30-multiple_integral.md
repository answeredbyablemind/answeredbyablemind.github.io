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

{% raw %}
<center>
  <iframe width = "390" height = "450" frameborder = "0" src="https://angeloyeo.github.io/p5/2020-07-30-multiple_integral_preview/"></iframe>
  <br>
  중적분의 의미. 함수 아래에 있는 부피들을 잘게 쪼개서 더해주자.
  <br>
  ※ 시각적인 효과를 위한 인위적인 조작으로 계산된 부피추정값과 시각적 결과물은 약간의 차이를 보입니다.
</center>

# 정적분의 개념으로부터 출발

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-07-30_Multiple_Integral/pic1.png">
  <br>
  그림 1. 구분구적법을 이용해 함수 f(x) 아래의 넓이를 구해주는 과정을 통해 정적분의 개념을 얻었다.
</p>

함수가 $y = f(x)$라고 하면, $\Delta x$만큼의 길이를 곱해줘서 작은 사각형의 넓이를 생각해서 $a$부터 $b$까지 더해준다.


approximated area

$$\sum_{x=a}^{b}f(x)\Delta x$$

$$\Rightarrow \lim_{\Delta \rightarrow 0}\sum_{x=a}^{b}f(x)\Delta x=\int_{a}^{b}f(x)dx$$

미적분의 기본정리를 이용하면

$$\frac{d}{dx}F(x) = f(x)$$

이므로, 적분값은 다음과 같이 계산할 수 있다.

$$식(x) = F(b) - F(a)$$

# 중적분의 개념으로 확장

정적분의 개념을 확장해서 중적분의 개념으로 확장해보자.

/////// 그림 2: 중적분 Boas Fig 2.2 같은 느낌으로 그림 그릴 것. ////////

그림 2를 보면 3차원 데카르트 좌표 공간 상에 동그란 밑면을 가진 원통형 물체가 놓여있다.

그리고 이 원통형 물체의 높이는 $z=f(x,y)$라는 함수로 주어져있다.

그림 1과 그림 2를 비교해보면, 정적분과 중적분의 여러가지 차이를 확인할 수 있는데, 우선 정적분에서 $\Delta x$로 주어졌던 미소길이는 중적분에서는 $\Delta A = \Delta x \Delta y$로 주어져있는 것을 알 수 있다.

또, 정적분에서 생각했던 '작은 사각형의 넓이'인 $f(x)\Delta x$는 중적분에서는 작은 나무 막대기의 부피인 $f(x,y)\Delta x \Delta y$로 개념이 확장된다.

표로 그 내용을 정리하면 다음과 같다.

<center>

| 구분          | 정적분         | 중적분   |
| ------------- |:-------------:| -----:|
| 미소길이/면적  | $\Delta x$    | $\Delta x \Delta y = \Delta A$ |
| 합치는 대상 | 작은 사각형      |   작은 막대기의 부피 |
| 함수의 형태 | $y=f(x)$      |    $z=f(x,y)$ |

</center>

정적분에서 작은 사각형들의 넓이를 합쳤던 것 처럼 중적분에서는 작은 막대기의 부피를 합쳐볼 것이다.

육면체 막대기의 높이는 $밑면 \times 높이$로 계산할 수 있다. 이 경우 높이는 $f(x,y)$로 주어져있고 거기에 밑면의 넓이는 $\Delta x \Delta y$로 주어져 있기 때문에 다음과 같이 작은 막대기의 부피를 생각해볼 수 있다.

$$f(x,y)\Delta x\Delta y$$

그런 다음, 정적분 계산을 할 때 주어진 $a$에서 $b$까지의 범위에 대해 작은 사각형의 넓이를 더해준 것 처럼, 중적분에서는 주어진 적절한 $x$와 $y$의 위치에 대해 작은 막대기들의 부피를 다 더해주도록 하자.

$$\sum_x\sum_y f(x,y)\Delta x \Delta y$$

그런 다음, 정적분에서와 마찬가지로 극한의 개념을 이용해 다음과 같이 부피값을 수렴시켜줄 수 있다.

$$\lim_{\Delta x \rightarrow 0}\lim_{\Delta y \rightarrow 0}\sum_x\sum_y f(x,y)\Delta x \Delta y = \iint_Af(x,y)dxdy$$

## 중적분에서 적절한 x, y의 위치란?

정적분에서는 $x=a$에서 $x=b$까지 변했다.

중적분과 같이 밑면의 모양이 단순하지 않은 경우 $x$와 $y$의 범위를 어떻게 정해야 할까?

$$\iint_Af(x,y)dxdy = \int_{x=?}^{?}\int_{y=?}^{?}f(x,y)dxdy$$


그림 2를 봤을 때, 밑면을 x축으로 정사영시켰다고 생각해보자. 그렇게 했을 때 결정되는 가장 양 끝에 있는 값들을 각각 $x=a$, $x=b$라고 하자.

또, 밑면의 가장자리를 x축과 수평한 선을 따라 절반으로 나누고 한쪽을 $y_1(x)$, $y_2(x)$라고 각각 이름 붙이자.

글로 설명한 것을 아래 그림을 참고해 이해해보도록 하자.

/////// 그림 3: 그림 2에서 위 내용을 설명할 수 있도록 그림 그릴 것. ////////

정적분에서는 우리가 $x$는 $a$에서 $b$까지 바꿔가면서 합을 계산했다고 하면,

중적분에서는 $x$는 $a$에서 $b$까지 쌓여가고, $y$는 $y_1(x)$에서 $y_2(x)$까지 쌓여간다고 생각하면 위 식 (y)의 $x$와 $y$의 적분 범위를 결정할 수 있게 된다.

$$\iint_Af(x,y)dxdy = \int_{x=a}^{b}\int_{y=y_1(x)}^{y_2(x)}f(x,y)dxdy$$

이렇게 구성된 식을 더 풀어 생각해보면 y에 대한 식이 모두 x에 대한 함수로 결정되어 있기 때문에 결국 $x$에 대한 적분으로 바뀌게 되어 중적분을 정적분 계산하듯이 풀어낼 수 있게 된다.

# 중적분 문제 예시



<iframe width="560" height="315" src="https://www.youtube.com/embed/d_8UWJSqmpY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% endraw %}

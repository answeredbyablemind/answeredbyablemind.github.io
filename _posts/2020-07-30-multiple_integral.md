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
</center>

# 정적분의 개념으로부터 출발

/////// 그림 1: 정적분 Boas Fig 2.1 같은 느낌으로 그림 그릴 것. ////////

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



<iframe width="560" height="315" src="https://www.youtube.com/embed/d_8UWJSqmpY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% endraw %}
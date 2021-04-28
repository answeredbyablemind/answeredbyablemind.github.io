---
title: 오일러 방법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210429
tags: 미분방정식
---

<center>
  <iframe width = "500" height = "500" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-29-Euler_method/"></iframe>
  <br>
  오일러 방법을 통한 dy/dx = y의 솔루션으로의 근사치 플롯
  <br>
  <br>
</center>

# Prerequisites

미분방정식에 대한 오일러 방법을 이해하시기 위해선 다음의 내용을 알고 오시는 것이 좋습니다.

* 미분의 의미

# 미분 방정식이 말하는 것

미분 방정식. 처음 이 개념을 들어본지도 10년이 지났지만 여전히 미분 방정식은 어렵게 느껴진다.

몇 번을 이해해보기 위해서 책을 들여다 보았지만 매번 여러가지 풀이법에만 매몰되어 공부하다보니 미분 방정식이 진짜 뭐였는지 기억이 가물가물해졌다고나 할까.

미분 방정식은 함수와 도함수가 포함된 방정식을 말한다.

다시 말해, 예를 들어 아래와 같은 것은 미분방정식으로 볼 수 있다.

$$\frac{dy}{dx}= f(x)$$

$$\frac{dy}{dx} = f(x,y)$$

$$x_1\frac{\partial y}{\partial x_1}+x_2\frac{\partial y}{\partial x_2} = y$$


식 (1)을 조금 더 풀어서 더 쉬운 미분방정식 예시를 들어보면 다음과 같은 것 또한 미분방정식이라 볼 수 있다는 얘기이다.

$$\frac{dy}{dx} = x$$

식 (4)에 있는 좌변은 변화율이고,식 (5)에 있는 우변은 정의역의 값이다.

다시 말해, 식 (4)의 미분 방정식은 함수 위의 순간 순간의 변화가 입력해준 $x$ 값에 따라 어떻게 다른지를 말해주고 있는 것이라고 할 수 있다.

일반적인 방정식과의 차이점을 짚어보자면 일반적인 방정식은 함수값 간의 매칭을 보여주지만, 미분 방정식은 함수값의 변화와 함수값의 매칭을 연결시켜주고 있다고 할 수 있을 것 같다.

여기서 핵심 포인트는 '함수값의 변화'와 '함수값'의 매칭을 보여준다는 점인데, 과연 미분 방정식에서 말하는 '변화'란 무엇일까?

# 변화: 다음 포인트 함수값과의 차이

식 (4)를 다시 한번 보자. 식 (4)는 생각할 수 있는 미분 방정식 중 가장 쉬운 것이라고 볼 수 있을 것 같다.

$$\frac{dy}{dx} = x \notag$$

미분 방정식이 함수값의 변화에 관한 것이라고 하면 식 (4)에서는 어떤 변화를 보여줄까?

그런데, 식 (4)에는 미분 계수 $dy/dx$가 들어있다보니 식이 어려워 보일 수 있다. 미분 계수를 원래의 정의대로 돌려놓고 생각해보자.

$y=f(x)$라고 했을 때,

$$식(4) \Rightarrow \lim_{h\rightarrow 0}\frac{f(x+h)-f(x)}{h}=x % 식 (5)$$

오히려 더 복잡해진 것 같다. 그런데, 여기서도 극한기호도 떼버리고 생각해보자. $h$는 매우 작아지는 값이라는 의미에서 극한 기호를 적어놓았는데, 우리는 조금 큰 $h$부터 점점 $h$를 줄여가면서 식 (5)의 의미를 생각해보자.

## $h=1$인 경우

$$식(5)\Rightarrow f(x+1)-f(x) = x % 식 (6)$$

$$\Rightarrow f(x+1) = x + f(x) % 식 (7)$$

즉, 식 (7)이 말하는 것은 일종의 점화식이다. 만약, $f(0)=0$이라는 초기값을 설정해보면 다음과 같이 $f(1), f(2), \cdots$을 구할 수 있다.


$$f(1) = 0 + f(0) = 0 + 0 = 0 % 식 (8)$$

$$f(2) = 1 + f(1) = 1+ 0 = 1 % 식 (9)$$

$$f(3) = 2 + f(2) = 2 + 1 = 3 % 식 (10)$$

$$f(4) = 3 + f(3) = 3 + 3 = 6 % 식 (11)$$

$$\vdots\notag$$

반대로 f(-1)과 같은 값들도 구할 수 있다. 식 (7)을 $x$를 좌변으로 옮겨 다시 써주면,

$$f(x) = f(x+1) - x % 식 (12)$$

이므로,

$$\Rightarrow f(x-1) = f(x) - (x-1) % 식 (13)$$

이다. 따라서,

$$f(-1) = f(0) - (-1) = 0 + 1 = 1 % 식 (14)$$

$$f(-2) = f(-1) - (-2) = 1 + 2 = 3  % 식 (15)$$

$$f(-3) = f(-2) - (-3) = 3 + 3 = 6  % 식 (16)$$

일부 값을 표로 정리하면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic2.png">
</p>

그리고 이것을 그래프로 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic1.png">
  <br>
  그림 1. 식 (7) 점화식의 solution을 그래프에 옮긴 것
</p>

## $h = 0.5$인 경우

$h=0.5$라면 식 (5)는 다음과 같이 변하게 될 것이다.

$$식(5)\Rightarrow \frac{f(x+0.5)-f(x)}{0.5} = x % 식 (17)$$

$$\Rightarrow f(x+0.5) = 0.5x + f(x) % 식 (18)$$

식 (7)과 마찬가지로 식 (18)역시도 점화식의 개념으로 생각해볼 수 있으며 $f(0)=0$이라는 초기 조건을 이용하면 $f(0.5), f(1), f(1.5)$ 등의 값을 얻을 수 있다.

마찬가지로 아래와 같이 식 (18)을 조금 조정하면 $f(-0.5), f(-1)$ 등의 값 또한 얻을 수 있다.

$$\Rightarrow f(x-0.5)= f(x)  - 0.5 (x-0.5) % 식 (19)$$

일부 값을 표로 정리하면 아래와 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic3.png">
</p>

그리고 이것을 그래프로 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic4.png">
  <br>
  그림 2. 식 (18) 점화식의 solution을 그래프에 옮긴 것
</p>

## $h=0.1$인 경우

$h=0.1$인 경우에도 위의 방법을 그대로 따라가서 점화식을 만들면 아래와 같으며,

$$식(5)\Rightarrow \frac{f(x+0.1)-f(x)}{0.1} = x % 식 (20)$$

같은 방법을 통해 그래프로 점화식의 solution을 그리면 다음과 같다.


<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic5.png">
  <br>
  그림 3. 식 (20) 점화식의 solution을 그래프에 옮긴 것
</p>

## 식 (4)의 진짜 solution과 그림 1-3의 비교

그런데, 식 (4)는 다시 이렇게도 쓸 수 있는 것이다.

$$식(4) \Rightarrow f'(x)= x % 식 (21) $$

식 (21)은 양변을 적분하고 $f(0)=0$이라는 초기값을 넣어주면 다음과 같은 결과를 얻을 수 있다.

$$f(x) = \frac{1}{2}x^2$$

즉, $f(x)$는 $\frac{1}{2}x^2$가 정답이었다고 할 수 있는데, 이 값을 그림 1~3에서 그린 값과 비교해보자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-29-Euler_method/pic6.png">
  <br>
  그림 4. 그림 1~3에서 표현된 점화식 solution과 true solution 간의 비교
</p>

그림 4를 보면 $h$의 값이 작을 수록 점화식으로 계산한 solution과 true solution은 비슷한 결과를 보여준다는 것을 알 수 있다.

# Euler's method

위의 내용에서 step by step으로 설명한 방법이 오일러 방법이다[^1].

[^1]: 좀 더 정확히는 [테일러 급수](https://angeloyeo.github.io/2019/09/02/Taylor_Series.html)를 이용해 유도할 수 있다.

<p align = "center">
  <img width = "600" src = "https://upload.wikimedia.org/wikipedia/commons/a/ae/Euler_method.png">
  <br>
  그림 5. 오일러 방법에 대한 시각적 설명
  <br>
  그림 출처: <a href = "https://ko.wikipedia.org/wiki/%EC%98%A4%EC%9D%BC%EB%9F%AC_%EB%B0%A9%EB%B2%95"> 위키피디아: 오일러 방법 </a>
</p>

오일러 방법은 미분방정식을 수치해법으로 풀어주는 방법인데, 우리에게 몇 가지 점을 시사해준다.

1. 미분방정식의 solution을 구한다는 것은 미분방정식을 만족해주는 $f(x)$를 구하는 것이다.
2. 미분 방정식은 함수값의 변화에 대해 얘기해주고 있으며, 이것은 지금 포인트와 다음 포인트에서의 함수값 차이를 말해준다.
3. 시작점만 하나 특정할 수 있다면 미분방정식에서 말해주는 함수값 변화 룰에 따라 solution curve 하나를 구할 수 있다.
4. 지금 포인트와 다음 포인트 간의 간격이 좁을 수록 solution curve는 true solution에 가까워진다.


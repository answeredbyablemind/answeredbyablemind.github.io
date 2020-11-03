---
title: 밑이 음수인 지수함수
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190912
tags: 기초수학
---

<p align = "center">
<img widht = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic0.png">
<br>
밑이 음수인 지수 함수 y=(-1.5)^x. 왼쪽 plot이 정의역, 오른쪽 plot이 치역을 나타내고 있다.
</p>

**※ 이 article에서는 복소수가 single-valued라고 가정하겠습니다.** 

# 지수 함수의 정의

일반적으로 지수함수는 밑이 양수인 경우에 대해 취급한다. 위키피디아에서는 다음과 같이 지수함수를 정의하고 있다.

| DEFINITION 1. 지수 함수 |
| --------- |
|$a$를 양의 상수, $x$를 모든 실수 값을 취하는 변수라고 할 때,<br><center>$$y = a^x$$</center>로 주어지는 함수를 말한다.|

우리가 흔히 아는 지수함수를 시각화 하자면 다음과 같다.

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic1.png">
<br>
그림 1. 일반적인 지수 함수. 밑이 1보다 큰 경우와 0에서 1 사이인 경우의 예시
</p>

생각해보면 밑이 음수인 경우 실수 지수를 가지는 지수함수의 값은 어떻게 표현하면 좋을까?

가령, $y=(-1)^x$만 보더라도 $x$가 정수인 경우는 곱셈의 정의를 이용해 쉽게 처리하겠지만, 지수 $x$가 실수인 경우에는 그 처리가 어렵다.

그런데 잘 생각해보면 $y=(-1)^x$에서 $x=1/2$인 경우 우리는 이 값이 허수 $i$라는 사실을 알고 있다. 즉, 우리는 밑이 음수인 지수함수에 대해서는 복소수에서 그 해법을 찾아볼 수 있을 것 같다.

# 수에 대한 이해: 크기와 방향

## 좌, 우 방향을 가지는 수: 정수

우리는 음수 밑을 가지는 지수함수에 대해 생각해보고자 하므로, 음수에 대해 조금 더 생각해볼 필요가 있다.

음수는 아래의 그림2와 같이 분해해서 생각할 수 있다.

<p align = "center">
<img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic2.png">
<br>
그림 2. 음수는 방향과 크기를 모두 가지고 있다.
</p>

<p align = "center">
<img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic3.gif">
<br>
그림 3. -1.5의 방향과 크기를 모두 나타낸 애니메이션.
</p>

## 2차원 평면 상의 모든 방향을 가지는 수: 복소수

그런데 방향은 꼭 좌, 우만 있는 것은 아니다. 2차원 평면 상에서는 상, 하, 좌, 우 등 360도로 수많은 방향이 있을 수 있다. 다시 말해, 수(여기서는 복소수를 지칭)는 크기와 방향을 모두 가질 수 있다.

2차원 평면 상의 모든 방향을 표시하기 위해선 직교하는 두 개의 방향이 있으면 되는데, 이전 글 중 허수와 관련된 글[^1]을 보면 잘 알 수 있겠지만 허수는 실수와 서로 직교하는 수 체계이기 때문에 실수축과 허수축을 도입해 2차원 상의 수인 복소수를 표현할 수 있을 것이다.

[^1]: https://angeloyeo.github.io/2019/06/15/imaginary_number.html


<p align = "center">
<img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic4.png">
<br>
그림 4. 실수축과 허수축을 이용해 구성한 복소 평면. 복소 평면에선 2차원 공간 상의 어떤 방향의 회전이라도 표현될 수 있다.
</p>

이로써 2차원 공간 상에서의 회전을 모두 표현할 수 있게 되는데, 이 때 유용한 공식은 오일러 공식이다.

오일러 공식은 크기 $r$과 $x$축으로부터의 각도 $\theta$만큼을 가지는 숫자를 표현하기에 유용하다.

$$r e^{i\theta} = r (\cos\theta + i \sin\theta)$$

<p align = "center">
<img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic5.png">
<br>
그림 5. 오일러 공식을 이용하면 크기와 방향을 이용해 복소수를 표현하기에 용이하다.
</p>

다시 음수로 돌아와서, 복소 평면과 오일러 공식을 이용해 $-1$을 표현하자면, 크기는 1이고 각도는 $\pi \space rad$이므로 아래의 그림 6과 같이 표현할 수 있을 것이다.

<p align = "center">
<img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic6.png">
<br>
그림 6. 복소 평면에서 -1은 크기는 1이고, 실수축으로부터의 각도는 180'(pi 라디안)인 숫자이다.
</p>

# 밑이 음수인 지수함수

## -1의 x 승은? (x는 실수)

오일러 공식을 이용해 $-1$을 쓰면 $e^{i\pi}$와 같으므로, $(-1)^x$는 다음과 같이 쓸 수 있다.

$$(-1)^x = (e^{i\pi})^x = e^{ix\pi}$$

식 3을 해석할 때, 오일러 공식을 이용하면 $(-1)^x$는 $x$축으로부의 각도가 $x \pi \space rad$ 인 점의 위치를 나타낸다고 할 수 있다.

<p align = "center">
<img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic7.gif">
<br>
그림 7. -1의 x승을 표현한 그래프. 왼쪽의 plot이 정의역, 오른쪽의 plot이 치역이다.
</p>

## -1.5의 x 승은? (x는 실수)

마찬가지 방법을 이용해서 밑이 -1이 아니라 -1.5이면 어떨까?

$$(-1.5)^x = (1.5 \times (-1))^x = (1.5 \times e^{i\pi})^x = 1.5^x \times e^{ix\pi}$$

식 4를 자세히 보면 가장 우측 식에서 $1.5^x$는 x가 커질 수록 값이 커지고, $e^{ix\pi}$는 식 3 및 그림 7에서 보았듯이 x의 크기에 따라 회전한다.

따라서, 식 4의 결과를 보면 x가 커질 수록 값이 커지면서 회전하는 결과를 보일 것이다.

<p align = "center">
<img width = "800" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic8.gif">
<br>
그림 8. -1.5 의 x승을 표현한 그래프. 왼쪽의 plot이 정의역, 오른쪽의 plot이 치역이다.
</p>

그림 8의 시간에 따른 흐름을 색깔로 나타내면 이 article의 맨 처음과 같은 그림을 얻을 수 있게 되는 것이다.

<p align = "center">
<img widht = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic0.png">
<br>
그림 9. -1.5의 x승을 표현한 그래프. 시간에 따른 흐름을 색깔을 이용해 표시했다.
</p>

## 또 다른 방식의 시각화

지금까지 밑이 음수인 지수함수를 시각화 하기 위해선 정의역과 치역을 따로 분리시켰는데, 

다른 방법을 이용해 시각화 하면 정의역과 치역을 한번에 표시해줄 수도 있다.

다만 이 방법에서는 치역의 실수부와 허수부를 따로 그려야 한다.

가령 $y=(-1.5)^x$의 그래프는 아래의 그림 10과 같다.

<p align = "center">
<img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic10.png">
<br>
그림 10. 정의역과 치역을 한번에 표현할 수 있는 밑이 음수인 지수함수의 시각화
</p>

<center>
  
<iframe width="560" height="315" src="https://www.youtube.com/embed/KlAW7xkwDRo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>

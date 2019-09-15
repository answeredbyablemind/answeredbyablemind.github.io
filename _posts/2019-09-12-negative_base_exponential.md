---
title: 밑이 음수인 지수함수
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190912
tags: 기초수학
---

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic0.png">
<br>
밑이 음수인 지수 함수. 왼쪽 plot이 정의역, 오른쪽 plot이 치역을 나타내고 있다.
</p>

※ 이 article에서는 복소수가 single-valued라고 가정하겠습니다.

# 지수 함수의 정의

일반적으로 지수함수는 밑이 양수인 경우에 대해 취급한다. 위키피디아에서는 다음과 같이 지수함수를 정의하고 있다.

| DEFINITION 1. 지수 함수 |
| --------- |
|$a$를 양의 상수, $x$를 모든 실수 값을 취하는 변수라고 할 때,<br>$$y = a^x$$<br>로 주어지는 함수를 말한다.|

우리가 흔히 아는 지수함수를 시각화 하자면 다음과 같다.

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic1.png">
<br>
그림 1. 일반적인 지수 함수. 밑이 1보다 큰 경우와 0에서 1 사이인 경우의 예시
</p>

생각해보면 밑이 음수인 경우 실수 지수에 대한 처리를 하기 어려운게 사실이다.

가령, $y=(-1)^x$만 보더라도 $x$가 정수인 경우는 곱셈의 정의를 이용해 쉽게 처리하겠지만, 지수 $x$가 실수인 경우에는 그 처리가 어렵다.

그런데 잘 생각해보면 $y=(-1)^x$에서 $x=1/2$인 경우 우리는 이 값이 허수 $i$라는 사실을 알고 있다. 즉, 우리는 밑이 음수인 지수함수에 대해서는 복소수에서 그 해법을 찾아와야 할 것이다.

# 수에 대한 이해: 크기와 방향

우리는 음수 밑을 가지는 지수함수에 대해 생각해보고자 하므로, 음수에 대해 조금 더 생각해볼 필요가 있다.

음수는 아래의 그림2와 같이 분해해서 생각할 수 있다.

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic2.png">
<br>
그림 2. 음수는 방향과 크기를 모두 가지고 있다.
</p>

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic3.gif">
<br>
그림 3. 음수의 방향과 크기를 모두 나타낸 애니메이션.
</p>

그리고, 방향은 꼭 좌, 우만 있는 것은 아니다. 2차원 평면 상에서는 상, 하, 좌, 우 등 360도로 수많은 방향이 있을 수 있다. 다시 말해, 수(여기서는 복소수를 지칭)는 크기와 방향을 모두 가질 수 있다.

2차원 평면 상의 모든 방향을 표시하기 위해선 직교하는 두 개의 방향이 있으면 되는데, 이전 글 중 허수와 관련된 글[^1]을 보면 잘 알 수 있겠지만 허수는 실수와 서로 직교하는 수 체계이기 때문에 실수축과 허수축을 도입해 2차원 상의 수인 복소수를 표현할 수 있을 것이다.

[^1]: https://angeloyeo.github.io/2019/06/15/imaginary_number.html


<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic4.png">
<br>
그림 4. 실수축과 허수축을 이용해 구성한 복소 평면. 복소 평면에선 어떤 방향의 회전이라도 표현될 수 있다.
</p>

이로써 2차원 공간 상에서의 회전을 모두 표현할 수 있게 되는데, 이 때 유용한 공식은 오일러 공식이다.

오일러 공식은 크기 $r$과 $x$축으로부터의 각도 $\theta$만큼을 가지는 숫자를 표현하기에 유용하다.

$$r e^{i\theta} = r (\cos\theta + i \sin\theta)$$

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic5.png">
<br>
그림 5. 오일러 공식을 이용하면 크기와 방향을 이용해 복소수를 표현하기에 용이하다.
</p>

<p align = "center>
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-12_negative_base_exponential/pic6.png">
<br>
그림 6. 복소 평면에서의 -1의 위치
</p>


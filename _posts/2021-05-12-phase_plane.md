---
title: 위상 평면(phase plane)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210512
tags: 미분방정식
---

<p align = "center">
  <iframe width= "101%" height = "650" src = "https://mathlets.org/javascript/build/vectorFields.html" frameborder = "0"></iframe>
  <br>
  a, b, c, d 값을 조정해가며 phase plane의 변화를 확인해보자.
  <br>
  출처: MIT Mathlets, 
  <a href = "https://mathlets.org/mathlets/vector-fields/">https://mathlets.org/mathlets/vector-fields/</a>
</p>

# Prerequisites

위상 평면에 대한 내용을 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [자연상수 e의 의미](https://angeloyeo.github.io/2019/09/04/natural_number_e.html)
* [허수의 존재 의미에 대하여](https://angeloyeo.github.io/2019/06/15/imaginary_number.html)
* [밑이 음수인 지수 함수](https://angeloyeo.github.io/2019/09/12/negative_base_exponential.html)
* [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)
* [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [1계 선형 미분방정식의 해법](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)
* [고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)

# 위상 평면 소개

2원 1계 미분방정식이나 2계 미분방정식을 해석할 때 위상평면을 이용한 해석은 미분방정식의 해의 특성을 파악하는데 굉장히 중요한 역할을 한다.

아래와 같은 2원 1계 미분방정식에서 

$$\begin{cases}
  \dfrac{dx}{dt} = f(x, y) \\\\
  \dfrac{dy}{dt} = g(x, y)
\end{cases} % 식 (1)$$

위상 평면은 2차원(혹은 3차원) 실수 평면에서 모든 점 $(x, y)$에 대한 기울기를 평면에 표현할 수 있다는 사실을 바탕으로 그릴 수 있다.

다시 말해, $(x, y)$에서의 기울기 $dy/dx$는

$$\frac{dy}{dx}=\frac{dy/dt}{dx/dt}$$

와 같이 계산할 수 있다는 점을 감안하면 모든 $(x, y)$에서 기울기를 계산해 그려줄 수 있다.

가장 기본적인 2원 1계 미분방정식은 다음과 같은 것인데,

$$\begin{cases}
  \dfrac{dx}{dt} = x \\\\
  \dfrac{dy}{dt} = y
\end{cases} % 식 (2)$$

식 (2)의 phase plane을 그리면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic1.png">
  <br>
  그림 1. 식 (2)의 phase plane. 화살표는 단위행렬의 고유벡터, 두꺼운 검은선은 고유벡터 방향으로의 원점을 통과하는 직선을 나타낸 것임.
</p>

또 다른 2원 1계 미분방정식은 다음과 같은 것도 있을 수 있다.

$$\begin{cases}
  \dfrac{dx}{dt} = y \\\\
  \dfrac{dy}{dt} = x
\end{cases} % 식 (3)$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic2.png">
  <br>
  그림 2. 식 (3)의 phase plane. 화살표는 단위행렬의 고유벡터, 두꺼운 검은선은 고유벡터 방향으로의 원점을 통과하는 직선을 나타낸 것임.
</p>

## 위상 평면을 손으로 그리는 방법

그림 1과 그림 2의 위상 평면이 식 (2)와 식 (3)으로부터 어떻게 얻어졌을까?

당연히 컴퓨터로 그린 것이지만, 우리는 대략적인 원리는 파악하고 있어야 위상평면에 대해서 더 잘 이해할 수 있다.

기본적으로 식 (1)와 같은 연립 미분방정식이 있다고 생각해보자.

임의의 점 $(x,y)$에 대해 식 (1)을 통해 $dx/dt$와 $dy/dt$를 계산할 수 있다.

여기서 $dt$를 적절한 크기의 $\Delta t$로 바꿔 생각하면 적절한 크기의 $\Delta x$와 $\Delta y$를 계산할 수 있다.

가령, 식 (3)을 예로 들어보면 (2, -1)이라는 점에서는 $dx/dt = -1$, $dy/dt = 2$ 가 된다.

이제부터는 화살표를 그려야 한다. 화살표가 의미하는 것은 해당 좌표에서 미분계수가 말해주는 방향이다.

미분계수 $dx/dt$나 $dy/dt$는 모두 $\Delta x / \Delta t$나 $\Delta y / \Delta t$에 대한 극한값으로 정의된다.

따라서, 화살표를 그리는 기준이 되는 $\Delta t$ 값을 정해보자. 이 값만 주어진다면 $\Delta x$와 $\Delta y$를 얻어낼 수 있을 것이다.

만약 $\Delta t = 0.1$이라고 잡는다면 $\Delta x = dx/dt * \Delta t = -0.1$, $\Delta y = dy/dt * \Delta t = 0.2$이므로,

(2, -1)이라는 점에서는 (2, -1)으로부터 $(2+\Delta x, -1+ \Delta y)=(1.9, -0.8)$점으로 화살표를 이어주면 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic3.png">
  <br>
  그림 3. 식 (3)의 위상 평면을 그리는 과정 중 (2, -1)이라는 점에서 해당되는 벡터를 그린 결과물
</p>

이와 같은 방법으로 모든 좌표에서 화살표를 그려주면 위상평면이 그려지는 것이다.

(물론 손으로 그리는 방법은 매우 시간 소모가 많이 되므로 컴퓨터로 그리길 추천한다.)

## 화살표를 연속적으로 그리게 되면?

이번에는 $\Delta t$를 0.1에서 0.5로 조금 더 크게 해서 연속적으로 화살표를 그려보도록 하자.

위에서 설명한 것과 같은 방식으로 (2, -1)이라는 점으로부터 $\Delta t = 0.5$로 설정한 상태에서 여러번 시간 스텝 진행에 따른 $(x, y)$ 좌표의 위치를 그려보면 아래와 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic4.png">
  <br>
  그림 4. (2, -1)이라는 점으로부터 시작해 $\Delta t = 0.5$ 인 경우에 5회 이동해 본 경로
</p>

위의 그림 4를 보면 (2, -1)에서 $A$를 곱해가면서 계산이 진행됨에 따라 한쪽 검은색 라인을 따라 0에 가까워지고 다른 한쪽 검은색 라인을 따라 0에서 멀어지는 것을 볼 수 있다.

이러한 결과는 비단 (2, -1)에서 뿐만 아니라 이 평면 위의 어떤 점을 잡더라도 비슷한 경향을 보이게 된다는 것을 알 수 있다.

아래의 그림에서는 4개의 임의의 점을 선택하고 5회씩 이동해본 경로를 그려보았다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic5.png">
  <br>
  그림 5. 임의의 네 개의 점에서부터 시작해 $\Delta t = 0.5$ 인 경우에 5회 이동해 본 경로
</p>

네 개의 포인트 중 어떤 경우더라도 한쪽 검은색 라인을 따라 원점에 가까워지고 다른 한쪽 검은색 라인을 따라 원점에서 멀어지는 것을 볼 수 있다.

그렇다면 우리가 생각해야 하는 것은 검은색 라인은 무엇이고, 어떤 경우에 원점에 가까워지고 어떤 경우에는 원점에서 멀어지려고 할까?

# 위상평면과 행렬

식 (1)~(3)을 통해 볼 수 있는 것은 식 (1)의 $f(x,y)$ 혹은 $g(x,y)$를 어떻게 정하는가에 따라서 위상 평면의 모양이 결정된다는 점이다.

여기서 생각해볼 수 있는 점은 $f(x,y)$와 $g(x,y)$은 $x, y$에 대한 식이고 이것을 조합할 수 있는 좋은 방법 중 하나는 행렬을 이용하는 것이다.

다시 말해 우리는 식 (1)을 아래와 같은 행렬을 이용한 연립방정식으로 볼 수도 있다는 점이다.

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} = \begin{bmatrix}a & b \\ c & d \end{bmatrix} \begin{bmatrix}x\\y\end{bmatrix}=A \begin{bmatrix}x\\y\end{bmatrix} % 식(4)$$

## 미분방정식 시스템에서 고유벡터의 의미

식 (4)를 보면 미분방정식 시스템은 행렬을 이용해 표현할 수 있다는 것을 알 수 있다. 여기서 주어진 행렬을 통해 우리가 알 수 있는 정보는 어떤 것이 있을까?

식 (4)는 이런식으로도 생각해볼 수 있는 것이다.

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} 
  = \begin{bmatrix}a & b \\ c & d \end{bmatrix} 
  \begin{bmatrix}x\\y\end{bmatrix}=
  \begin{bmatrix}a & b \\ c & d \end{bmatrix} 
  \begin{bmatrix}1 & 0 \\ 0 & 1 \end{bmatrix} 
  \begin{bmatrix}x\\y\end{bmatrix}% 식(5)$$

그러니까 우리가 지금 보고 있는 위상평면의 기울기 $dx/dt$와 $dy/dt$의 값은 원래의

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} 
  = \begin{bmatrix}1 & 0 \\ 0 & 1 \end{bmatrix} 
  \begin{bmatrix}x\\y\end{bmatrix}$$

로 표현될 수 있었던 위상평면을 행렬

$$\begin{bmatrix}a & b \\ c & d\end{bmatrix}$$

를 통해 변환 시켜준 결과인 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic9.png">
  <br>
  그림 6. 행렬 $A$가 취해주는 선형 변환
</p>

즉, 행렬 $A$는 그림 6의 왼쪽에 있는 위상 평면 상에 있는 각각의 벡터들에 적용해서 선형변환을 취해주는 것이라고 할 수 있다. 영상으로 확인해보면 다음과 같은 변화가 일어나는 것이다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_as_linear_transformation.mp4">
  </video>
  <br>
  그림 7. 위상 평면을 생각할 때 선형변환으로써의 행렬의 기능
</p>

그런데, 고유벡터 위에 있던 화살표들은 크기만 바뀌고 방향이 바뀌지 않는다. (반대방향으로는 갈 수 있다.) 고유벡터 위에 있는 화살표들만 색깔을 다르게 해서 표시해보면 다음과 같다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_as_linear_transformation_with_eig.mp4">
  </video>
  <br>
  그림 7. 선형 변환 시 고유벡터 위에 있는 화살표들의 방향은 바뀌지 않는다. (반대방향으로는 갈 수 있음)
</p>

그럼 왜 행렬 $A$가 선형변환을 취해줄 때 빨간색으로 표현한 벡터들에서는 변화가 일어나지 않을까?

왜냐면 **행렬 $A$가 가해주는 변환은 고유벡터 상에서는 변화가 고유벡터 방향으로 상수배만큼먼 움직이기 때문이다.**

그리고 위상 평면에서는 벡터의 크기는 나타내지 않고 방향만 나타내다보니 빨간색으로 표현한 벡터들은 방향 변화가 보이지 않기 때문이다. (다만 고윳값이 음수라면 반댓방향으로는 이동할 수 있음.)

다시 말해, 고유벡터의 정의를 잘 생각해보면, 위상 평면 상에서 변환 전의 벡터가 행렬 $A$의 고유벡터와 방향이 일치하는 벡터였다면 그 크기만 변하고 방향이 변하지 않는다.

그래서 고유벡터는 행렬 $A$를 통해 변하게 된 위상 평면 상 변화의 **새로운 축**인 것 처럼 작동하게 된다.

다시 말해, 행렬 $A$가 아래와 같을 때,

$$A=\begin{bmatrix}0 & 1 \\ 1 & 0 \end{bmatrix} % 식 (8)$$

고유벡터는 다음과 같다.

$$v_1 = \frac{1}{\sqrt{2}}\begin{bmatrix}-1\\1 \end{bmatrix}$$

$$v_2 = \frac{1}{\sqrt{2}}\begin{bmatrix}1 \\1 \end{bmatrix}$$

따라서 $v_1$ 방향의 직선인 $y=-x$와 $v_2$ 방향의 직선인 $y=x$가 위상 평면의 새로운 축으로 작동한다는 것을 알 수 있다.

## 미분방정식 시스템에서 고윳값의 의미

고유벡터에 대해 알아보았으니 이번에는 고윳값의 의미에 대해서도 한번 생각해보자.

그림 4에서 확인한 $(2, -1)$에서부터 $\Delta t = 0.5$라고 설정했을 때 매 스텝마다의 솔루션 커브의 움직임에 대한 그림을 다시 생각해보자.

우선 앞선 꼭지에서 우리는 고유벡터들이 새로운 변화의 '축'으로 작용한다는 것을 확인했다. 그렇다면 솔루션 커브의 변화에 따른 새로운 '축'의 좌표는 어떻게 될지 생각해보자.

아래의 그림에서는 시각화를 위해 위상 평면의 화살표는 제거하고 솔루션의 타임 스텝 별 변화만을 표시하였다.

거기에, $y=-x$ 선 위에 있는 고유벡터 $v_1$과 $y=x$ 선 상에 있는 고유벡터 $v_2$에 정사영을 취해 원점으로부터의 거리를 계산해보았다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic10.png">
  <br>
  그림 8. 그림 4에서 시간 스텝 별 솔루션의 좌표를 두 고유벡터에 정사영하여 원점으로부터 거리를 측정해보자.
</p>

위 그림에서 얻은 원점으로부터의 거리(즉, 새로운 축 위의 좌표)를 표시해보면 다음과 같이 생각해볼 수 있다.

첫 번째 방법은 새로운 축 위의 좌표값 그대로를 생각해보는 것이고, 두 번째는 순번에 따른 새로운 축의 좌표값이 어떻게 변하는지 생각해보는 것이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic11.png">
  <br>
  그림 9. 1번 고유벡터의 관점에서 보는 새로운 좌표값의 변화
</p>

두 번째 고유벡터에도 마찬가지 일을 수행할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic12.png">
  <br>
  그림 10. 2번 고유벡터의 관점에서 보는 새로운 좌표값의 변화
</p>

1번 고유벡터의 고윳값은 $-1$이고, 2번 고유벡터의 고윳값은 $1$이었다. 이 사실과 그림 9, 그림 10에서 보여주는 현상을 잘 대조해놓고 생각해보면 고윳값의 부호가 음수이면 매 타입스텝마다 새로운 고유벡터위의 좌표값이 0으로 수렴해가고, 반대로 고윳값의 부호가 양수이면 매 타임스텝마다 새로운 고유벡터 위의 좌표값이 무한대로 발산하는 것을 알 수 있다.

거기다 그림 9, 그림 10을 보면 타입 스텝마다의 좌표값의 변화는 exponential한 변화를 띄는 것을 알 수 있는데, 이것은 [자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 보았던 것처럼 positive feedback을 통해 다음번 솔루션 커브 상의 위치를 결정하기 때문이다. 다시 말해 현재값을 기준으로 다음번 값이 정해지기 때문에 exponential한 변화를 보이며 이 또한 $\Delta t$가 매우 작아지면 연속적인 성장을 수행하기 때문에 자연상수 $e$를 밑으로 하는 지수함수의 꼴로 성장할 것임을 알 수 있다.

따라서 각각의 고유벡터 위에서는 1계 미분방정식과 같이 positive feedback을 통해 솔루션 커브의 좌표가 결정되며

$$\frac{dx}{dt}=\lambda x$$

와 같이 고윳값의 크기에 따라 성장 속도가 결정되는 것임을 알 수 있다.

왜냐면 고윳값의 정의에 따라 한번 성장 할 때 마다 고유벡터 위에서는 고윳값 만큼만 성장하기 때문이다.

따라서, 각 고유벡터 위의 좌표값의 변화는

$$ce^{\lambda t}$$

와 같이 쓸 수 있는 것이다. 여기서 $c$는 초기값에 의해 결정되는 값이다.

## 2원 1계 미분방정식의 해

결론적으로 연립 제차 미분방정식에서 고윳값, 고유벡터의 성질을 생각하면 다음과 같이 해를 생각할 수 있다.

$$\begin{bmatrix}x(t) \\y(t) \end{bmatrix}=c_1 v_1 \exp(\lambda_1 t) +c_2 v_2 \exp(\lambda_2 t) $$

다시 말해 고유벡터 $v_1$과 $v_2$를 따라 변화가 일어나되, 그 위에서의 좌표는 $\exp(\lambda_1 t)$와 $\exp(\lambda_2 t)$와 같이 시간에 따라 변해간다는 뜻이다.

그리고 $c_1$, $c_2$는 초기값에 따라 결정되는 값이다.

따라서, 식 (4)의 연립 미분방정식이라면 고유벡터가 $[-1, 1]^T$, $[1, 1]^T$이고 그에 대응되는 고윳값은 각각 $-1$, $1$이므로 해는 다음과 같을 것이다.

$$\begin{bmatrix}x(t) \\y(t) \end{bmatrix}=c_1 \frac{1}{\sqrt{2}}\begin{bmatrix}-1\\1 \end{bmatrix} \exp(-t) +c_2 \frac{1}{\sqrt{2}}\begin{bmatrix}1\\1 \end{bmatrix} \exp(t) $$

$$=c_1 \begin{bmatrix}-1\\1 \end{bmatrix} e^{-t} +c_2 \begin{bmatrix}1\\1 \end{bmatrix} e^{t}$$

거기다 만약 $t=0$일 때 $(2, -1)$이라는 점을 통과하는 경우라고 하면 솔루션 커브는 아래와 같다.

$$\begin{bmatrix}2\\ -1 \end{bmatrix} = c_1\begin{bmatrix}-1 \\ 1\end{bmatrix}+c_2\begin{bmatrix}1 \\ 1\end{bmatrix}$$

$$\therefore c_1 = -\frac{3}{2},\quad c_2 = \frac{1}{2}$$

$$\therefore \begin{bmatrix}x(t) \\y(t) \end{bmatrix}=-\frac{3}{2}\begin{bmatrix}-1\\1 \end{bmatrix} e^{-t} +\frac{1}{2}\begin{bmatrix}1\\1 \end{bmatrix} e^{t} $$

이 식은 매개변수 $t$로 표현된 곡선의 방정식이며, 그림으로 표현하면 아래와 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic6.png">
  <br>
  그림 11. 식 (17)의 곡선을 그림으로 표현한 것
</p>

그리고 그림 9, 10에서 생각해본 고유벡터 상의 좌표들을 실제 솔루션의 좌표와 비교해보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic13.png">
  <br>
  그림 12. Euler method로 생각해본 고유벡터 상의 좌표와 실제 솔루션과의 비교
</p>

# 실수, 복소수, 중복 고윳값의 의미

지금까지 우리는 솔루션 커브의 시간에 따른 변화를 위상 평면상에서 표현할 수 있고, 그 움직임이 고유벡터를 중심으로 일어난다는 것을 확인했다.

뿐만 아니라, 고윳값의 크기와 부호에 따라 솔루션 커브의 시간에 따른 변화 속도가 바뀌고 원점으로 향해갈지 멀어질지에 관한 방향이 결정된다는 것을 알아보았다.

그러면, 우리는 여기서 생각해 볼 수 있는 것이 또 하나 생긴다.

고윳값은 아래와 같은 특성 방정식을 풀면서 얻어지는 것이라는 것을 잘 생각해보자.

$$det(A-\lambda I)=0$$

이 과정에서 만약 고윳값이 $\lambda =2, \text{ or } 3$이었다면 특성방정식은 다음과 같았을 것이다.

$$(\lambda-2)(\lambda-3)=0$$

$$\Rightarrow \lambda^2-5\lambda+6=0$$

여기서 생각해볼 수 있는 것은 이 식은 중학교 시절 배우는 대수학적인 간단한 이차방정식이라는 점이다.

따라서, 이차방정식의 해는 실근, 허근, 중근 중 한 가지 경우로 나올 수 있게 된다.

그러므로 우리는 다음과 같은 결론을 내릴 수 있다.

고윳값은 실수이거나 복소수이거나 중근을 갖게 된다고 말이다.

## 실수 고윳값을 갖는 경우

실수 고윳값을 갖는 경우는 어렵지 않게 해석할 수 있다.

식 (14)에서 본 것 처럼 고윳값은 자연상수 $e$의 지수로 올려서 이용하게 되는데, [자연상수 e의 의미](https://angeloyeo.github.io/2019/09/04/natural_number_e.html) 편을 참고해보면 $e$ 위의 지수는 성장횟수와 성장률에 비례하는 값이다.

즉, 고윳값 $\lambda = \alpha$라고 하면 식 (14)에서와 같이 자연상수 $e$에 지수로 올리면,

$$e^{\alpha t}$$

이다. 다시 말해 $t$가 커질 수록 얼마나 빨리 성장시킬 것인가를 말해주고 있는 것이다.

그러므로 실근을 갖는 경우에는 아래 그림과 같이 고유벡터를 따라 원점으로 가까워지거나 원점으로부터 멀어지거나 하는 변화를 보이는 솔루션 커브를 갖는다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic1.png">
  <br>
  그림 13. 실수 고윳값을 갖는 경우의 위상 평면 및 일부 solution curve의 예시
</p>

## 복소수 고윳값을 갖는 경우

복소수 고윳값을 갖는 경우는 허수에 대한 약간의 지식이 필요하다.

허수에 관한 내용은 [허수의 존재 의미에 대하여](https://angeloyeo.github.io/2019/06/15/imaginary_number.html) 편에서 조금 자세히 본 적이 있는데, 한 마디로 요약하면 어떤 복소수에 허수를 곱해주는 것은 시계 반대방향으로 90도 회전을 의미한다는 것이다.

핵심 포인트만 언급하자면, 허수가 관여한다는 것은 회전과 관련 있는 변화가 생길 것이라는 것을 암시한다고 보면 좋을 것 같다.

그런데, 우리는 식 (14)에서 본 것 처럼 고윳값을 자연상수 $e$의 지수로 올려서 사용하게 된다.

그럼 고윳값이 해주는 역할은 어떤 것일까?

가령, 고윳값을 아래와 같은 형태의 복소수로 서술해보자.

$$\lambda = \alpha + i\beta$$

여기서 $\alpha,\beta$는 모두 임의의 실수이고 $i=\sqrt{-1}$이다.

그러면 자연상수 $e$에 지수로 $\alpha \pm i\beta$를 올려주면,

$$e^{\lambda t}=e^{\alpha t + i\beta t}$$

가 되고, 지수법칙에 의해,

$$\Rightarrow e^{\alpha t}e^{i\beta t}$$

가 된다고 할 수 있다.

그러면 $e^{\alpha t}$는 위의 실수 고윳값 케이스에서 봤던 것 처럼 값이 지속적으로 커지거나 지속적으로 작아지는 것을 의미한다.

그런데, $e^{i\beta t}$는 어떤 의미를 가질까?

이것은 반지름이 1인 원 위의 회전을 의미한다. 혹시 이 부분이 생소하다면 [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html) 편을 참고해보도록 하자.

일반적으로 $e^{i\theta}$는 복소 평면에서 $1$이라는 숫자를 $\theta$ 라디안 만큼 회전시킨 곳의 위치의 복소수를 의미한다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic7.png">
  <br>
  그림 14. 허수 지수를 갖는 자연상수 지수 함수의 복소 평면 상의 위치
</p>

따라서, $e^{\alpha t}$는 시간이 지날 수록 값이 커지고 $e^{i\beta t}$는 시간이 지나면서 계속 회전을 하게 되므로 결국 두 값을 곱한 $e^{\alpha t}e^{i\beta t}$는 회전하면서 반지름이 점점 커지는 원과 같은 형태를 띄게 된다.

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/rotate_and_bigger.mp4">
  </video>
  <br>
  그림 15. 복소수 지수를 갖는 자연상수 지수 함수 $ re^{i\theta t}$의 시간에 따른 위치 변화
</p>

따라서 복소 고윳값을 갖는 경우에는 실수부가 0보다 크면 반지름이 계속해서 커지는 솔루션 커브를 갖게 된다.

<p align = "center">
  <img src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic3.png">
  <br>
  그림 16. 실수부가 0보다 큰 복소 고윳값을 갖는 경우의 솔루션 커브
</p>

반대로 복소 고윳값을 갖는 경우에는 실수부가 0보다 작으면 반지름이 계속해서 작아지는 솔루션 커브를 갖게 된다.

<p align = "center">
  <img src ="https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic2.png">
  <br>
  그림 17. 실수부가 0보다 작은 복소 고윳값을 갖는 경우의 솔루션 커브
</p>

## 중복 고윳값을 갖는 경우

중복 고윳값을 갖는 경우를 생각해보려면 약간의 고민이 필요하다.

우선 중복 고윳값을 갖는다는 말은 이 고윳값은 항상 실수(real number)라는 것을 의미한다.

왜냐면 특성 방정식의 해는 2차 방정식의 근의 공식으로 부터 정해지는 것일텐데 판별식이 0이라는 것은 결국 중근은 항상 실수임을 말해주고 있는 것이기 때문이다.

중복 고윳값을 갖는 경우에는 고유벡터가 일차 독립인지 아닌지 여부에 따라 솔루션이 달라질 수 있다.

### 1. 중복 고윳값을 갖더라도 고유벡터는 독립적인 경우

아래와 같은 케이스를 생각해보자.

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix}=\begin{bmatrix}\lambda & 0 \\ 0 & \lambda \end{bmatrix}\begin{bmatrix}x \\y\end{bmatrix}=A\begin{bmatrix}x \\y\end{bmatrix}$$

이 경우는 고윳값이 모두 $\lambda$로 중복되지만 고유벡터는

$$v_1 =\begin{bmatrix}1\\0\end{bmatrix},v_2 =\begin{bmatrix}0\\1\end{bmatrix}$$

로 각각이 $x$ 축과 $y$축에 해당한다. 그러므로 솔루션은 다음과 같이 구해질 수 있다.

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1\begin{bmatrix}1 \\0\end{bmatrix}e^{\lambda t}+c_2\begin{bmatrix}0\\1\end{bmatrix}e^{\lambda t}$$

$$=\begin{bmatrix}c_1\\c_2\end{bmatrix}e^{\lambda t}$$

### 2. 중복 고윳값을 갖고 고유벡터도 중복인 경우

※ 아래의 내용에 대해 이해하지 못한다면 스킵하여도 이후 내용을 이해하는데 문제가 없습니다.

아래와 같은 케이스를 생각해보자.

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix}=\begin{bmatrix}\lambda & 1 \\ 0 & \lambda \end{bmatrix}\begin{bmatrix}x \\y\end{bmatrix}=A\begin{bmatrix}x \\y\end{bmatrix}$$

이 경우는 고윳값은 $\lambda$로 두 개가 중복인데, 고유벡터는

$$v=\begin{bmatrix}1\\0\end{bmatrix}$$

으로 하나만 나오는 경우이다.

이런 경우는 우선 첫 번째 해를 먼저 구해보면,

$$s_1(t)= e^{\lambda t}\begin{bmatrix}1 \\0\end{bmatrix}$$

임을 알 수 있다. 그런데 여기서부터 두 번째 해는 다음과 같이 생각할 수 있다[^1].

$$s_2(t) = te^{\lambda t}\begin{bmatrix}1\\0\end{bmatrix}+e^{\lambda t}\begin{bmatrix}v_3 \\ v_4\end{bmatrix}$$

[^1]: 왜 이런 형식의 해를 생각하는지에 대해서는 크게 고민하지 말자. 앞으로의 미분방정식의 여러 해법을 공부할 때에도 많은 경우가 아이디어 싸움이다. 미분방정식은 해가 유일하게 존재한다고 판별되면 어떤 방식으로 해를 구하던지 해만 구할 수 있다면 그것이 정답이다. 여기서도 순전히 '아이디어'로 생각하자. (이미 다른 방식으로 많이 풀어본 뒤 실패하고 남게 된 아이디어라고 봐야 한다.)

그리고 최종 해는 다음과 같이 $s_1(t)$와 $s_2(t)$의 선형결합으로 생각하자.

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1s_1(t)+c_2s_2(t)$$

$s_2(t)$ 역시 원래의 미분방정식을 만족해야 하므로 대입해보면,

$$s_2'=As_2$$

$$\Rightarrow e^{\lambda t}\begin{bmatrix}1\\0\end{bmatrix}+t\lambda e^{\lambda t}\begin{bmatrix}1\\0\end{bmatrix}+\lambda e^{\lambda t}\begin{bmatrix}v_3\\v_4\end{bmatrix}=A\left(te^{\lambda t}\begin{bmatrix}1\\0\end{bmatrix}+e^{\lambda t}\begin{bmatrix}v_3 \\ v_4\end{bmatrix}\right)$$

따라서 $te^{\lambda t}$와 $e^{\lambda t}$로 양변을 각각 묶어주면,

$$\left(\lambda\begin{bmatrix}1\\0\end{bmatrix}\right)te^{\lambda t}+\left(\begin{bmatrix}1\\0\end{bmatrix}+\lambda\begin{bmatrix}v_3 \\v_4\end{bmatrix}\right)e^{\lambda t}=\left(A\begin{bmatrix}1\\0\end{bmatrix}\right)te^{\lambda t}+\left(A\begin{bmatrix}v_3 \\v_4\end{bmatrix}\right)e^{\lambda t}$$

와 같으므로 다음을 만족해야 함을 알 수 있다.

$$\begin{cases}

  A\begin{bmatrix}1\\0\end{bmatrix} = \lambda\begin{bmatrix}1\\0\end{bmatrix} \\\\
  A\begin{bmatrix}v_3\\v_4\end{bmatrix}=\begin{bmatrix}1\\0\end{bmatrix}+\lambda\begin{bmatrix}v_3\\v_4\end{bmatrix}

\end{cases}$$

위 식에서 첫 번째 식은 원래 고유벡터와 고윳값을 만족시키는 식이므로 크게 신경쓸 것이 없고 두 번째 식에 대해서는 다음과 같이 바꿔 쓸 수 있음을 알 수 있다.

$$\Rightarrow \left(A-\lambda I\right)\begin{bmatrix}v_3\\v_4\end{bmatrix}=\begin{bmatrix}1\\0\end{bmatrix}$$

$$=\begin{bmatrix}0&1\\0&0\end{bmatrix}\begin{bmatrix}v_3\\v_4\end{bmatrix}=\begin{bmatrix}1\\0\end{bmatrix}$$

여기서 잘 보면 $v_3$는 free variable이고 $v_4=1$임을 알 수 있다. 따라서 $v_3=0$이라고 선택하면,

$$\Rightarrow \begin{bmatrix}v_3\\v_4\end{bmatrix}=\begin{bmatrix}0\\1\end{bmatrix}$$

이 된다.

그러므로 $s_2(t)$는

$$s_2(t)=te^{\lambda t}\begin{bmatrix}1\\0\end{bmatrix}+e^{\lambda t}\begin{bmatrix}0 \\ 1\end{bmatrix}=\begin{bmatrix}t\\1\end{bmatrix}e^{\lambda t}$$

따라서, 우리가 구하고자 했던 시스템의 솔루션은 다음과 같은 것으로 판단할 수 있다.

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1\begin{bmatrix}1 \\0\end{bmatrix}e^{\lambda t}+c_2\begin{bmatrix}t\\1\end{bmatrix}e^{\lambda t}$$

실제로 아래와 같은 연립미분방정식에 대한 phase plane을 그려보자.

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix}=\begin{bmatrix}-1 & 1 \\ 0 & -1 \end{bmatrix}\begin{bmatrix}x \\y\end{bmatrix}=A\begin{bmatrix}x \\y\end{bmatrix}$$

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic8.png">
  <br>
  그림 18. 중복 고윳값 고유벡터를 갖는 연립 미분방정식의 phase plane
</p>
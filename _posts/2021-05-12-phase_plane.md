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
* [고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [복소 고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2020/11/02/complex_eigen.html)

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

만약 $\Delta t = 0.1$이라고 잡는다면 $\Delta x = dx/dt * \Delta t = -0.1$, $\Delta y = dy/dt * \delta t = 0.2$이므로,

(2, -1)이라는 점에서는 (2, -1)으로부터 $(2+\Delta x, -1+ \Delta y)=(1.9, -0.8)$점으로 화살표를 이어주면 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic3.png">
  <br>
  그림 3. 식 (3)의 위상 평면을 그리는 과정 중 (2, -1)이라는 점에서 해당되는 벡터를 그린 결과물
</p>

이와 같은 방법으로 모든 좌표에서 화살표를 그려주면 위상평면이 그려지는 것이다.

(물론 손으로 그리는 방법은 매우 시간 소모가 많이 되므로 컴퓨터로 그리길 추천한다.)

# 위상평면과 행렬

식 (1)~(3)을 통해 볼 수 있는 것은 식 (1)의 $f(x,y)$ 혹은 $g(x,y)$를 어떻게 정하는가에 따라서 위상 평면의 모양이 결정된다는 점이다.

여기서 생각해볼 수 있는 점은 $f(x,y)$와 $g(x,y)$은 $x, y$에 대한 식이고 이것을 조합할 수 있는 좋은 방법 중 하나는 행렬을 이용하는 것이다.

다시 말해 우리는 식 (1)을 아래와 같은 행렬을 이용한 연립방정식으로 볼 수도 있다는 점이다.

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} = \begin{bmatrix}a && b \\ c && d \end{bmatrix} \begin{bmatrix}x\\y\end{bmatrix}=A \begin{bmatrix}x\\y\end{bmatrix} % 식(4)$$

여기서 $v = \begin{bmatrix} x, y \end{bmatrix}^T$라고 하면

$$\frac{d}{dt}v=Av % 식 (5)$$

와 같은 관계로 식 (1)을 다시 써볼 수도 있을 것이다.

## 미분방정식 시스템에서 고윳값, 고유벡터의 의미

식 (5)를 보면 미분방정식 시스템은 행렬을 이용해 표현할 수 있다는 것을 알 수 있다. 여기서 주어진 행렬을 통해 우리가 알 수 있는 정보는 어떤 것이 있을까?

식 (5)에서 우리는 우변의 $Av$에 주목해보자. 

식 (5)에 따라 우리는 $Av$를 계산해주면 $dx/dt$와 $dy/dt$를 얻을 수 있게 되며, 앞서 위상평면을 손으로 그리는 방법에 대해 보았던 것 처럼 이를 확인하면 화살표의 head가 향해야 할 좌표를 알 수 있다.

즉, $Av$는 지금 주어진 $v = [x_0, y_0]^T$가 다음 번 시간 스텝에서는 어디로 이동할지에 관한 계산이다.

그리고 그 다음번 타임스텝은 새로 이동한 점으로부터 $A$를 곱해 새로 이동할 좌표를 계산하면 된다.

이러한 방식으로 주어진 점으로부터 여러 번 타임 스텝 뒤에는 어디로 점이 이동할지 생각해보자.

행렬 $A$가 아래와 같을 때,

$$A=\begin{bmatrix}0 && 1 \\ 1 && 0 \end{bmatrix} % 식 (6)$$

다음과 같은 방식으로 (2, -1)이라는 점으로부터 $\Delta t = 0.5$로 설정한 상태에서 여러번 시간 스텝 진행에 따른 $(x, y)$ 좌표의 위치를 그려보면 아래와 같다.

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

두 검은색 라인은 행렬 $A$의 [고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html) 방향의 두 직선이다.

또, 각 고유벡터에 대응되는 고윳값이 음수인 경우 시간이 지남에 따라 원점에 가까워지려 하고 대응되는 고윳값이 양수인 경우 원점에서 멀어지려고 한다.

실제 식 (6)의 행렬 $A$의 고유벡터는 다음과 같다.

$$v_1 = \frac{1}{\sqrt{2}}\begin{bmatrix}-1\\1 \end{bmatrix}$$

$$v_2 = \frac{1}{\sqrt{2}}\begin{bmatrix}1 \\1 \end{bmatrix}$$

또, 각 고유벡터에 대응되는 고윳값은 다음과 같다.

$$\lambda_1 = -1,\quad \lambda_2 = 1$$

따라서, 그림 4 혹은 그림 5에서 볼 수 있는 것 처럼 매번 새로운 좌표를 찾아갈 때 마다 $v_1$을 따라서는 원점에 가까워지고 $v_2$를 따라서는 원점에서 멀어지려고 한다는 것을 확인할 수 있다.

그럼 왜 매번 행렬 $A$를 곱해서 새로운 좌표를 찾아 갈 때마다 고유벡터를 따라 변화가 일어날까?

왜냐면 **행렬 $A$가 가해주는 변환은 고유벡터 상에서는 변화가 고유벡터 방향으로 상수배만큼 움직이지만 다른 벡터에서는 그렇지 않고 방향이 변하기 때문이다.**

그래서 고유벡터는 행렬 $A$를 통해 변하게 된 위상 평면 상 변화의 **새로운 축**으로 작동하게 된다.

조금 더 시각적으로 설명해보면, 행렬은 선형 변환이다 라는 관점에서 접근해보면 좋다. 선형 변환이라는 것은 다음과 같이 원래의 그림 1에서 보여주는 단위 행렬로 설명되는 기본적인 연립미분방정식의 위상 평면을 우리에게 주어진 행렬로 표현하는 위상평면으로 변환 시켜주는 역할을 하는 것이다.

우리에게 주어졌던 행렬 $A$

$$A=\begin{bmatrix}0 & 1 \\ 1 & 0\end{bmatrix}$$

에 대해서 아래와 같은 선형 변환으로 행렬 $A$ 의 역할을 생각해볼 수 있는 것이다.

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_as_linear_transformation.mp4">
  </video>
  <br>
  그림 6. 위상 평면을 생각할 때 선형변환으로써의 행렬의 기능
</p>

그런데, 고유벡터 위에 있던 화살표들은 크기만 바뀌고 방향이 바뀌지 않는다. (반대방향으로는 갈 수 있다.) 고유벡터 위에 있는 화살표들만 색깔을 다르게 해서 표시해보면 다음과 같다.

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_as_linear_transformation_with_eig.mp4">
  </video>
  <br>
  그림 7. 선형 변환 시 고유벡터 위에 있는 화살표들의 방향은 바뀌지 않는다. (반대방향으로는 갈 수 있음)
</p>

그렇다면 고윳값의 의미는 무엇일까? 고윳값의 부호는 해당 고유벡터 축에서 원점으로 가까워질지 멀어질지를 결정해주는 요소였다고 하면, 고윳값의 크기는 얼마나 빨리 원점으로 가까워질지 멀어질지를 결정해주는 요소다.

## 2원 1계 미분방정식의 해

[자연상수 e와 제차 미분방정식](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 본 것 처럼 우리는 매번 다음번 좌표를 정할 때 마다 현재 결과물을 바탕으로 성장하므로 좌표의 이동은 연속성장을 이용해 표현할 수 있다. 따라서 자연상수 $e$를 이용해서 좌표의 변화를 표현하는 것은 연속성장의 의미를 담는 것이므로 자연스러운 표현방법이라 할 수 있다.

그리고 [자연상수 위의 승수의 역할이 바로 성장 속도](https://angeloyeo.github.io/2019/09/04/natural_number_e.html)와 관련된 것이므로 자연상수 $e$의 지수에 고윳값을 이용함으로써 성장 속도를 표현할 수 있을 것이다.

또, 주어진 행렬 $A$에 대해 행렬 $A$의 고유벡터를 따라 좌표평면 상에서 변화가 일어나므로, 연립 미분방정식의 일반해는 다음과 같이 서술하면 충분할 것이다.

$$\begin{bmatrix}x(t) \\y(t) \end{bmatrix}=c_1 v_1 \exp(\lambda_1 t) +c_2 v_2 \exp(\lambda_2 t) $$

따라서, 식 (6)의 행렬로 쓸 수 있는 연립 미분방정식이라면 그 해는 다음과 같을 것이다.

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
  그림 8. 식 (17)의 곡선을 그림으로 표현한 것
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

식 (12)에서 본 것 처럼 고윳값은 자연상수 $e$의 지수로 올려서 이용하게 되는데, [자연상수 e의 의미](https://angeloyeo.github.io/2019/09/04/natural_number_e.html) 편을 참고해보면 $e$ 위의 지수는 성장횟수와 성장률에 비례하는 값이다.

즉, 고윳값 $\lambda = \alpha$라고 하면 식 (12)에서와 같이 자연상수 $e$에 지수로 올리면,

$$e^{\alpha t}$$

이다. 다시 말해 $t$가 커질 수록 얼마나 빨리 1이라는 값을 성장시킬 것인가를 말해주고 있는 것이다.

그러므로 실근을 갖는 경우에는 아래 그림과 같이 고유벡터를 따라 원점으로 가까워지거나 원점으로부터 멀어지거나 하는 변화를 보이는 솔루션 커브를 갖는다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic1.png">
  <br>
  그림 9. 실수 고윳값을 갖는 경우의 위상 평면 및 일부 solution curve의 예시
</p>

## 복소수 고윳값을 갖는 경우

복소수 고윳값을 갖는 경우는 허수에 대한 약간의 지식이 필요하다.

허수에 관한 내용은 [허수의 존재 의미에 대하여](https://angeloyeo.github.io/2019/06/15/imaginary_number.html) 편에서 조금 자세히 본 적이 있는데, 한 마디로 요약하면 어떤 복소수에 허수를 곱해주는 것은 시계 반대방향으로 90도 회전을 의미한다는 것이다.

핵심 포인트만 언급하자면, 허수가 관여한다는 것은 회전과 관련 있는 변화가 생길 것이라는 것을 암시한다고 보면 좋을 것 같다.

그런데, 우리는 식 (12)에서 본 것 처럼 고윳값을 자연상수 $e$의 지수로 올려서 사용하게 된다.

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






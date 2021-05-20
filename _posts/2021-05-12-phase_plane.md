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
* [미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html)
* [고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [복소 고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2020/11/02/complex_eigen.html)

# 위상 평면 소개

2원 1차 미분방정식이나 2차 미분방정식을 해석할 때 위상평면을 이용한 해석은 미분방정식의 해의 특성을 파악하는데 굉장히 중요한 역할을 한다.

아래와 같은 2원 1차 미분방정식에서 

$$\begin{cases}
  \dfrac{dx}{dt} = f(x, y) \\\\
  \dfrac{dy}{dt} = g(x, y)
\end{cases} % 식 (1)$$

위상 평면은 2차원(혹은 3차원) 실수 평면에서 모든 점 $(x, y)$에 대한 기울기를 평면에 표현할 수 있다는 사실을 바탕으로 그릴 수 있다.

다시 말해, $(x, y)$에서의 기울기 $dy/dx$는

$$\frac{dy}{dx}=\frac{dy/dt}{dx/dt}$$

와 같이 계산할 수 있다는 점을 감안하면 모든 $(x, y)$에서 기울기를 계산해 그려줄 수 있다.

가장 기본적인 2원 1차 미분방정식은 다음과 같은 것인데,

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

또 다른 2원 1차 미분방정식은 다음과 같은 것도 있을 수 있다.

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

$$\begin{bmatrix}dx/dt\\dy/dt \end{bmatrix} = \begin{bmatrix}a_{11} && a_{12} \\ a_{21} && a_{22}\end{bmatrix} \begin{bmatrix}x\\y\end{bmatrix}=A \begin{bmatrix}x\\y\end{bmatrix} % 식(4)$$

여기서 $v = \begin{bmatrix} x, y \end{bmatrix}^T$라고 하면

$$\frac{d}{dt}v=Av % 식 (5)$$

와 같은 관계로 식 (1)을 다시 써볼 수도 있을 것이다.

## 미분방정식 시스템에서 고윳값, 고유벡터의 의미

식 (5)를 보면 미분방정식 시스템은 행렬을 이용해 표현할 수 있다는 것을 알 수 있다. 여기서 주어진 행렬을 통해 우리가 알 수 있는 정보는 어떤 것이 있을까?

식 (5)에서 우리는 우변의 $Av$에 주목해보자. 

식 (5)에 따라 우리는 $Av$를 계산해주면 $dx/dt$와 $dy/dt$를 얻을 수 있게 되며, 앞서 위상평면을 손으로 그리는 방법에 대해 보았던 것 처럼 이를 확인하면 화살표의 head가 향해야 할 좌표를 알 수 있다.

즉, $Av$는 지금 주어진 $v = [x0, y0]^T$가 다음 번 시간 스텝에서는 어디로 이동할지에 관한 계산이다.

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

그렇다면 고윳값의 의미는 무엇일까? 고윳값의 부호는 해당 고유벡터 축에서 원점으로 가까워질지 멀어질지를 결정해주는 요소였다고 하면, 고윳값의 크기는 얼마나 빨리 원점으로 가까워질지 멀어질지를 결정해주는 요소다.

## 2원 1차 미분방정식의 해

[미분방정식과 자연상수 e](https://angeloyeo.github.io/2021/05/05/ODE_and_natural_number_e.html) 편에서 본 것 처럼 우리는 매번 다음번 좌표를 정할 때 마다 현재 결과물을 바탕으로 성장하므로 좌표의 이동은 연속성장을 이용해 표현할 수 있다. 따라서 자연상수 $e$를 이용해서 좌표의 변화를 표현하는 것은 연속성장의 의미를 담는 것이므로 자연스러운 표현방법이라 할 수 있다.

그리고 [자연상수 위의 승수의 역할이 바로 성장 속도](https://angeloyeo.github.io/2019/09/04/natural_number_e.html)와 관련된 것이므로 자연상수 $e$의 지수에 고윳값을 이용함으로써 성장 속도를 표현할 수 있을 것이다.

또, 주어진 행렬 $A$에 대해 행렬 $A$의 고유벡터를 따라 좌표평면 상에서 변화가 일어나므로, 연립 미분방정식의 일반해는 다음과 같이 서술하면 충분할 것이다.

$$\begin{bmatrix}x(t) \\y(t) \end{bmatrix}=c_1 v_1 \exp(\lambda_1 t) +c_2 v_2 \exp(\lambda_2 t) $$

따라서, 식 (6)의 행렬로 쓸 수 있는 연립 미분방정식이라면 그 해는 다음과 같을 것이다.

$$\begin{bmatrix}x(t) \\y(t) \end{bmatrix}=c_1 \frac{1}{\sqrt{2}}\begin{bmatrix}-1\\1 \end{bmatrix} \exp(-t) +c_2 \frac{1}{\sqrt{2}}\begin{bmatrix}1\\1 \end{bmatrix} \exp(t) $$

$$=c_1 \begin{bmatrix}-1\\1 \end{bmatrix} e^{-t} +c_2 \begin{bmatrix}1\\1 \end{bmatrix} e^{t}$$

거기다 만약 $t=0$일 때 $(2, -1)$이라는 점을 통과하는 경우라고 하면 솔루션 커브는 아래와 같다.

$$\begin{bmatrix}2\\ -1 \end{bmatrix} = c_1\begin{bmatrix}-1 \\ 1\end{bmatrix}+c_2\begin{bmatrix}1 \\ 1\end{bmatrix}$$

$$\therefore c_1 = -\frac{3}{2},\quad c_2 = \frac{1}{2}$$

$$\therefore \begin{bmatrix}x(t) \\y(t) \end{bmatrix}=-\frac{3}{2}\begin{bmatrix}-1\\1 \end{bmatrix} \exp(-t) +\frac{1}{2}\begin{bmatrix}1\\1 \end{bmatrix} \exp(t) $$

그림으로 표현하면 아래와 같이 표현할 수도 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/pic6.png">
  <br>
  그림 6. 식 x의 solution curve
</p>


## 행렬이 작동하는 변환 시각화

위상 평면을 분석할 때 행렬 $A$의 고윳값, 고유벡터의 역할에 대해 좀 더 시각적으로 이해할 수 있게 된다.

### positive & negative real eigenvalues

$$\begin{bmatrix}1 && 2 \\ 3 && 2 \end{bmatrix}$$

고윳값:

$$ \lambda = -1, 4$$

고유벡터:

$$\begin{bmatrix} -0.707 \\ 0.707 \end{bmatrix}, \begin{bmatrix}-0.555 \\ -0.832\end{bmatrix}$$

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_with_particle_case1.mp4">
  </video>
  <br>
  그림 4. 양수, 음수인 고윳값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### two positive eigenvalues

$$\begin{bmatrix}2 && 0 \\ 0 && 3 \end{bmatrix}$$

고윳값:

$$ \lambda = 2, 3$$

고유벡터:

$$\begin{bmatrix} 1 \\ 0 \end{bmatrix}, \begin{bmatrix} 0 \\ 1\end{bmatrix}$$

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_with_particle_case2.mp4">
  </video>
  <br>
  그림 5. 두 양수 고윳값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>


### two negative eigenvalues

$$\begin{bmatrix}-2 && 0 \\ 0 && -3 \end{bmatrix}$$

고윳값:

$$ \lambda = -3, -2$$

고유벡터:

$$\begin{bmatrix} 0 \\ 1 \end{bmatrix}, \begin{bmatrix} 1 \\ 0\end{bmatrix}$$

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_with_particle_case3.mp4">
  </video>
  <br>
  그림 6. 두 음수 고윳값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### complex eigenvalues

$$\begin{bmatrix}-3 && 1 \\ -2 && -1 \end{bmatrix}$$

고윳값:

$$ \lambda = -2+i, -2-i$$

고유벡터:

$$\begin{bmatrix} 0.408 - 0.408i \\ 0.817 \end{bmatrix}, \begin{bmatrix} 0.408+0.408i \\ 0.817 \end{bmatrix}$$

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_with_particle_case4.mp4">
  </video>
  <br>
  그림 6. 두 복소 고윳값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

### repeated eigenvalues

$$\begin{bmatrix}-1 && 1 \\ 0 && -1 \end{bmatrix}$$

고윳값:

$$ \lambda = -1\text{(중근)}$$

고유벡터:

$$\begin{bmatrix} 1 \\ 0 \end{bmatrix}, \begin{bmatrix} -1 \\ 0 \end{bmatrix}$$

<p align = "center">
  <video width = "700" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-12-phase_plane/phase_plane_with_particle_case5.mp4">
  </video>
  <br>
  그림 7. 두 중근 고윳값을 갖는 행렬로 얻게 되는 위상평면의 예시
</p>

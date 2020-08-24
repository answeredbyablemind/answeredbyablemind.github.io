---
title: 발산정리(2D)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200817
tags: 미적분학
---

# 발산 정리의 수식

| THEOREM 1. 발산 정리 (2D) |
| --------- |
| 벡터장이 $F(x,y) = P(x,y)\hat{i} + Q(x,y)\hat{j}$로 주어져있고, 선적분의 방향은 면적 A의 boundary에 대해 반 시계 방향이라고 할 때 아래의 식이 성립한다.<br><center>$$\iint_A\left(\frac{\partial P}{\partial x} + \frac{\partial Q}{\partial y}\right)dxdy = \oint_{\partial A}\left(\vec{F}\cdot\hat{n}ds\right)$$</center>|

발산 정리는 닫힌 경로에 대해서 해당 경로를 따라 빠져나가거나 들어간 총 유량은 그 경로로 구성된 면적의 전체 유입/유출량과 같다는 의미를 갖고 있다.

# prerequisites

발산 정리를 이해하기 위해선 아래의 내용에 대해 이해하는 것이 좋다.

* [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)
* [벡터장의 flux(2D)](https://angeloyeo.github.io/2020/08/18/flux_2D.html)

# 발산 정리의 증명

※ 해당 증명은 Mary L. Boas의 책 Mathematical Methods in the Physical Sciences에서부터 가져왔습니다.

발산 정리를 증명하는 과정은 [그린 정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)에서부터 출발한다. 그린 정리는 선적분과 중적분의 관계에 대해 기술하고 있으며, 수식은 다음과 같다.

$$\oint_C\vec{F}\cdot d\vec{r} = \iint_A\frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y}dxdy$$

여기서 벡터장 $\vec{F}(x,y)$는 다음과 같이 주어진다고 하자.

$$\vec{F}(x,y) = P(x,y)\hat{i} + Q(x,y)\hat{j}$$

여기서 $P(x,y)$와 $Q(x,y)$는 임의의 함수이므로 다음과 같이 조정하여도 무방하다.

$$P(x,y) \Rightarrow -V_y$$

$$Q(x,y) \Rightarrow + V_x$$

그렇게 하면 식(2)의 좌변은 다음과 같이 바뀐다.

$$\text{식(2)의 좌변} \Rightarrow \oint_C\vec{F}\cdot d\vec{r} = \oint_C\left(-V_ydx+V_xdy\right)=\oint_C\vec{V}\cdot \hat{n} ds$$

(만약 위 식에서 $\oint \vec{V}\cdot \hat{n} ds$의 의미가 이해되지 않는다면 [벡터장의 flux(2D)](https://angeloyeo.github.io/2020/08/18/flux_2D.html)편을 복습하고 오는 것도 좋을 것 같다.)

여기서 $\vec{V} = V_x\hat{i} + V_y\hat{j}$이다.

그리고 식 (2)의 우변은 다음과 같이 바뀐다.

$$\text{식(2)의 우변} \Rightarrow \iint_A\frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y}dxdy = \iint_A\frac{\partial V_x}{\partial x}+\frac{\partial V_y}{\partial y}$$

사실 식 (4), (5)의 아이디어는 접선 벡터를 법선 벡터로 바꾸는 -90도 회전을 의미하는 과정에서부터 얻은 것이라고 할 수 있다.

잠깐 복습하자면,

$$\begin{bmatrix}
\cos(-90°) & -\sin(-90°) \\
\sin(-90°) & \cos(-90°) \\
\end{bmatrix} \begin{bmatrix}
x \\
y \\
\end{bmatrix} = \begin{bmatrix}
0 & 1 \\
-1 & 0 \\
\end{bmatrix} \begin{bmatrix}
x \\
y \\
\end{bmatrix} = \begin{bmatrix}
y \\
-x \\
\end{bmatrix}$$

이므로 임의의 벡터를 -90도 회전을 할 때에는 $x$, $y$를 각각 $y$, $-x$로 바꿔준다는 것이 아이디어의 핵심이다. 해당 내용에 대한 자세한 논의는 [벡터장의 flux(2D)의 법선 벡터 계산 부분](https://angeloyeo.github.io/2020/08/18/flux_2D.html#%EB%B2%95%EC%84%A0-%EB%B2%A1%ED%84%B0-%EA%B3%84%EC%82%B0)을 다시 한번 보고 오는 것도 좋을 것 같다.

이제 식 (6)과 식 (7)은 같은 것이므로 수식으로 연결해주면 발산정리가 증명된다.

$$\Rightarrow \oint_C\vec{V}\cdot \hat{n} ds=\iint_A\frac{\partial V_x}{\partial x}+\frac{\partial V_y}{\partial y}$$

# 발산정리(2D)의 의미

아래의 그림 1과 같이 임의의 벡터장 $\vec{F}$와 닫힌 경로 $C$를 생각해보자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic1.png">
  <br>
  그림 1. 발산 정리의 의미를 설명하기 위해 생각한 닫힌 경로 C와 내부의 면적 R
</p>

발산정리의 의미에 대한 설명은 [그린 정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html)편에서와 마찬가지로 flux의 결과값이 면적분과 관련이 있다는 방식으로 설명하고자 한다.

flux를 계산하는 과정도 기본적으로는 [벡터장의 선적분](https://angeloyeo.github.io/2020/08/17/line_integral.html)에 기반을 두고 있기 때문에 벡터의 내적이 가장 중요한 개념이다.

우선 그림 1에서 주어진 닫힌 경로를 따라 flux를 계산한 결과는 다음과 같다.

$$\oint_C\vec{F}\cdot \hat{n}ds$$

이제 닫힌 경로 $C$를 아래 그림 2와 같이 반으로 쪼개보도록 하자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic2.png">
  <br>
  그림 2. 닫힌 경로 C를 두 개로 나눠 생각해보면 두 경로에 대해 flux를 계산할 때의 법선 벡터는 빨간색, 파란색 화살표와 같이 표시할 수 있다.
</p>

이 때, 그림 2의 나눠진 두 경로의 가운데 부분을 보면 이 경로는 $C_1$ 경로에서와 $C_2$ 경로에서 동시에 포함되는 경로임을 알 수 있다.

이 "동시에 포함되는 경로"는 $C_1$에 대한 flux를 계산할 때와 $C_2$에 대한 flux를 계산할 때 지나가는 길이는 동일하지만 법선벡터는 반대이므로 해당 경로에서는 $C_1$에 대한 flux를 계산할 때의 결과값과 $C_2$에 대한 flux를 계산할 때의 결과 값이 서로 크기는 같으나 부호는 반대이므로 더하면 0이 된다.

그러므로, $C_1$에 대해 계산해준 flux 값과 $C_2$에 대해 계산해준 flux 값을 더하면 원래의 닫힌 경로 $C$에 대해 계산해준 flux 값과 같아진다는 것을 알 수 있다. 수식으로 적으면 다음과 같다.

$$\oint_C\vec{F}\cdot\hat{n}ds = \oint_{C_1}\vec{F}\cdot\hat{n}ds+\oint_{C_2}\vec{F}\cdot\hat{n}ds$$

이번엔 그림 2에서 쪼갰던 경로를 한번 더 쪼개서 아래의 그림 3과 같이 원래의 경로 $C$를 총 네 개의 닫힌 경로로 쪼개보자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic3.png">
  <br>
  그림 3. 닫힌 경로 C를 네 개로 나눠 생각해보면 두 경로에 대해 flux를 계산할 때의 법선 벡터는 빨간색, 파란색, 초록색, 보라색 화살표와 같이 표시할 수 있다.
</p>

그림 2의 flux 값들을 계산해줬을 때와 마찬가지 논리로 원래의 닫힌 경로 $C$ 내부에 있는 경로들의 flux 값은 더해줬을 때 모두 0이 되므로 모든 경로 $C_1$, $C_2$, $C_3$, $C_4$에 대해서 구해준 flux 값들의 합은 원래 경로 $C$에 대한 flux 값과 같다. 수식으로 적으면 다음과 같다.


$$\oint_C\vec{F}\cdot\hat{n}ds = \sum_{k=1}^4\oint_{C_k}\vec{F}\cdot\hat{n}ds$$

이러한 방식을 이용하면 닫힌 경로 $C$ 내부를 임의의 양수 $N$개 만큼으로 쪼갤 수도 있을 것이다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic4.png">
  <br>
  그림 4. 닫힌 경로 C를 임의의 양수 N개 만큼 쪼개서 보더라도 쪼개진 경로 내부의 flux 값들을 모두 더하면 원래의 경로 C에 대한 flux 값과 같다.
</p>

지금까지의 논의와 마찬가지로 닫힌 경로 내부의 $N$개의 닫힌 경로들에 대해 flux 값을 계산해주고 합하면 원래의 경로 $C$에 대한 flux 값과 같아지게 된다.

$$\oint_C\vec{F}\cdot\hat{n}ds = \sum_{k=1}^N\oint_{C_i}\vec{F}\cdot\hat{n}ds$$


## k번째 닫힌 경로의 flux 값에 대한 계산

아래의 그림과 같이 $k$번째 닫힌 경로 $C_k$에 대해 생각해보자.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic5.png">
  <br>
  그림 5. k번째 닫힌경로 C_k와 경로 위의 점에서의 벡터장. 
</p>

이 경로의 밑변과 높이가 각각 $2\Delta x$, $2\Delta y$라고 하고, 주어진 벡터장 $\vec{F} = P(x,y)\hat{i}+Q(x,y)\hat{j}$에 대해, 경로 위의 네 점에서의 벡터값을 각각 $v_1$부터 $v_4$라고 하자.

$$\vec{v_1} = P(x+\Delta x, y)\hat{i} + Q(x+\Delta x, y)\hat{j}$$

$$\vec{v_2} = P(x, y + \Delta y)\hat{i} + Q(x, y + \Delta y)\hat{j}$$

$$\vec{v_3} = P(x-\Delta x, y)\hat{i} + Q(x-\Delta x, y)\hat{j}$$

$$\vec{v_4} = P(x, y - \Delta y)\hat{i} + Q(x, y - \Delta y)\hat{j}$$

그리고, 여기서의 하나의 가정은 $\Delta x$, $\Delta y$는 충분히 작기 때문에 닫힌 경로 $C_k$에서 네 변 각각에서 벡터장은 변하지 않는다고 가정하도록 하자.

우리가 구하고자 하는 것은 결국 $\oint_{C_k}\vec{F}\cdot\hat{n}ds$이므로 경로 $C_k$의 네 선분에 대해 적분 값을 각각 계산해 더해주도록 하자.

벡터 $\vec{v}_1$이 지나가는 선분으로부터 시계반대방향의 순서로 계산해주자. 각 선분에서 법선벡터는 크기가 1이고 방향은 $x$ 혹은 $y$ 방향이므로 단위벡터를 이용해 표현할 수 있다.

$$\text{① }\int_C\vec{v}_1\cdot\hat{n}ds = \vec{v}_1\int_Cds=\vec{v}_1\cdot(\hat{i})2\Delta y$$

$$\text{② }\int_C\vec{v}_2\cdot\hat{n}ds = \vec{v}_2\int_Cds=\vec{v}_2\cdot(\hat{j})2\Delta x$$

$$\text{③ }\int_C\vec{v}_3\cdot\hat{n}ds = \vec{v}_3\int_Cds=\vec{v}_3\cdot(-\hat{i})2\Delta y$$

$$\text{④ }\int_C\vec{v}_4\cdot\hat{n}ds = \vec{v}_4\int_Cds=\vec{v}_4\cdot(-\hat{j})2\Delta x$$

$$\text{① + ② + ③ + ④}\Rightarrow \vec{v}_1\cdot(\hat{i})2\Delta y + \vec{v}_2\cdot(\hat{j})2\Delta x + \vec{v}_3\cdot(-\hat{i})2\Delta y + \vec{v}_4\cdot(-\hat{j})2\Delta x$$

여기서 $\vec{v}_1\cdot(\hat{i})$의 의미는 $\vec{v}_1$ 중 $x$ 컴포넌트만 남게 하겠다는 의미와 같다. 따라서, 위 식을 조금 더 풀어서 써보면 다음과 같다.

$$\Rightarrow P(x+\Delta x, y)2\Delta y + Q(x, y+\Delta y)2\Delta x - P(x-\Delta x, y)2\Delta y - Q(x, y-\Delta y)2\Delta x$$

$4\Delta x \Delta y$로 묶어주면,

$$\Rightarrow 4\Delta x\Delta y\left\lbrace
\frac{P(x+\Delta x, y) - P(x-\Delta x, y)}{2\Delta x} + \frac{Q(x, y + \Delta y) - Q(x, y-\Delta y)}{2\Delta y}
\right\rbrace$$

여기서 $4\Delta x \Delta y$는 닫힌 경로 $C_k$의 면적 $\|R_k\|$가 되고, 중괄호 안에 있는 값은 [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)편에서 본 발산 값과 비슷한데 여기서는 '유사 발산'이라고 이름 붙이도록 하자. 기호는 pseudo divergence를 생각해 $pdiv(\cdot)$이라고 하도록 하자.

$$\oint_{C_k}\vec{F}\cdot\hat{n}ds\Rightarrow |R_k|pdiv(\vec{F})$$

## 지금까지 얻은 내용을 종합해보자.

따라서, 식 (13)은 결국 다음과 같이 쓸 수 있게 된다.

$$\sum_{k=1}^N\oint_{C_k}\vec{F}\cdot\hat{n}ds = \sum_{k=1}^N|R_k|pdiv(\vec{F})$$

여기서 원래의 닫힌경로 $C$를 쪼개준 개수 $N$을 무수하게 많이 늘린다면 결국 $\Delta x$와 $\Delta y$는 매우 작아지게 되고 $\|R_k\|$는 미소 면적 $dA$로 생각할 수 있게 되고 유사 발산(pdiv)은 한 점에서의 벡터장의 발산과 같은 의미를 갖게 된다.

또, 원래의 닫힌 경로 $C$에 대한 flux 값은 무한히 쪼개 발생한 경로 $C_k$들의 flux의 합과 같다. 그러므로 식 (22)에 대해 $N$을 무한히 크게하면,

$$\oint_C\vec{F}\cdot\hat{n}ds = \lim_{N\rightarrow \infty}\sum_{k=1}^N\oint_{C_k}\vec{F}\cdot\hat{n}ds $$

$$= \lim_{N\rightarrow \infty}\sum_{k=1}^N|R_k|pdiv(\vec{F})=\iint_A div(\vec{F})dA =\iint_A\left(\frac{\partial P}{\partial x}+\frac{\partial Q}{\partial y}\right)dxdy$$

즉, 발산정리가 말하고자 하는 것은 닫힌 경로에 대해 최외각 경로에 대한 flux 값이나 그 내부를 아주 잘게 쪼개 얻은 작은 면적들의 divergence의 합이 같다는 의미를 갖는다.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/dtAgMxlt9u4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
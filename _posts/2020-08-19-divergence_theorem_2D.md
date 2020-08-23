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

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-19-divergence_theorem_2D/pic1.png">
  <br>
  그림 1. 발산 정리의 의미를 설명하기 위해 생각한 닫힌 경로 C와 내부의 면적 R
</p>

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/dtAgMxlt9u4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
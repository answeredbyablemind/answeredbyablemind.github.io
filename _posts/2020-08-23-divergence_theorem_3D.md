---
title: 발산정리(3D)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200823
tags: 미적분학
---

※ 본 포스팅에서 발산정리라고 부르는 개념은 특별한 언급이 없다면 3차원 발산 정리(가우스 정리)를 의미합니다.
이는 [2차원 발산 정리](https://angeloyeo.github.io/2020/08/19/divergence_theorem_2D.html)와 구별하기 위함입니다.

# 발산 정리의 수식

$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S} = \iiint_V(\vec{\nabla}\cdot\vec{F})dV$$

# 발산 정리의 의미

## prerequisites

발산 정리의 의미에 대해 이해하시기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)

## 발산 정리의 의미 소개

아래와 같이 어떤 벡터장 위에 닫힌 곡면 S과 그로 인해 만들어지는 정육면체 모양의 부피체가 있다고 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic1.mp4">
  </video>
  <br>
  그림 1. 3차원 공간 위에 닫힌 곡면 S와 그로 인해 만들어지는 정육면체 모양의 부피체
</p>

이 때 우리는 정육면체의 6개의 면에 대한 면벡터를 생각할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic2.png">
  <br>
  그림 2. 정육면체가 갖는 6가지 면
</p>

발산 정리에서 우리가 알고자 하는 것은 이 6개 면에 대한 [면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)이 결국 이 부피체에 의한 [삼중적분](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)의 값과 같다는 것이다.

우리는 [그린정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#curl%EC%9D%84-%ED%86%B5%ED%95%9C-%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A7%81%EA%B4%80%EC%A0%81-%EC%9D%B4%ED%95%B4)나 [스토크스 정리](https://angeloyeo.github.io/2020/08/22/stokes_theorem.html)의 의미를 알아볼 때 처럼 부피체의 부피를 쪼개가면서 발산정리의 의미에 대해 생각해보자.

우선 아래와 같이 부피체를 y 축에 대해 2개로 쪼개보자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic3.mp4">
  </video>
  <br>
  그림 3. 정육면체 형태의 부피체를 y축에 대해 두 개로 쪼갠 경우
</p>

여기서 우리는 총 12개의 면에 대해 생각할 수 있지만, 특별히 두 개로 쪼개진 부분의 면을 생각해서 조감해보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic4.png">
  <br>
  그림 4. 두 개로 쪼개진 부피체를 z-축에서 조감한 경우의 각 면벡터의 형상
</p>

이 때 쪼개진 두 부피체를 각각 $V_1$, $V_2$라고 하고 각 부피체에 포함되는 

이 때, 그림 4에서 볼 수 있듯이 쪼개진 면에서는 양쪽으로 나오는 두 면벡터가 면적은 같으나 그 방향이 반대이므로 이 면에서 구하게 되는 두 면적분 값을 합쳐주면 0이 된다.

따라서, 전체 12개의 면에 대한 면적분 값을 모두 합치면 원래의 (쪼개기 전의) 부피체에 대한 면적분의 값과 같다.

즉, 수식으로 작성하면 다음과 같다.


$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S} ={\large\bigcirc}\kern-1.55em\iint_{S_1}\vec{F}\cdot d\vec{S_1} + {\large\bigcirc}\kern-1.55em\iint_{S_2}\vec{F}\cdot d\vec{S_2} $$

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Jgng92Hhl5s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

# 발산 정리의 증명

## prerequisites

발산 정리의 증명 과정을 잘 이해하기 위해선 다음의 내용에 대해 알고오시는 것이 좋습니다.

* 미적분학의 기본정리

함수 $f$가 닫힌구간 $[a, b]$에서 연속이며, 함수 $F$가 $f$의 임의의 부정적분이면 다음이 성립한다.

$$\int_{a}^{b}f(t)dt = F(b) - F(a)$$

* [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [미소곡면의 법선벡터](https://angeloyeo.github.io/2020/08/20/normal_vector.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)
* [발산 정리의 의미](https://angeloyeo.github.io/2020/08/23/divergence_theorem_3D.html#발산-정리의-의미)

## 증명을 위한 곡면, 정의역, 벡터장 소개

이번 증명 과정에서는 정의역이 $x$, $y$ 평면이고 윗면과 아랫면의 높이가 $z = g_1(x,y)$, $z=g_2(x,y)$와 같이 정해지는 원통 모양의 닫힌 곡면을 이용해 발산 정리를 증명하고자 한다. 특히, $g_1(x,y)$와 $g_2(x,y)$로 결정되는 이 닫힌 곡면(원통)의 윗면과 아랫면의 법선 벡터는 $z$축의 단위벡터와 평행하다[^1].

----- 정의역과 닫힌 곡면 그림 넣을 곳 -----

이후 정의역이 $y$, $z$인 경우[^2]와 $x$, $z$인 경우[^3]에 대해서는 지금의 정의역이 $x$, $y$인 경우에 대한 증명 방식과 유사한 방식으로 증명할 수 있다는 방식으로 일반적인 3차원 공간에 대해 발산 정리를 증명할 수 있다.

또, 이번 증명에서는 벡터장이 $\hat k$ 컴포넌트만 주어져 있다고 가정하자. 즉, 3차원 공간 상에 주어진 벡터 필드 $\vec{F}$를 $\lt 0, 0, R\gt$로 쓰도록 하자. 꺽쇠 괄호로 표시한 것은 원래의 $\vec{F} = R(x,y,z)\hat k$를 줄여서 표시한 것이다.

우리가 증명할 발산 정리의 수식을 다시 한번 써보고 증명을 시작해보자.

$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S} = \iiint_V(\vec{\nabla}\cdot\vec{F})dV$$

## 주어진 곡면, 정의역, 벡터장을 이용한 증명

발산 정리의 수식 중 면적분 부분으로부터 증명을 시작해 보도록 하자.

$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S}$$

우리가 이번 발산 정리의 증명에서 상정하는 닫힌 곡면은 원통형인데, 원통형의 면은 윗면, 측면, 아랫면의 세 가지 면으로 나눠서 생각할 수 있으므로 위의 면적분의 식도 아래와 같이 나눠서 쓸 수 있다.

$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S} = \iint_{S_\text{윗면}}\vec{F}\cdot d\vec{S} + \iint_{S_{측면}}\vec{F}\cdot d\vec{S} + \iint_{S_{아랫면}}\vec{F}\cdot d\vec{S}$$

이 때, 측면에 대한 면적분을 생각해보면, 측면에 해당하는 면의 법선 벡터는 항상 $x, y$ 평면에 평행한 법선벡터를 갖게 된다. 그런데, 동시에 우리가 상정한 벡터장은 $\hat k$ 컴포넌트만 가지므로 법선벡터와 벡터장이 항상 수직이다. 따라서, 측면에 해당하는 면적분 값은 0이 된다. 즉, 아래와 같다.

$${\large\bigcirc}\kern-1.55em\iint_S\vec{F}\cdot d\vec{S} = \iint_{S_\text{윗면}}\vec{F}\cdot d\vec{S} + \iint_{S_{아랫면}}\vec{F}\cdot d\vec{S}$$

이제 여기서 수식을 좀 더 전개하기 위해 [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)에서 계산했던 것 처럼 면벡터($d\vec{S}$)에 대해 계산해보도록 하자. 일반적으로 곡면은 아래와 같이 두 개의 매개변수를 이용해 표현된다.

$$\vec{r}(u,v) = x(u,v)\hat i + y(u,v)\hat j + z(u,v)\hat k$$

이번 증명에서는 곡면의 정의역이 $x$, $y$이고 높이가 $z = g_1(x,y)$ 혹은 $z=g_2(x,y)$로 정해지므로 곡면의 방정식을 아래와 같이 쓸 수 있다.

$$\vec{r}(x,y) = x\hat i + y\hat j + g(x, y)\hat k$$

따라서, 미소곡면에 대한 면벡터는 아래와 같이 쓸 수 있을 것이다.

$$d\vec{S} = (r_x\times r_y) dxdy = 
\begin{vmatrix}
  \hat i && \hat j && \hat k \\
  1 && 0 && g_x \\
  0 && 1 && g_y
\end{vmatrix} dxdy$$

$$=\lt -g_x, -g_y, 1 \gt dxdy$$

여기서 원래의 면적분 값의 계산을 조금 더 전개해보도록 하자.

$$\Rightarrow \iint_{S_\text{윗면}}\vec{F}\cdot d\vec{S} + \iint_{S_{아랫면}}\vec{F}\cdot d\vec{S} \notag$$

$$=\iint_{D_{윗면}}\lt 0, 0, R(x, y, g_2(x,y))\gt \cdot \lt -g_x, -g_y, 1\gt dxdy\notag$$

$$-\iint_{D_{아랫면}}\lt 0, 0, R(x, y, g_1(x,y))\gt \cdot \lt -g_x, -g_y, 1\gt dxdy$$

위 식에서 중간의 부호가 더하기에서 빼기로 바뀌는 것은 $g_2(x,y)$의 법선벡터와 $g_1(x, y)$의 법선벡터의 방향이 반대이기 때문이다.

내적을 취해준 뒤 수식을 조금 더 전개하면,

$$\Rightarrow\iint_{D_{윗면}}R(x,y,g_2(x,y))dxdy - \iint_{D_{아랫면}}R(x,y,g_1(x,y))dxdy$$

$$=\iint_D R(x,y,g_2(x,y)) - R(x,y,g_1(x,y))dxdy$$

[그린정리의 증명](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A6%9D%EB%AA%85)에서 사용한 방식과 마찬가지로, 여기서 미적분학의 기본정리를 이용하면 위 식은 아래와 같이 생각할 수도 있다.

$$\Rightarrow\iint_D \left(\int_{z=g_1(x,y)}^{z=g_2(x,y)} \frac{\partial R}{\partial z}dz\right) dxdy$$

이는 [삼중적분](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)을 이용해서 아래와 같이 표기할 수도 있다.

$$\Rightarrow \iiint_V\frac{\partial R}{\partial z}dxdydz$$

여기서 $\frac{\partial R}{\partial z}$는 벡터장 $\vec{F} = \lt 0, 0, R\gt$ 에서의 [발산](https://angeloyeo.github.io/2019/08/25/divergence.html)값과 같다고 할 수 있다. 또, $dxdydz$는 미소 부피이므로 $dV$와 같이 쓸 수 있다. 따라서, 위 식은 아래와 같이 쓸 수 있다.

$$\Rightarrow \iiint_V\left(\vec{\nabla}\cdot \vec{F}\right)dV$$

즉, 이것은 원래의 발산정리의 식을 증명한 것과 같다.

## 일반적인 3차원 공간에 대한 발산 정리

앞서 우리는 정의역이 $x$, $y$이고 $z$ 축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^1]에 대해 발산정리를 증명했다.

마찬가지 방법으로 정의역이 $y$, $z$이고 $x$축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^2]에 대해서, 그리고 정의역이 $x$, $z$이고 $y$축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^3]에도 앞서 증명한 방법과 같은 방법으로 증명할 수 있기 때문에 일반적인 닫힌 곡면에 대한 3차원 공간에서 발산 정리가 성립한다고 할 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/mGAVueXsqcA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

[^1]: 보통 이런 공간을 type-I region이라고도 부른다.

[^2]: type-II region

[^3]: type-III region

---
title: 매개변수 변환법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210605
tags: 미분방정식
---

# Prerequisites

이 포스팅을 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html)
* [론스키안(Wronskian)](https://angeloyeo.github.io/2019/10/10/Wronskian.html)
* [크래머 공식(Cramer's Rule)](https://angeloyeo.github.io/2021/06/08/Cramers_rule.html)
* [미정계수법](https://angeloyeo.github.io/2021/06/04/undetermined_coefficients.html)

# 매개변수 변환법 소개

매개변수 변환법은 비제차 미분방정식을 풀이하기 위해 고안된 방법이다.

미정계수법은 비제차 항이 다항 함수, 코사인, 사인함수, 지수함수인 경우에만 적용할 수 있었지만 매개변수 변환법은 그 활용도가 더 넓다고 할 수 있다.

아래와 같은 2계 비제차 미분방정식을 생각해보자.

$$x''+p(t)x'+q(t)x=r(t)$$

위와 같은 2계 비제차 미분방정식의 해는 다음과 같은데,

$$x(t) = x_h(t) + x_p(t)$$

$x_c(t)$의 기저 함수는 두 개이므로 조금 더 풀어쓰면 다음과 같다.

$$x(t)=c_1x_1(t)+c_2x_2(t)+x_p(t)$$

여기서 매개변수 변환법의 아이디어는 [Reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order.html) 편에서 본 것 처럼 $x_h$의 기저 $x_1$과 $x_2$를 이용해서 $x_p$를 구해낼 수는 없을까 라는 것이다.

다시 말해 아래와 같이

$$x_p(t) = u(t)x_1(t) + v(t)x_2(t)$$

와 같이 $x_p$를 설정하면 $x_1(t)$와 $x_2(t)$에 모두 독립적인 적절한 $x_p(t)$를 얻어낼 수 있을 것이라는 아이디어이다.

여기서 $x_p(t)$를 잘 보면 $x_h(t)$의 $c_1$과 $c_2$를 $u$, $v$로 바꾼 것임을 알 수 있다. 다시 말해, parameter를 바꾼 것이라고 할 수 있고 이런 맥락에서 매개변수 변환법(variation of parameters)라는 method의 이름이 부여된 것이락 볼 수 있다.

아무튼 여기서 중요한 것은 $x_p(t)$ 역시도 식(1)을 만족하는 solution이라는 것이다. 따라서 $x_p$를 식 (1)에 대입해보자.

그러기 위해 1차 미분과 2차 미분을 구해보면,

$$x_p=ux_1+vx_2$$

$$x_p'=u'x_1+ux_1'+v'x_2+vx_2'$$

여기서 $x_p''$을 구하기 전에 아래와 같은 가정을 덧붙여보자.

$$u'x_1+v'x_2 = 0$$

이 가정은 미분 식을 간단하게 만들어줄 뿐만 아니라 솔루션을 구하는데 매우 핵심적인 역할을 한다. 이 가정은 뒤에 있을 Cramer's rule에 적용하기 위한 연립 방정식으로 연결되기 때문이다. 우리는 적절한 $u$, $v$를 찾는 것이 목적이기 때문에 이런 가정까지도 만족하는 $u$와 $v$를 찾기만 하면 되는 것이다. 

이런 가정을 가지고 $x_p''$을 구하면,

$$x_p'' = u'x_1'+ux_1''+v'x_2'+vx_2''$$

임을 알 수 있다.

따라서, 원래의 미분방정식에 $x_p''$, $x_p'$, $x_p$를 대입하면,

$$x_p''+p(t)x_p'+q(t)x_p=r(t)$$

$$=\Big\lbrace u'x_1'+ux_1''+v'x_2'+vx_2''\Big\rbrace+p(t)\Big\lbrace (ux_1'+vx_2')\Big\rbrace + q(t)(ux_1+vx_2) = r(t)$$

이 식을 $u$와 $v$에 관해 다시 정리해주면,

$$\Rightarrow u\Big\lbrace x_1''+p(t)x_1'+q(t)x_1 \Big\rbrace
\\ \\
\quad\quad + v\Big\lbrace x_2''+p(t)x_2'+q(t)x_2 \Big\rbrace
\\ \\
\quad\quad\quad + u'x_1'+v'x_2' = r(t)
$$

이다. 여기서 중괄호($\lbrace\rbrace$) 안에 있는 방정식은 모두 제차미분방정식의 해를 가지고 써준 것이므로 0이다. 따라서 위의 식은 

$$\Rightarrow u'x_1'+v'x_2'=r(t)$$

와 같이 쓸 수 있다.

---

여기서 식 (7)과 식 (12)를 묶어 다음과 같이 표현해보자.

$$\begin{cases}u'x_1+v'x_2= 0 \\ \\ u'x_1'+v'x_2'=r(t)\end{cases}$$

이 식은 일종의 연립방정식으로 아래와 같이 행렬을 이용해 표현할 수도 있다.

$$\begin{bmatrix}x_1 & x_2\\ x_1' & x_2'\end{bmatrix}\begin{bmatrix}u' \\ v'\end{bmatrix}=\begin{bmatrix}0 \\ r(t)\end{bmatrix}$$

따라서, 우리가 구하게 되는 해는 $u'$와 $v'$에 관한 것이다.

이 연립방정식을 구할 수 있는 해법 중 하나는 크래머 법칙(Cramer's rule)이다.

크래머 법칙을 이용하면 아래와 같이 해를 구할 수 있다.

$$u'=\frac
  {\text{det}\left(\begin{bmatrix}0 & x_2 \\ r(t) & x_2'\end{bmatrix}\right)}
  {\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)}
$$

$$v'=\frac
  {\text{det}\left(\begin{bmatrix}x_1 & 0 \\ x_1' & r(t) \end{bmatrix}\right)}
  {\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)}
$$

여기서 분모의 $\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)$를 $x_1$과 $x_2$의 [론스키안(Wronskian)](https://angeloyeo.github.io/2019/10/10/Wronskian.html)이라고 부르는데 우리는 $W(x_1, x_2)$라고 적자.

그리고 각 분자에 있는 행렬식은 $2\times 2$ 행렬의 행렬식을 직접 계산할 수 있으므로,

$$u'=\frac{-x_2r(t)}{W(x_1,x_2)}$$

$$v'=\frac{x_1r(t)}{W(x_1,x_2)}$$

임을 알 수 있다. 따라서,

$$u(t)=\int \frac{-x_2r(t)}{W(x_1,x_2)} dt$$

$$v(t)=\int \frac{x_1r(t)}{W(x_1,x_2)} dt$$

과 같이 $u(t)$와 $v(t)$를 계산할 수 있게 된다.

따라서, particular solution은

$$x_p(t) = -x_1\int\frac{x_2r(t)}{W(x_1,x_2)}dt+x_2\int\frac{x_1r(t)}{W(x_1,x_2)}dt$$

가 됨을 알 수 있다.

# 예제문제

## 문제 1.

아래의 미분방정식의 해를 구하시오.

$$2x''+18x=6\tan(3t)$$

### Solution

매개변수 변환법을 이용해 문제를 풀 때 빠질 수 있는 함정 중 하나는 최고 차항의 계수가 1이 아닌 경우에 이것을 1로 만들어줘야 한다는 점이다.

그러기 위해 양변을 $2$로 나눠주자.

$$\Rightarrow x''+9x=3\tan(3t)$$

[2계 선형미분방정식의 해법(2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html) 편에서 확인한 바와 같이 대입법을 이용해 위 방정식의 제차꼴 해를 풀어주면,

$$x_h(t) = c_1\cos(3t)+c_2\sin(3t)$$

임을 알 수 있다.

따라서 $x_1(t) = \cos(3t)$ 이고, $x_2(t)=\sin(3t)$이다.

식 (21)의 해법을 이용해 비제차 해(particular solution)을 구해보자.

그러기 위해 $x_1$과 $x_2$와 Wronskian을 먼저 계산하도록 하자.

$$W(x_1, x_2) = \text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1'& x_2'\end{bmatrix}\right)=\text{det}\left(\begin{bmatrix}\cos(3t) & \sin(3t) \\ -3\sin(3t) & 3\cos(3t)\end{bmatrix}\right)$$

$$=3\cos^2(3t)+3\sin^2(3t) = 3$$

따라서, particular solution은

$$x_p(t) = -\cos(3t)\int \frac{3\sin(3t)\tan(3t)}{3}dt+\sin(3t)\int \frac{3\cos(3t)\tan(3t)}{3}dt$$

여기서 $\tan(t)=\frac{\sin(t)}{\cos(t)}$ 라는 사실을 이용하자.

$$\Rightarrow-\cos(3t)\int\frac{\sin^2(3t)}{\cos(3t)}dt+\sin(3t)\int\sin(3t)dt$$

$$=-\cos(3t)\int\frac{1-\cos^2(3t)}{\cos(3t)}dt+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

$$=-\cos(3t)\int\sec(3t)-\cos(3t)dt+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

$$=-\cos(3t)\left(\int\sec(3t)dt-\int\cos(3t)dt\right)+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)
$$

$\sec(t)$의 적분이 아래와 같다는 사실을 이용하자.

$$\int\sec(t)dt = \ln|\sec(t)+\tan(t)|+C$$

$$\Rightarrow-\cos(3t)\left(\frac{1}{3}\ln|\sec(3t)+\tan(3t)|\right)+\cos(3t)\left(\frac{1}{3}\sin(3t)\right)+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

여기서 뒤의 두 개 항은 부호만 반대이고 값은 같은 것이므로,

$$\Rightarrow-\cos(3t)\left(\frac{1}{3}\ln|\sec(3t)+\tan(3t)|\right)$$

$$=-\frac{\cos(3t)}{3}\ln|\sec(3t)+\tan(3t)|$$

와 같이 particular solution을 구할 수 있다.

따라서 일반해는

$$x(t) = c_1\cos(3t)+c_2\sin(3t)-\frac{\cos(3t)}{3}\ln|\sec(3t)+\tan(3t)|$$

이다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/TmgzQ83rNs4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
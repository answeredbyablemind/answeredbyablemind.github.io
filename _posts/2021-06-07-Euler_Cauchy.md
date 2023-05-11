---
title: 오일러-코시 미분방정식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210607
tags: 미분방정식
lang: ko
---

# Prerequisites 

이 포스팅의 내용에 대해 잘 알기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [2계 선형 미분방정식의 해법 (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2.html)

# 오일러-코시 미분방정식 소개

$n$계 오일러 코시 미분방정식은 아래와 같은 형태를 띄는 미분방정식을 말한다.

$$a_nx^ny^{(n)}(x)+a_{n-1}x^{n-1}y^{(n-1)}(x)+\cdots+a_0y(x)=f(x)$$

2계 오일러-코시 미분방정식은 다음과 같을 것이다.

$$a_2x^2y''+a_1xy'+a_0y=f(x)$$

2계 오일러-코시 미분방정식을 보면 이 미분방정식은 선형 미분방정식이지만 미분계수 앞에 붙은 값들이 상수가 아니기 때문에 일반적으로 사용하는 2계 선형미분방정식의 해법을 바로 적용하기는 어려운 면이 있다.

## 연산자의 선형성 확인

오일러 코시 미분방정식이 선형 미분방정식인 것을 확인해보기 위해선 아래의 절차를 거치면 된다.

오일러 코시 미분방정식의 미분연산자는

$$L=a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0$$

이므로,

$$L(c_1y_1 + c_2y_2)=c_1L(y_1)+c_2L(y_2)$$

임을 확인해보자.

$$L(c_1y_1+c_2y_2)=\left(a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0\right)(c_1y_1+c_2y_2)$$

$$=c_1\left(a_2x^2\frac{d^2y_1}{dx^2}+a_1x\frac{dy_1}{dx}+a_0y_1\right)+c_2\left(a_2x^2\frac{d^2y_2}{dx^2}+a_1x\frac{dy_2}{dx}+a_0y_2\right)$$

$$=c_1L(y_1)+c_2L(y_2)$$

따라서 오일러-코시 미분방정식은 선형미분방정식이다.

## 해를 구하는 방법 (1)

만약 오일러-코시 미분방정식이 제차 미분방정식인 경우에는 다음과 같이 식을 구하면 편하다.

$y=x^m$의 형태를 띌 것이라 가정하는 것이다. 이렇게 하는 이유는 $y=x^m$으로 두면 $y$를 두번 미분한 것은 $y''=m(m-1)x^{m-2}$가 되는데 그와 동시에 바로 앞에 $x^2$이 붙어 있으므로 두 번 미분해줘서 승수를 낮춰준 것이 상쇄되는 효과를 보인다고 생각할 수 있기 때문이다.

거듭해서 얘기하지만 미분방정식을 풀 때는 그 미분방정식이 유일해를 가진다고 판단되면 방법이 어떻든 간에 풀어내기만 하면 그것이 정답이다. 미분방정식의 해법은 그래서 아이디어 싸움이다보니 풀이법도 중구난방이다.

어찌되었든 $y=x^m$이라고 가정한 것을 원래의 식 (2)에 대입하되, 제차 미분방정식의 꼴로 미분방정식을 생각해주면 다음과 같이 쓸 수 있다.

$$식(2)\Rightarrow a_2x^2 \cdot m (m-1)(x^{m-2})+a_1x\cdot m (x^{m-1})+a_0x^m=0$$

$$=(a_2m(m-1)+a_1m+a_0)x^m =0$$

$$=(a_2m^2+(a_1-a_2)m+a_0)x^m=0$$

여기서 $x\neq 0$일 때 공통인자 $x^m$을 제거하면,

$$\Rightarrow a_2m^2+(a_1-a_2)m+a_0=0$$

이 된다.
 
따라서, 여기서 $m$에 따라 미분방정식의 해를 구할 수 있게 되는 것이다.

## 해를 구하는 방법 (2)

또 다른 오일러-코시 미분방정식을 풀기 위한 방법은 아래와 같이 치환법을 이용하는 것이다.

이 방법은 비제차 오일러-코시 미분방정식을 풀어야 할 때 유용하게 사용할 수 있다.

$$z=\ln(x)$$

$$y(x)=\phi(\ln(x))=\phi(z)$$

그러면 미분계수는 다음과 같이 치환 가능하다.

$$\frac{dy}{dx}=\frac{d\phi}{dx}=\frac{d\phi}{dz}\cdot\frac{dz}{dx}=\frac{d\phi}{dz}\cdot\frac{1}{x}$$

$$\frac{d^2y}{dx^2}=\frac{d}{dx}\left(\frac{d\phi}{dz}\cdot\frac{1}{x}\right)$$

$$=\frac{d}{dx}\frac{d\phi}{dz}\frac{1}{x}+\frac{d\phi}{dz}\cdot\frac{d}{dx}\left(\frac{1}{x}\right)$$

$$=\frac{d}{dz}\frac{d\phi}{dx}\frac{1}{x}+\frac{d\phi}{dz}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d}{dz}\left(\frac{d\phi}{dz}\frac{1}{x}\right)\frac{1}{x}+\frac{d\phi}{dz}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d^2\phi}{dz^2}\cdot\frac{1}{x^2}-\frac{d\phi}{dz}\frac{1}{x^2}$$

$$=\frac{1}{x^2}\left(\frac{d^2\phi}{dz^2}-\frac{d\phi}{dz}\right)$$

따라서, 원래의 식 (2)는 다음과 같이 바뀐다.

$$식(2)\Rightarrow a_2x^2\frac{1}{x^2}\left(\frac{d^2\phi}{dz^2}-\frac{d\phi}{dz}\right)+a_1x\frac{1}{x}\frac{d\phi}{dz}+a_0\phi(z)=f(e^z)$$

$$= a_2\left(\frac{d^2\phi}{dz^2}-\frac{d\phi}{dz}\right)+a_1\frac{d\phi}{dz}+a_0\phi(z)=f(e^z)$$

$$=a_2\frac{d^2\phi}{dz^2}+(a_1-a_2)\frac{d\phi}{dz}+a_0\phi(z)=f(e^z)$$

이제부터 위 식은 선형 2계 미분방정식을 풀어주는 방법을 도입해서 풀이할 수 있다.

이 결과는 방법 (1)과 같은 결과를 보여주는 것을 알 수 있다. 다만, 비제차 항을 처리할 방법이 생긴다는 점에서 방법 (1)과 다른 점이 있다.

# 예시

## 문제 1.

아래의 미분방정식의 해를 구하시오.

$$x^2u''-3xu'+3u=0$$

### 해법

우리는 $u=x^m$이라는 해를 가질 것이라 가정하고 문제를 풀어보자.

$u=x^m$을 대입하면,

$$\Rightarrow x^2(m(m-1)x^{m-2})-3x(mx^{m-1})+3x^m=m(m-1)x^m-3mx^m+3x^m=(m^2-4m+3)x^m=0$$

여기서 $x^m$이 해가 되기 위해선 $x=0$이라는 조건은 피해야만 한다. 이 조건을 제외했을 때 솔루션 $u$는

$$u(x)=c_1x+c_2x^3$$

임을 알 수 있다.
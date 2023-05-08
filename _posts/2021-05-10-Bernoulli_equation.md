---
title: 베르누이 미분방정식
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210510
tags: 미분방정식
lang: ko
---

이전 포스팅 [1계 선형 미분 방정식의 해법](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html) 편에서는 아래와 같은 미분방정식의 해법을 찾는 방법에 대해 다룬 바 있다.

$$\frac{dx}{dt}+p(t)x=q(t) % 식 (1)$$

이번 시간에는 위 식 (1)이 약간 변형된 비선형 미분 방정식 중 하나인 베르누이 미분방정식의 해법에 대해 알아보고자 한다.

# 베르누이 미분방정식의 형태

베르누이 미분방정식의 형태는 아래와 같다.

$$\frac{dx}{dt}+p(t)x=q(t)x^n % 식 (2)$$

여기서 $p(t)$와 $q(t)$는 우리가 분석하고자하는 구간에서 연속함수이고, $n$은 실수라고 하자.

만약 $n=0$이거나 $n=1$이면 선형미분 방정식이 되는 경우이므로 베르누이 미분방정식에서는 $n=0$이거나 $n=1$이 아닌 경우에 관심이 있는 경우라고 할 수 있다.

# 베르누이 미분방정식의 해법

베르누이 미분방정식의 해법의 핵심은 식 (2)의 비선형적인 방정식을 선형적인 형태로 바꿔주는 것이다.

이를 위해 식 (2)의 양변을 $x^n$으로 나눠보자.

$$\Rightarrow x^{-n}\frac{dx}{dt}+p(t)x^{1-n}=q(t) % 식 (3)$$

이제 식 (3)을 식 (1)과 유사한 형태로 바꿔주기 위해 식 (3)의 좌변에 있는 $x^{1-n}$을 새로운 함수인 $u=x^{1-n}$으로 바꾼다고 생각해보자.

여기서 확인해볼 수 있는 것 중 하나는 $u$를 $t$에 대해 미분한 결과인데, chain rule을 $u=x^{1-n}$의 우변에 적용하면

$$\frac{du}{dt}=(1-n)x^{-n}\frac{dx}{dt} % 식(4)$$

이다.

따라서, 식 (3)은 다음과 같이 쓸 수 있다.

$$식(3)\Rightarrow \frac{1}{1-n}\frac{du}{dt}+p(t)u=q(t) % 식 (5)$$

다시 말하면, 베르누이 미분방정식에 치환을 적절히 적용하면 일반적인 [1계 선형미분방정식](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations.html)으로 바꿔줄 수 있게 된다.

# 예제

여타 미분방정식처럼 예제 문제를 풀어보는 것이 베르누이 미분방정식의 해를 구하는 방법을 이해하는데 도움이 될 것으로 보인다.

## 문제 1

다음 미분방정식의 해를 구하여라.

$$\frac{dx}{dt}+\frac{1}{t}x=t^2x^2 % 식 (6)$$

### 풀이

주어진 식은 $n=2$인 베르누이 미분방정식이다. 여기서 식 (6)의 양변을 $x^2$로 나눠주자.

그러면,

$$\frac{1}{x^2}\frac{dx}{dt}+\frac{1}{t}\frac{1}{x}=t^2 % 식 (7)$$

이다.

여기서 $u=x^{-1}$라 두면,

$$\frac{du}{dt}=\frac{d}{dt}(x^{-1})\frac{dx}{dt}=-\frac{1}{x^2}\frac{dx}{dt} % 식 (8)$$

이다. 그러므로 식 (7)은 다음과 같이도 쓸 수 있게 된다.

$$식(7) \Rightarrow -\frac{du}{dt}+\frac{1}{t}u=t^2 % 식 (9)$$

여기서 양변에 $(-1)$을 곱해주면

$$\frac{du}{dt}-\frac{1}{t}u=-t^2 % 식 (10)$$

이다.

여기서부터는 1계 선형미분방정식의 해를 찾는 방법을 이용하여, 양변에 적분 인자 $e^{\int -\frac{1}{t}dt}$를 곱해주자.

$\int -\frac{1}{t}dt=-\ln t$이고, $e^{-\ln t}=e^{\ln 1/t}=1/t$이므로 적분인자는 $1/t$이다.

따라서, 식 (10)의 양변에 $1/t$를 곱해주면,

$$\frac{1}{t}\frac{du}{dt}-\frac{1}{t^2}u=-t % 식 (11)$$

가 되고, 식 (11)은 다음과 같이 변형할 수 있다.

$$식(11)\Rightarrow \frac{d}{dt}\left(\frac{u}{t}\right)=-t$$

$$\Rightarrow \frac{u}{t} = -\int t dt + C=-\frac{1}{2}t^2+C$$

$$\therefore u(t) = -\frac{1}{2}t^3+Ct$$

원래 $u=1/x$라고 하였으므로, 

$$\therefore x(t) = \frac{1}{-0.5t^3+Ct}$$

이다.

<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Fluz6bjmgm8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

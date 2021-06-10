---
title: 스트룸-리우빌 이론
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210606
tags: 미분방정식
---

이번 포스팅은 [University of Washington의 Nathan Kutz 교수님 강의](https://www.youtube.com/watch?v=12d15vI52b8)를 참고하여 작성한 것임을 미리 밝힙니다.

# Prerequisites

이번 포스팅의 내용에 대해 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)
* [고유함수 전개](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html)

# 스트룸 리우빌 이론 소개

스트룸 리우빌 이론(Sturm-Liouville theory)[^1]은 2계 선형미분방정식의 해를 얻고 이 해의 특성을 이해하기 위한 이론이다. (포스팅에서는 줄여서 S-L 이론이라고도 부르고자 함)

[^1]: 이름이 심지어 정리(theorem)가 아닌 '이론(theory)'이다. 이 이론을 따르는 수 많은 적용 사례들이 있음을 시사한다.

특히, 2계 선형미분방정식을 연산자(operator)의 관점에서 봄으로써 해를 구하고자 하는 시도에서 출발한다. 이 이론이 의미있는 이유는 아무리 복잡한 2계 미분방정식이더라도 S-L 이론의 관점에서 문제를 보면 그 문제들을 다르게 해석해볼 수 있기 때문이다.

선형 연산자 $L$에 대해 아래와 같은 꼴을 띄는 방정식은 스트룸 리우빌 이론으로 해석할 수 있다.

$$Lu=\mu r(x)u+f(x) % 식(1)$$

여기에 아래와 같은 경계 조건이 주어져야 한다. 

$$\alpha_1 u(a)+\beta_1 \frac{du(a)}{dx}=0 % 식(2)$$

$$\alpha_2 u(b)+\beta_2 \frac{du(b)}{dx}=0 % 식(3)$$

여기서 $\alpha, \beta$ 값들은 다음과 같은 성질을 만족하는 상수이다[^1].

$$\alpha_1^2+\beta_1^2 >0 % 식 (4)$$

$$\alpha_2^2+\beta_2^2 >0 % 식 (5)$$

[^1]: 이 조건이 만족할 때를 regular S-L 문제라고 하는데, 너무 깊게는 들어가지 말자.

조금 더 구체적으로 선형 연산자 $L$은 아래와 같이 주어지는 것이며 이 연산자를 스트룸 리우빌 연산자(Sturm-Liouville Operator)라고 부르자.

$$Lu = -\frac{d}{dx}\left[p(x)\frac{du}{dx}\right]+q(x)u$$

여기서 $p(x), q(x), r(x)$가 $x\in[a,b]$의 구간에서 $0$보다 큰 함수여야 한다.

## 2계 선형미분방정식과의 관계

스트룸 리우빌 연산자와 스트룸 리우빌 이론을 적용 시키기 위한 방정식의 꼴은 매우 생소해보인다.

하지만, 이 연산자를 적용해 방정식을 풀면 일반적인 2계 선형미분방정식을 다른 방법으로 적은 것이라는 것을 알 수 있다.

$$Lu=\mu r(x) u+f(x)$$

$$\Rightarrow -\frac{d}{dx}\left[p(x)\frac{du}{dx}\right]+q(x)u=\mu r(x)u+f(x)$$

$$\Rightarrow -\frac{dp}{dx}\frac{du}{dx}-p(x)\frac{d^2u}{dx^2}+(q(x)-\mu r(x))u=f(x)$$

여기서 순서만 약간 정리해주면,

$$\Rightarrow -p(x)u''-\frac{dp}{dx}u'+(q(x)-\mu r(x))u=f(x)$$

와 같다는 것을 알 수 있으며, 이것은 일반적인 2계 선형 미분방정식의 꼴임을 쉽게 알 수 있다.

즉, 스트룸 리우빌 문제는 일반적인 2계 선형미분방정식 중 $p(x),q(x),r(x)$가 0보다 큰 함수여야 한다는 조건과 특정한 경계 조건을 만족하는 2계 미분방정식의 해를 구해내기 위해 정립된 이론으로 생각할 수 있는 것이다.

다만, 원래의 스트룸 리우빌 이론의 방정식 꼴을 띄게 이론을 구축한 이유는 많은 문제가 스트룸 리우빌 이론의 방정식과 같은 형태로 방정식이 주어지기 때문이다.

## S-L 연산자는 self-adjoint 연산자이다.

생소한 개념들이 계속해서 등장하고 있을 것으로 생각된다.

self-adjoint란 것은 또 무엇일까?

[선형 연산자와 함수 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html) 편에서 확인했던 것과 같이 adjoint 라는 것은 선형대수학에서 행렬의 transpose에 대응되는 개념이라고 언급한 바 있다.

일단 adjoint에 대해 잠깐 복습해보자.

$x\in [a, b]$에 대해 정의된 함수 $f(x)$, $g(x)$의 내적을 아래와 같이 정의하자. 

$$\langle f, g\rangle = \int_{a}^{b}\overline{f(x)}g(x)dx$$

여기서 $\overline{f(x)}$ 표기는 $f(x)$ 함수에 대해 complex conjugate을 취해둔 것이다.

그러면 어떤 선형연산자 $L$에 대한 adjoint $L^\dagger$는 다음과 같은 성질을 만족해야 한다.

$$\langle Lf, g \rangle=\langle f, L^\dagger g\rangle$$

다시 말해 self-adjont인 연산자란 $L^\dagger =L$인 연산자를 말한다.

그러므로 다음과 같은 성질을 만족해야 한다.

$$\langle Lf, g\rangle =\langle f, Lg\rangle$$

이러한 연산자들은 마치 <b><span style="color:red">선형대수학에서 대칭 행렬(symmetric matrix) 혹은 에르미트 행렬(Hermitian matrix)의 개념에 대응</span></b>된다.

이제 S-L 연산자가 self adjoint 연산자임을 확인해보자.

$$\langle Lf, g\rangle=\int_{a}^{b}\left(-\frac{d}{dx}\left[p(x)\overline{f '}\right]+q(x)\overline f\right)g \ dx$$

$$=\int_{a}^{b}-\frac{d}{dx}\left[p(x)\overline{f'}\right]g +q(x)\overline f g \ dx$$

부분 적분을 이용하면

$$\Rightarrow -\left[p(x)\overline{f'}g\right]_{a}^{b}+\int_{a}^{b}\left(p(x)\overline{f'}g' + q(x)\overline f g \right)dx$$

또, 마찬가지로,

$$\langle f, Lg\rangle=\int_{a}^{b}\overline f\left(-\frac{d}{dx}\left[p(x)g'\right]+q(x)g\right)dx$$

마찬가지로 부분적분을 이용해,

$$=-\left[\overline{f} p(x)g'\right]_{a}^{b}+\int_{a}^{b}\left(\overline{f'}p(x)g'+\overline f q(x)g \right)dx$$

이다.

이 때, $\langle Lf, g\rangle=\langle f, Lg\rangle$ 인지 여부를 확인해보자.

$$\langle Lf, g\rangle-\langle f, Lg\rangle = \left(-\left[p(x)\overline{f'}g\right]_{a}^{b}+\int_{a}^{b}\left(p(x)\overline{f'}g' + q(x)\overline f g \right)dx\right)\\-\left(-\left[\overline{f} p(x)g'\right]_{a}^{b}+\int_{a}^{b}\left(\overline{f'}p(x)g'+\overline f q(x)g \right)dx\right)$$

$$=-\left[p(x)\overline{f'}g\right]_{a}^{b}+\left[\overline{f} p(x)g'\right]_{a}^{b}$$

$$=-\left[p(x)\overline{f'}g-p(x)\overline{f}g'\right]_{a}^{b}$$

$$=\left[p(x)W(\overline{f}, g)\right]_{a}^{b}$$

여기서 $W$는 Wronskian이다.

이 때, 잘 생각해보면 $W(\overline{f},g)$는 $x=a$일 때나 $x=b$일 때나 항상 0이다. 왜냐하면, 식 (2)의 경계조건(즉, $x=a$인 경우)을 함수 $\overline{f}$와 $g$에 대해 얻은 두 조건을 행렬로 표현해보면 다음과 같은데

$$\begin{bmatrix}\overline{f(a)} &\overline{f'(a)}\\g(a) & g'(a)\end{bmatrix}\begin{bmatrix}\alpha_1 \\ \beta_1\end{bmatrix}=\begin{bmatrix}0 \\0\end{bmatrix}$$

여기서 위 식의 왼쪽에 있는 행렬이 역함수를 가지게 되면 $\alpha_1$, $\beta_1$은 모두 0이 되므로 식 (4)의 조건을 어기게 되는 것이다. 그 뿐만 아니더라도 $\alpha_1$과 $\beta_1$이 모두 0이면 아무런 의미없는 경계조건이 되는 것이므로 $W(\overline{f}, g)$가 0이 되어야 함은 자명하다고 할 수 있다. 마찬가지 방법으로 $b$에 대해서도 위의 방법은 성립한다.

따라서, $\langle Lf, g\rangle-\langle f, Lg\rangle = 0$임을 알 수 있다.

그러므로 S-L 연산자 $L$은 self-adjoint 연산자임을 알 수 있다.

## 스트룸 리우빌 이론의 고윳값 문제

S-L 연산자의 고윳값, 고유함수 문제를 다루기에 앞서 우리는 구간 $[a,b]$에서 정의되는 복소함수 $f(x)$, $g(x)$, $r(x)$에 대해서 아래와 같은 내적 연산을 정의하자.

$$\langle f, g \rangle_r=\int_{a}^{b}r(x)\overline{f(x)}g(x)dx$$

여기서 $r(x)$는 weighting function이라고 부른다. 많은 경우에 $r(x)=1$인데 그렇지 않은 일반적인 경우까지 포함하기 위해 위와 같은 형태의 내적을 정의한다고 보면 좋을 것 같다. $r(x)=1$인 경우의 함수의 내적은 다음과 같이 쓰도록 하자.

$$\langle f, g \rangle=\int_{a}^{b}\overline{f(x)}g(x)dx$$

또, 직교성에 대한 표현을 쉽게 하기 위해 다음과 같은 Kronecker Delta 함수 표기를 생각하자.

$$\langle u_n, u_m\rangle_r=\delta_{mn}$$

여기서 $\delta_{mn}$은 $m=n$ 인 경우만 1이고 나머지 경우는 0인 함수를 의미한다.

이제 S-L 연산자 $L$에 대해 다음과 같은 식을 생각해보자.

$$Lu_n=\lambda_nr(x) u_n$$

여기서 $u_n$은 $x$에 대한 함수이고 고윳값 $\lambda_n$에 대응하는 고유함수라는 것을 생각해볼 수 있다.

이 식의 우변이 $r(x)$가 곱해진 형태로 주어진 것은 원래의 Sturm-Liouville 이론에서 주어진 방정식의 우변의 형태에 맞춰진 것이다.

---

한편, 우리는 앞서 Sturm-Liouville operator가 self-adjoint operator라는 것을 확인했다.

self-adjoint operator는 잠깐 언급했듯이 선형대수학에서 에르미트 행렬(Hermitian matrix)의 개념을 확장시킨 것이라고 할 수 있다.

[고유함수 전개](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html) 편에서 에르미트 행렬을 소개한 바 있었는데, 에르미트 행렬의 가장 중요한 특징은 **에르미트 행렬의 고윳값은 모두 실수이고 서로 다른 고윳값에 대응되는 고유벡터들이 모두 직교한다**는 것이었다.

마찬가지로 self-adjoint operator 역시도 고윳값, 고유함수를 가진다. 그리고 self-adjoint operator의 고윳값은 모두 실수이며, 고윳값들이 서로 다르면 고유함수들이 직교한다.

그런데 혹시 S-L 이론에서는 고윳값들이 모두 다르다(distinct)는 것을 보장받을 수만 있다면 S-L 연산자의 모든 고유함수들은 서로 직교할 수 있다. 과연 S-L 연산자의 고윳값들은 모두 distinct하다고 할 수 있을까?

정답은 "그렇다"이다. 식 (2)~식(5)의 조건을 만족하는 S-L 연산자라면 고윳값이 모두 distinct하고 서로 다른 고유 함수가 직교하는 특성을 갖는다. 이에 대해서는 스트룸의 분리 정리, 스트룸의 비교 정리, 스트룸의 진동 정리를 통해 증명할 수 있다고 하는데, 아직 필자의 수학적 지식이 부족한 탓에 자세히 이해하기는 어려워 증명은 스킵하고자 한다. 자세한 내용은 [전파거북이 님의 포스팅](https://ghebook.blogspot.com/2011/11/sturm-liouville-theory.html)을 참고해보자.

---

지금까지의 내용을 종합하여 S-L 연산자가 self-adjoint 연산자이고 모든 고윳값이 distinct 하다는 것을 바탕으로 생각하면 S-L 연산자는 다음과 같은 성질을 가진다는 것을 알 수 있다.

* S-L 연산자의 고윳값은 모두 실수이고, distinct해서 다음과 같이 나열할 수 있다.

$$\lambda_1 \lt \lambda_2 \lt \lambda_3 \lt \cdots \lt \lambda_n \lt \cdots \rightarrow \infty$$

* 위 고윳값에 대응되는 고유함수들은 모두 실수 함수이며, 아래와 같이 서로 직교한다. 구간 $[a,b]$에서 정의된 서로 다른 고유함수 $y_n$, $y_m$에 대해,

$$\langle y_n, y_m \rangle_r = \int_{a}^{b}r(x)\overline{y_n(x)}y_m(x)dx=\int_{a}^{b}r(x)y_n(x)y_m(x)dx=\delta_{mn}$$

* 두 번째 고유함수에 관한 성질에 의해 고유함수들은 구간 $[a, b]$에서 weighting 함수 $r(x)$와 함께 정의되는 힐버트 공간($L^2([a,b],w(x)dx)$, 쉽게 말해 함수 공간으로써 함수가 무한 차원 공간의 점으로 해석될 수 있게 해줌.)의 직교 기저를 구성하게 된다.

핵심적인 것은 S-L 연산자의 고유함수가 힐버트 공간의 직교 기저를 구성한다는 것인데, 이 성질에 의해 구간 $[a,b]$에서 정의된 식 (1)의 솔루션 함수 $u$는 고유함수의 선형결합으로 표현될 수 있다.

$$u=\sum_{n=1}^{\infty}c_nu_n$$

같은 방법으로 식 (1)의 forcing function인 $f(x)$도 고유함수의 선형결합으로 표현할 수 있다. 

이 방법은 [고유함수 전개](https://angeloyeo.github.io/2021/06/01/eigenfunction_expansions.html) 편에서 본 내용과 크게 다르지 않다. 이번에는 스트룸 리우빌 문제에 적용하는 것만이 유일한 차이라고 할 수 있다.

고유함수들의 orthogonality, $\langle u_n,u_m\rangle_r=\delta_{nm}$, 를 적용하기 위해서 $f(x)$를 구하는 것 보다 $r(x)$로 나눈 식에 대해 고려해보자. 아래와 같은 식을 생각해보자.

$$\frac{f(x)}{r(x)}=\sum_{n=1}^{\infty}b_n u_n$$

여기서 $b_n$의 값을 특정하기 위해 아래와 같이 내적 연산을 취해보자.

$$\left\langle\frac{f(x)}{r(x)}, u_m\right\rangle_r=\left\langle\sum_{n=1}^\infty b_nu_n, u_m \right\rangle_r$$

$$\Rightarrow \int_{a}^{b}r(x)\left[\frac{f(x)}{r(x)}\right]u_m dx= \int_{a}^{b}r(x)\left(\sum_{n=1}^{\infty}b_nu_n\right)u_m dx$$

우변의 식에서 $\langle u_n,u_m\rangle_r=\delta_{nm}$이라는 관계에 의해 summation이 취해질 때 $n=m$인 경우에만 한해서 $\langle u_n,u_m \rangle_r = 1$이고 나머지의 경우는 모두 0이다. 따라서,

$$\Rightarrow \int_{a}^{b}f(x)u_mdx=b_m$$

즉, $b_n$은 아래와 같이 계산될 수 있는 것이다.

$$b_n=\langle f, u_n\rangle$$

다시 솔루션 함수의 고유함수 전개로 넘어와서,


원래의 식 (1)의 $u$를 고유함수의 선형결합을 이용해 다음과 같이 표현할 수 있다.

$$Lu=\mu r(x)u+f(x)$$

$$\Rightarrow L\left(\sum_{n=1}^{\infty}c_nu_n\right)=\mu r(x)\left(\sum_{n=1}^{\infty}c_nu_n\right)+f(x)$$

연산자 $L$은 선형 연산자이므로 summation 안으로 집어넣으면,

$$\Rightarrow \left(\sum_{n=1}^{\infty}c_n L u_n\right)=\mu r(x)\left(\sum_{n=1}^{\infty}c_nu_n\right)+f(x)$$

여기서 $Lu_n$은 고윳값을 이용해 다음과 같이 쓸 수도 있다.

$$\Rightarrow \left(\sum_{n=1}^{\infty}c_n \lambda_n r(x)u_n \right)=\mu r(x)\left(\sum_{n=1}^{\infty}c_nu_n\right)+f(x)$$

여기서 $u_m$에 대한 내적 연산을 취해주면,

$$\Rightarrow \sum_{n=1}^{\infty}c_n\lambda_n \langle r(x)u_n, u_m\rangle=\mu\sum_{n=1}^{\infty}c_n\langle r(x)u_n, u_m\rangle + \langle f, u_m\rangle$$

$$\Rightarrow \sum_{n=1}^{\infty}c_n\lambda_n \langle u_n, u_m\rangle_r=\mu\sum_{n=1}^{\infty}c_n\langle u_n, u_m\rangle_r + \langle f, u_m\rangle$$

$$\Rightarrow c_m\lambda_m = \mu c_m + b_m$$

여기서 우변의 $\mu c_m$을 좌변으로 옮겨서 식을 약간만 정리해주면,

$$(\lambda_n-\mu)c_n = b_n, \quad n=1,2,3,\cdots$$

과 같이 쓸 수 있게 된다.

결국 우리는 $c_n$을 구해서 솔루션 함수를 표현해주는 것이 목표이다. 여기서 $c_n$이 적절히 존재해야지만 솔루션이 존재한다고 할 수 있다. 따라서 위 식을 보면 다음과 같은 조건에 따라 해의 존재 형태를 알 수 있게 된다.

* Case 1: $\mu\neq \lambda_n$

$$c_n = \frac{b_n}{\lambda_n-\mu}$$

* Case 2: $\mu = \lambda_n, b_n\neq 0$, 해가 존재하지 않음

* Case 3: $\mu=\lambda_n, b_n=0$, 유일해가 아님 (null space가 0 벡터가 아닌경우)

거의 대부분의 경우는 Case 1을 따르기 때문에 솔루션 함수는 다음과 같이 쓸 수 있게 된다.

$$u(x)=\sum_{n=1}^{\infty}\frac{\langle f, u_n\rangle}{\lambda_n-\mu}u_n(x)$$

# 예제 문제

## 2계 비제차 미분방정식

아래와 같은 2계 비제차 미분방정식을 Sturm Liouville 이론의 관점에서 풀이하시오.

$$\frac{d^2u}{dx^2}+2u=-x$$

여기서 $x\in[0, 1]$에서 정의되며 경계조건은 다음과 같다.

$$u(0) = 0$$

$$u(1)+u'(1)=0$$

### 풀이

이 문제를 스트룸 리우빌 형식으로 바꾸면 다음과 같이 쓸 수 있다.

$$-\frac{d^2}{dx^2}u=2u+x$$

다시 말해, 원래의 식 (1)과 식 (6)의 관점에서 보면 $p(x)=1$, $q(x)=0$, $r(x)=1$, $\mu=2$, $f(x)=x$인 아주 간단한 형태의 스트룸 리우빌 문제라고 볼 수 있다.

여기서 $\mu=0$, $q(x)=-2$라고도 볼 수 있지만, 관점의 문제일 뿐이다는 점은 약간의 팁(?)이다.

이 식의 고윳값 문제는 다음과 같은데,

$$-\frac{d^2u_n}{dx^2}=\lambda_n u_n$$

이 고윳값 문제의 일반해는 다음과 같다.

$$u_n=c_1 \sin\sqrt{\lambda_n}x + c_2 \cos\sqrt{\lambda_n}x$$

$u_n(0)=0$ 이라는 경계 조건을 만족하기 위해선 $c_2=0$이 되어야 하므로 고유함수는

$$u_n=c_1\sin\sqrt{\lambda_n}x$$

라고 쓸 수 있다.

또 다른 경계조건인 $u_n(1)+u'_n(1)=0$라는 조건을 만족하기 위해 $u'(x)$를 구해보면,

$$u'(x)=\sqrt{\lambda_n}c_1\cos\sqrt{\lambda_n}x$$

이므로, $u_n(1)+u'_n(1)$은

$$u_n(1)+u'_n(1)=c_1\sin\sqrt{\lambda_n}+\sqrt{\lambda_n}c_1\cos\sqrt{\lambda_n}=0$$

이어야 한다. 여기서 $c_1$은 0이 되면 안되므로(trivial solution이 나오기 때문에),

고윳값은 다음의 조건을 만족하는 값들이어야 한다.

$$\sin\sqrt{\lambda_n}+\sqrt{\lambda_n}\cos\sqrt{\lambda_n}=0$$

여기서 양변을 $\cos\sqrt{\lambda_n}$으로 나눠주면,

$$\Rightarrow \sqrt{\lambda_n}+\tan\sqrt{\lambda_n}=0$$

을 만족하는 $\lambda_n$이 고윳값들이다.

위 방정식의 해를 얻기 위해선 $y=\tan(x)$ 함수와 $y=-x$함수가 만나는 지점을 찾아야 한다.

일반적인 방법으로는 해를 얻기 힘들고 컴퓨터를 이용해 해를 구하면 다음과 같은 결과를 얻을 수 있다.

<p align = "center">
  <img src=  "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-06-Sturm_Liouville/pic1.png">
  <br>
  그림 1. tan(x)+x=0의 솔루션위 의치
</p>

$$\lbrace x | \tan(x)+x=0\rbrace = \lbrace 2.0288, 4.9132, 7.9787, 11.086, 14.207, \cdots\rbrace$$

그러면 위의 값들이 $\sqrt{\lambda_n}\text{ for } n = 1,2,\cdots$에 대응되는 값임을 알 수 있다.

이 때 각 고윳값들에 대응되는 고유함수 $u_n$을 $\langle u_n, u_n \rangle = 1$이 되도록 정규화하면 $u_n$은 다음과 같이 수정할 수 있다..

$$u_n = \frac{\sqrt{2}}{(1+\cos^2\sqrt{\lambda_n})^{1/2}}\sin\sqrt{\lambda_n}x\quad\quad n=1,2,\cdots$$

따라서, 우리는 이 고유함수를 이용해 $f(x)$와 $u(x)$를 표현할 수 있게 된다.

그를 위해 먼저 $b_n$을 계산해보면,

$$b_n = \langle f, u_n\rangle = \int_{0}^{1}\left(\frac{\sqrt{2}}{(1+\cos^2\sqrt{\lambda_n})^{1/2}}x\sin\sqrt{\lambda_n}x \right)dx=\frac{2\sqrt{2}\sin\sqrt{\lambda_n}}{\lambda_n(1+\cos^2\sqrt{\lambda_n})^{1/2}}$$

와 같다. 따라서,

$$f(x)=4\sum_{n=1}^{\infty}\frac{\sin\sqrt{\lambda_n}\sin\sqrt{\lambda_n}x}{\lambda_n(1+\cos^2\sqrt{\lambda_n})}$$

이고,

$$u(x)=4\sum_{n=1}^{\infty}\frac{\sin\sqrt{\lambda_n}\sin{\sqrt{\lambda_n}x}}{\lambda_n(\lambda_n-2)(1+\cos^2\sqrt{\lambda_n})}$$

과 같이 쓸 수 있음을 알 수 있다.

이 결과들은 다소 복잡해 보이지만 아래와 같이 영상으로 보면 그 의미를 더 쉽게 이해할 수 있다.

$u(x)$는 일반적인 비제차미분방정식의 해를 구하는 방법을 통해

$$u(x)=0.82761\sin(\sqrt{2}x)-\frac{x}{2}$$

라는 것을 쉽게 알 수 있는데, $u(x)$를 위에서 구한 고유함수의 선형결합으로 표현한 것과 비교하면 다음과 같이 수렴해가는 것을 알 수 있다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-06-Sturm_Liouville/pic2.mp4">
  </video>
  <br>
  그림 2. 고유함수의 선형결합으로 u(x)를 approximate 해가는 과정
</p>

더 신기한 것은 $f(x)=x$라는 함수도 고유함수의 선형결합으로 표현해줄 수 있다는 점이다.

이 개념이 더 확장된 것이 [푸리에 급수](https://angeloyeo.github.io/2019/06/23/Fourier_Series.html)이다. 푸리에 급수는 임의의 주기함수를 삼각함수의 합으로 표현해준다.

푸리에 시리즈가 수학적으로 흠결없이 작동할 수 있는 데에는 이러한 깊은 배경지식이 자리하고 있는 것이다.

<p align = "center">
  <video width = "600" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-06-06-Sturm_Liouville/pic3.mp4">
  </video>
  <br>
  그림 3. 고유함수의 선형결합을 이용해 f(x)를 approximate 해가는 과정
</p>

## 푸리에 급수

푸리에 급수는 아래의 스트룸 리우빌 문제를 해결하는 과정에서 등장하는 급수라고 할 수 있다.

아래와 같은 단순한 선형 연산자를 생각해보자.

$$L=-\frac{d^2}{dx^2}$$

이 연산자는 식 (6)에 대해 $p(x)=1$,$q(x)=0$인 경우이며 $r(x)=1$인 경우라고 상정해 다음과 같은 고윳값 문제를 생각해보자.

$$Lu_n=\lambda_n u_n$$

여기서 $n=1,2,\cdots,\infty$이다.

또, 경계값 조건은 다음과 같이 주어주자.

$$u(0)=u(\pi)=0$$

이 고윳값 문제의 해는 다음과 같이 단순히 정현파의 결합으로 주어질 수 있다.

$$u_n(x)=c_1\cos(\sqrt{\lambda_n}x)+c_2\sin(\sqrt{\lambda_n}x)$$

여기서 경계조건 중 $u(0)=0$을 대입하면,

$$u_n(0)=c_1=0$$

임을 알 수 있고, 경계조건 중 $u(\pi)=0$을 대입하면,

$$u_n(\pi)=c_2\sin(\sqrt{\lambda_n}\pi)=0$$

을 만족해야 하는데 $c_2$는 0이 아닌 값이어야 고윳값 문제의 솔루션 고유함수가 trivial solution이 아니게 된다. 따라서 고윳값은 

$$\sqrt{\lambda_n}=n$$

이며 고유함수는

$$u_n=\sin(nx)$$

이다.

여기서 $\langle u_n,u_n\rangle = 1$로 만들어주기 위해 다음을 확인해보자.

$$\langle u_n, u_n\rangle = \int_{0}^{\pi}\sin(nx)\sin(nx)dx$$

$$=\int_{0}^{\pi}\frac{-\cos(2nx)+\cos(0)}{2}dx$$

$$=\frac{1}{2}\int_{0}^{\pi}\cos(0)-\cos(2nx)dx$$

$$=\frac{1}{2}\left(x-\frac{1}{2n}\sin(2nx)\right)_{0}^{\pi}$$

$$=\frac{\pi}{2}$$

따라서, $\langle u_n,u_n\rangle = 1$로 만들어주기 위해서는 다음과 같이 고유함수의 형태를 수정하자.

$$u_n=\frac{2}{\pi}\sin(nx)$$

여기서 $n=1,2,\cdots, \infty$ 이다.

이제 이 연산자 $L$을 이용해 다음과 같은 비제차 미분방정식을 푼다고 가정하자.

$$Lu=f(x)=x,\quad x\in[0,\pi]$$

마찬가지로 경계조건은 $u(0)=u(\pi)=0$으로 주어진다고 가정하자.

식 (31)의 결과에 따라 $f(x)=x$는 다음과 같이 고유함수의 선형결합으로 표현해줄 수 있다.

$$f(x)=\sum_{n=1}^{\infty}b_n u_n=\sum_{n=1}^{\infty}b_n \frac{2}{\pi}\sin(nx)$$

그리고 $b_n$은 식 (35)와 같이 구해줄 수 있다.

$$b_n=\langle f, u_n\rangle = \int_{0}^{\pi}x\frac{2}{\pi}\sin(nx)dx$$

$$=\frac{2}{\pi}\int_{0}^{\pi}x\sin(nx)dx$$

$$=\frac{2}{\pi}\left(-\frac{1}{n}x\cos(nx)\Big|_{0}^{\pi}+\int_{0}^{\pi}\frac{1}{n}\cos(nx)dx\right)$$

$$=\frac{2}{\pi}\left(-\frac{1}{n}\pi\cos(n\pi)-\frac{1}{n}\cdot\frac{1}{n}(\sin(nx))\Big|_{0}^{\pi}\right)$$

$$=\frac{2}{\pi}\left(-\frac{1}{n}\pi(-1)^n\right)=-\frac{2}{n}(-1)^n$$

그러므로 $f(x)=x$는 삼각함수의 선형결합으로 다음과 같이 표현해줄 수 있게 된다.

$$f(x)=x=\sum_{n=1}^{\infty}-\frac{2}{n}(-1)^n\sin(nx)$$

## 베셀 미분방정식(Bessel equation)

스트룸 리우빌 이론의 백미(白眉)는 여러가지 특수 미분방정식에 대해 적용해볼 수 있다는 점이다.

손으로 쉽게 풀기 어려운 여러가지 특수 미분방정식을 스트룸 리우빌 형태로 나타낼 수 있다는 것을 확인함으로써 이 미분방정식의 해는 쉽게 구하는 것은 어렵지만 이 해가 가지는 특성들이 어떤 것인지 알 수 있게 해주는 것이다.

가령, 베셀 방정식은 아래와 같은 형태이다.

$$x^2y''+xy'+(x^2-\nu^2)y=0$$

베셀 방정식을 스트룸 리우빌 꼴로 나타내면 다음과 같다.

$$(xy')'+\left(x-\frac{\nu^2}{x}\right)y=0$$

## 르장드르 방정식

르장드르 방정식은 아래와 같은 꼴이다.

$$(1-x^2)y''-2xy'+\nu(\nu+1)y=0$$

르장드르 방정식도 아래와 같은 꼴로 나타낼 수 있다.

$$((1-x^2)y')'+\nu(\nu+1)y=0$$


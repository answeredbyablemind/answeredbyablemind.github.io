---
title: 신호 공간(signal space)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220112
tags: 신호처리
---

# Prerequisites

본 포스팅을 더 잘 이해하기 위해선 아래의 내용에 대해 알고 오는 것이 좋습니다.

* [벡터의 기본 연산](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)

[//]:# (신호가 벡터임을 보이는 것도 좋은 설명 방법)

[//]:# (벡터 공간 위의 점 하나가 벡터이고 --> 신호 공간 위의 한 점이 신호라는 점을 부각할 것)

[//]:# (벡터 공간 위의 한 점을 표현하기 위해 기저벡터들의 선형결합을 이용할 수 있다는 점을 꼭 넣을 것)

# signals as vectors

※ 이 꼭지의 내용은 이전 포스팅 중 [선형 연산자와 신호 공간](https://angeloyeo.github.io/2021/05/31/linear_operator_and_function_space.html)의 일부 내용과 동일합니다. 신호를 '신호'로 바꿔쓴 것만 차이가 있습니다.

이전 포스팅 중 선형대수학의 기초 부분인 [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html)에서는 세 가지 관점으로 벡터를 생각했다.

각각은 벡터란 화살표 같은 것, 숫자의 나열, 벡터 공간의 원소라는 정의였다.

그 중 벡터란 벡터 공간의 원소라는 정의가 가장 수학적인 정의라고 말한 바 있는데, 이 정의가 중요한 이유는 '이런 방식으로 벡터를 정의하는 것은 이러한 특성을 가진 것들은 모두 벡터로 취급해서 다룰 수 있다는 점을 강조한다'라고 언급했다.

다시 말해, 벡터의 특성을 가지는 개념을 발견한다면, 선형대수학에서 적용해볼 수 있었던 테크닉들과 개념들을 확장해 적용해볼 수 있게 되는 것이다.

조금 더 구체적으로 말하자면 어떤 수학적 object(가령, 벡터, 행렬, 신호, 등등...)가 벡터이기 위해선 다음의 두 가지 연산에 대해 닫혀있어야 한다.

* 벡터의 상수배
* 벡터의 합

너무 단순한가?

마치 쿠팡에서 로켓와우 멤버십 가입비 2900원만내면[^1] 쿠팡에서 제공하는 모든 로켓배송 서비스를 누릴 수 있는 것 처럼, 어떤 수학적 object가 위의 두 개의 법칙만 잘 만족하는 것이라고 확인된다면 '벡터'라는 멤버십을 받게 되는 것이다.

[^1]: 지금은 회비가 좀 올랐다.

그리고 이에 따라 선형대수학에서 열심히 일궈놓은 개념들과 테크닉들을 적용받을 수 있게 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-31-linear_operator_and_function_space/pic1.png">
  <br>
  그림 1. 쿠팡에서 로켓와우 멤버십에 가입해 누릴 수 있는 혜택들 (출처: 쿠팡)
</p>

엄밀한 증명은 아니지만 간단하게만 생각해봐도 신호는 벡터로 볼 수 있는 자격을 갖췄다.

아래는 신호의 상수배와 신호끼리의 합을 표현한 것이다. 

$$(c\cdot x)(t) = c\cdot x(t) % 식 (1)$$

$$(x+z)(t) = x(t)+z(t) % 식 (2)$$

다시 말해 어떤 신호 $x(t)$에 임의의 상수 $c$를 곱하더라도 여전히 $cx(t)$는 신호이고,

어떤 신호 $x(t)$와 $z(t)$를 더하더라도 $x(t)+z(t)$ 역시 신호다.

<p align = "center">
  <img src = "https://upload.wikimedia.org/wikipedia/commons/d/d7/Example_for_addition_of_functions.svg">
  <br>
  그림 2. 두 신호의 합
  <br>
  <a href = "https://en.wikipedia.org/wiki/Function_space"> 그림 출처: Fucntion space, Wikipeda </a>
</p>

이렇게 되면 벡터가 벡터 공간의 원소로 정의되었던 것 처럼, 신호도 벡터 공간의 원소로 정의될 수 있는 벡터가 되며, 이 때 신호가 포함되어 있는 벡터 공간을 <span style="color:red"><b>"신호 공간(signal space)"</b></span>이라고 부른다.

---

우리는 벡터의 개념을 확장해서 신호 공간이라는 개념을 얻어낼 수 있음을 알게되었다.

이제 중요한 점은 어떻게 벡터에 적용되는 선형대수학의 개념들과 테크닉들을 신호에 적용할 것인가 라는 점이다.

개념의 확장이 있고 난 뒤에는 아무 의심없이 적용했던 모든 것들을 의심해봐야 한다.

이 개념이 어디서부터 나왔는지, 이 개념이 가졌던 근본적인 의미가 뭐였는지 생각해본 뒤에 비로소 확장된 버전의 테크닉들을 생각해낼 수 있기 때문이다.

여기서는 총 세 가지의 선형대수학의 개념에 대해 신호해석학에서 "확장된" 버전의 개념이 어떤 것인지 알아볼 것이다.

## 벡터 간의 내적 → 신호의 내적

첫 번째는 내적(inner product) 연산이다.

선형대수학에서 벡터의 내적은 다음과 같이 정의되었다.

임의의 아래와 같은 $n$차원 실수 벡터 $\vec{a}$와 $\vec{b}$에 대하여,

$$\vec{a} = \begin{bmatrix}a_1\\ a_2 \\ \vdots \\ a_n\end{bmatrix} % 식 (3)$$

$$\vec{b} = \begin{bmatrix}b_1\\ b_2 \\ \vdots \\ b_n\end{bmatrix} % 식 (4)$$

$$\text{dot}(\vec{a}, \vec{b})=a_1b_1 + a_2b_2 +\cdots + a_nb_n % 식 (5)$$

만약 $\vec{a}$와 $\vec{b}$가 복소 벡터였다고 하면 내적은 다음과 같이 정의된다.

$$\text{dot}(\vec{a}, \vec{b})=a_1^*b_1 + a_2^*b_2 +\cdots + a_n^*b_n % 식 (6)$$

여기서 $*$은 복소 켤레(complex conjugate) 연산이다.

왜 복소 벡터는 복소 켤레 연산이 들어가는지 생각해본다면 내적을 통해 복소 벡터에서 길이를 정의하기 위해서이다.

어떤 실수 벡터 $\vec{a}$의 크기(보통 L2-norm)는 다음과 같이 정의된다.

$$\text{norm}_2(\vec{a}) = \sqrt{a_1^2 + a_2^2 + \cdots + a_n^2} % 식 (7)$$

즉,

$$\text{norm}_2(\vec{a}) = \sqrt{\text{dot}(\vec{a}, \vec{a})}=\sqrt{a_1a_1+a_2a_2+\cdots+a_na_n} % 식 (8)$$

이 개념을 복소벡터에까지 확장시키면, 복소 벡터 $\vec{a}$에 대해서

$$\text{norm}_2(\vec{a})=\sqrt{a_1^2+a_2^2 + \cdots a_n^2}=\sqrt{a_1^*a_1+a_2^*a_2+\cdots +a_n^*a_n}=\sqrt{\text{dot}(\vec{a},\vec{a})} % 식 (9)$$

이어야 하므로 복소벡터의 내적연산은 식 (6)과 같이 정의되어야 하는 것이다.

이제 식 (6)의 방식을 확장해 신호의 내적을 정의해보도록 하자.

미분방정식을 다룰 때 사용되는 신호들은 실수 신호 범위에서 그치지않고 신호값이 복소수가 될 수 도 있기 때문에 다음과 같이 복소 벡터의 내적의 정의를 확장해 다음과 같이 정의한다.

실수 입력 복소수 출력을 갖는 구간 $(a, b)$에서 정의된 임의의 복소신호 $f$, $g$에 대해 두 신호의 inner product $\langle f, g\rangle$은 

$$\langle x, z\rangle \equiv \int_a^b x(t)z^*(t) dt % 식 (10)$$

이다. 여기서 $x^*(t)$는 $x(t)$의 complex conjugate이다.


# 참고 문헌

* [Ch. 5 Vector spaces and signal spaces, Robert Gallager, MIT OCW 6.450 Principles of Digital Communications I](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-450-principles-of-digital-communications-i-fall-2006/lecture-notes/book_5.pdf)
* [신호 공간, 정보통신기술용어해설](http://www.ktword.co.kr/test/view/view.php?m_temp1=4178)
* [4. Space Signal Representation of Waveforms, Prapun Suksompong, ECS452 2013, Sirindhorn International Institute of Technology](https://www2.siit.tu.ac.th/prapun/ecs452_2013_1/ECS452%204%20u2.pdf)
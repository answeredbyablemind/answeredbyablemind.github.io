---
title: 양의 정부호 행렬
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2021220
tags: 선형대수학
---

<center>
  <iframe width = "810" height = "490" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-12-20-positive_definite/"></iframe>
  <br>
  행렬이 positive definite 이기 위한 조건은 무엇일까?
  <br>
  <br>
</center>

# Prerequisites

양의 정부호 행렬에 대해 더 잘 알기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [행렬과 선형변환](https://angeloyeo.github.io/2019/07/15/Matrix_as_Linear_Transformation.html)
* [고윳값과 고유벡터](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)
* [헤시안 행렬의 기하학적 의미](https://angeloyeo.github.io/2020/06/17/Hessian.html)

# 정의(Definition)

우선 양의 정부호 (positive definite, 이하 p.d.) 행렬의 정의부터 차근히 살펴보도록 하자.

영벡터가 아닌 임의의 열벡터 $x$와 대칭 행렬 $A$에 대해 다음이 성립한다면 $A$는 정방형 행렬이다.

$$x^TAx >0$$

생각해보면 굉장히 이상한 정의다. 행렬에 대해 정의하는데 왜 열벡터 $x$를 한쪽에는 전치(transpose)를 취하고 다른 한쪽에는 취하지 않고 곱한다는 것일까?

# 양의 정부호 행렬의 의미

## 양의 정부호라는 이름이 갖는 의미

수학 용어들 중 번역이 굉장히 잘 된 용어들이 있다. 양의 정부호라는 번역도 positive definite (이하 p.d.) 이라는 영어 단어에 비해서 그 의미가 더 잘 와닿게 번역된 것 같다.

양의 정부호는 부호와 관련이 있다. 다시 말해 행렬이 양의 정부호 행렬이라면 양수가 작동하는 방식이 그대로 적용되어 작동하는 것과 유사함을 시사한다.

임의의 양의 실수 $a$를 생각해보자. 또, 임의의 실수 $b$도 생각해보자.

$a$가 양수이면, $b$에 곱했을 때 그 부호가 그대로 유지된다는 것은 아주 기초적인 결과이다.

다시 말해, $a$가 양수이면 $b$에 곱했을 때 $b$의 크기는 키워주지만 방향을 뒤집어주지는 않는다.

---

이번엔 임의의 벡터 $a$, $b$를 생각해보자. 그리고 이 두 벡터에 대한 내적을 생각해보자. 일반적으로 정의하는 내적은 다음과 같이 계산된다.

$$a^Tb = |a||b|\cos(\theta)$$

여기서 $\theta$는 $a$와 $b$의 사잇각이다. 그리고 $-\pi/2 \lt \theta \lt \pi/2$라는 조건을 만족할 때 $a^Tb > 0$이다.

(그림 넣을 것)

---

이제 양의 정부호 행렬의 정의를 생각해보면, 영벡터가 아닌 열벡터 $x$에 대해 다음을 만족해야 임의의 대칭 행렬 $A$가 양의 정부호 행렬이다.

$$x^TAx>0$$

여기서 $x^TAx$를 괄호를 이용해 다음과 같이 써보자.

$$x^TAx \rightarrow x^T(Ax)$$

즉, 위 식은 임의의 영벡터가 아닌 벡터 $x$에 대해 선형 변환 $A$를 취해준 다음 원래의 $x$와 내적을 취해준 것으로 해석할 수도 있다.

앞서 말했던 것 처럼 두 벡터를 내적해서 양의 값이 나오기 위해서는 두 벡터 간의 사잇각이 $-\pi/2 \lt \theta \lt \pi/2$을 만족해야 한다.

그러므로, 결국 $x$에 선형 변환을 시켜줬을 때 변환 전 후의 각도 변화가 -90도에서 90도 사이에서 변하게 된다는 뜻으로 볼 수 있다.

즉, 양의 실수처럼 양의 정부호 행렬을 이용한 선형변환은 입력 벡터를 '뒤집어주지는 않는' 것이어야 한다.

(그림 넣을 것)

## 양의 정부호와 고윳값

부가적인 성질이지만 양의 정부호 행렬과 고윳값의 부호는 연관성이 깊다.

$$Ax=\lambda x$$

$$x^TAx = x^T\lambda x=\lambda |x|^2$$

이 때, 정의상 $x^TAx >0 $ 이므로 $\lambda>0$이다.

다시 말해 행렬 $A$가 대칭행렬이라는 조건 하에 고윳값의 부호가 모두 양수라는 조건은 행렬 $A$가 양의 정부호 행렬임을 말해주는 조건이다.

## 양의 정부호와 헤시안 행렬

양의 정부호 여부가 가장 중요하게 사용되는 응용 분야 중 하나는 최적화 분야이다.

최적화 이론에서는 함수의 최솟값을 찾는 것을 최종 목표로 한다고 볼 수 있다.

일전에 [헤시안 행렬](https://angeloyeo.github.io/2020/06/17/Hessian.html)에 대해 다룬 적 있었지만, 헤시안 행렬은 2차 미분계수와 비슷한 의미를 갖는다고도 언급한 바 있다.

어떻게 생각하면 헤시안 행렬은 기본 bowl의 형태를 더 볼록하거나 오목하게 만드는 기하학적인 변환을 수행해주는 역할이라고도 할 수 있는데,

그림으로 보면 다음과 같다.

<p align = "center">
  <img src ="https://raw.githubusercontent.com/angeloyeo/gongdols/master/%EB%AF%B8%EC%A0%81%EB%B6%84%ED%95%99/%ED%97%A4%EC%8B%9C%EC%95%88%20%ED%96%89%EB%A0%AC%EC%9D%98%20%EC%9D%98%EB%AF%B8/fig3.gif">
  <br>
</p>

<p align = "center">
  <img src ="https://raw.githubusercontent.com/angeloyeo/gongdols/master/%EB%AF%B8%EC%A0%81%EB%B6%84%ED%95%99/%ED%97%A4%EC%8B%9C%EC%95%88%20%ED%96%89%EB%A0%AC%EC%9D%98%20%EC%9D%98%EB%AF%B8/fig4.gif">
  <br>
</p>

위 그림들의 화살표는 헤시안 행렬의 고유벡터 방향을 나타내고, 빨간색인 경우는 고윳값이 양수, 파란색인 경우는 고윳값이 음수인 경우를 의미한다.

잘 보면 고윳값이 모두 양수인 경우의 헤시안 행렬을 이용한 선형변환은 기본 bowl 형태가 더 볼록하게 만들어지는 것을 알 수 있다.

반면에 두 번째 그림에서 처럼 고윳값이 하나는 양수이지만 나머지 하나는 음수가 되면, 기본 bowl 형태가 안장(saddle) 형태로 바뀌는 것을 볼 수 있다.

즉, 헤시안 행렬은 대칭행렬이고, 거기서 헤시안 행렬에서 고윳값이 모두 양수라는 것은 헤시안 행렬이 양의 정부호 행렬임을 의미한다.

다시 말해, 어떤 두 번 미분가능한 실함수 $f$에 대해 Hessian 행렬이 양의 정부호 행렬이라면 이 함수의 전체적인 형태는 아래로 볼록하고, 필연적으로 극소값을 갖는다는 것을 알 수 있다. 

만약 여기서 gradient를 구해서 0인 지점을 찾는다면 그 포인트가 바로 극소값임을 알 수 있다.


# 참고문헌

* [Geometrical interpretation of p.d. matrix, StackExchange](https://math.stackexchange.com/questions/86309/what-is-the-geometrical-interpretation-to-positive-definite-matrix)
* [Definite Matrix, Wikipedia](https://en.wikipedia.org/wiki/Definite_matrix)
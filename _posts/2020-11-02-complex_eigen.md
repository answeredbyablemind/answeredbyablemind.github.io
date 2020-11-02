---
title: 복소 고윳값과 고유벡터의 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201102
tags: 선형대수
---

# Prerequisites

해당 포스트에 대해 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [허수의 존재 의미에 대하여](https://angeloyeo.github.io/2019/06/15/imaginary_number.html)
* [자연상수 e의 의미](https://angeloyeo.github.io/2019/09/04/natural_number_e.html)
* [오일러 공식의 기하학적 의미](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)
* [고윳값과 고유벡터의 기하학적 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)

# 회전 행렬의 고윳값과 고유벡터

$$A=\begin{bmatrix}\cos(\theta) && -\sin(\theta) \\ \sin(\theta) && \cos(\theta)\end{bmatrix}$$

가령 90도 시계반대방향으로 회전하는 행렬을 적용해 선형변환 한 결과는 다음과 같다.

$$\begin{pmatrix} \cos(\pi/2) & -\sin(\pi/2) \\ \sin(\pi/2) & \cos(\pi/2) \end{pmatrix} $$

<p align="center"><iframe  src="https://angeloyeo.github.io/p5/Matrix_as_a_linear_transformation/rotation/" width="325" height = "260" frameborder="0"></iframe></p>

[고윳값과 고유벡터의 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html)편에서 얘기했던 것의 핵심은 다음과 같았다.

고유벡터와 고윳값이 물어보는 것은 

<center>

<b>“벡터 x에 어떠한 선형변환 A를 했을 때, 그 크기만 변하고 원래 벡터와 평행한 벡터 x는 무엇인가요?”
<br><br>
“그렇다면, 그 크기는 얼마만큼 변했나요?”</b>

</center>

라는 얘기 말이다.

그렇다면 의문이다. 회전 변환 시 크기만 바뀌고 방향이 바뀌지 않는 벡터는 어디있는가?

## 고윳값과 고유벡터의 계산

회전 행렬의 고윳값과 고유벡터의 의미를 파악하기 위해 직접 고윳값과 고유벡터를 계산해보도록 하자.

### 고윳값의 계산

$$A\vec{x}=\lambda\vec{x}$$

$$=\begin{bmatrix}\cos(\theta) && -\sin(\theta) \\ \sin(\theta) && \cos(\theta)\end{bmatrix}\vec{x} = \lambda\vec{x}$$

여기서 $\vec{x}$는 $I\vec{x}$로 분해해 생각할 수도 있으므로,

여기서 $I$는 아래와 같은 identity matrix이다.

$$I=\begin{bmatrix}1 && 0\\0 && 1\end{bmatrix}$$

$$\Rightarrow \begin{bmatrix}\cos(\theta) && -\sin(\theta) \\ \sin(\theta) && \cos(\theta)\end{bmatrix}\vec{x} = \lambda I\vec{x}$$

여기서 우변을 좌변으로 옮겨 계산하면,

$$\Rightarrow (A-\lambda I)\vec{x} = \begin{bmatrix}\cos(\theta)-\lambda && -\sin(\theta) \\ \sin(\theta) && \cos(\theta)-\lambda\end{bmatrix}\vec{x}=\vec{0}$$

여기서 $\vec{X}$가 영벡터가 아니기 위해선 $(A-\lambda I)$가 역행렬을 가지지 않아야 하므로 $(A-\lambda I)$의 행렬식의 값은 0이 되어야 한다.

$$det(A-\lambda I)=(\cos(\theta)-\lambda)^2+\sin^2(\theta) = 0$$

$$=\cos^2(\theta) - 2\lambda\cos(\theta) + \lambda^2 + \sin^2(\theta)=0$$

여기서 $\cos^2(\theta) + \sin^2(\theta) = 1$ 이므로,

$$\Rightarrow \lambda^2 -2\lambda\cos(\theta) + 1 = 0$$

2차 방정식에 대한 근의 공식을 적용하면 $\lambda$는 다음과 같이 계산할 수 있다.

$$\lambda = \cos(\theta) \pm\sqrt{\cos^2(\theta)-1}$$

$$=\cos(\theta)\pm\sqrt{-\sin^2(\theta)}$$

$$=\cos(\theta) \pm i\sin(\theta)$$

여기서 $i=\sqrt{-1}$이다.

이제, 각 eigenvalue에 대응되는 eigenvector를 계산해보자.

### 1. $\lambda=\cos(\theta)+i\sin(\theta)$인 경우의 고유벡터

$\lambda = \cos(\theta) + i\sin(\theta)$ 인 경우,

$$\begin{bmatrix}\cos(\theta) && -\sin(\theta) \\ \sin(\theta) && \cos(\theta)\end{bmatrix}\vec{x} = (\cos(\theta) +i\sin(\theta))\vec{x}$$

을 만족해야 한다.

우변을 좌변으로 넘기면,

$$\Rightarrow \begin{bmatrix}-i\sin(\theta) && -\sin(\theta) \\ \sin(\theta) && -i\sin(\theta)\end{bmatrix}\vec{x}=0$$

즉, 위의 행렬과 벡터의 곱은 아래의 선형연립방정식을 푸는 것과 같다고 할 수 있다.

벡터 $\vec{x} = \begin{bmatrix}x_1 \\ x_2\end{bmatrix}$라고 하면,

$$\begin{cases}
  -i\sin(\theta) x_1 - \sin(\theta)x_2 =0 \\ 
  \sin(\theta)x_1 - i\sin(\theta)x_2 =0  
\end{cases}$$

여기서 모든 방정식을 $\sin(\theta)$로 나누면[^1],

[^1]: 즉, $\theta$는 0 혹은 $\pi$가 아닌 경우에 한함. $\theta$가 0 혹은 $\pi$인 경우에는 회전 변환이라고 보기보다는 가만히 있는 경우 혹은 선형 변환 후 좌표계가 뒤집어 진 경우와 같다고 볼 수 있기 때문에 굳이 회전변환으로 해석하지 않는다고 보는 것도 일리가 있는 생각임.

$$\begin{cases}
  -i x_1 - x_2 =0 \\ 
  x_1 - i x_2 =0  
\end{cases}$$

이므로, 

$$\vec{x}=\begin{bmatrix}i\\1\end{bmatrix}$$

이다.

### 2. $\lambda=\cos(\theta)-i\sin(\theta)$인 경우의 고유벡터

1에서와 비슷한 방법으로 고유벡터를 계산하면

$\lambda=\cos(\theta)-i\sin(\theta)$인 경우의 고유벡터는

$$\vec{x}=\begin{bmatrix}-i\\1\end{bmatrix}$$

이다.


# 고윳값과 고유벡터에 대한 또 다른 관점

다시 한번, [고윳값과 고유벡터의 기하학적 의미](https://angeloyeo.github.io/2019/07/17/eigen_vector.html) 편에서는 고윳값과 고유벡터를 다음과 같이 생각하자고 하였다.

<center>
<b>
“벡터 x에 어떠한 선형변환 A를 했을 때, 그 크기만 변하고 원래 벡터와 평행한 벡터 x는 무엇인가요?”
<br><br>
“그렇다면, 그 크기는 얼마만큼 변했나요?”
</b>
</center>

즉, 위의 관점은 어떤 선형변환에 대해 고윳값과 고유벡터를 **찾는** 과정에 초점을 맞춘 것이라고 볼 수 있겠다.

하지만, 이렇게도 한번 생각해보자. 우리가 적절한 고윳값과 고유벡터를 안다고 하면, 해당 고유벡터에 대해선 고윳값이 가지는 의미는 다음과 같다.

<center>
<b>
"고유벡터에 대한 선형변환은 딱 고윳값 만큼만 상수배 해주게 된다."
</b>
</center>

<p align = "center">
<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/eigen_vector_values/pic3.png">
<br>
고유벡터에 선형변환이 작용되면 딱 고윳값 만큼만 상수배 해주게 된다.
</p>


## 상수배란 무엇일까?

상수배란 [벡터의 기본 연산(상수배, 덧셈)](https://angeloyeo.github.io/2020/09/07/basic_vector_operation.html) 편에서 다룬 것과 같이 벡터로써 갖추어야 할 기본적인 성질이다.

하지만, 그 근본적인 의미는 '곱셈'에 있다고 할 수 있다.

[허수의 존재 의미](https://angeloyeo.github.io/2019/06/15/imaginary_number.html) 편에서 언급했던 것 처럼 

복소수를 곱한다는 것은 회전을 의미한다.



# 복소 고유벡터의 시각화

# 
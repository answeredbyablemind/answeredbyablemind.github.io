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

[//]:# (회전 행렬의 변환 기하학적으로 표현할 것)

의문: 회전 변환 시 크기만 바뀌고 방향이 바뀌지 않는 벡터는 어디있는가?

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

$$=\cos(\theta) \pm \sqrt i\sin(\theta)$$

여기서 $i=\sqrt{-1}$이다.

이 식을 잘 생각해보면 [오일러 공식](https://angeloyeo.github.io/2020/07/07/Euler_Formula.html)에 의해,

$$\lambda = \exp(\pm i\theta)$$

와 같다는 것을 알 수 있다.

이제, 각 eigenvalue에 대한 eigenvector를 계산해보자.

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

여기서 모든 방정식을 $\sin(\theta)$로 나누면,

(즉, $\theta$는 0 혹은 $\pi$가 아닌 경우에 한함.)

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


## 고윳값과 고유벡터에 대한 또 다른 관점

"고유벡터에 대한 선형변환은 딱 고윳값 만큼만 스케일링 한다."

# 복소 고유벡터의 시각화

# 
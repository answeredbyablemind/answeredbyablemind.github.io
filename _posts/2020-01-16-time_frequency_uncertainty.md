---
title: 시간-주파수 불확정도
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200116
tags: 푸리에 신호처리
lang: ko
---

# 가우시안 함수

가우시안 함수(Gaussian function)은 다음과 같은 수식으로 정의된다.

$$g(t) = a\cdot \exp\left(-\frac{(t-b)^2}{2c^2}\right)$$

가우시안 함수는 complex Morlet wavelet의 envelope 또는 시간 영역에서 보면 time window의 역할을 하게 되는 함수이다. 위의 식 중 상수 a, b,c를 적절히 변형시키면 평균 $\mu$, 표준편차가 $\sigma$인 가우시안 함수를 상정할 수 있다.

가우시안 함수를 이용하는 이유는 양자역학의 코펜하겐 해석을 빌려와 설명할 수 있을 것 같은데, freely moving quantum의 위치(position) 또는 운동량(momentum)이 각자의 space에서 확률적으로 정해진다고 할 때 평균값 $\mu$를 중심으로 $\sigma$만큼의 표준편차를 가지고 존재한다고 말 할 수 있다면 그 quantum의 위치를 표현하는 확률 분포는 정규 분포를 통해 표현할 수 있기 때문이다[^1].

[^1]: 이러한 가정을 가지고 어떻게 정규분포가 유도되는지 궁금한 사람은 내 유투브의 영상 중 <정규 분포 공식 유도> 편을 보기 바람. https://www.youtube.com/watch?v=vQghF8hjwbw

우리의 경우는 하나의 시간 신호에 대해 시간-주파수 분석을 시행 했을 때 시간-주파수 domain에서 신호가 가지고 있는 시간-주파수 특성을 정확한 좌표로써 알 수 없으며 이것이 어떤 평균적인 위치를 중심으로 어느 정도의 표준편차를 가지고 확률적으로 존재한다고 가정할 때, 시간-주파수 공간의 확률적인 위치는 정규 분포를 통해 표현하는 것이 수학적으로 가장 타당하기 때문이다.

이제 가우시안 함수의 푸리에 변환을 확인해본 다음 불확정성의 원리를 적용시켜 시간-주파수 불확정도의 관계를 확인해보자.

# 가우시안 함수의 푸리에 변환

상수를 적절히 변형시켜 표본의 표준편차가 $\sigma$이고, 평균이 0인 분포를 표현하는 Gaussian function은 다음과 같다. 이 함수는 소위 정규분포라고 불리는 함수와 동일하다.

$$g(t) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{t^2}{2\sigma^2}\right)$$

이제 $g(t)$에  CTFT를 적용하면 다음과 같다.

$$G(f) = \mathfrak{F}\left[g(t)\right]\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}
{\exp\left(-\frac{t^2}{2\sigma^2} \right) \exp\left(-j2\pi ft\right)dt}$$

조금 복잡하겠지만 $G(f)$를 $f$에 대해 미분한 다음 미분방정식을 풀어내는 방식으로 $G(f)$의 꼴을 확인할 수 있게 된다.

$$\frac{dG(f)}{df}=\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)\cdot(-j2\pi t)\cdot \exp\left(-j2\pi ft\right)dt$$

여기서 부분적분을 적용해보도록 하자. $u$를 $e^{-j2\pi ft}$로 두고, $dv$를 $e^{-\frac{t^2}{2\sigma^2}}(-j2\pi t)dt$로 두면 부분적분 공식을 활용하기 위해 다음과 같은 관계를 유도할 수 있다.

$$u= \exp\left(-j2\pi ft\right) \Rightarrow du = (-j2\pi f)\exp\left(-j2\pi ft\right) dt$$

$$dv = \exp\left(-\frac{t^2}{2\sigma^2}\right)(-j2\pi t)dt \Rightarrow v = (j2\pi)\sigma^2 \cdot \exp\left(-\frac{t^2}{2\sigma^2}\right)$$

그리고 부분적분 공식을 이용하면 위의 $u, v$에 대하여

$$\int u dv = uv - \int v du$$

이므로

$$\frac{dG(f)}{df}

= \frac{1}{\sigma\sqrt{2\pi}} \left\{
    \left[
        \exp\left(-j2\pi ft\right) (j2\pi) \sigma^2 \exp\left(-\frac{t^2}{2\sigma^2}\right)
        \right]^{\infty}_{-\infty}

        - \int_{-\infty}^{\infty}\left(j2\pi \sigma^2 \exp\left(-\frac{t^2}{2\sigma^2}\right)\right)(-j2\pi f)\exp\left(-j2\pi ft\right)dt
    \right\}$$

이다.

여기서 우변의 첫 번째 항인 $\exp\left(-\frac{t^2}{2\sigma^2}\right)$은 $t=\pm \infty$에서 0으로 수렴하므로

$$\frac{dG(f)}{df}=\frac{1}{\sigma\sqrt{2\pi}}\left\{

    -\int_{-\infty}^{\infty}
        {4\pi^2\sigma^2 f \exp\left(-\frac{t^2}{2\sigma^2}\right)\exp\left(-j2\pi ft\right)}dt
    \right\} 
    
    = -4\pi^2\sigma^2 f G(f)$$

가 된다.

따라서 우리는 다음의 미분방정식을 얻을 수 있다.

$$\frac{dG(f)}{df}=-4\pi^2\sigma^2fG(f)$$


이 식은 다음과 같이 변경할 수 있다.

$$\frac{1}{G(f)}dG(f) = -4\pi^2\sigma^2fdf$$

양변에 적분기호를 씌우면,

$$\int\frac{1}{G(f)}dG(f) = -4\pi^2\sigma^2\int fdf$$

$$\Rightarrow ln(G(f)) = -4\pi^2\sigma^2\cdot \frac{1}{2}\cdot f^2+C$$


따라서,

$$G(f) = C\exp\left(-2\pi^2\sigma^2f^2\right)

= C\exp\left(-\frac{(2\pi f \sigma)^2}{2}\right)$$

이다.

이 때, 적분상수 C를 구해보면

$$G(0) = C = \frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}
    \exp\left(-\frac{t^2}{2\sigma^2}\right)\exp\left(-j2\pi\cdot0\cdot t\right)
dt\notag$$

$$=\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt$$


이며, 이것은 소위 말하는 가우스 적분을 해결함으로써 얻을 수 있다. 가우스 적분을 풀어내는 방법은 내 유튜브 영상 중 가우스 적분 편을 참고하길 바란다 (https://www.youtube.com/watch?v=iLW-CgzA-NU). 

일반적인 가우스 적분의 해는 다음과 같으므로,

$$\int_{-\infty}^{\infty}\exp\left(-x^2\right)dx = \sqrt{\pi}$$

따라서 변수 치환을 활용하면

$$x = \frac{t}{\sigma\sqrt 2}, \quad dx = \frac{1}{\sigma\sqrt 2}dt$$

이고, 이것을 통해서 다음을 확인할 수 있다.

$$\Rightarrow \int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)\frac{1}{\sigma\sqrt 2}dt = \sqrt \pi$$

$$\therefore \int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt = \sigma \sqrt{2\pi}$$


따라서,

$$G(0) = \frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt = \frac{1}{\sigma\sqrt{2\pi}}\sigma\sqrt{2\pi} = 1$$

이기 때문에

$$G(f) = C\exp\left(
    -\frac{(2\pi f\sigma)^2}{2}
    \right)
    = \exp\left(
    -\frac{(2\pi f\sigma)^2}{2}
    \right)$$

임을 알 수 있다.

그러므로,

$$g(t) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{t^2}{2\sigma^2}\right)$$

의 푸리에 변환은

$$G(f) = \exp\left(
    -\frac{(2\pi f\sigma)^2}{2}
    \right)$$

임을 알 수 있다.

즉, 가우시안 함수의 푸리에 변환도 가우시안 함수임을 확인할 수 있다.


# 시간, 주파수 영역에서의 불확정도와 그들의 관계

이때 다시 한 번 정규 분포의 성질을 생각해보면 시간 영역에서 보았을 때 $g(t)$의 시간 불확정도 $\sigma_t$는 $\sigma$이고, 주파수 영역에서 보았을 때 $G(f)$의 주파수 불확정도 $\sigma_f$는 $\frac{1}{2\pi \sigma}$라는 것을 알 수 있다. 

따라서 시간, 주파수 불확정도의 관계는 다음과 같다.

$$\sigma_t\sigma_f = \frac{1}{2\pi}$$
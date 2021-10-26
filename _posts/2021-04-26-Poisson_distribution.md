---
title: 포아송 분포
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210426
tags: 통계학
---

<center>
  <iframe width = "500" height = "500" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-26-Poisson_distribution/"></iframe>
  <br>
  파라미터 λ를 수정해가며 다양한 경우의 포아송분포의 생김새에 대해 확인해보자. 
  <br>
  포아송분포에서 x 축에 있는 k가 갖는 것은 어떤 의미일까? 
  <br>
  그리고 각 막대의 길이는 어떤 의미를 갖는지 설명할 수 있는가?
  <br>
  <br>
</center>

포아송 분포는 생각보다 이항분포 만큼 실생활에서 유용하다. 

이름도 복잡해보이고 수식도 어려워 보이지만, 실제 이 분포가 말하는 것이 무엇인지 알고나면 정규분포보다 더 친근해질 수 있는 좋은 친구라는 것을 알 수 있을 것이다.

# Prerequisites

포아송 분포를 잘 이해하기 위해서는 아래의 내용에 대해 알고오시는 것이 좋습니다.

* [이항 분포](https://angeloyeo.github.io/2021/04/23/binomial_distribution.html)

# 포아송 분포의 정의

정해진 시간 안에 어떤 사건이 일어날 횟수에 대한 기댓값을 $\lambda$라고 했을 때, 그 사건이 $n$회 일어날 확률은 다음과 같다.

$$f(n;\lambda) = \frac{\lambda^n e^{-\lambda}}{n!}$$

여기서 $e$는 자연상수이다.

# 포아송 분포가 필요한 이유?

1시간 동안 창밖을 바라보는 상상을 해보자.

창 밖에는 수많은 사람들이 지나가고 있는데, 이 중 한 사람이 넘어질 가능성이 얼마나 될까?

가령 1000명의 사람들이 지나가고 있다고 했을 때, 10초에 1명 꼴로 사람이 넘어진다고 가정해보자.

즉, 10초에 0.1%의 확률로 사람이 한명 넘어진다고 해보자는 말이다.

그러면, 우리는 3600초 동안 10초에 0.1%의 확률로 일어나는 사건이 독립적으로 360번 일어나는 일을 가정하고 있다고도 볼 수 있다.

이런 경우에 우리는 이항분포를 이용해 1시간 동안 몇 명의 사람이 넘어지는지에 대한 확률에 대한 분포를 확인할 수 있을 것이다.

다시 말해, 총 시행회수 $n$과 성공확률 $p$인 경우의 이항분포를 $B(n,p)$라고 했을 때, $B(360, 0.001)$를 따르는 사건이라고 생각하고 문제를 풀어보자. 평균적으로는 $360 \times 0.001 = 0.36$명이라는 결론은 쉽게 얻을 수 있지만... 이것의 분포를 과연 쉽게 계산할 수 있을까?

다시 말해, 360번 중 $k$번 사건이 이어날 확률은 

$$B(n, p;k) = B(360, 0.001; k) = \frac{360!}{k!(360-k)!}(0.001)^k (0.999)^{360-k}$$

라는 사실을 알 수 있는데, 360 factorial 이라... 이건 무한대나 다름없는 어마어마하게 큰 숫자임을 직감할 수 있을 것이다.

실제로 구글에서 360 factorial을 계산해보라고 하면 '불능'이라고 말해줄 정도이니 말이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-04-26-Poisson_distribution/pic1.png">
  <br>
  그림 1. 너무 큰 숫자의 factorial은 계산이 불가능하다.
</p>

이처럼 이항분포에서 $n$이 너무 크고 $p$가 너무 작은 경우에 이항 분포의 확률분포를 근사적으로 계산하기 위해서는 극한값을 이용한 새로운 형태의 분포를 제시하는 것이 바람직해보인다.

포아송 분포는 이러한 문제를 해결하기 위해 탄생한 분포라고 할 수 있다.

# 포아송 분포의 유도 과정

포아송 분포는 이항분포에서부터 유도할 수 있다.

$\lambda = np$라고 하면, $p=\frac{\lambda}{n}$ 이므로,

$$Pr(K=k) = {}_n\mathrm{ C }_kp^k(1-p)^{n-k}$$

$$=\frac{n(n-1)\cdots(n-k+1)}{k!}\left(\frac{\lambda}{n}\right)^k\left(1-\frac{\lambda}{n}\right)^n\left(1-\frac{\lambda}{n}\right)^{-k}$$

$$=\left(\frac{\lambda^k}{k!}\right)\frac{n(n-1)\cdots(n-k+1)}{n^k}\left(1-\frac{\lambda}{n}\right)^n\left(1-\frac{\lambda}{n}\right)^{-k}$$

여기서 $n\rightarrow \infty$로 극한을 취하면 다음과 같은 변화가 생김을 알 수 있다.

$$\lim_{n\rightarrow \infty}p=\lim_{n\rightarrow \infty}\frac{\lambda}{n} = 0$$

$$\lim_{n\rightarrow \infty}\frac{n(n-1)\cdots(n-k+1)}{n^k} = 1$$

$$\lim_{n\rightarrow \infty}\left(1-\frac{\lambda}{n}\right)^n

=\lim_{n\rightarrow \infty}\left(1-\frac{\lambda}{n}\right)^{-\frac{n}{\lambda} \times (-\lambda)} = e^{-\lambda}

$$

$$\lim_{n\rightarrow \infty}\left(1-\frac{\lambda}{n}\right)^k=1$$

따라서,

$$Pr(K=k)\rightarrow \left(\frac{\lambda^k}{k!}\right)e^{-\lambda}$$

인 것을 알 수 있다.

다시 말해 포아송 분포는 수 많은 사건 중(즉, $n\rightarrow \infty$) 특정한 사건이 발생할 확률이 매우 적은(즉, $p\rightarrow 0$) 확률변수가 갖는 분포임을 알 수 있다.

# 포아송 분포 예시 문제

## 문제 1.

보험사 A는 2000건의 보험 계약을 가지고 있다. 이 보험을 계약한 사람이 보험을 청구할 확률이 0.001이라고 할 때 포아송 근사를 이용하여 다음 확률을 구하시오.

1) 보험 청구가 한번도 없을 확률

2) 보험 청구가 3번 이하일 확률

3) 보험 청구가 5번 이상일 확률

### 문제 1의 Solution

총 2000건의 보험에 대해 청구할 확률이 0.001이므로 평균 2건의 보험이 청구될 것임을 알 수 있다. 


1) 보험 청구가 한번도 없을 확률은 $\lambda = 2$인 포아송 분포에 대하여 $k=0$인 경우이므로,

$$Pr(K=0) = \left(\frac{2^0}{0!}\right)e^{-2} = 0.13534$$

약 13.5%임을 알 수 있다.

2) 보험 청구가 3번 이하일 확률은

$$\sum_{i=0}^3Pr(K=i) = \left(\frac{2^0\times e^{-0}}{0!}+\frac{2^1\times e^{-1}}{1!}+\frac{2^2\times e^{-2}}{2!}\right)=0.85712$$

약 85.7% 임을 알 수 있다.

3) 보험 청구가 5번 이상일 확률은

$$1-\sum_{i=0}^4Pr(K=i)=1-\left(
  \frac{2^0\times e^{-0}}{0!}+
  \frac{2^1\times e^{-1}}{1!}+
  \frac{2^2\times e^{-2}}{2!}+
  \frac{2^2\times e^{-3}}{3!}+
  \frac{2^2\times e^{-4}}{4!}\right) = 0.052653$$

이다. 즉 약 5.26%임을 알 수 있다. 다시 말해 보험 청구가 5건 이상 들어올 확률은 5%정도로 꽤 낮다고 볼 수 있다.

## 문제 2.

어느 산골짜기 보건소에는 환자가 자주 오지 않아서 한산하다. 하루 평균 3명의 환자가 내원한다고 했을 때, 하루에 두 명 이상의 환자가 내원할 확률은?

### 문제 2의 Solution

보건소에 하루 두 명 이상이 내원하는 경우는 2명 + 3명 + 3명 + $\cdots$ + $\infty$명의 경우의 수를 모두 더해야 하므로, 확률의 총 합은 1이라는 것에서 생각하여 1에서 내원하는 경우가 0명 + 1명인 확률을 빼준 값으로 두 명 이상 내원하는 확률을 계산하자.

즉,

$$Pr(K>=2)=1-\sum_{i=0}^1Pr(K=i)=1-\left(\frac{e^{-3}\times 3^0}{0!}+\frac{e^{-3}\times 3^1}{1!}\right)$$

$$ = 1-(0.0498+0.1494) = 0.8008$$

즉 약 80% 확률로 하루 두 명 이상의 환자를 볼 수 있다.
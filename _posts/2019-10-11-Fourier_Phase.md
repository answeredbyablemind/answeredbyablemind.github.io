---
title: 푸리에 변환과 위상(phase)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20191010
tags: 신호처리 푸리에변환
---
# 들어가기에 앞서

푸리에 변환에 대해서 이해하기 어려워 하는 부분 중 하나로 phase를 꼽을 수 있다. 보통 amplitude에 대한 개념은 직관적이기 때문에 이해하기 쉽지만 phase는 그렇지 않은 경우가 많고 phase에 대해서 많이들 신경 쓰지 않는 경우도 종종 있다. 푸리에 변환의 시작인 함수 내적의 의미와 복소수의 근본적인 의미에 대해 잘 이해할 수 있어야 어떻게 푸리에 변환을 통해서 amplitude와 phase가 비로소 이해될 수 있다고 생각한다. 

푸리에 변환은 실수함수를 복소수 영역으로 mapping 시켜주는 기능을 한다. 특별히 mapping의 kernel이 독특한 성질을 가지고 있기 때문에 이것을 통해 우리는 시간 영역에서 주파수 영역으로의 변환으로 대응해 생각해볼 수 있는 것이다. 그렇다면 왜, 다시 한 번, 푸리에 변환을 통해서 amplitude와 phase라는 결과가 둘 다 나올 수 있는 것일까?

# 푸리에 변환의 식

푸리에 변환의 공식을 다시 한 번 생각해보자.

$$X(f) = \int_{-\infty}^{\infty}x(t)exp(-j2\pi ft)dt$$

이 공식을 바라보는 여러 가지 관점이 존재하지만 가장 근본적인 관점은 함수의 내적을 통해 보는 것이다. 즉, 위의 공식은 다음과 같은 관점으로 바라 볼 수 있다.

<center>“임의의 주파수 $f$에 대하여, $X(f)$는 $x(t)$와 $exp(-j2\pi ft)$의 내적”</center>

우리는 내적에 대해서 한 번 더 생각해 볼 필요가 있는데, 내적의 의미 중 여기서 가장 두드러지게 볼 것은 “닮음”이다. 통계학에서 활용하는 공식 중 하나인 Correlation을 생각해보자. 임의의 random vector $X$와 $Y$에 대하여 correlation은 다음과 같이 정의한다. 

$$\frac{E[(X-\mu_x)(Y-\mu_y)]}{\sigma_X\sigma_Y}$$

위 공식을 잘 보면  $\mu_X, \mu_Y,\sigma_X,\sigma_Y$등의  통계량이 사용되었으며 거기에 $E[XY]$와 같이 X와 Y를 동시에 사용하여 얻은 통계량도 있다는 것을 알 수 있다. 

이 때, correlation coefficient의 분자와 분모를 따로 떼어서 생각해본다면, 분모의 표준편차를 이용한 나눗셈은 correlation 값을 -1에서 1사이에 넣기 위한 normalization 임을 알 수 있고, X와 Y의 평균값을 빼준 것은 평균을 기준으로 변화의 정도를 확인해보기 위한 것임을 알 수 있다. 따라서, correlation coefficient의 본질은 랜덤 변수 X와 Y의 내적의 기댓값이라고 할 수 있다.

따라서, 우리는 함수의 내적으로부터도 비슷한 의미를 도출할 수 있어야 한다. 즉, 푸리에 변환의 공식은 다음과 같은 의미 또한 내포하고 있는 것이다.

<center>“임의의 주파수 $f$에 대하여, $X(f)$는 $x(t)$와 $exp(-j2\pi ft)$가 얼마나 닮았는가.”</center>

# 푸리에 변환과 Phase

위에서 알아보았듯이 식 (1) 에서 푸리에 변환의 의미는 "$x(t)$와 $esp(-j2\pi ft)$가 얼마나 닮았는가?" 이다.

그런데, $exp(-j2\pi ft)$의 의미는 무엇인가? 바로 $exp(-j2\pi ft)=cos(2\pi ft)-jsin(2\pi ft)$이다. 그렇다면 위의 문장은 다음과 같이 바꿔 쓸 수도 있다.

<center> "$x(t)$가 $cos(2\pi ft)$와 얼마나 닮았는지, $sin(2\pi ft)$와는 또 얼마나 닮았는지 알아본 다음

각각을 실수부와 허수부의 값으로 표현해 복소수로 표현해보자."</center>

그렇게 되면 어떠한 정현파이던지 크기와 위상을 확인할 수 있게 되는 것이다. 

즉, 푸리에 변환은 주어진 신호 $x(t)$가 cosine, sine과 얼마나 닮았는지를 말해주게 되고, 그것을 이용하면 어떠한 주파수를 가진 정현파로 쪼갤 때 그 주파수의 크기와 위상을 모두 알 수 있게 되는 것이다. 어떠한 정현파도 코사인으로 환원시켜 생각해볼 수 있으므로 코사인의 합 공식을 생각해보면,

$$A\cos(2\pi f_0 t + \phi) = A\cos(2\pi f_0 t) cos(\phi) - A \sin (2\pi f_0 t)sin(\phi)$$

cosine과 닮은 정도는 $A cos(\phi)$만큼으로 표현되고 sine과 닮은 정도는 $A sin(\phi)$로 표현되어 해당 신호의 주파수 $f_0$에서의 성분의 크기 $A$와 위상 $\phi$를 모두 확인할 수 있게 되는 것이다. 

위에서 간단히 적은 내용을 직접 수식적으로 확인해보자.

$$\mathfrak{F}[A\cos(2\pi f_0 t + \phi)] = \mathfrak{F}[\cos(2\pi f_0 t)\cos(\phi) - \sin(2\pi f_0 t)\sin(\phi)]$$


잠시 여기서 정현파의 푸리에 변환을 생각해보면,

$$\cos(2\pi f_0 t) = \frac{exp(j2\pi f_0 t) + exp(-j2\pi f_0 t)}{2}$$

로 생각할 수 있는데, 푸리에 변환의 frequency shift 성질을 이용하면,

$$\mathfrak{F}[cos(2\pi f_0 t)] - \mathfrak{F}[\frac{exp(j2\pi f_0 t) + exp(-j2\pi f_0 t)}{2}] = \frac{1}{2}[\delta(f-f_0) + \delta(f+f_0)]$$

이다.


Sine파의 경우에는 

$$\sin(2\pi f_0 t) = \frac{exp(j2\pi f_0 t) - exp(-j2\pi f_0 t)}{2j}$$

이므로,

$$\mathfrak{F}[sin(2\pi f_0 t)] - \mathfrak{F}[\frac{exp(j2\pi f_0 t) - exp(-j2\pi f_0 t)}{2j}] = \frac{1}{2j}[\delta(f-f_0) - \delta(f+f_0)]$$

이다.

그러므로 처음으로 돌아가서,

$$\mathfrak{F}[A\cos(2\pi f_0 t + \phi)] = \mathfrak{F}[A cos(2\pi f_0 t) cos(\phi) - A\sin(2\pi f_0 t)\sin(\phi)]$$

$$ = A\cos(\phi)\mathfrak{F}[\cos(2\pi f_0 t)] - A\sin(\phi)\mathfrak{F}[\sin(2\pi f_0 t)]$$

$$ = A\cos(\phi)[\frac{1}{2}(\delta(f-f_0)+\delta(f+f_0))] - A\sin(\phi)[\frac{1}{2j}(\delta(f-f_0)-\delta(f+f_0))]$$

$여기서 \frac{1}{2j} = -\frac{j}{2}$ 이므로,

$$ = A\cos(\phi)[\frac{1}{2}(\delta(f-f_0)+\delta(f+f_0))] + A\sin(\phi)[\frac{j}{2}(\delta(f-f_0)-\delta(f+f_0))]$$

$$ = \frac{A}{2}\delta(f-f_0)(\cos(\phi) + j\sin(\phi)) + \frac{A}{2}\delta(f+f_0)(\cos(\phi)-j\sin(\phi))$$

와 같이 정리할 수 있게 된다. 

실수 신호를 푸리에 변환하면 양의 주파수와 음의 주파수가 모두 나오게 되는데, 우리는 결과 중 양의 주파수만 관찰하여도 결과의 본질을 이해하는데 큰 문제가 없으므로 다음과 같이 생각할 수 있다.

<center> 

"$Acos(2\pi f_0t+\phi)$를 $exp(-j2\pi ft)=cos(2\pi ft)-jsin(2\pi ft)$와 함수 내적을 통해 닮음 정도를 확인해보았더니 $f_0$라는 주파수에서 cosine 부분과는 $Acos(\phi)$만큼 닮았음.
<br><br>
 이에 따라, 실수부를 $A cos(\phi)$로 표현했고 sine 부분과는 $A sin(\phi)$만큼 닮았기 때문에 허수부를 $A sin(\phi)$로 표현하였음. 즉, 해당 함수는 주파수 $f_0$에서 크기 $A$를 갖고 위상 $\phi$를 가짐."

</center>
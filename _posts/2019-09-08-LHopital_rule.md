---
title: 로피탈 정리의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190908
tags: 미적분학
---

<p align = "center">
  <img width = "500" src = "https://data.ygosu.com/upload_files/board_study/240555/574b096040ae3.jpg">
  <br>
  로피탈 정리만 생각하면 아직도 그분의 외침이 들린다. <del>아니 선생!...</del>
</p>

# 로피탈 정리의 정의

고교 시절 극한을 공부할 때 일명 '꼼수'로 통했던 정리가 하나 있으니, 로피탈의 정리이다.

보통은 고등학교 시절에는 간단히 언급이 되기만 하거나, 엄밀한 증명을 위해선 고등학교 수준을 넘는 수학지식이 필요하므로 증명이 생략되는 경우가 거의 대부분이다.

로피탈의 정리를 우리가 대충 알고 있기로는 아래의 식 (1)과 같은데,

$$\lim_{t\rightarrow \alpha}\frac{f(t)}{g(t)} = \lim_{t\rightarrow \alpha}\frac{f'(t)}{g'(t)}$$

이런 대략적인 내용만 알고있어도 아래와 같은 극한을 쉽게 구할 수 있다.

$$\lim_{x\rightarrow 0}\frac{\sin x}{x} = \lim_{x\rightarrow 0}\frac{(\sin x)'}{(x)'} = \lim_{x\rightarrow 0}\frac{\cos x}{1} = 1$$

사실 로피탈의 정리는 식 (1)에서 크게 벗어나지 않는데, 몇 가지 조건을 추가해서 정의되며 로피탈의 정리를 이용해 극한을 계산할 때에는 이러한 조건들을 꼼꼼히 고려해야한다.

| DEFINITION 1. 로피탈의 정리 |
| --------- |
|실수함수 $f(t)$와 $g(t)$에 대하여, $\alpha$는 다음 중 하나의 극한값을 갖는다고 하자. <br> <center>$$\alpha^{\pm}, \alpha^+, \alpha^-, +\infty, -\infty \notag$$</center><br> 또, $L$은 실수이거나 $+\infty$ 혹은 $-\infty$로 발산한다고 하자. <br><br> 이 때, 만약 <br><center>$$\lim_{t\rightarrow \alpha}\frac{f'(t)}{g'(t)}=L$$</center> 이고, <br> <center>$\text{(i) }\lim_{t\rightarrow \alpha}g(t) = \lim_{t\rightarrow \alpha}f(t) = \pm\infty$ 또는 <br> $\text{(ii) }\lim_{t\rightarrow \alpha}g(t) = \lim_{t\rightarrow \alpha}f(t) = 0$ 이라면</center> <br> <center>$$\lim_{t\rightarrow \alpha}\frac{f(t)}{g(t)} = L$$</center> 이다.|

DEFINITION 1에서 주목해야할 점 중 하나는, 보통 많이들 알고 있기로는 $f(t)/g(t)$의 극한을 풀기 위해 분자, 분모를 미분해서 극한값을 구하는 방식으로 로피탈의 정리를 이용한다고 생각하지만, 

원래는 로피탈의 정리는 $f'(t)/g'(t)$의 극한이 존재하는 경우에야 $f(t)/g(t)$의 극한과 $f'(t)/g'(t)$의 극한이 같다는 것을 말해주고 있다는 점이다.

또, 구하고자 하는 $f(t)/g(t)$의 극한에 대해서, 분자, 분모가 모두 0 으로 수렴하거나 무한대로 발산할 때에야 비로소 로피탈의 정리가 사용될 수 있다는 점 역시 주목해야할 점이다.

# 로피탈 정리의 기하학적 이해

로피탈의 정리를 기하학적으로 이해하기 위해 다음과 같이 매개변수 방정식을 이용해 아래의 식 (5) 및 그림 1과 같이 $g(t)$와 $f(t)$를 평면상의 경로의 한 점으로 생각하자.

$$(x, y) = (g(t), f(t))$$

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-08_LHopital_rule/pic1.png">
  <br>
  그림 1. $t$를 매개변수로 하여 함수 $g(t), f(t)$를 평면상의 한 점으로 생각하자.
</p>

이런 처리를 해줌으로써 두 개의 함수를 하나의 곡선으로 대체해 생각할 수 있다.

또, 다음과 같이 바꿔 생각할 수 있다.

$$\frac{f'(t)}{g'(t)} = \frac{dy/dt}{dx/dt} = \frac{dy}{dx}$$

$$\frac{f(t)}{g(t)} = \frac{y}{x}$$

즉, 식 (6)이 의미하는 것은 그림 1의 경로에서 $(x, y)$의 **순간 변화율**을 의미하고, 식 (7)은 원점에서부터 $(x, y)$까지의 **평균 변화율**을 의미하게 된다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-08_LHopital_rule/pic2.png">
  <br>
  그림 2. 매개변수를 이용한 곡선에서 $f'(t)/g'(t)$와 $f(t)/g(t)$의 의미는 <br>각각 순간변화율(파란색)과 평균변화율(빨간색)이다.
</p>

여기서 로피탈의 정리는 극한에 관한 것인데 $t$를 어떤 $\alpha$로 보내주는 것에 관한 것이다. 그림 1 또는 2에서 $\alpha$에 대한 극한을 취해준다는 것은 곡선상의 어디엔가 있는 $(x,y)$로 접근하겠다는 의미로 해석할 수 있다.

그렇다면, 이 때 $t\rightarrow \alpha$로 접근할 때 시시각각 순간 변화율과 평균 변화율이 변하는 것을 확인할 수 있다.

<p align = "center">
  <img width = "500" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-08_LHopital_rule/pic3.gif">
  <br>
  그림 3. $t\rightarrow \alpha$로 접근하겠다는 것은 <br> 빨간점을 곡선상의 어디엔가 있는 $(x,y)$로 접근시키겠다는 의미와 같으며, <br>시시각각 순간 변화율(파란색)과 평균 변화율(빨간색)이 변한다.
</p>
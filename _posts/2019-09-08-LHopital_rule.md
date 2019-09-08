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
  <img src = "https://data.ygosu.com/upload_files/board_study/240555/574b096040ae3.jpg">
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
|<center>실수함수 $f(t)$와 $g(t)$에 대하여, $\alpha$는 다음 중 하나의 극한값을 갖는다고 하자. <br><br> $$\alpha^{\pm}, \alpha^+, \alpha^-, +\infty, -\infty \notag$$<br> 또, $L$은 실수이거나 $+\infty$ 혹은 $-\infty$로 발산한다고 하자. <br><br> 이 때, 만약 <br> $$\lim_{t\rightarrow \alpha}\frac{f'(t)}{g'(t)}$$ <br>이고, <br> $$\text{(1) }\lim_{t\rightarrow \alpha}g(t) = \lim_{t\rightarrow \alpha}f(t) = \pm\infty$$ <br><br>또는<br> $$\text{(2) }\lim_{t\rightarrow \alpha}g(t) = \lim_{t\rightarrow \alpha}f(t) = 0$$ <br><br> 이라면 <br> $$\lim_{t\rightarrow \alpha}\frac{f(t)}{g(t)} = L$$ <br>이다.</center>|


---
title: Wold's theorem
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201005
tags: 신호처리
---

※ Wold's theorem은 위너-킨친 정리의 Discrete Time Signal 버전이라고 할 수 있다.

※ 해당 내용은 [Richard Shiavi의 Introduction to applied statistical signal analysis, 3e.](https://www.amazon.com/Introduction-Applied-Statistical-Signal-Analysis/dp/0120885816)의 내용을 옮겨 적은 것임.


# 1. Discrete Time Random Signal의 Power Spectrum Density (PSD)

Wide-sense stationary random signal의 푸리에 변환을 생각할 때의 가장 큰 문제점은 푸리에 변환이 존재하지 않는다는 것이다. 다시 말해 $X(f)$가 존재하기 위해서는 신호의 에너지가 유한해야 한다. 다시 말해 아래와 같은 식을 만족해야 한다는 뜻이다. 

$$energy = T\sum_{n=-\infty}^{\infty}x(n)^2 < \infty$$

$x(n)$은 최소한 wide-sense stationary 하므로 모든 sample function의 energy는 양의 무한대로 발산하게 된다(Priestly, 1981)[^1]. 

[^1]: 해당 내용에 대한 조금 더 구체적인 설명은 [위너-킨친 정리](https://angeloyeo.github.io/2020/10/04/Wiener_Khinchin.html)의 내용을 참고


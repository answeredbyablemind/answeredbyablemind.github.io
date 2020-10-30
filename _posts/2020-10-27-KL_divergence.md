---
title: KL divergence
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201027
tags: 통계학 머신러닝
---

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-27-KL_divergence/pic1.png">
  <br>
  KL divergence가 말하는 것: 이상과 현실 간의 괴리
</p>

# prerequisites

해당 포스팅의 내용에 대해 이해하시려면 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [정보 엔트로피](https://angeloyeo.github.io/2020/10/26/information_entropy.html)

# 정보 엔트로피의 상대적 비교

KL divergence는 쿨백-라이블러(Kullback-Leibler) 발산을 줄여서 쓴 말인데, 쿨백과 라이블러 모두 사람이름인 것으로 확인된다. 

그러니까, KL divergence를 생각할 때는 "divergence"라는 말에만 주목하면 된다는 것인데, 이 divergence의 의미는 [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html) 같은 개념이 아니라, 그저 "차이"를 다른 말로 쓴 것일 뿐이다는 것을 명심해야 한다.

특히, 여기서 "차이"라고 말하는 것은 두 확률 분포를 비교한다는 말이다.

이 때 정보 엔트로피를 이용해 비교가 진행되다 보니 KL divergence를 또 다른 말로 relative entropy라고 부르기도 한다.


[//]:# (굳이 entropy의 개념을 끌어들이는 이유는 뭘까? 다른 개념을 이용할 수도 있지 않을까? 가령 기초적인 빼기 같은 것 말이다.)

가령, 우리의 목적이 확률 분포 $P$를 정확히 모델링하는 것이라고 하자.


이산확률분포 $P$와 $Q$가 동일한 샘플 공간 $\chi$에서 정의된다고 하면 KL divergence는 다음과 같다.

$$D_{KL}(P\|Q) = \sum_{x\in \chi}P(x)\log\left(\frac{P(x)}{Q(x)}\right)$$

$$=-\sum_{x\in \chi}P(x)\log\left(\frac{Q(x)}{P(x)}\right)$$

$$=-\sum_{x\in\chi}P(x)\log Q(x) + \sum_{x\in\chi}P(x)\log P(x)$$



<p align = "center">
  <iframe width ="880" height = "340" src="https://angeloyeo.github.io/p5/2020-10-27-KL_divergence/" frameborder = "0"></iframe>
    <br>
    KL-divergence의 시각화. 
    <br>
    파란색 함수와 빨간색 함수를 각각 $P(x)$, $Q(x)$라고 했을 때, 초록색 함수에 대한 넓이 합이 KL-divergence 값 $D_{KL}(P\|Q)$을 의미한다.
</p>

# 참고 자료

* [위키피디아 KL divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence)
---
title: AutoEncoder
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201010
tags: 기계학습
---

이번 시간에는 RBM과 함께 딥러닝 이론 구축의 근간이 되었던 개념 중 하나인 AutoEncoder(이하 AE)에 대해 알아보고자 한다.

[Restricted Boltzmann Machine](https://angeloyeo.github.io/2020/10/02/RBM.html)(이하 RBM)과 AE는 거의 유사한 목표를 갖고 있다. 둘의 목표는 모두 hidden layer에서 input layer(혹은 visible layer)의 데이터에 관한 latent factor들을 얻어내는 것이다.

이 말이 조금 어렵게 들릴 수 있는데, 조금 쉽게 설명하자면 AE는 데이터를 압축하고, 다시 압축 해제하는 과정을 거치게 만든 뉴럴네트워크이다.

그럼 굳이 압축 해제해서 원래 데이터를 얻을 것을 왜 굳이 압축을 할까?

첫번째로는 이 뉴럴넷이 압축하는 방식을 배웠으면 하기 때문이다. 다시 말해, 비선형적인 차원감소를 수행하고, 이를 통해 원래 고차원의 데이터를 더 낮은 차원에서 표현하고 싶기 때문이다.

아마 이 과정에서 일부 데이터의 손실이 발생할 수 있는데, 이 손실을 최소화 해주기 위한 프로세스를 통해 더 좋은 AE로 훈련받을 수 있는 것이다.

두 번째로는 지금껏 전혀 보지 못한 데이터를 생성할 때에 AE가 힘을 발휘할 수 있기 때문이다.

앞서 언급한 압축의 첫 번째 이유에서 더 낮은 차원의 압축된 데이터를 얻는다고 말했다. 이것을 거꾸로 생각해 보자. 

이미 잘 훈련된 AE가 있다고 하면, 압축된 낮은 차원의 벡터 공간에서 임의의 점을 선정해 다시 압축해제를 시키면 지금껏 보지 못한 데이터가 생성될 수 있다.

왜냐면 AE는 낮은 차원에 표현되어 있는 데이터를 다시 높은 차원으로 압축 해제하는 방법을 잘 배웠을 것이기 때문이다.

이러한 두 가지 이유에 해당하는 일을 수행하는 것을 인코딩과 디코딩이라고 말한다. 즉, 압축 과정을 인코딩, 압축 해제 과정을 디코딩이라고 부른다. 그리고 이러한 일들을 수행하는 파트들을 각각 인코더, 디코더라고 부른다.


<img src = "https://qph.fs.quoracdn.net/main-qimg-5fb85839f91f99cdfa19b80c252c0fc2">

<img src = "https://qph.fs.quoracdn.net/main-qimg-cbead8949d99b15d099ca073b1206a45">

# 참고자료

* [What is the difference between autoencoders and a restricted Boltzmann machine?](https://www.quora.com/What-is-the-difference-between-autoencoders-and-a-restricted-Boltzmann-machine)
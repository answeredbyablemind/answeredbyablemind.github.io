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

[//]:# (AE의 구조 그림 넣을 것)

# 압축의 관점에서: 인코더의 역할

데이터를 압축한다는 것은 다른 말로하면 "차원감소"와 비슷한 말로 볼 수 있다.

하지만, 차원감소라는 말 대신 "압축"이라는 말을 굳이 사용하고 있는 것은 선형적인 차원감소에서 사용하는 "투영(혹은 정사영)"이 아닌 비선형적인 방식의 차원 감소가 이루어지기 때문이다.

오토인코더(AutoEncoder, AE)로 데이터를 압축하면 우리는 그 결과로써 표현 벡터(representation vector)를 얻을 수 있다.

이 표현 벡터를 직관적으로 잘 이해할 수 있는 방법 중 하나는 표현 벡터를 2차원 혹은 3차원 벡터로 받아 이 것을 직접 그려보는 것이다.

이번 posting에서는 MNIST 데이터를 AE에 적용해 차원 압축을 시켜보고자 한다.

MNIST 데이터에 대해 짧게 설명하자면 아래의 그림과 같이 0에서 9까지의 숫자를 손으로 쓴 그림들을 포함하고 있는 데이터셋이다.

각 그림은 28x28 픽셀의 크기로 구성되어 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-10-autoencoder/pic1.png">
  <br>
  그림 1. MNIST 데이터셋의 일부 샘플
  <br>
  <a href = "https://ko.wikipedia.org/wiki/MNIST_%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4"> 그림 출처: Wikipedia MNIST 데이터베이스</a>
</p>

아래는 [MNIST 데이터](https://tensorflowkorea.gitbooks.io/tensorflow-kr/content/g3doc/tutorials/mnist/beginners/)를 이용해 784 차원의 데이터 (28 x 28)를 2차원으로 압축해 얻은 표현 벡터를 label 별로 색깔을 달리하여 표시한 것이다.

<p align ="center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-10-autoencoder/pic2.png">
  <br>
  그림 2. MNIST 데이터의 representation vector의 시각화
</p>

그림 2를 보면 알 수 있는 것은 0으로 labeling이 된 데이터들(보라색)은 좌측 상단에 퍼져있듯이 위치하고 있는데, 다른 label의 숫자들과는 떨여져 있다는 것이다.

또, 1로 labeling된 데이터들은 우측 하단에 퍼져있고, 다른 label의 숫자들과 떨어져 있다.

반면 0과 1의 label이 아닌 데이터들은 중앙에 함께 퍼져서 위치하는 것을 알 수 있다.

우선은 각 label별로 분리되지 않고 뭉쳐져서 representation vector가 표시되고 있는 것에 대해서는 크게 신경쓰지 말도록 하자. 이 결과에 대한 더 좋은 성능을 얻는 방법은 [Variational AutoEncoder 편](https://angeloyeo.github.io/2020/10/11/VAE.html)에서 추가로 다루도록 하겠다.

어찌되었건 AE에서 인코더의 역할은 주어진 고차원의 데이터(여기선 784차원의 데이터)를 낮은 차원의 벡터(여기선 2차원)으로 압축시켜 표현할 수 있게 해준다는 것이다.

[//]:# (latent space라는 용어를 굳이 설명해야할까?)

# 압축 해제의 관점에서: 디코더의 역할

# 파이썬 코드 예시

# AE의 출력 결과

<img src = "https://qph.fs.quoracdn.net/main-qimg-5fb85839f91f99cdfa19b80c252c0fc2">

<img src = "https://qph.fs.quoracdn.net/main-qimg-cbead8949d99b15d099ca073b1206a45">

# 참고자료

* [What is the difference between autoencoders and a restricted Boltzmann machine?](https://www.quora.com/What-is-the-difference-between-autoencoders-and-a-restricted-Boltzmann-machine)
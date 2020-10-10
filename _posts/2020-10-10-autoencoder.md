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

어떻게 생각하면 차원 감소의 방법 중 하나라고 생각할 수도 있다. 조금 더 구체적으로는 고차원의 데이터를 저차원으로 압축시켜주는 방법이다. PCA와 AE가 (혹은 PCA와 RBM이) 보여주는 차이점은 PCA는 선형적인 모델인 것에 반해 AE 혹은 RBM은 비선형적인 모델이라는 점이다.



<img src = "https://qph.fs.quoracdn.net/main-qimg-5fb85839f91f99cdfa19b80c252c0fc2">

<img src = "https://qph.fs.quoracdn.net/main-qimg-cbead8949d99b15d099ca073b1206a45">

# 참고자료

* [What is the difference between autoencoders and a restricted Boltzmann machine?](https://www.quora.com/What-is-the-difference-between-autoencoders-and-a-restricted-Boltzmann-machine)
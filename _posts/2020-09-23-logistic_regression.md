---
title: 로지스틱 회귀
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200923
tags: 머신러닝
---

# Prerequisites

본 포스팅의 내용에 대해 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [경사하강법](https://angeloyeo.github.io/2020/08/16/gradient_descent.html)
* [선형회귀 (최적화 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html#%EC%B5%9C%EC%A0%81%ED%99%94-%EB%AC%B8%EC%A0%9C-%EA%B4%80%EC%A0%90%EC%97%90%EC%84%9C-%EB%B3%B8-%ED%9A%8C%EA%B7%80%EB%B6%84%EC%84%9D)

# 회귀에서 분류로...

[선형회귀 (최적화 관점)](https://angeloyeo.github.io/2020/08/24/linear_regression.html#%EC%B5%9C%EC%A0%81%ED%99%94-%EB%AC%B8%EC%A0%9C-%EA%B4%80%EC%A0%90%EC%97%90%EC%84%9C-%EB%B3%B8-%ED%9A%8C%EA%B7%80%EB%B6%84%EC%84%9D) 편에서 확인한 데이터들은 라벨 값(즉, 아래의 그림 1에서 사고 발생 건수)이 연속적인 것이었다.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-24-linear_regression/pic7.png">
  <br>
  그림 1. 선형회귀 모델 구축 시 이용한 연속적 라벨을 가지는 데이터
</p>


하지만 어떤 경우에는 다음과 같이 라벨이 범주형일 수도 있다. 라벨이 범주형이라는 것은 가령 "남자, 여자" 혹은 "강아지, 고양이" 등의 연속적인 숫자로 나타내기 어려운 데이터들을 얘기하고 보통 0 혹은 1로 숫자로 치환해 생각한다.

가령 아래와 같이 $x$라는 특성값이 5보다 작으면 클래스가 0으로, 5보다 같거나 크면 클래스가 1로 결정된다고 생각해보자.

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/pic1.png">
  <br>
  그림 2. 범주형 데이터의 예시. 특성값 $x$가 5보다 작으면 클래스 0, 5보다 크거나 같으면 클래스 1로 분류할 수 있다고 하자.
</p>


<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/pic2.png">
  <br>
</p>

[//]:# (범주형 데이터를 표현할 수 있는 함수 필요함을 어필할 것.)

<p align = "center">
  <img width = "400" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/pic3.png">
  <br>
</p>

[//]:# (왜 sigmoid 함수인가? --> 미분하기 쉽다. 또, 각 label에 대한 데이터의 분포가 정규분포라고 했을 때 Posterior를 계산하면 얻을 수 있는 결과임. 어려우니까 넘어가자.)

# Error에 대한 gradient 계산

## P에 대한 편미분 계산

계산의 편의를 위해 다음과 같이 변수들을 벡터화 시키도록 하자.

$$X=\begin{bmatrix}x \\ 1\end{bmatrix}$$

$$\theta = \begin{bmatrix}a\\b\end{bmatrix}$$

따라서, $ax+b$는 다음과 같이 쓸 수 있다.

$$\theta^TX=\begin{bmatrix}a & b\end{bmatrix}\begin{bmatrix}x \\ 1\end{bmatrix}$$

먼저, $P(X,\theta) = 1/(1+\exp(-\theta^T X))$라고 하면,

$$\frac{\partial P}{\partial \theta} = \frac{\partial}{\partial \theta}\left(\frac{1}{1+\exp(-\theta^TX)}\right)$$

분자식의 형태로 되어있는 함수에 대한 미분을 적용하면,

$$\Rightarrow\frac{(-1)(1+\exp(-\theta^T X))'}{(1+\exp(-\theta^TX))^2}$$

여기서 $1+\exp(-\theta^TX)$를 $\theta$에 대해 미분해주자.

$$\Rightarrow\frac{(-1)(\exp(-\theta^TX))(-X)}{(1+\exp(-\theta^TX))^2}$$

이제 부호를 정리해주면 아래와 같다.

$$\Rightarrow \frac{\exp(-\theta^TX)X}{(1+\exp(-\theta^TX))^2}$$

여기서 분모의 제곱항을 다시 나눠 쓰면 다음과 같다.

$$\Rightarrow\frac{\exp(-\theta^TX)X}{(1+\exp(-\theta^TX))(1+\exp(-\theta^TX))}$$

따라서 또 나눠 쓰면 다음과 같이도 쓸 수 있을 것이다.

$$\Rightarrow \left(\frac{1}{1+\exp(-\theta^TX)}\right)\left(\frac{\exp(-\theta^TX)}{1+\exp(-\theta^TX)}\right)X$$

여기서 두 번째 term은 1을 더하고 1을 빼도 결과는 변화가 없으므로,

$$=\left(\frac{1}{1+\exp(-\theta^TX)}\right)\left(\frac{1+\exp(-\theta^TX)-1}{1+\exp(-\theta^TX)}\right)X$$

즉, 원래의 $P(X, \theta)$에 대한 정의를 이용하여 다음과 같이 쓸 수 있다.

$$ = P(X,\theta)(1-P(X,\theta))X$$

## Error에 대한 편미분 계산

우리는 error를 다음과 같이 정의하였다.

$$E(y, P) = -(y\log(P)+(1-y)\log(1-P))$$

$$\frac{\partial E}{\partial \theta}=-\left(y\frac{\partial \log(P)}{\partial \theta}+(1-y)\frac{\partial\log(1-P)}{\partial \theta}\right)$$

$$\Rightarrow -\left(y\frac{\partial \log(P)}{\partial P}\frac{\partial P}{\partial \theta}+(1-y)\frac{\partial \log(1-P)}{\partial (1-P)}\frac{\partial(1-P)}{\partial P}\frac{\partial P}{\partial \theta}\right)$$

$$\Rightarrow -\left(y\frac{1}{P}\frac{\partial P}{\partial \theta}+(1-y)\frac{1}{1-P}(-1)\frac{\partial P}{\partial \theta}\right)$$

$$\Rightarrow -y\frac{1}{P}\frac{\partial P}{\partial \theta}+(1-y)\frac{1}{1-P}\frac{\partial P}{\partial \theta}$$

$$\Rightarrow -y\frac{1}{P}P(1-P)X+(1-y)\frac{1}{1-P}P(1-P)X$$

$$\Rightarrow -y(1-P)X + (1-y)PX$$

$$=-Xy+PXy+PX-PXy$$

$$=(P-y)X$$

$$\therefore \frac{\partial E}{\partial a}=(P-y)x$$

이고,

$$\frac{\partial E}{\partial b}=(P-y)$$

이다.

# 회귀 모델 구축 결과

<p align = "center">
  <video width = "400" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/picN.mp4">
  </video>
  <br>
</p>

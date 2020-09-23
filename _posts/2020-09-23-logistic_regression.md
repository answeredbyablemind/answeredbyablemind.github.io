---
title: 로지스틱 회귀
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200923
tags: 머신러닝
---

다음과 같이 범주형 데이터가 주어진다고 하자.

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/pic1.png">
  <br>
</p>

[//]:# (선형회귀로 푼 경우 그림 그릴 것)

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-09-23-logistic_regression/pic2.png">
  <br>
</p>

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

여기서 두 번째 term은 +1 -1 을 해도 결과는 변화가 없으므로,

$$=\left(\frac{1}{1+\exp(-\theta^TX)}\right)\left(\frac{1+\exp(-\theta^TX)-1}{1+\exp(-\theta^TX)}\right)X$$

즉, 원래의 $P(X, \theta)$에 대한 정의를 이용하여 다음과 같이 쓸 수 있다.

$$ = P(X,\theta)(1-P(X,\theta))X$$

## Error에 대한 편미분 계산

우리는 error를 다음과 같이 정의하였다.

$$E(y, P) = -(y\log(P)+(1-y)\log(1-P))$$

$$\frac{\partial E}{\partial \theta}=-\left(y\frac{\partial \log(P)}{\partial \theta}+(1-y)\frac{\log(1-P)}{\partial \theta}\right)$$

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
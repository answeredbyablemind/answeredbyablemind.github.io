---
title: Restricted Boltzmann Machine (임시 백업)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201002
tags: 기계학습
---


RBM에 기대되는 역할: Generative Model

PCA와 유사하게 데이터의 lower-dimension의 representation을 학습하도록 하는 것.

Learning Steps: Gibbs sampling을 통해서 학습. visible layer에 데이터를 주고 hidden layer의 node 값을 샘플링. 그런 다음 다시 visible layer의 데이터를 다시 예측하도록 하는 과정이 있음.

즉, input을 reconstruction하는 과정임.

RBM에게 학습이란 원래의 input과 reconstructed input 간의 차이가 줄어드는 것임.

Gibbs Sampling이라는것은 특별히 어려운 것이 아니라 조건부 샘플링에 불과함.

Contrastive Divergence라는 것은 입력값과 Reconstructed 입력값 간의 차이를 의미하는 것에 불과함. 즉 요즘말로 Error.

CD-1 이라는 것은 Reconstruction을 한번만 해서 얻은 Reconstruction입력을 에러(즉, RBM에서 말하는 에너지) 계산에 이용하겠다는 것임.


visible layer와 hidden layer의 bias가 갖는 의미: 각 visible node와 hidden node의 inherent property를 찾아주는 역할

-----------------------------------

아래와 같이 내가 정리했지만 너무 어렵다. 더 쉽게 다시 쓸 예정...


# 1. 개요

 Restricted Boltzmann Machine(RBM)은 Deep probabilistic models를 이루는 building block으로 [Geoffery Hinton 교수](https://www.cs.toronto.edu/~hinton/)의 [Deep Belief Network](https://en.wikipedia.org/wiki/Deep_belief_network)에서 pre-training 할 때 가장 중요하게 사용되는 개념이다. 

# 2. 본격 설명

## 1) RBM의 구조

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-10-02-RBM/pic1.png">
  <br>
  그림 1. RBM의 구조
</p>

RBM은 undirected probabilistic graphical model로써 observable variables로 이루어진 층 (visible layer)과 latent variables로 이루어진 층 (hidden layer)으로 구성되어 있다. 또 하나 독특한 점으로써, RBM의 visible layer와 hidden layer 내의 node들은 서로 독립적이다. 이 사실은 이후 RBM을 설계할 때 사용되는 공식을 유도할 때 매우 중요한 요소로 사용된다.

참고로 이름에 ‘restricted’라는 이름이 붙은 것은 원래의 Boltzmann machine에서는 hidden layer나 visible layer 따위의 제한은 없고 layer 내의 node가 독립적이라던지 하는 제한이 없기 때문이다. 사실 이런 제한을 두게 된 것은 수학적인 유도를 진행시키는 것이 힘들어서이다. 이후 전개 과정을 계속 보게 된다면 이것이 무슨 의미인지 알 수 있을 것이다.

[//]:# (Boltzmann Machine과 RBM의 구조 차이 그림 넣을 것)

## 2) RBM의 목적

RBM의 목표는 주어진 환경에 대해 모든 가능한 사건의 확률 분포를 모델링하는 것이다. 

조금 더 자세하게 말하자면, visible layer의 벡터 $\vec{v}$가 주어졌을 때, 그것에 가장 잘 대응할 수 있는 다른 차원의 representation $\vec{h}$를 학습하고자 하는 것이며 이것을 알려고 하는 방법으로 확률적인 방법을 택한 것이다. 

조금 더 구체적으로, 어떤 특수한 환경을 가장 잘 표현할 수 있도록 RBM을 학습시킨다는 것은 이 환경에서 추출한 임의의 $\vec{v}$에 대한 다른 차원의 적절한 표현 $\vec{h}$를 찾을 수 있도록 weight matrix $W$와 biases $\vec{b},\vec{c}$를 찾아주는 것이다. 

여기서 $\vec{b}$, $\vec{c}$ 는 각각 visible layer와 hidden layer의 bias 이고 각각이 $d$개와 $n$개로 구성되어 있다고 하자.

어떻게 생각하면 RBM의 개념은 PCA와 비슷할 수 도 있다. PCA는 고차원의 데이터에 대해 더 저차원의 공간에서의 representation을 찾고자 하는 것이기 때문이다. 하지만 PCA와는 전혀 다른 접근법을 이용한다.

## 3) Energy-based model

RBM을 공부할 때 몇 가지 그냥 받아들였으면 하는 부분이 있는데 그 중 하나가 Energy의 개념이다. 기본적으로 RBM에서는 visible layer와 hidden layer의 node들을 벡터 로 명명하고, 모든 가능한 $\vec{v}$와 $\vec{h}$에 대한 energy를 정의해두었다. 

이 때, $\vec{v}$와 $\vec{h}$의 요소들은 0 또는 1의 값을 가진다. energy를 정의하는 배경은 다음과 같이 소개할 수 있다. Boltzmann machine은 본래 확률 분포를 모델링하기 위한 graphical model이며, 확률의 개념을 energy의 개념을 통해 접근하고자 했다. 모든 가능한 $\vec{v}$와 $\vec{h}$에 대해, 각각의 상태(state)에 대한 에너지를 정의하고, 에너지가 높을수록 해당 조합의 상태가 될 확률은 낮아진다는 것이 Boltzmann machine의 기본적인 출발이다.[^1] 

[^1]: 좀 더 깊이 알아보고 싶다면 깁스 에너지와 깁스 분포라는 키워드를 가지고 자료를 찾아볼 수 있을 것이라 생각된다.

 RBM에서 에너지는 다음과 같이 정의한다.

$$E(\vec{v}, \vec{h}) = -\vec{b}\cdot\vec{v} - \vec{c}\cdot\vec{h} - \vec{v}\cdot W \vec{h}$$

[//]:# (식 1)

$$=-\sum_k b_k v_k - \sum_j c_j h_j - \sum_j \sum_k W_{jk}h_j v_k$$

[//]:# (식 2)

에너지의 정의에 온통 (-)가 붙어있는 것에 너무 반감을 갖지는 말자. Hinton의 강의에 따르면 그저 “높은 에너지는 나쁘기 때문에” (-)를 붙여둔 것이라고 한다.

 또한, 이렇게 정의된 에너지에 따라 곧장 확률을 정의할 수 있다.

$$P(\vec{v}, \vec{h}) = \frac{1}{Z}\exp(-E(\vec{v}, \vec{h}))$$

[//]:# (식 3)

여기서 $Z$는 normalizing constant이며 다음과 같이 정의된다.

$$Z = \sum_{\vec{v}}\sum_{\vec{h}}\exp(-E(\vec{v}, \vec{h}))$$

[//]:# (식 4)

Energy에 대해 조금 더 자세하게 예를 들어서 설명해보자. 우리의 목표는 Energy를 낮추는 것이다. 만약 $b_k \lt 0$이라고 하자. 그러면 $v_k$는 0이 되어야 좋다. 왜냐하면 그것이 energy를 더 작게 해줄 수 있는 선택이기 때문이다. 

또 만약 $b_k>0$이라고 해보자. 그러면 $v_k$는 1이 되는 것이 좋다. 

이런 식으로 $c_j$와 $h_j$의 관계도 생각할 수 있겠다. 

또, weight에 대해서도 생각해보자. $w_{jk} \lt 0$이라고 생각해보자. 그러면 이때는 $h_j$나 $v_k$ 둘 중 하나 또는 둘 다가 0이 되는 것이 좋다. 또 만약 $w_{jk} \gt 0$이라고 하면, $h_j$와 $v_k$가 1이 되는 것이 좋다. 이런 trade off 관계를 잘 지키는 $\vec{v}$와 $\vec{h}$라면 나올 확률이 높을 것이고 그렇지 않은 $\vec{v}$와 $\vec{h}$라면 나올 확률이 상대적으로 낮을 것이다. 

이것에 관해서 모델링을 하는 것이 RBM이다.

이제 normalizing constant $Z$에 대해서 생각해보도록 하자. $Z$는 식(4)와 같이 정의되는데, 모든 가능한 $\vec{v}$와 $\vec{h}$에 대해 생각하는 것은 너무 숫자가 많다. 

가령 MNIST 데이터에 관한 RBM을 만든다고 하자. 이 때, input vector는 784차원, hidden layer unit의 개수는 100개라고 하면, 모든 가능한 경우의 수는 $2^{748}\times 2^{100} = 2^{848}$개다.

이것을 개선해보기 위해 joint probability distribution 대신에 conditional probability distribution에 대해 생각해보도록 하자. 왜냐하면 conditional probability distribution은 joint probability distribution을 구하는 것에 비해 쉽고, Gibbs sampling을 통해 쉽게 sampling 할 수도 있다. 또, 본래 RBM을 통해 얻고자 하는 것이 바로 가 주어졌을 때 적절한 를 구하는 것이기 때문에 본래의 취지에도 잘 맞는 접근법이기 때문이다.

## 4) $\vec{v}$와 $\vec{h}$에 관한 conditional probability

지금은 $P(\vec{h}\|\vec{v})$에 대해 증명할 것이지만, 본래 $\vec{h}$와 $\vec{v}$는 대칭적인 것이기 때문에 $P(\vec{v}\|\vec{h})$에 대해 생각하는 것은 $P(\vec{h}\|\vec{v})$를 증명할 때에 쓴 방법과 같은 방법으로 생각할 수 있어서 용이하다. 

$$P(\vec{h}|\vec{v}) = \frac{P(\vec{v}, \vec{h})}{P(\vec{v})}$$


여기서 에너지와 확률의 관계, 그리고 marginal pdf의 개념을 이용하면 다음과 같이 식을 전개할 수 있다.

$$\Rightarrow \frac{\frac{1}{Z}\exp(-E(\vec{v}, \vec{h}))}{\sum_h P(\vec{v}, \vec{h})}$$

$$=\frac
{\frac{1}{Z}\left(\exp(\vec{b}\cdot\vec{v}+\vec{c}\cdot\vec{h} +\vec{v}\cdot W \vec{h})\right)}
{\sum_h \frac{1}{Z}\left(\exp(\vec{b}\cdot\vec{v}+\vec{c}\cdot\vec{h} +\vec{v}\cdot W \vec{h})\right)}$$

$$=\frac
{
  \exp\left(\vec{c}\cdot \vec{h}+\vec{v}\cdot W\vec{h}\right)
  }
{
  \sum_h\exp\left(\vec{c}\cdot \vec{h}+\vec{v}\cdot W\vec{h}\right)
}$$

$$=\frac{1}{Z'}\exp\left(\vec{c}\cdot\vec{h}+\vec{v}\cdot W\vec{h}\right)$$

여기서 $Z' = \sum_h \exp\left(\vec{c}\cdot\vec{h} + \vec{v}\cdot W\vec{h}\right)$ 이다.

이 때 위 식을 scalar form으로 고쳐보면 다음과 같이 쓸 수도 있다.

$$\Rightarrow \frac{1}{Z'}\exp\left(\sum_{j=1}^n c_j h_j + \sum_{j=1}^n \vec{v}\cdot w_{:,j}h_j\right)$$

여기서 $w_{:,j}$는 $W$ 행렬의 $j$열의 모든 행을 한꺼번에 표현한 것이다. 
이것은 지수함수의 성질에 따라 다음과 같이 표현할 수 있다.

$$\Rightarrow \frac{1}{Z'}\prod_{j=1}^{n}\exp\left(c_j h_j+ \vec{v}\cdot  w_{:, j}h_j\right)$$

이 때, RBM의 구조에서 설명했듯이 $h_j, j= 1, 2, \cdots, n$은 조건부 독립이라 가정했으므로 다음은 참이다.

$$P(\vec{h}|\vec{v}) = \prod_{j=1}^{n}P(h_j|\vec{v})$$

그렇기 때문에 

$$P(\vec{h}|\vec{v}) = \frac{1}{Z'}\prod_{j=1}^{n}\exp\left(
  c_jh_j + \vec{v}\cdot w_{:, j} h_j
  \right) = \prod_{j=1}^{n}P(h_j |\vec{v})$$

이므로 $Z'$을 적절히 n개로 나눌 수 있으므로 (즉, $Z' = \prod_{j=1}^{n}Z_j'$)

$$P(h_j|\vec{v}) = \frac{1}{Z_j'}\exp\left(c_j h_j +\vec{v}\cdot w_{:, j}h_j\right)$$


라고 생각할 수 있다. 여기서 $Z_j' = \sum_{h_j}\exp\left(c_j h_j + \vec{v}\cdot w_{:,j}h_j\right)$이다. [^2]


[^2]: 이 과정에서 계산을 많이 생략했는데, 정말 자세한 증명이 궁금하다면 아래를 참조하길 바람. http://info.usherbrooke.ca/hlarochelle/ift725/5_02_inference.pdf


그리고,

$$P(h_j | \vec{V}) = \frac{1}{Z'}\exp\left(c_j h_j \vec{v}\cdot w_{:,j}h_j\right)$$

$$ = \frac{
  \exp\left(c_j h_j + \vec{v}\cdot w_{:, j}h_j\right)
}
{
  \sum_{h_j}\exp\left(c_j h_j + \vec{v}\cdot w_{:, j}h_j\right)
}$$


$$ = \frac{
  \exp\left(c_j h_j + \vec{v}\cdot w_{:, j}h_j\right)
}
{
  1 + \exp\left(c_j + \vec{v}\cdot w_{:, j}\right)
}$$


따라서,

$$P(h_j = 1 | \vec{v}) = \frac{
  \exp\left(c_j + \vec{v}\cdot w_{:, j}\right)
}
{
  1 + \exp\left(c_j + \vec{v}\cdot w_{:, j}\right)
}$$

$$=\sigma(c_j + \vec{v}\cdot w_{:, j})$$

(여기서 $\sigma(\cdot)$은 sigmoid 함수임.)

따라서,

$$P(\vec{h} = 1 | \vec{v}) = \prod_{j=1}^{n}\sigma(c_j +\vec{v}\cdot w_{:, j})$$

이고[^3], 같은 방법으로

[^3]: 여기서 이라는 것에서 1은 1로 이루어진 n차원 벡터임. 아래의 $\vec{v} = 1$ 도 마찬가지.

$$P(\vec{v} = 1|\vec{h}) = \prod_{i=1}^{d}\sigma(b_i + w_{i,:}\cdot\vec{h})$$

이다.

## 5) Gibbs sampling

이제 만약 적절한 biases와 weight $\vec{b}, \vec{c}, W$가 RBM에서 학습되어 있다고 하자. 그러면 어떤 방식으로 $\vec{h}$와 $\vec{v}$를 결정해 줄 수 있을까? 그것은 Gibbs sampling을 이용하여 가능하다.
Gibbs sampling은 두 개 이상의 joint distribution으로부터 연쇄적으로 표본을 추출하는 과정을 의미한다. 여기서 연쇄적이라는 말은 마코프 연쇄(Markov chain)을 의미한다. Gibbs sampling에 대해 정확하게 이해하려면 따로 공부하는 것이 좋다. 

RBM에서 $\vec{v}$와 $\vec{h}$가 Markov property를 가진다는 것은 $l$번 째 state의 $\vec{v}^{(l)}$과 $P(\vec{h}^{(l)}\|\vec{v}^{(l)})$을 통해 $\vec{h}^{(l)}$을 유추해낼 수 있다는 것을 의미한다. (여기서 $\vec{v}$와 $\vec{h}$의 순서는 바뀔 수 있다.) 즉 다음과 같은 과정을 통해 $\vec{v}$와 $\vec{h}$를 얻을 수 있다.

---

Step 1. Sample $\vec{h}^{(l)}$ ~ $P(\vec{h}\|\vec{v}^{(l)})$

  $\Rightarrow$ We can simultaneously and independently sample from all the elements of $\vec{h}^{(l)}$ given $\vec{v}^{(l)}$.

Step 2. Sample $\vec{v}^{(l+1)}$ ~ $P(\vec{v}\|\vec{h}^{(l)})$

  $\Rightarrow$ We can simultaneously and independently sample from all the elements of $\vec{v}^{(l+1)}$ given $\vec{h}^{(l)}$.

---

여기서 superscript $^{(l)}$또는 $^{(l+1)}$ 등은 $(l)$번째 또는 $(l+1)$번째 상태의 $\vec{v}$ 혹은 $\vec{h}$를 의미한다.

조금 더 구체적으로 설명하자면, $\vec{c},\vec{b}, W$를 모두 안다고 가정해보자. 즉, training이 모두 끝났다고 가정하도록 하자. 여기서 $\vec{v}$는 우리가 알 수 있는 것이다. 그러면 $P(h_j = 1 \| \vec{v})$는 

$$P(h_J = 1 | \vec{v}) = \sigma(c_j + \vec{v}\cdot W_{:, j})$$

로부터 그 값을 도출할 수 있게 된다. 가령 $P(h_j =1 \| \vec{v}) = 0.2$라는 값을 얻었다고 해보자. 이때, uniform distribution에서 random하게 0~1 사이의 숫자를 얻자. 그러면 다음과 같은 방식으로 $h_j$가 0인지 1인지를 결정할 수 있다.

---

num = rand(1);

if num < $P(h_j = 1\| \vec{v})$

$\Rightarrow h_j = 1$

else

$\Rightarrow h_j = 0$

end

---

## 6) log-likelihood를 통한 RBM의 training

RBM을 포함한 Energy-based model은 log-likelihood를 최대화 시켜줌으로써 학습시킬 수 있다. RBM의 parameter들(biases, weights)을 $\theta$라고 통칭하고, training data set을라고 $S = \left\lbrace v^{(1)}, v^{(2)}, \cdots, v^{(n)}\right\rbrace$할 때, 이 모델의 log-likelihood는 다음과 같이 정의할 수 있다.

$$L(\theta|S) = \sum_{t=1}^{n}\log(P(v^{t}))$$

이제 이 식을 조금 더 전개해보자. $P(\vec{v}^{(t)} = \sum_h P(\vec{h}, \vec{v}^{(t)}$ 이므로,

$$\Rightarrow \sum_{t=1}^{n} \log \sum_{\vec{h}}P(\vec{h}, \vec{v}^{(t)})$$

$$=\sum_{t=1}^{n}\log \sum_{\vec{h}}\frac{1}{Z}\exp\left(-E(\vec{h}, \vec{v}^{(t)})\right)$$

$$=\sum_{t=1}^{n}\log \left(\frac{1}{Z}\sum_{\vec{h}}\exp\left(-E(\vec{h}, \vec{v}^{(t)})\right)\right)$$

$$=\sum_{t=1}^{n}\left(
  \log\left(\frac{1}{Z}\right) + \log\sum_{\vec{h}}\exp(-E(\vec{h}, \vec{v}^{(t)}))
  \right)$$

$$=\sum_{t=1}^{n}\log\sum_{\vec{h}}\exp\left(-E(\vec{h}, \vec{v}^{(t)})\right)-n\log(Z)$$

$$=\sum_{t=1}^{n}\log\sum_{\vec{h}}\exp(-E(\vec{h}, \vec{v}))- n \log\sum_{\vec{v}, \vec{h}}\exp(-E(\vec{h}, \vec{v}))$$



이제 log-likelihood를 최대화 해주기 위해서 $L(\theta\|S)$를 에 $\theta$대해 편미분하고 이를 통해 gradient ascent 방법을 적용해보자.

$$\nabla_\theta L(\theta|S) = \nabla_\theta \sum_{t=1}^{n}\log\sum_{\vec{h}}\exp\left(-E(\vec{v}^{(t)}, \vec{h})\right) - n\nabla_\theta \log\sum_{\vec{v}, \vec{h}}\exp\left(-E(\vec{v}, \vec{h})\right)$$

$$=\sum_{t=1}^n\frac{
  \sum_{\vec{h}}\left(
    \exp(-E(\vec{v}^{(t)}, \vec{h}))\times \nabla_\theta\left(-E(\vec{v}^{(t)}, \vec{h})\right)
    \right)
}{
  \sum_{\vec{h}}\exp(-E(\vec{v}^{(t)}, \vec{h}))
}

- n \frac{
  \sum_{\vec{v}, \vec{h}}\left(\exp(-E(\vec{v},\vec{h}))\times \nabla_\theta (-E(\vec{v}, \vec{h}))\right)
}{
  \sum_{\vec{v}, \vec{h}}\exp(-E(\vec{v}, \vec{h}))
}$$

$$=\sum_{t=1}^n E_{P(\vec{h}|\vec{v}^{(t)})}\left\lbrace
  \nabla_\theta(-E(\vec{v}^{(t)}, \vec{h}))
\right\rbrace

-n E_{P(\vec{h},\vec{v})}\left\lbrace\nabla_\theta (-E(\vec{v}, \vec{h}))\right\rbrace$$

마지막 줄에서 $E_{P(\vec{h}\|\vec{v}^{(t)})}\left\lbrace\cdot\right\rbrace$과 $E_{P(\vec{h}\|\vec{v})}\left\lbrace\cdot\right\rbrace$은 각각 $P(\vec{h}\|\vec{v}^{(t)})$와 $P(\vec{h}, \vec{v})$를 확률질량함수로 하는 기댓값 연산자이다.

기댓값 연산자로 생각할 수 있는 이유에 대해서 다음과 같이 생각해보자. 가령 $x_i(i = 1, 2, \cdots, n)$을 구간 $[0, 1]$의 uniform distribution에서 추출했다고 하면 다음은 random variable $X$의 기댓값이다.

$$E\left\lbrace X\right\rbrace = \sum_{i=1}^{n}x_i$$

다음으로, $x_i$는 event에 대한 state이고 (가령, 주사위를 굴려서 나온 주사위 면의 숫자) $P(X = x_i)$는 해당 event가 나올 확률이라고 하면 다음은 random variable 의 기댓값이다.

$$E\left\lbrace X\right\rbrace = \sum_{i=1}^{n}P(X = x_i)x_i$$

또, $x_i$는 event에 대한 state이고, $w_i$는 사건이 발생한 빈도(frequency)라고 했을 때, (가령, 주사위를 10000번 굴렸으며, 1이 나온 횟수는 1200번이라고 하면 $x_1 = 1$이고 $w_1 = 1200$이다.) 다음은 random variable 의 기댓값이다.

$$E\left\lbrace X\right\rbrace=\frac{\sum_{i=1}^n (w_i x_i)}{\sum_{i=1}^{n}w_i}$$


같은 논리를 통해 식 (32)와 같이 기댓값 연산자를 활용할 수 있다. 또한, 식 (32)에서 $E_{P(\vec{h}\|\vec{v}^{(t)})}\lbrace\cdot\rbrace$ 처럼 조건부 확률을 확률질량함수로 하게 되는 것은 $\vec{v}^{(t)}$는 우리가 입력하는 데이터이기 때문에 주어진 것이다. 즉 random variable이 아니기 때문이다.

이제, 위의 식 (32)를 다시 보자.

식 (32)에서 왼쪽의 term을 positive phase라고 부르고, 오른쪽 term을 negative phase라고 부르도록 하자. 우리는 $P(\vec{h} = 1 \| \vec{v})$을 sigmoid 함수를 이용해서 구현할 수 있다는 사실을 알고 있으므로, positive phase는 상대적으로 구하기 쉽지만, negative phase에서는 $P(\vec{h}, \vec{v})$를 알지 못하므로 기댓값 연산을 정확하게 해줄 수는 없다. 

하지만 우선은 gradient 값을 각 parameter에 대해 각각 계산해보도록 하자. $\theta$는 $W,\vec{b},\vec{c}$로 구분될 수 있으므로, 각각에 대하여

$$\nabla_W(-E(\vec{v}, \vec{h}))=\frac{\partial}{\partial W}\left(
  \vec{b}\cdot\vec{v}+\vec{c}\cdot\vec{h}+\vec{v}\cdot W\vec{h}
  \right) = \vec{h}\vec{v}^T$$

$$\nabla_{\vec{b}}(-E(\vec{v}, \vec{h}))=\frac{\partial}{\partial \vec{b}}\left(
  \vec{b}\cdot\vec{v}+\vec{c}\cdot\vec{h}+\vec{v}\cdot W\vec{h}
  \right) = \vec{v}$$


$$\nabla_{\vec{c}}(-E(\vec{v}, \vec{h}))=\frac{\partial}{\partial \vec{c}}\left(
  \vec{b}\cdot\vec{v}+\vec{c}\cdot\vec{h}+\vec{v}\cdot W\vec{h}
  \right) = \vec{h}$$

와 같이 생각할 수 있다.

따라서,

$$\nabla_W(L(\theta|S)) = \sum_{t=1}^{n}\hat{h}(\vec{v}^{(t)})^T - n E_{P(\vec{v}, \vec{h})}\left\lbrace\vec{h}\vec{v}^T\right\rbrace$$

$$\nabla_{\vec{b}}(L(\theta|S)) = \sum_{t=1}^{n}\vec{v}^{(t)}) - n E_{P(\vec{v}, \vec{h})}\left\lbrace\vec{v}\right\rbrace$$

$$\nabla_{\vec{c}}(L(\theta|S)) = \sum_{t=1}^{n}\hat{h}^{(t)} - n E_{P(\vec{v}, \vec{h})}\left\lbrace\vec{h}\right\rbrace$$

여기서

$$\hat{h}^{(t)} = E_{P(\vec{h}|\vec{v}^{(t)})}\lbrace\hat{h}\rbrace=\sigma(\vec{c} + \vec{v}^{(t)}W)$$

이다.


## 7) Contrastive Divergence

 앞서 설명했듯이 식 (32)의 negative phase에서 $P(\vec{h},\vec{v})$를 알 수 없으므로 기댓값을 정확하게 구할 수는 없다. 따라서 기댓값 연산자를 제거하고 sampling을 통해 추정하는 값을 이용해 기댓값을 추정하도록 하자. 
 이 때, 원래라면 sampling을 통한 좋은 추정값을 얻기 위해서는 sampling iteration이 무한대에 가까워서 stationary distribution에 도달하여 얻은 값이어야 한다. 하지만 Contrastive Divergence의 아이디어는 몇 번만 sampling 해줘서 얻은 sample 값을 이용해도 negative phase의 기댓값을 추정하여 사용하는데 큰 무리가 없다는 것이다. 
 
 Hinton 교수는 단 한번의 sampling으로 얻은 $\vec{h}$와 $\vec{v}$만으로도 negative phase의 기댓값 연산자의 값을 유도하는데 충분하다는 사실을 경험적으로 알아냈다. Contrastive Divergence의 아이디어를 요약하자면 다음과 같다.

① Replace the expectation by a point estimate at $\tilde{v}$.

② Obtain the point $\tilde{v}$ by Gibbs sampling.

③ Start sampling chain at $\vec{v}^{(t)}$

so that 

$$E_{P(\vec{v}, \vec{h})}\lbrace\nabla_\theta(-E(\vec{v}, \vec{h}))\rbrace\approx\nabla_\theta(-E(\vec{v}, \vec{h}))|_{\vec{v}=\tilde{v}, \vec{h} = \tilde{h}}$$

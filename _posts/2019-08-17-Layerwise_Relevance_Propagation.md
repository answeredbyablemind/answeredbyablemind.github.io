---
title: Layer-wise Relevance Propagation
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190817
tags: 딥러닝
---
<style>
  @media screen and (max-width:500px){
    iframe {
        width: 100vw; 
        height: 55vw;
        background:white;  
    }
  }

  @media screen and (min-width:500px){
    iframe {
        width: 55vw; 
        height: 30vw;
        background:white;  
    }
  }
</style>

# Feature의 중요성

패턴 인식과 기계학습에서 특징을 잘 만들어내는 것이 매우 중요.

딥뉴럴넷에서는 특징까지도 스스로 선별.

그런데, 사람들이 알기 어렵다. 어떤 특성을 보고 어떻게 그러한 결정을 했는지 알아내는 것은 특히 실제 필드에서 적용 시에는 매우 중요한 이슈.


# Deep Nerual Network Transparency

뉴럴네트워크는 비선형 회귀모델의 일종으로 생각할 수 있고, 

망이 깊어지는 딥 뉴럴 네트워크의 탄생 이후로 feature selection까지 ~~~ 추상화~~ 

그래서 뉴럴네트워크는 "Blackbox" 모델로 생각되어 왔다.

이걸 이해하기 위한 연구들은 크게 두 종류로~

// pic 0 here
// 출처: ICASSP2017 Tutorials on Methods for Interpreting and Understanding Deep Neural Networks

Layer-wise Relevance Propagation (이하 LRP)는 ~에 속한다.


# Layer-wise Relevance Propagation (LRP)

## Goal of LRP

분해를 통한 설명(explanation by decomposition)을 목표로 한다.

좀더 상세하게는, 훈련된 뉴럴넷 모델에서 임의의 샘플 $x = (x_1, x_2, \cdots, x_i, \cdots, x_d)$에 대하여 이 뉴럴넷 모델은 $f(x)$라는 출력을 얻는다고 하면,

$d$ 차원 입력 $x$의 각 차원의 relevance score를 계산하는 것이 목적이다.


이 때, 각 차원 i에 대한 relevance score는 다음과 같은 특징을 갖는다.

$$f(x) = \sum_{i=1}^{d}R_i$$


이해를 돕기 위해 입력 샘플 $x$가 그림이라고 생각하자. 아래 그림 1의 예시처럼 잘 훈련된 뉴럴네트워크에 수탉 사진을 입력으로 넣고 출력으로 '수탉'을 얻는다고 하면,

이 수탉이라는 출력 f(x)[^1]를 얻기 위해 입력 샘플의 각 pixel들이 기여하는 바($R_i$)를 계산하는 방법인 것이다.

아래 그림 1에서 볼 수 있듯이 heatmap이라고 적힌 그림에 각 pixel들의 기여도(relevance score)를 색깔로 표시해두었으며, 수탉의 부리나 머리등을 보고 해당 입력의 클래스가 '수탉'임을 출력했다는 것을 알 수 있다.

[^1]: 여기서 이 분류기가 수탉이냐 아니냐를 판단하는 binary classifier라면 출력 f(x)는 sigmoid 함수의 출력으로, 다중 클래스 분류기라면 softmax의 출력을 쓸 수 있다.

// pic 1 here
// 출처: Explaining Decisions of Neural Networks by LRP. Alexander Binder @ Deep Learning: Theory, Algorithms, and Applications. Berlin, June 2017 

## The intuition behind it

LRP(Layer-wise Relevance Propagation)의 이름에서 볼 수 있듯이 이 method는 relevance score를 출력단에서 입력단 방향으로 top-down 방식으로 기여도를 재분배 하는 방법이다.

LRP의 기본적인 가정 및 작동 방식은 다음과 같다.

* 각 뉴런은 어느 정도의 기여도(certain relevance)를 갖고 있다.
* 기여도는 top-down 방식으로 각 뉴런의 출력단에서 입력단 방향으로 재분배 된다.
* (재)분배시 기여도는 보존된다.

// pic 2 here
// 출처: Explaining Decisions of Neural Networks by LRP. Alexander Binder @ Deep Learning: Theory, Algorithms, and Applications. Berlin, June 2017 

재분배시 기여도가 보존된다는 말을 추가 설명 하자면, 예를 들어 그림 1에서와 같이 특정 사진 입력에 대해 '수탉'이라는 분류를 했고 그 출력값(여기서는 확률이라고 할 수 있겠다) $f(x)$가 0.9였다고 하자. 그러면 각 layer의 뉴런들은 0.9라는 출력에 대한 기여도를 모두 조금씩은 갖고 있으며, relevance score를 분배한 후 각 layer에서의 relevance score의 합은 0.9가 되어야 한다는 뜻이다.

## Explanation for neural network?

// pic 3 here

이제 우리가 실질적으로 맞닥뜨리게 되는 문제는 이것이다: **딥 뉴럴 네트워크의 예측값 혹은 출력값($f(x)$)을 수학적으로 어떻게 분해해 '기여도'를 정의할 것인가?**

이 문제에 대한 해결법은 위에서 설명한 <기본적인 가정 및 작동 방식>에 따라 각 뉴런별로 생각하게 되고, 특히 각 뉴런의 출력과 입력의 관계를 이용해 기여도를 수학적으로 정의하고자 한다.

// pic 4 here

그림 4에서와 같이 입력 2개를 갖는(즉, weight는 2개, bias는 1개) 기본적인 뉴런 하나를 생각해보자.

수학적으로 relevance score라는 것은 **입력의 변화에 따른 출력의 변화 정도**로 볼 수 있다.

다시 말해, 그림 4에서 output $f(x)$에 대한 각각의 입력 $x_1, x_2$의 기여도는 다음과 같이 표현될 수 있다.

$$\frac{\partial f}{\partial x_1}, \frac{\partial f}{\partial x_2}$$

그러므로, 어떻게든 아래와 같이 $f(x)$와 $\frac{\partial f}{\partial x_1}, \frac{\partial f}{\partial x_2}$ 간의 관계를 설명할 수 있는 적절한 식을 도출할 수 있다면,

출력을 relevance score로 분해하여 생각할 수 있게 되는 것이다.

LRP에서는 Taylor Series를 도입한다.

### Taylor Series

임의의 매끄러운 함수 $f(x)$ 및 실수 $a$에 대해 $f(x)$의 Taylor Series는 다음과 같다.

$$f(x) = \sum_{n=0}^{\infty}\frac{f^{(n)}(a)}{n!}(x-a)^n$$

$$=f(a) + \frac{f'(a)}{1!}(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \frac{f'''(a)}{3!}(x-a)^3 + \cdots$$

여기서 error term "$\epsilon$"을 이용해 first-order Taylor series를 쓰면 다음과 같다.

$$f(x) = f(a) + \frac{d}{dx}f(x)\big|_{x=a}(x-a) + \epsilon$$

다변수 함수의 경우에는 Taylor 급수는 다음과 같다.

// pic 5 here

즉, d 차원 input에 대해서는 다음과 같이 first-order Taylor series를 쓸 수 있다.

$$f(\pmb{x}) = f(\pmb{a}) + \sum_{p = 1}^{d}\frac{\partial \pmb{f}}{\partial x_p}\big|_{\pmb{x}=\pmb{a}}(\pmb{x} - \pmb{a}) + \epsilon$$

위 식에서 우변의 두 번째 term이 의미하는 것이 바로 $x_p$가 변했을 때 $f(x)$는 얼마나 변했는가이다.

### 뉴런의 특성을 이용한 테일러 급수 수식의 '적절한' 변형








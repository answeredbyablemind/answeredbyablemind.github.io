---
title: 사비츠키-골레이 필터
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20201021
tags: 신호처리
---

# Prerequisites

이번 포스팅을 이해하기 위해선 다음의 지식이 선행 학습되어야 합니다.

* FIR 필터
* 행렬 연산에 관한 기초 지식 (행렬곱, 역행렬 등)

# 유도 과정

$$\epsilon_N = \sum_{n=-M}^{M}\left(p(n)-x[n]\right)^2$$

$$=\sum_{n=-M}^{M}\left(\sum_{k=0}^Na_kn^k - x[n]\right)^2$$

편미분을 통해 에러를 최소화 할 수 있는 계수 $a_i\text{ for }i=0,1,\cdots,N$을 찾을 수 있다.

$$\frac{\partial\epsilon_N}{\partial a_i}=\sum_{n=-M}^{M}2\left(\sum_{k=0}^{N}a_kn^k-x[n]\right)n^i = 0\notag$$

$$\text{ for }i=0,1,\cdots,N$$

위 식을 조금 더 정리하면,

$$\sum_{n=-M}^{M}n^i\sum_{k=0}^{N}a_kn^k-\sum_{n=-M}^{M}n^ix[n] = 0$$

$$\Rightarrow \sum_{n=-M}^{N}\sum_{k=0}^{N}n^{i+k}a_k=\sum_{n=-M}^{M}n^ix[n]$$

[//]:# (식 x)

이제 식 (x)를 행렬을 이용해 표현하기 위해 아래와 같은 행렬 $A$를 정의하자.

$(2M+1)\times(N+1)$의 dimension을 갖는 어떤 행렬 $A$를 다음과 같이 정의하도록 하자.

$$A = \lbrace a_{n, i} \rbrace = \lbrace n^i \rbrace\notag$$

$$\text{where }-M\leq n \leq M \text{ and } i=0,1,\cdots,N$$

여기서 $\lbrace a_{n,i}\rbrace$의 표시는 $n$번째 행 $i$번째 열의 원소가 $n^i$와 같이 정의한다는 것을 의미한다.

참고로, 원소별로 쓰면 행렬 $A$는 다음과 같다[^1].

$$A = \begin{bmatrix}
  (-M)^0 && (-M)^1 && \cdots && (-M)^N \\\\
  (-M+1)^0 && (-M+1)^1 && \cdots && (-M+1)^N \\\\
  \vdots && \vdots && \vdots && \vdots \\\\
  0^0 && 0^1 && \cdots && 0^N \\\\
  1^0 && 1^1 && \cdots && 1^N \\\\
  \vdots && \vdots && \ddots && \vdots \\\\
  M^0 && M^1 && \cdots && M^N
\end{bmatrix}$$

[^1]: 잘 보면 행렬 A는 전형적인 [반데르몽드 행렬](https://en.wikipedia.org/wiki/Vandermonde_matrix)이다.

또, 식 (x)를 행렬을 이용해 표현하기 위해 필요한 벡터들을 추가로 몇개 쓰자면,

$$\vec a = [a_0, a_1, a_N]^T$$

$$\vec x = [x[-M], \cdots, x[-1], x[0], x[1], \cdots, x[M]]^T$$

이다.

이제 $A, \vec{a}, \vec{x}$를 이용해 식 (x)를 행렬로 쓰면 다음과 같다.

$$식(x)\Rightarrow A^TA\vec{a} = A^T \vec{x}$$

[//]:# (식 y)

이 과정을 잘 이해하기 위해 $A^TA$를 계산해보면, $A^T$의 $i$번째 행, $A$의 $k$번째 열은 각각

$$A^T_{(i,:)}=[(-M)^i, (-M+1)^i, \cdots, M^i]$$

$$A_{(:, k)} = [(-M)^k, (-M+1)^k, \cdots, M^k]^T$$

이므로, $A^TA$의 $i$번째 행, $k$번째 열의 원소는

$$A^TA = \lbrace a_{i,k}\rbrace = \left\lbrace \sum_{n=-M}^{M}(n)^{i+k}\right\rbrace$$

임을 알 수 있고, 또 $A^T\vec{x}$의 경우,

$$A^T\vec{x}=
\begin{bmatrix}
  (-M)^0 && (-M+1)^0 && \cdots && 0^0 && 1^0 && \cdots && M^0 \\\\
  (-M)^1 && (-M+1)^1 && \cdots && 0^1 && 1^1 && \cdots && M^1 \\\\
  \vdots && \vdots && \vdots && \vdots && \vdots && \vdots && \vdots \\\\
  (-M)^N && (-M+1)^N && \cdots && 0^N && 1^N && \cdots && M^N
  \end{bmatrix}
  
\begin{bmatrix}
x[-M]\\ \vdots \\ x[-1] \\ x[0] \\ x[1] \\ \vdots \\ x[M]
\end{bmatrix}$$

$$=\begin{bmatrix}\sum_{n=-M}^{M}n^0x[n] \\\\\sum_{n=-M}^{M}n^1x[n] \\\\ \vdots \\\\\sum_{n=-M}^{M}n^Nx[n]\end{bmatrix}$$

$$=\sum_{n=-M}^{M}\begin{bmatrix}n^0 \\n^1 \\ \vdots \\ n^N \end{bmatrix}x[n]$$

임을 알 수 있다.


그러면 식 (y)를 통해 계수 벡터 $\vec{a}$를 계산할 수 있다[^2].

$$\vec{a} = (A^TA)^{-1}A^Tx$$

그리하여 얻은 결과를 다음과 같이 정리하자.

$$(A^TA)^{-1}A^Tx = Hx$$

[^2]: 잘 보면 이 결과는 normal equation의 해와 같다.

# MATLAB 코드

```MATLAB
clear; close all; clc;

M = 10; % 필터의 길이는 2M+1 = 21
N = 9; % 다항식의 차수는 9

% 테스트용 신호
load mtlb
t = (0:length(mtlb)-1)/Fs;

%% MATLAB으로 계수만 얻은 것
b = sgolay(N, 2*M+1);

sgolay_filter = b((size(b,1)+1)/2,:);

smtlb = conv(mtlb, sgolay_filter,'same');

%% MATLAB으로 직접 convolution까지 한 것
smtlb_MATLAB = sgolayfilt(mtlb, N, 2*M+1);

%% 직접 S-G filter의 계수까지도 계산
A = zeros(2*M+1, N+1);

n_range = -M:M; % 원래 논문에서 n
i_range = 0:N; % 원래 논문에서 i
for i = 1:size(A,1)
    for j = 1:size(A,2)
        A(i,j)= n_range(i)^i_range(j);
    end
end

% matrix H = (A^TA)^{-1}*A^T

H = (A'*A)\A';

sgolay_filter_calculated = H(1,:);

my_smtlb_calculated = conv(mtlb, sgolay_filter_calculated,'same');

figure;
plot(t, mtlb);
axis([0.2 0.22 -3 2])
hold on;
plot(t, smtlb);
plot(t, my_smtlb_calculated);
plot(t, smtlb_MATLAB);
```

# Moving Average와의 비교

<img src = "https://www.researchgate.net/profile/Gianfranco_Miele/publication/301888741/figure/fig6/AS:668524762656788@1536400132558/Comparison-of-the-filtering-effects-of-the-Moving-Aaverage-MA-and-Savitzky-Golay-SG.png">

# 참고자료

* [What is a Savitzky-Golay Filter, IEEE, 2011, Ronald W. Schafer](https://ieeexplore.ieee.org/document/5888646)
---
title: 가우스-조던 행렬 소거법의 기하학적 의미
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190909
tags: 선형대수
---

# 가우스-조던 행렬 소거법이란?

가우스-조던 행렬 소거법은 연립 일차 방정식의 해를 구하는 방법 중 하나이다. 

이 소거법은 연립 방정식에서 아래와 같은 연산을 취해주더라도 방정식의 해는 변하지 않는다는 원리를 기반으로 수행된다.

* 각 식에 0이 아닌 상수를 곱하는 것 (scaling)
* 방정식들을 더하거나 빼더는 것 (subtraction)
* 방정식의 순서를 바꾸는 것 (permutation)

조금 후려쳐서 설명하면, 가우스-조던 행렬 소거법은 위 세가지 방법을 이용해서 연립방정식을 $Ax=b$ 꼴로 만든 후, A 행렬이 단위행렬[1,0;0,1] 처럼[^1] 변할 수 있게 만들어 나가는 과정이라고도 할 수 있을 것 같다.

[^1]: 정확히는 reduced row echelon form이지만 지금은 굳이 이런 어려운 용어를 생각하지는 말자.

우선은 간단한 예시 문제를 풀면서 가우스-조던 행렬 소거법을 수행해보자.

## 예시 문제 풀이를 통한 가우스-조던 행렬 소거

우리는 아래의 연립방정식의 해를 구해보고자 한다.

$$
\begin{cases}
2x+2y = 2 \\
4x+2y = 2
\end{cases}
$$

### 1. 주어진 연립방정식을 행렬의 형태로 변환

우선은 가우스-조던 행렬 소거법을 이용하기 위해선 주어진 연립방정식을 $Ax=b$꼴로

변경해주는 과정이 필요하다.

즉, 식 (1)을 다음과 같이 쓸 수 있다.
$$
\begin{bmatrix}
2 & 2 \\
4 & 2
\end{bmatrix}

\begin{bmatrix}
x\\
y
\end{bmatrix}
=
\begin{bmatrix}
2\\
2
\end{bmatrix}

$$
### 2. 행렬 A와 b를 합친 augmented matrix 형태로 변경

$$ \left[
\begin{array}{cc|c}
  2&2&2\\
  4&2&2
\end{array}
\right] $$


### 3. Scaling (row1 -> row1 x 1/2)

1행 1/2를 곱해서 1행의 첫번째 숫자가 1이 될 수 있게 만든다.

$$ \left[
\begin{array}{cc|c}
  2&2&2\\
  4&2&2
\end{array}
\right] \longrightarrow 

\left[
\begin{array}{cc|c}
  1&1&1\\
  4&2&2
\end{array}
\right] 
$$

### 4. Subtraction (row2 -> row2 - 4 x row1)

2행의 첫 번째 숫자가 0이 될 수 있게 2행에서 1행에 4를 곱한 값을 빼주자.

$$ \left[
\begin{array}{cc|c}
  1&1&1\\
  4&2&2
\end{array}
\right] \longrightarrow 

\left[
\begin{array}{cc|c}
  1&1&1\\
  0&-2&-2
\end{array}
\right] 
$$


### 5. Scaling (row2 -> row2 x (-1/2))

2행의 두 번째 숫자가 1이될 수 있도록 2행에 (-1/2)를 곱해주자.


$$ \left[
\begin{array}{cc|c}
  1&1&1\\
  0&-2&-2
\end{array}
\right] \longrightarrow 

\left[
\begin{array}{cc|c}
  1&1&1\\
  0&1&1
\end{array}
\right] 
$$


### 6. Subtraction (row1 -> row1 - row2)

1행의 두 번째 숫자는 0이될 수 있께 1행에서 2행을 빼준 값을 1행에 대입시키자.

$$ \left[
\begin{array}{cc|c}
  1&1&1\\
  0&1&1
\end{array}
\right] \longrightarrow 

\left[
\begin{array}{cc|c}
  1&0&0\\
  0&1&1
\end{array}
\right] 
$$


### Solution!

위 6가지 단계를 거친 결과 우리는 식 (1)의 연립방정식의 해는

$$(x,y) = (0,1)\notag$$

임을 알 수 있었다.

# 가우스 소거법의 기하학적 의미

이번에는 식 (1)을 가우스-조던 행렬 소거법으로 푸는 과정을 시각화해서 생각해보자.

기하학적으로 가우스-조던 행렬 소거법은 **"직선의 방정식의 법선 벡터를 선형 변환시켜주는 과정"** 이다. (이 때 교차점은 변하지 않아야 한다.)

식 (1)은 연립방정식을 푸는 문제로도 생각할 수 있지만, 두 개의 1차 함수의 교점을 구하는 문제로도 생각할 수 있다.



## 동일한 예시 문제에 대한 단계별 시각화


### 1. 주어진 연립방정식을 두 개의 일차 함수로 시각화

### 2. (행렬 A와 b를 합친 augmented matrix 형태로 변경)

해당 단계는 시각화 과정에 해당되지 않는 과정이므로 생략

### 3. Scaling (row1 -> row1 x 1/2)

### 4. Subtraction (row2 -> row2 - 4 x row1)

### 5. Scaling (row2 -> row2 x (-1/2))

### 6. Subtraction (row1 -> row1 - row2)

### Solution!

# 3차원의 경우의 시각화

---

(유튜브 영상 넣기)
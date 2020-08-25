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

$$\begin{bmatrix}
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
\end{bmatrix}$$

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

기하학적으로 가우스-조던 행렬 소거법은 **직선의 방정식의 법선 벡터를 선형 변환시켜주어 법선 벡터들이 단위 벡터에 평행하게 만드는 과정** 이다. (이 때 교차점은 변하지 않아야 한다.)

식 (1)은 연립방정식을 푸는 문제로도 생각할 수 있지만, 두 개의 1차 함수의 교점을 구하는 문제로도 생각할 수 있다.

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic1.png">
<br>
그림 1. 식 (1)의 연립방정식을 좌표평면 상의 두 함수와 그 교차점을 구하는 문제로 환원해 표현한 것
</p>

그림 1에서 식(1) 연립방정식에 해당되는 두 함수와 그 교차점을 표시했다.

식 (1)에서 $2x+2y=2$와 $4x+2y=2$에 해당되는 함수를 각각 파란색, 주황색으로 표시했다.

또 그림 1에서 확인할 수 있는 것은 두 함수의 법선 벡터인데, $2x+2y=2$와 $4x+2y=2$에 해당되는 법선벡터는 파란색, 주황색으로 표시한 벡터이며, 그 벡터 값은 각각 (2,2)와 (4,2)이다.

그렇다면, 가우스-조던 행렬 소거법이 과연 어떤 것인지 시각적으로 파악해보도록 하자.

## 동일한 예시 문제에 대한 단계별 시각화

### 1. 주어진 연립방정식을 두 개의 일차 함수로 시각화

그림 1과 같이 주어진 연립방정식을 일차 함수로 시각화 할 수 있다.

### 2. (행렬 A와 b를 합친 augmented matrix 형태로 변경)

해당 단계는 시각화 과정에 해당되지 않는 과정이므로 생략한다.

### 3. Scaling (row1 -> row1 x 1/2)

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic2.gif">
<br>
그림 2. scaling을 통해 식 (1)의 첫 번째 방정식에 1/2를 곱하는 과정을 시각화 한 것
</p>

scaling은 시각화하면 말 그대로 법선벡터의 크기를 줄여주거나 방향을 바꿔주는 효과를 가져오게 된다.

이번 scaling 단계에서는 식 (1)의 첫 번째 방정식에 1/2를 곱해주는 과정이 포함되어 있으며, 그림 2에서 보는 것 처럼 법선벡터의 크기를 줄여주는 효과를 가져오게 되었다.

여기서는 특별히 선형변환 된 법선벡터의 첫번째 원소가 2에서 1로 변했다는 것에 주목하면 된다. 

### 4. Subtraction (row2 -> row2 - 4 x row1)

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic3.gif">
<br>
그림 3. subtraction을 통해 식 (1)의 두 번째 방정식의 법선 벡터를 y축에 평행하게 만드는 과정을 시각화 한 것
</p>

subtraction 과정을 거치면 2차원 벡터의 두 개 원소 중 하나를 0으로 만들게 되는데, 이 과정을 통해서 법선벡터는 x축 혹은 y축에 평행하도록 변환된다. 그림 3에서는 subtraction을 통해 식 (1)의 두 번째 방정식의 법선 벡터를 y 축에 평행하도록 변환하는 과정을 보여주고 있다.

### 5. Scaling (row2 -> row2 x (-1/2))

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic4.gif">
<br>
그림 4. scaling을 통해 식 (1)의 두 번째 방정식의 법선 벡터를 y축에 평행하면서 방향도 같도록 만드는 과정을 시각화 한 것
</p>

그림 4에서는 scaling 과정을 통해 식 (1)의 두 번째 방정식의 법선 벡터를 y축에 평행하면서 단위 벡터의 방향과 같은 방향을 보도록 만든 과정을 보여주고 있다.

### 6. Subtraction (row1 -> row1 - row2)

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic5.gif">
<br>
그림 5. subtraction을 통해 식 (1)의 첫 번째 방정식의 법선 벡터를 x축에 평행하면서 방향도 같도록 만드는 과정을 시각화 한 것
</p>

subtraction 과정을 거치면 2차원 벡터의 두 개 원소 중 하나를 0으로 만들게 되는데, 이 과정을 통해서 법선벡터는 x축 혹은 y축에 평행하도록 변환된다. 그림 5에서는 subtraction을 통해 식 (1)의 첫 번째 방정식의 법선 벡터를 x 축에 평행하도록 변환하는 과정을 보여주고 있다.

### Solution!

<p align = "center">
<img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-09-09_Gauss_Jordan/pic6.png">
<br>
그림 6. 가우스-조던 행렬 소거법을 통해 변환된 법선벡터들과 연립방정식의 솔루션
</p>

그림 6에서는 가우스-조던 행렬 소거법을 통해 얻게된 최종 결과물이다.

그림 1~5까지 과정을 쭉 살펴보면 알 수 있듯이 연립방정식의 해는 이 소거법을 적용하면서 변하지 않지만 그 법선 벡터들이 변한다는 것을 알 수 있다.

다시 정리하자면 가우스-조던 행렬 소거법은 선형 변환을 통해 직선 방정식의 법선 벡터를 단위 벡터(혹은 기저 벡터)와 평행하게 만들어주는 과정이라고 할 수 있겠다. 우리는 이 방법을 거침으로써 해를 편리하게 얻어낼 수 있게 된다.

# 3차원의 경우의 시각화

변수가 $x, y z$로 세 개이고, 방정식이 3개인 연립방정식의 경우에도 마찬가지 시각화가 가능하다. 

그러나, 3차원의 경우에는 시각화가 가능하긴 하지만 정작 한 눈에 이해하기는 어렵기 때문에 자세한 설명은 생략하고, 시각화 시킨 애니메이션만을 보여드리고자 한다.

3차원의 경우에는 아래의 연립방정식에 대한 해를 구하는 과정을 시각화했다.


$$
\begin{cases}
10x+10y+15z = 2 \\
3x-2y+4z = 4 \\
-4x+4y+5z=1
\end{cases}
$$

애니메이션에서 파란색, 주황색, 노란색이 각각 첫 번째, 두 번째, 세 번째에 해당되는 식이다.


<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/PBPuwnv59pk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/Ov7fetr-qg8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</center>
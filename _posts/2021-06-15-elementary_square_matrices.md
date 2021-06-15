---
title: 기본 행렬
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210615
tags: 선형대수학
---

본 포스팅은 University of California Davis ENG 006: Engineering Problem Solving에서 제공하는 ZyBooks의 내용을 바탕으로 작성하였습니다.

기본 행렬(elementary matrix)은 $n\times n$ 크기의 단위 행렬 $I_n$에서 기본행연산(elementary row operation)을 한번 수행하여 얻어지는 행렬이다.

기본행연산은 총 세가지이다.

* Row switching
* Row multiplication
* Row addition

# Elementary matrices

## Row switching

## Row multiplication

## Row-addition matrices

$$\begin{bmatrix}
  \color{blue}{a_{11}} & \color{blue}{a_{12}} & \color{blue}{a_{13}} & \color{blue}{a_{14}}\\
  \color{red}{a_{21}}  & \color{red}{a_{22}}  & \color{red}{a_{23}}  & \color{red}{a_{24}} \\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} \rightarrow

\begin{bmatrix}
  a_{11} & a_{12} & a_{13} & a_{14}\\
  \color{red}{a_{21}} \color{black}{+} \color{blue}{sa_{11}} & \color{red}{a_{22}} \color{black}{+} \color{blue}{sa_{12}}  & \color{red}{a_{23}} \color{black}{+} \color{blue}{sa_{13}}  & \color{red}{a_{24}} \color{black}{+} \color{blue}{sa_{14}}\\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} $$

위와 같은 연산을 수행해주는 행렬 $E$를 생각해보자. 위 연산 전, 후 결과에 대해 연산이 이루어지기 전 행렬을 $A$라고 하면 다음과 같이 행렬 $E$가 행렬 $A$에 작동한다고 생각할 수 있다.

$$EA=E\begin{bmatrix}
  \color{blue}{a_{11}} & \color{blue}{a_{12}} & \color{blue}{a_{13}} & \color{blue}{a_{14}}\\
  \color{red}{a_{21}}  & \color{red}{a_{22}}  & \color{red}{a_{23}}  & \color{red}{a_{24}} \\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix}=\begin{bmatrix}
  a_{11} & a_{12} & a_{13} & a_{14}\\
  \color{red}{a_{21}} \color{black}{+} \color{blue}{sa_{11}} & \color{red}{a_{22}} \color{black}{+} \color{blue}{sa_{12}}  & \color{red}{a_{23}} \color{black}{+} \color{blue}{sa_{13}}  & \color{red}{a_{24}} \color{black}{+} \color{blue}{sa_{14}}\\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} $$

$$I=\begin{bmatrix}1 & 0 & 0 \\ \color{red}{0} & \color{red}{1} & \color{red}{0} \\ 0 & 0 & 1\end{bmatrix}\rightarrow E = \begin{bmatrix}1 & 0 & 0 \\ \color{red}{s} & 1 & 0 \\ 0 & 0 & 1\end{bmatrix}$$


$$EA=\begin{bmatrix}1 & 0 & 0 \\ \color{blue}{s} & 1 & 0 \\ 0 & 0 & 1\end{bmatrix}\begin{bmatrix}
  \color{blue}{a_{11}} & \color{blue}{a_{12}} & \color{blue}{a_{13}} & \color{blue}{a_{14}}\\
  \color{red}{a_{21}}  & \color{red}{a_{22}}  & \color{red}{a_{23}}  & \color{red}{a_{24}} \\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix}=\begin{bmatrix}
  a_{11} & a_{12} & a_{13} & a_{14}\\
  \color{red}{a_{21}} \color{black}{+} \color{blue}{sa_{11}} & \color{red}{a_{22}} \color{black}{+} \color{blue}{sa_{12}}  & \color{red}{a_{23}} \color{black}{+} \color{blue}{sa_{13}}  & \color{red}{a_{24}} \color{black}{+} \color{blue}{sa_{14}}\\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} $$

가령 아래와 같은 행렬 $A$에 대해,

$$A=\begin{bmatrix}\color{blue}{1} & 2 & 3 & 4 \\ \color{red}{1} & -1 & -2 & 2 \\ 0 & 3 & 2 &  1\end{bmatrix}$$

2행의 첫 번째 원소를 0으로 만들기 위해서 2행 = 2행 - 1행을 대입해주기 위해선 다음과 같이 기본행렬을 이용할 수 있다.

$$EA = \begin{bmatrix}1 & 0& 0\\
 \color{blue}{-1} & 1 & 0 \\ 0 & 0 & 1\end{bmatrix}\begin{bmatrix}\color{blue}{1} & 2 & 3 & 4 \\ \color{red}{1} & -1 & -2 & 2 \\ 0 & 3 & 2 &  1\end{bmatrix}= \begin{bmatrix}\color{blue}{1} & 2 & 3 & 4 \\ \color{red}{0} & -3 & -5 & -2 \\ 0 & 3 & 2 &  1\end{bmatrix}$$
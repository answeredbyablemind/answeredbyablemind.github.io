---
title: 기본 행렬
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210615
tags: 선형대수학
---

기본 행렬(elementary matrix)은 $n\times n$ 크기의 단위 행렬 $I_n$에서 기본행연산(elementary row operation)을 한번 수행하여 얻어지는 행렬이다.

# Elementary row-replacement matrices

$$\begin{bmatrix}
  \color{blue}{a_{11}} & \color{blue}{a_{12}} & \color{blue}{a_{13}} & \color{blue}{a_{14}}\\
  \color{red}{a_{21}}  & \color{red}{a_{22}}  & \color{red}{a_{23}}  & \color{red}{a_{24}} \\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} \rightarrow

\begin{bmatrix}
  a_{11} & a_{12} & a_{13} & a_{14}\\
  \color{red}{a_{21}} \color{black}{+} \color{blue}{sa_{11}} & \color{red}{a_{22}} \color{black}{+} \color{blue}{sa_{12}}  & \color{red}{a_{23}} \color{black}{+} \color{blue}{sa_{13}}  & \color{red}{a_{24}} \color{black}{+} \color{blue}{sa_{14}}\\
  a_{31} & a_{32} & a_{33} & a_{34}
\end{bmatrix} 

$$
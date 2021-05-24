---
title: trace-determinant plane
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210517
tags: 미분방정식
---


<p align = "center">
  <iframe width= "101%" height = "650" src = "https://mathlets.org/javascript/build/linPhasePorMatrix.html" frameborder = "0"></iframe>
  <br>
  Trace-Determinant plane 상의 점들에 매칭되는 phase plane
  <br>
  출처: MIT Mathlets, 
  <a href = "https://mathlets.org/mathlets/linear-phase-portraits-matrix-entry/">https://mathlets.org/mathlets/linear-phase-portraits-matrix-entry/</a>
</p>

# Prerequisites

해당 내용에 대해 잘 이해하기 위해선 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [위상 평면 (phase plane)](https://angeloyeo.github.io/2021/05/12/phase_plane.html)

# 위상 평면 내용 복습

[위상 평면 (phase plane)](https://angeloyeo.github.io/2021/05/12/phase_plane.html) 편에서 선형 연립 미분방정식은 아래와 같이 행렬을 이용해 표현할 수 있음을 확인하였다.

$$\begin{bmatrix}dx/dt \\ dy/dt\end{bmatrix} = \begin{bmatrix}a && b \\ c && d \end{bmatrix}\begin{bmatrix}x \\ y \end{bmatrix}$$

그리고 위 식의 행렬로부터 고윳값과 고유벡터를 계산해보고 고윳값, 고유벡터의 값에 따른 phase plane의 형태 변화에 대해 알아보았다.

확인한 바에 따르면 고윳값이 모두 실수일 때는, 고유벡터들이 새로운 변화의 축인 것 처럼 작동하였다.

만약, 고윳값이 양수인 경우 해당되는 고유벡터를 따라 시간이 지날 수록 함수값이 원점으로부터 멀어지게 되었다. 

또, 고윳값이 음수인 경우 해당되는 고유벡터를 따라 시간이 지날 수록 함수값은 원점에 가까워지게 되었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic1.png">
  <br>
  그림 1. 실수 고윳값을 가지는 경우. 양수 고윳값에 대응되는 고유벡터를 따라 함수값은 원점으로부터 멀어지고, 음수 고윳값에 대응되는 고유벡터를 따라 함수값은 원점을 향해 간다.
</p>

한편, 고윳값이 복소수인 경우에는 phase plane이 원점을 따라 회전하는 것 같은 형태를 띄게 되었다. 

이 때, 복소 고윳값의 실수부가 1보다 작으면 원점을 향해서 수렴하게 되었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic2.png">
  <br>
  그림 2. 복소 고윳값을 가지는 경우. 복소 고윳값의 실수부가 1보다 작으면 원점을 향해 수렴해가며 회전한다.
</p>

한편, 고윳값이 복소수인데 실수부가 1보다 크면 phase plane의 형태가 원점을 벗어나는 회전을 하는 것을 알 수 있었다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-05-17-trace_determinant_plane/pic3.png">
  <br>
  그림 3. 복소 고윳값을 가지는 경우. 복소 고윳값의 실수부가 1보다 크면 원점으로부터 멀어져가며 회전한다.
</p>

또, 고윳값이 겹치는 경우도 있다. 중근 고윳값을 가지는 경우라고 표현한다.
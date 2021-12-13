---
title: 카이제곱 분포와 검정
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 2021213
tags: 통계학
---

# 카이 제곱 분포

사실상 통계학을 처음 공부하면서 가장 어려운 부분은 용어라고 말해도 과언이 아니다. 그리스 문자 $\chi$는 영어로는 chi라고 쓰고 읽기는 '카이'라고 읽는다.

거기다가 제곱까지 붙어있으니... 우리는 도통 친해지기 어려운 새로운 용어를 또 마주해야 하는 것이다.

사실 카이제곱 분포는 그렇게 어려운 분포가 아니다. 생각보다는 직관적이다.

양의 정수 $k$에 대해 $k$개의 독립적이고 표준정규 분포를 따르는 확률변수 $X_1,\cdots, X_k$를 정의하면 자유도 $k$의 카이제곱 분포는 확률변수

$$Q = \sum_{i=1}^{k} X_i^2$$

의 분포이다.

말이 어렵다면, 이렇게 다시 한번 생각해보자. 표준 정규 분포를 생각해보고 여기서 변수 한개만 랜덤하게 뽑아보자.

그런 다음 그 변수를 제곱해서 histogram에 카운트를 시켜보자. 그림으로 보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic1.png">
  <br>
  그림 1. 자유도 1인 카이제곱 분포를 얻는 시뮬레이션 과정
</p>

이런 방식으로 무수히 많이 반복해보면 다음과 같은 히스토그램을 얻을 수 있음을 알 수 있다.

아래의 영상에서는 1000번만 반복해보았다.

<p align = "center">
  <video width = "800" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic2.mp4">
  </video>
  <br>
  그림 2. 크기 3인 표본을 100회 추출하면서 매 회 추출된 표본의 평균값을 histogram 형태로 도시한 것
</p>

이 결과를 실제 자유도가 1인 카이제곱 분포와 비교해보면 다음과 같이 상당히 일치하는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic3.png">
  <br>
  그림 3. 시뮬레이션과 자유도 1인 카이제곱 분포의 비교
</p>

# 참고문헌

* [Statistics for application (MIT Lecture, 18.443) Section 10. Chi-squared goodness-of-fit test](https://ocw.mit.edu/courses/mathematics/18-443-statistics-for-applications-fall-2006/lecture-notes/lecture11.pdf)
* [SPSS Tutorial: Chi Square Analysis, The Open University](https://www.open.ac.uk/socialsciences/spsstutorial/files/tutorials/chi-square.pdf)


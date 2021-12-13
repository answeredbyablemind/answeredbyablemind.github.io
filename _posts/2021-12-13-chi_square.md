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

양의 정수 $k$에 대해 $k$개의 독립적이고 표준정규분포를 따르는 확률변수 $X_1,\cdots, X_k$를 정의하면 자유도 $k$의 카이제곱 분포는 확률변수

$$Q = \sum_{i=1}^{k} X_i^2$$

의 분포이다.

## 카이제곱 분포 시뮬레이션

말이 어렵다면, 이렇게 다시 한번 생각해보자. 표준정규분포를 생각해보고 여기서 변수 한개만 랜덤하게 뽑아보자.

그런 다음 그 변수를 제곱해서 histogram에 카운트를 시켜보자. 그림으로 보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic1.png">
  <br>
  그림 1. 자유도 1인 카이제곱 분포를 얻는 시뮬레이션 과정
</p>

이런 방식으로 무수히 많이 반복해보면 다음과 같은 히스토그램을 얻을 수 있음을 알 수 있다.

아래의 영상에서는 1000번만 반복해보았다.

<p align = "center">
  <video width = "auto" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic2.mp4">
  </video>
  <br>
  그림 2. 자유도 1인 카이제곱 분포 획득 시뮬레이션
</p>

이 결과를 실제 자유도가 1인 카이제곱 분포와 비교해보면 다음과 같이 상당히 일치하는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic3.png">
  <br>
  그림 3. 시뮬레이션과 자유도 1인 카이제곱 분포의 비교
</p>

같은 방식으로 $k=3$인 경우의 카이제곱 분포도 시뮬레이션 해볼 수 있다.

$k=1$인 경우와 다른 점은 표준정규분포에서 변수 세 개를 뽑고, 그 값들을 제곱하여 더한다는 것에 차이가 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic4.png">
  <br>
  그림 4. 자유도 3인 카이제곱 분포를 얻는 시뮬레이션 과정
</p>

마찬가지로 1000번 반복해보면 다음과 같은 histogram을 얻을 수 있다.

<p align = "center">
  <video width = "auto" height = "auto" loop autoplay controls muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic5.mp4">
  </video>
  <br>
  그림 5. 자유도 3인 카이제곱 분포 획득 시뮬레이션
</p>

마지막의 히스토그램과 실제 자유도가 3인 카이제곱 분포를 비교하면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic6.png">
  <br>
  그림 6. 시뮬레이션과 자유도 3인 카이제곱 분포의 비교
</p>

## 다양한 자유도에 따른 카이제곱 분포의 형태

위의 시뮬레이션에서 봤던 것 처럼 카이제곱 분포는 통계량의 정의 상 표준정규분포로부터 얻은 랜덤 변수들을 "제곱"해 더하기 때문에 양의 확률변수에 한해서만 존재한다는 것을 알 수 있다.

또, "더한"것이기 때문에 더해주는 변수의 수가 많아질 수록 정규분포에 가까워진다. ([중심극한정리](https://angeloyeo.github.io/2020/09/15/CLT_meaning.html))

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2021-12-13-chi_square/pic7.png">
  <br>
  그림 7. 자유도 1~4에 대응되는 카이제곱 분포
</p>

## 카이제곱 분포의 쓸모?

그렇다면 왜 굳이 표준정규분포로 부터 얻는 랜덤 변수들을 제곱해서 더해주는 걸까? 이렇게 해주었을 때 어떤 쓸모가 있을까?

카이제곱 분포는 오차(error) 혹은 편차(deviation)를 분석할 때 도움을 받을 수 있는 분포다.

이것을 이해하기 위해서는 우리가 보통 error를 정규분포로 설계한다는 점을 이해해야 한다.

가령, 회귀분석을 이용한 모델 제작 시, 우리가 얻은 데이터들은 모델의 출력값을 중심으로 하는 정규분포에서 랜덤하게 샘플링되어 얻은 값이라고 보는 것이다.

<p align = "center">
  <img src = "https://i.stack.imgur.com/Wqrn4.png">
  <br>
  그림 8. 회귀분석 시 오차에 대한 분포 설정
  <br>
  출처: [Stack Overflow](https://stackoverflow.com/questions/60143913/the-random-error-term-is-assumed-to-follow-the-normal-distribution-with-a-mean-o)
</p>

그것 뿐만 아니라, 특별한 가정이 없더라도 많은 경우 오차(error) 혹은 편차(deviation)는 정규분포를 따를 수 있다.

그러므로 이렇듯 오차 혹은 편차에 대한 분석을 수행할 때 카이제곱 분포를 이용하면 이 오차 혹은 편차가 우연히 발생할 수 있다고 볼 수 있을만한 수준의 것인지 그렇지 않은지를 판별할 수 있게 되는 것이다.

# 카이제곱 검정

## 적합도 검정

## 교차 검정



# 참고문헌

* [Statistics for application (MIT Lecture, 18.443) Section 10. Chi-squared goodness-of-fit test](https://ocw.mit.edu/courses/mathematics/18-443-statistics-for-applications-fall-2006/lecture-notes/lecture11.pdf)
* [SPSS Tutorial: Chi Square Analysis, The Open University](https://www.open.ac.uk/socialsciences/spsstutorial/files/tutorials/chi-square.pdf)


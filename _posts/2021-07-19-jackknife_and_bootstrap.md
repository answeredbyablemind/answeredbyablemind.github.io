---
title: 잭나이프 & 부트스트랩 방법
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210719
tags: 통계학
---

# Prerequisites

본 포스팅을 더 잘 이해하기 위해서는 아래의 내용에 대해 알고 오시는 것이 좋습니다.

* [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html)
* [p-value의 의미](https://angeloyeo.github.io/2020/03/29/p_value.html)

# Resample 방법

잭나이프 & 부트스트랩을 잘 이해하기 위해선 우선 샘플링의 개념에 대해서 다시 생각해보아야 한다.

통계학에서는 모집단의 성질을 확인하는 것이 최종 목표라고 할 수 있다. 그런데, (현실적인 이유로) 모집단 전체에 대해서 조사할 수 없다보니 표본을 추출한다고 언급했다.

그런데, [표본과 표준 오차의 의미](https://angeloyeo.github.io/2020/02/12/standard_error.html) 편에서 보았던 것 처럼 표본은 랜덤하게 선택되는 것이다.

표본이 전체 모집단을 잘 대표하도록 뽑힐 수도 있지만 그렇지 못할 수도 있다. 

금성에 사는 외계인 150명이라는 집단에 대해 키 모집단 분포를 알고 있다고 생각해보자. 그리고 그 모집단에서 6명의 sample을 추출해 표본의 키를 조사해보면 매 번 표본을 추출할 때 마다 값이 달라진다는 것을 알 수 있을 것이다.

<p align = "center">
    <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-02-12-standard_error/pic3.png">
    <br>
    그림 1. 세 번 표본을 추출해보고 그 때 마다 얻게되는 표본 분포를 그린 것
</p>

Resample 방법은 여기서, "이미 표본 추출이 끝났다고 생각했을 때 우리에게 주어진 데이터로 뭘 어떻게 해볼 수 있을까?" 라는 아이디어에서 출발한다.

일단 갖고 있는 데이터로 최선을 다해보자 이 얘기이다.

# 잭나이프(jackknife) 방법

jackknife 방법은 주어진 데이터에서 하나 씩 빼 가면서 이상이 없는지 체크해보는 방법이다.

가령, 그림 1에서 보았던 것과 같이 6명 화성인의 키(height)의 데이터가 다음과 같이 주어졌다고 생각해보자.

$$[10, 14, 15, 15, 16, 18]$$



<p align = "center">
    <img src = "https://thumbs.dreamstime.com/z/jackknife-vector-icon-jackknife-vector-outline-icon-illustration-white-background-135168267.jpg">
    <br>
    그림 1. 잭 나이프의 생김새
</p>

# 부트스트랩 방법

## 개요

## bootstrap p-value



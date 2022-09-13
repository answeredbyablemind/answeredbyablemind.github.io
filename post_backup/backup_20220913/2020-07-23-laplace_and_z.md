---
title: 라플라스 변환과 z-변환의 관계
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200723
tags: 신호처리
---

<style>
    iframe {
        display: block;
        border-style: none;
        margin: 0 auto;
    }
</style>

<p align = "center">
  <iframe width = "800" height = "800" src="https://angeloyeo.github.io/p5/2020-07-23-laplace_and_z/" frameborder = "0"></iframe>
    <br>
    s-plane에서 z-plane으로의 변화
    <br>
    슬라이더를 움직여 보세요 ^^
</p>

# 라플라스 변환과 z-변환

※ 이 꼭지는 [Z 변환 포스트](https://angeloyeo.github.io/2019/08/13/Z_transform.html)의 Z-변환과 라플라스 변환 꼭지에서 가져왔습니다.

Z-변환은 라플라스 변환의 discrete time 버전이라고 할 수 있다.

라플라스 변환의 식에서 시간 sampling을 해줌으로써 Z-변환을 얻어보자.

연속시간 신호<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq1.png">에 대해 라플라스 변환은 다음과 같이 정의된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq2.png"> </p>

여기서 연속시간 신호 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq3.png">를 시간 샘플링하기 위해, 샘플링 주기 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq4.png">에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq5.png">로 치환하도록 하자.

즉,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq6.png"> </p>

와 같은 과정을 거치며 여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq7.png">는 discrete time signal로 볼 수 있다. 따라서,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq8.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq9.png">를 대입하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-07-23-laplace_and_z/eq10.png"> </p>


위 유도과정을 통해서 Laplace와 Z-transform이 수식적으로 연관되어 있다는 사실을 확인할 수 있다. 결론적으로 Laplace 변환과 Z 변환은 각각의 복소수를 정의해주는 방법에 차이가 있을 뿐 모두 system의 특성을 확인하기 위한 테크닉이라고 할 수 있겠다. 

s-plane과 z-plane은 다음과 같은 형태학적 관계를 가지게 된다. 

<p align = "center">
  <img width = "600" src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-08-13_Z_Transform/pic1.png">
  <br>
  그림 1. s-plane과 z-plane의 관계. z-plane은 s-plane을 말아 넣은 것 같은 형태를 띄고 있다.
</p>

그림 1에서 처럼 s-plane에서는 세로축 기준 왼쪽에 pole이 위치해야 stable system이고 z-plane에서는 단위원 기준 안쪽에 pole이 위치하면 stable system이다.
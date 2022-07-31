---
title: 발산정리(3D)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20200823
tags: 미적분학
---

※ 본 포스팅에서 발산정리라고 부르는 개념은 특별한 언급이 없다면 3차원 발산 정리(가우스 정리)를 의미합니다.
이는 [2차원 발산 정리](https://angeloyeo.github.io/2020/08/19/divergence_theorem_2D.html)와 구별하기 위함입니다.

# 발산 정리의 수식

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq1.png"> </p>

# 발산 정리의 의미

## prerequisites

발산 정리의 의미에 대해 이해하시기 위해선 아래의 내용에 대해 알고 오시는 것을 추천드립니다.

* [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)

## 발산 정리의 의미 소개

아래와 같이 어떤 벡터장 위에 닫힌 곡면 S과 그로 인해 만들어지는 정육면체 모양의 부피체가 있다고 하자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic1.mp4">
  </video>
  <br>
  그림 1. 3차원 공간 위에 닫힌 곡면 S와 그로 인해 만들어지는 정육면체 모양의 부피체
</p>

이 때 우리는 정육면체의 6개의 면에 대한 면벡터를 생각할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic2.png">
  <br>
  그림 2. 정육면체가 갖는 6가지 면
</p>

발산 정리에서 우리가 알고자 하는 것은 이 6개 면에 대한 [면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)이 결국 이 부피체에 의한 [삼중적분](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)의 값과 같다는 것이다.

우리는 [그린정리](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#curl%EC%9D%84-%ED%86%B5%ED%95%9C-%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A7%81%EA%B4%80%EC%A0%81-%EC%9D%B4%ED%95%B4)나 [스토크스 정리](https://angeloyeo.github.io/2020/08/22/stokes_theorem.html)의 의미를 알아볼 때 처럼 부피체의 부피를 쪼개가면서 발산정리의 의미에 대해 생각해보자.

우선 아래와 같이 부피체를 y 축에 대해 2개로 쪼개보자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic3.mp4">
  </video>
  <br>
  그림 3. 정육면체 형태의 부피체를 y축에 대해 두 개로 쪼갠 경우
</p>

여기서 우리는 총 12개의 면에 대해 생각할 수 있지만, 특별히 두 개로 쪼개진 부분의 면을 생각해서 조감해보면 다음과 같다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic4.png">
  <br>
  그림 4. 두 개로 쪼개진 부피체를 z-축에서 조감한 경우의 각 면벡터의 형상
</p>

이 때 쪼개진 두 부피체를 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq2.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq3.png">라고 하고 각 부피체에 포함되는 6개의 면들을 통틀어 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq4.png">과 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq5.png">라고 하자.

이 때, 그림 4에서 볼 수 있듯이 쪼개진 면에서는 양쪽으로 나오는 두 면벡터가 면적은 같으나 그 방향이 반대이므로 이 면에서 구하게 되는 두 면적분 값을 합쳐주면 0이 된다.

따라서, 전체 2개의 부피체에 대한 면적분 값을 모두 합치면 원래의 (쪼개기 전의) 부피체에 대한 면적분의 값과 같다.

즉, 수식으로 작성하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq6.png"> </p>

이번엔 부피체를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq7.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq8.png"> 축에 대해 각각 두 개로 쪼개 총 네 개의 부피체를 만들어보자.

<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic5.mp4">
  </video>
  <br>
  그림 5. 정육면체 형태의 부피체를 x, y축에 대해 각각 두 개로 쪼갠 경우
</p>

이 때, 쪼개진 부피체를 각각 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq9.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq10.png">라고 하고, 각 부피체에 포함되는 6개의 면들을 통틀어 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq11.png">에서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq12.png">로 부르도록 하자.

그러면 아래의 그림 6에서 볼 수 있는 것 처럼 부피체를 쪼개게 된 내부의 면들에 대해서는 양쪽으로 나오는 두 면벡터가 면적은 같으나 그 방향이 반대이기 때문에, 이 면들에서 두 면적분 값을 구해서 더해주면 0이 된다는 것을 알 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic6.png">
  <br>
  그림 6. 네 개로 쪼개진 부피체를 z-축에서 조감한 경우의 각 면벡터의 형상
</p>

따라서, 전체 네 개의 부피체에 대한 면적분 값을 모두 합치면 원래의 (쪼개기 전의) 부피체에 대한 면적분의 값과 같다.

즉, 수식으로 작성하면 다음과 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq13.png"> </p>

위의 논의를 이어간다면 이러한 방식으로 임의의 개수만큼 부피체를 조깨더라도 쪼개진 부피체에 대한 면적분 값을 모두 합치면 원래의 부피체에 대한 면적분 값과 같을 것이다. 즉, 임의의 양수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq14.png">에 대하여 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq15.png"> </p>


<p align = "center">
  <video width = "400" height = "auto" loop autoplay muted>
    <source src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic7.mp4">
  </video>
  <br>
  그림 7. 정육면체 형태의 부피체를 x, y축에 대해 임의의 양수 N개로 쪼갠 경우<br>(그림에선 1000개로 쪼개었음)
</p>

또, 귀납적으로 생각하면 무수하게 많이 부피체를 쪼개더라도 위의 논의는 계속하여 성립하게 되어 무수하게 많이 쪼개진 부피체의 면적분 값을 다 더하면 원래의 부피체의 면적분값과 같다고 생각할 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq16.png"> </p>

-----------

그렇다면 하나의 작은 부피에서의 면적분 값이 의미하는 것은 무엇일까?

[벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)은 해당 미소면적을 지나는 벡터장의 벡터와 면벡터가 얼마나 닮았는지를 내적을 통해 계산해주고 전체 곡면에 대해 더해준 것이라고 언급하였다.

그리고, [면적분의 물리적 의미](https://angeloyeo.github.io/2020/08/21/surface_integral.html#%EB%A9%B4%EC%A0%81%EB%B6%84%EC%9D%98-%EC%9D%98%EB%AF%B8-3d-flux)는 곡면 S를 통해 빠져나간 유량을 의미한다고도 언급한 바 있다.

또한, [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)에서 배운 내용을 생각해본다면, 발산(divergence)의 의미는 "단위 부피당 빠져나간 유량"이었다.

즉, 이 부피체가 매우 작다고 하면 미소 부피의 발산값에 미소 부피의 부피를 곱해주면 이 미소 부피를 통해 빠져나간 유량을 의미한다고 할 수 있다.

수식으로 적어보면 다음과 같을 것이다. 임의의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq17.png"> 번째 매우 작은 부피체에 대하여 이 부피체의 부피가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq18.png">라고 한다면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq19.png"> </p>

이제 매우 작고 무수하게 쪼개준 전체 부피체에 대해 생각해준다면 식(5)는 다음과 같이 쓸 수 있을 것이다.


<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq20.png"> </p>

결국 주어진 최외각의 부피체에 대해 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq21.png">을 무수하게 많이 더해준다는 것은 이 부피체 내의 모든 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq22.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq23.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq24.png"> 에 대해 적분해준다는 뜻과 같다.

또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq25.png">이 무한히 커지면 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq26.png">는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq27.png">로 쓸 수 있다. 따라서 아래와 같이 발산 정리의 식을 생각할 수 있게 된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq28.png"> </p>


<center>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/Jgng92Hhl5s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

# 발산 정리의 증명

## prerequisites

발산 정리의 증명 과정을 잘 이해하기 위해선 다음의 내용에 대해 알고오시는 것이 좋습니다.

* 미적분학의 기본정리

함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq29.png">가 닫힌구간 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq30.png">에서 연속이며, 함수 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq31.png">가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq32.png">의 임의의 부정적분이면 다음이 성립한다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq33.png"> </p>

* [벡터장의 발산](https://angeloyeo.github.io/2019/08/25/divergence.html)
* [중적분의 의미](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)
* [미소곡면의 법선벡터](https://angeloyeo.github.io/2020/08/20/normal_vector.html)
* [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)
* [발산 정리의 의미](https://angeloyeo.github.io/2020/08/23/divergence_theorem_3D.html#발산-정리의-의미)

## 증명을 위한 곡면, 정의역, 벡터장 소개

이번 증명 과정에서는 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq34.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq35.png"> 평면이고 윗면과 아랫면의 높이가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq36.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq37.png">와 같이 정해지는 원통 모양의 닫힌 곡면을 이용해 발산 정리를 증명하고자 한다. 특히, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq38.png">와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq39.png">로 결정되는 이 닫힌 곡면(원통)의 윗면과 아랫면의 법선 벡터는 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq40.png">축의 단위벡터와 평행하다[^1].

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2020-08-23-divergence_theorem_3D/pic8.png">
  <br>
  그림 8. 정의역이 x, y 평면이고 윗면, 아랫면의 높이가 z = g(x,y)로 정해지는 원통 모양의 닫힌 곡면
</p>

이후 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq41.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq42.png">인 경우[^2]와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq43.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq44.png">인 경우[^3]에 대해서는 지금의 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq45.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq46.png">인 경우에 대한 증명 방식과 유사한 방식으로 증명할 수 있다는 방식으로 일반적인 3차원 공간에 대해 발산 정리를 증명할 수 있다.

또, 이번 증명에서는 벡터장이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq47.png"> 컴포넌트만 주어져 있다고 가정하자. 즉, 3차원 공간 상에 주어진 벡터 필드 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq48.png">를 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq49.png">로 쓰도록 하자. 꺽쇠 괄호로 표시한 것은 원래의 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq50.png">를 줄여서 표시한 것이다.

우리가 증명할 발산 정리의 수식을 다시 한번 써보고 증명을 시작해보자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq51.png"> </p>

## 주어진 곡면, 정의역, 벡터장을 이용한 증명

발산 정리의 수식 중 면적분 부분으로부터 증명을 시작해 보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq52.png"> </p>

우리가 이번 발산 정리의 증명에서 상정하는 닫힌 곡면은 원통형인데, 원통형의 면은 윗면(up), 측면(side), 아랫면(down)의 세 가지 면으로 나눠서 생각할 수 있으므로 위의 면적분의 식도 아래와 같이 나눠서 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq53.png"> </p>

이 때, 측면에 대한 면적분을 생각해보면, 측면에 해당하는 면의 법선 벡터는 항상 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq54.png"> 평면에 평행한 법선벡터를 갖게 된다. 그런데, 동시에 우리가 상정한 벡터장은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq55.png"> 컴포넌트만 가지므로 법선벡터와 벡터장이 항상 수직이다. 따라서, 측면에 해당하는 면적분 값은 0이 된다. 즉, 아래와 같다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq56.png"> </p>

이제 여기서 수식을 좀 더 전개하기 위해 [벡터장의 면적분](https://angeloyeo.github.io/2020/08/21/surface_integral.html)에서 계산했던 것 처럼 면벡터(<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq57.png">)에 대해 계산해보도록 하자. 일반적으로 곡면은 아래와 같이 두 개의 매개변수를 이용해 표현된다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq58.png"> </p>

이번 증명에서는 곡면의 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq59.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq60.png">이고 높이가 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq61.png"> 혹은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq62.png">로 정해지므로 곡면의 방정식을 아래와 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq63.png"> </p>

따라서, 미소곡면에 대한 면벡터는 아래와 같이 쓸 수 있을 것이다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq64.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq65.png"> </p>

여기서 원래의 면적분 값의 계산을 조금 더 전개해보도록 하자.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq66.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq67.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq68.png"> </p>

위 식에서 중간의 부호가 더하기에서 빼기로 바뀌는 것은 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq69.png">의 법선벡터와 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq70.png">의 법선벡터의 방향이 반대이기 때문이다.

내적을 취해준 뒤 수식을 조금 더 전개하면,

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq71.png"> </p>

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq72.png"> </p>

[그린정리의 증명](https://angeloyeo.github.io/2020/01/18/Green_theorem.html#%EA%B7%B8%EB%A6%B0-%EC%A0%95%EB%A6%AC%EC%9D%98-%EC%A6%9D%EB%AA%85)에서 사용한 방식과 마찬가지로, 여기서 미적분학의 기본정리를 이용하면 위 식은 아래와 같이 생각할 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq73.png"> </p>

이는 [삼중적분](https://angeloyeo.github.io/2020/07/30/multiple_integral.html)을 이용해서 아래와 같이 표기할 수도 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq74.png"> </p>

여기서 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq75.png">는 벡터장 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq76.png"> 에서의 [발산](https://angeloyeo.github.io/2019/08/25/divergence.html)값과 같다고 할 수 있다. 또, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq77.png">는 미소 부피이므로 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq78.png">와 같이 쓸 수 있다. 따라서, 위 식은 아래와 같이 쓸 수 있다.

<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq79.png"> </p>

즉, 이것은 원래의 발산정리의 식을 증명한 것과 같다.

## 일반적인 3차원 공간에 대한 발산 정리

앞서 우리는 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq80.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq81.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq82.png"> 축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^1]에 대해 발산정리를 증명했다.

마찬가지 방법으로 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq83.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq84.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq85.png">축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^2]에 대해서, 그리고 정의역이 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq86.png">, <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq87.png">이고 <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/2020-08-23-divergence_theorem_3D/eq88.png">축 방향으로의 컴포넌트만을 가진 벡터장이 주어진 경우[^3]에도 앞서 증명한 방법과 같은 방법으로 증명할 수 있기 때문에 일반적인 닫힌 곡면에 대한 3차원 공간에서 발산 정리가 성립한다고 할 수 있다.

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/mGAVueXsqcA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

[^1]: 보통 이런 공간을 type-I region이라고도 부른다.

[^2]: type-II region

[^3]: type-III region

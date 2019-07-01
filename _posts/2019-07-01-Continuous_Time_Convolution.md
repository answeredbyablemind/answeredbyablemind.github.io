---
title: 연속시간 컨볼루션(Continuous Time Convolution)
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20190701
---
{% raw %}
<p align="center"><iframe width = "530" height = "450" frameborder = "0" src="https://angeloyeo.github.io/p5/CT_Convolution_2/p5/"></iframe></p>

<center> 연속시간 컨볼루션이 말하는 것: 함수를 잘개 쪼개서 표현할 수 있다.</center>

#1. Continuous Time Domain에서 delta 함수 $\delta(t)$의 필요성

<center>![](https://wikidocs.net/images/page/4044/20160118_202007.png)</center>

위와 같은 임의의 Analog signal $x(t)$에 대해서 생각해보자. 가장 먼저 우리가 하고싶은 일은 DT Domain에서 convolution을 증명했기 대문에 이것을 CT domain에서 비슷하게 따라하는 것이다.


즉, 조금 더 자세하게 설명하자면, DT domain에서 했던 것 처럼 함수 $x(t)$를 분해(decompose)해보고 싶은 것이다.
즉, CT Domain에서도 DT Convolution의 식 (a)와 같은 방식으로 $x(t)$를 분해해서 보고 싶은 것이다.

그래서 다음과 같은 행동을 해본다.


<center>![](https://wikidocs.net/images/page/4044/20160118_202028.png)</center>

즉, CT signal을 DT signal인 것 마냥 사각형으로 조각을 내보는 것이다.

이렇게 해놓고 보니 뭔가 의미 있는 행동이었던 것 같지만, 사각형의 넓이를 이용해 줄 수도 있을 것 같아서 모든 사각형의 왼쪽 아래, 위 모서리의 시작점은 유지해주되(즉, 높이는 유지...) 넓이를 모두 1로 만들어보았다.


<center>![](https://wikidocs.net/images/page/4044/20160118_202038.png)</center>


이렇게 해주니 사각형의 넓이 덕분에 뭔가 의미 있는 것 같아지긴 했지만, 사각형이 시작하는 지점을 모두 같은 간격으로 같게 해주면 sampling 이론을 이용할 수 있겠다는 생각이 들어서 사각형이 시작하는 지점을 모두 같게 해주고, 너비는 $\alpha$로, 높이는 $\frac{1}{\alpha}$로 가. 정의해주어서 넓이가 1이 되는 사각형을 만들어주어야 겠다는 생각이 들었다. 즉, 넓이를 이용해서



<center>![](https://wikidocs.net/images/page/4044/20160118_202048.png)</center>

이렇게 만들어놓고 보니, 넓이 1인 사각형의 train과 analog 함수의 값을 곱해준 것은 sample된 analog signal을 표현할 수 있는 Sampled Signal이라는 생각이 문뜩 들었다. 그래서,



<center>![](https://wikidocs.net/images/page/4044/20160118_202054.png)</center>

이렇게 놓고보니, 빨간색 사각형들은 그 크기는 다르지만 원래의 신호에 비례하게 그 크기가 정렬된다는 것을 알 수 있고, 사각형의 넓이는 모두 원래 신호의 값에 비례한다는 것 또한 알 수 있다.이제, 사각형의 개수가 많아지면 어떻게 되는지 확인해보자.


<center>![](https://wikidocs.net/images/page/4044/20160118_202103.png)</center>

사각형 100개를 놓아봤더니 아날로그 신호를 매우 잘 표현해주는 sampled data가 되었다고 할 수 있겠다. 즉, 이 사각형의 넓이는 원래 신호의 크기의 비율이니까...이제 alpha의 크기를 줄여보자..

alpha = 0.5  0.3



<center>![](https://wikidocs.net/images/page/4044/20160118_202110.png)</center>

alpha = 0.1



<center>![](https://wikidocs.net/images/page/4044/20160118_202119.png)</center>


alpha = 0.01



<center>![](https://wikidocs.net/images/page/4044/20160118_202127.png)</center>


alpha = 0.001




<center>![](https://wikidocs.net/images/page/4044/20160118_202136.png)</center>

자, 이제 약간 오싹한 느낌이 들기도 하지만, 사각형이 매우 작아져서 마치 선처럼 되어버렸고, 원래의 신호를 사각형을 이용해서 sampling 한 신호처럼 되어버렸다.


<center>![](https://wikidocs.net/images/page/4044/20160118_202144.png)</center>


위의 파란 선이 원래 신호라는 사실이 무색할 정도로, 빨간색 사각형(지금은 선처럼 보이는)의 나열은 원래 신호와 매우 닮아있다.그렇다면, 이제 빨간색 사각형을 이용해서 원래 신호를 분리해 표현할 수 있지 않을까? 처음 시작할 때 원했던 것은 DT Domain에서처럼 CT 신호를 분리해서 표현하는 것이었기 때문이다. 즉, 너비가 $\alpha$이고 높이가 $\frac{1}{\alpha}$이고, 각각의 시작점의 간격이 $T_s$인 사각형 펄스의 신호를 $p_c(t)$라고 했을 때,

<center><img src="http://bit.ly/1OFjReF"></center>

라고 정의할 수 있다. 여기서 $rect_\alpha (t-b)$는 너비 $\alpha$와 높이 $\frac{1}{\alpha}$의 값을 가지는 사각형을 $t=b$인 점에서 그리는 함수라고 정의한다.

그런데, 하나의 $rect_\alpha(t-b)$ 함수에 대해서, <img src="http://bit.ly/1JXRHid">에 대해서 생각할 필요가 있다.

그것은, 우리는 **연속 함수를 매우 좁은 사각형의 합으로 표현하고 싶기 때문이다.**

즉, 너비는 매우 작아지면서 넓이는 1로 유지할 수 있는 개념의 사각형이 필요하다.

이것을



<center><img src="http://bit.ly/1OFjYqF"></center>



라고 정의한다.

즉, 일반적으로 $\delta(t)$는 $t=0$에서 너비는 무한소를 가지고, 그 높이는 무한대의 값을 가지면서도 그 넓이는 1인 사각형파를 의미하는 것이다. 다시 한번 이것이 왜 필요하냐면, 사각형의 넓이를 이용해서 Continuous Signal을 분해해보고 싶었기 때문이며, 이런 극한의 개념을 도입한 사각형 파의 개념을 도입함으로써 Analog Signal을 완벽하게 사각형의 너비를 이용해서 분해해 볼 수 있기 때문이다. 그렇기 때문에, 다시 $p_c(t)$는 이렇게 생각해보아야 한다. 즉, $\alpha \rightarrow 0$일 때,


<center><img src="http://bit.ly/1JXRwDx"></center>

또, 우리는 매우 촘촘한 사각형을 그려줘야 하기 때문에 $T_s$역시도 매우 작아지면 완벽할 것이다. 한 번 더 limit을 걸어주어서,


<center><img src="http://bit.ly/1JXRwU1"></center>


자 이제 $x(t)$는 이렇게 하면 완벽하게 분해할 수 있지 않을까? (극한의 개념 도입)

<center><img src="http://bit.ly/1JXRzPJ"></center>


그런데, delta 함수의 정의에 의해서,

<center><img src="http://bit.ly/1JXRxYb"></center>

이 때, $\delta(t)$는 정의상 사각형 모양에서 출발한다. $x(kT_s)$라는 함수 값에 연속적이고 그 너비가 매우 작은 사각형을 곱해줘 무한개를 더해주는 것은 정적분의 원리와 같다. 그렇기 때문에,

<center><img src="http://bit.ly/1JXRADj"></center>


와 같이 표현해주는 것과 같은 것이다.


#2. CT domain에서의 convolution

이제, CT signal도 $\delta(t)$의 개념이 들어왔기 때문에 어떠한 신호도 분해해서 볼 수 있다. 그렇기 때문에 DT Signal에서와 마찬가지로 LTI의 성질을 이용하면

<center><img src="http://bit.ly/1JXRATS"></center>


라는 사실을 알 수 있다.


<center> <iframe width="420" height="315" src="https://www.youtube.com/embed/HLYxnTV1N5k" frameborder="0" allowfullscreen></iframe> </center>

{% endraw %}

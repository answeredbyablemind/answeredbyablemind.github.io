---
title: 수식이 깨져 보일 때 대처법
sidebar:
  nav: docs-ko
aside:
  toc: false
key: 20190103
tags: 도움말
---

최근들어 알 수 없는 이유로 블로그의 수식이 깨져보일 때가 있다.

가령 아래의 그림과 같이 출력되는 경우이다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic01.png">
  <br>
  그림 1. 수식이 깨져서 출력되는 경우
</p>

이럴 때는 아래와 같이 대처하여 임시 방편으로 활용해보자.

우선, 이 방법은 모바일 환경에서는 적용할 수 없고 PC 환경에서만 사용할 수 있다는 점은 양해를 바란다.

이 방법은 이 블로그의 github repo를 fork 하여 포스팅에 사용된 *.md 파일을 모두 다운받은 다음, Visual Studio Code를 이용해 markdown을 rendering하는 방식을 이용하는 것이다.

# 깃허브 repo로 들어가기

만약, 깃허브 아이디가 없는 경우에는 깃허브에 가입하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic02.png">
  <br>
  그림 2. 깃허브 가입 화면
</p>

그런 다음 아래의 링크로 들어가서 블로그 repo에 접속하자.

<p align = "center">
<a href = "https://github.com/angeloyeo/angeloyeo.github.io"> Github 블로그 repo 링크</a>
</p>

그런 다음 Open with Github Desktop을 클릭하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic03.png">
  <br>
  그림 3. 블로그의 Github Repo 화면에서 Open with Github Desktop을 클릭하자.
</p>

만약 Github Desktop이 없다면 설치해주자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic04.png">
  <br>
  그림 4. Github Desktop이 설치되어 있지 않다면 설치해주도록 하자.
</p>

Github Desktop에는 아래와 같은 화면이 출력된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic05.png">
  <br>
  그림 5. Repo를 clone하는 과정
</p>

여기서 적절한 폴더를 선택해 블로그 Repo의 내용물들을 모두 다운받아주자.

저장한 폴더에 들어가면 _post라는 폴더가 있는 것을 확인할 수 있다. 이 안에 들어있는 *.md 파일을 열어주면 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic06.png">
  <br>
  그림 6. 열어 보려고 하는 *.md 파일들이 들어있는 위치
</p>


# Visual Studio Code 이용해 *.md 파일을 열기

이번에는 Visual Studio Code를 설치하자.

구글에 Visual Studio Code를 검색해 설치하고, Extension으로 Markdown All in One을 설치하도록 하자.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic07.png">
  <br>
  그림 7. VSCode를 설치하고 필요한 Markdown renderer extension을 설치하면 된다.
</p>

개인적으로 선호하는 Markdown renderer가 있다면 꼭 이 extension을 설치하지 않아도 괜찮다.

이렇게 설치해주고 나면 VS Code에서는 아래와 같은 화면이 나오게 되며, 이 버튼을 활성화 해주면 markdown으로 써져있는 수식을 rendering해서 읽을 수 있게 된다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic08.png">
  <br>
  그림 8. markdown preview 버튼의 위치
</p>

가령 아래와 같이 markdown으로 써둔 내용과 rendering을 수행해서 출력한 내용을 동시에 확인할 수 있다.

<p align = "center">
  <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/pics/2019-01-03-when_latex_not_appear/pic09.png">
  <br>
  그림 9. markdown preview를 통해 내용물을 읽는 모습
</p>


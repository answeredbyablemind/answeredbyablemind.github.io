<!-- RED_C = #FC6255
>>> GREEN_C'#83C167'
>>> TEAL_C'#5CD0B3'
>>> YELLOW_E'#E8C11C'
>>> PURPLE_A'#CAA3E8' >>> --> 
$\definecolor{PURPLEA}{rgb}{0.792, 0.639, 0.91}\definecolor{TEALC}{rgb}{0.361, 0.816, 0.702}\definecolor{BLUEC}{rgb}{0.345, 0.769, 0.867}\definecolor{YELLOWE}{rgb}{0.91, 0.757, 0.11}\definecolor{REDC}{rgb}{0.988, 0.384, 0.333}
\definecolor{GREENC}{rgb}{0.514, 0.757, 0.404}
\newcommand\gr[1]{{\color{GREENC}#1}}
\newcommand\pp[1]{{\color{PURPLEA}#1}}
\newcommand\tl[1]{{\color{TEALC}#1}}
\newcommand\pk[1]{{\color{PURPLEA}#1}}
\newcommand\bl[1]{{\color{BLUEC}#1}}
\newcommand\or[1]{{\color{YELLOWE}#1}}
\newcommand\rd[1]{{\color{REDC}#1}}
\newcommand\grx{\gr{x}}\newcommand\gry{\gr{y}}
\newcommand\tlx{\tl{x}}\newcommand\tly{\tl{y}}\newcommand\pkx{\pk{x}}\newcommand\pky{\pk{y}}\newcommand\ppx{\pk{x}}\newcommand\ppy{\pk{y}}
\newcommand\blx{\bl{x}}\newcommand\bly{\bl{y}}\newcommand\orx{\or{x}}\newcommand\ory{\or{y}}\newcommand\rdx{\rd{x}}\newcommand\rdy{\rd{y}}$ 
<!--①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳㉑㉒㉓㉔㉕㉖㉗㉘㉙㉚㉛㉜㉝㉞㉟㊱㊲㊳㊴㊵㊶㊷㊸㊹㊺㊻㊼㊽㊾㊿
⓵⓶⓷⓸⓹⓺⓻⓼⓽⓾
❶❷❸❹❺❻❼❽❾❿⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴
⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇-->

# 다항식의 덧셈과 뺄셈 (학습)
> 이번 시간에는 다항식의 덧셈과 뺄셈에 대해 알아보겠습니다.

### 다항식의 덧셈과 뺄셈
<video width="800" height="450" controls src="media/H11_0103_Scene1.mp4" autoplay muted></video>

중학교에서 배운 것처럼,
1. 괄호가 있는 경우에는 괄호를 풀고,
2. 동류항끼리 모아 정리하면 됩니다.

예를 들어, 두 다항식 
$$
\begin{align*}
A&=2 x^2-7 x+6 \\
B&=3 x^2+2
\end{align*}
$$
에 대해 $A+B$와 $A-B$를 직접 계산해보고,
아래 해설과 비교해봅시다.
<details><summary>정답 보기</summary>
<video width="800" height="450" controls src="media/H11_0103_Scene2.mp4" autoplay muted></video></video>

$$
\begin{align*}
A+B & =\left(2 x^2-7 x+6\right)+\left(3 x^2+2\right) \\
& =\bl{2 x^2}-\tl{7 x}+\pk6+\bl{3 x^2}+\pk2 \\
& =\bl{2 x^2}-\tl{7 x}+\bl{3 x^2}+\pp6+\pp2\\
& =\bl{2 x^2}+\bl{3 x^2}-\tl{7x}+\pk{6}+\pk{2} \\
& =\bl{5 x^2}-\tl{7 x}+\pk8\\
\quad\\
A\rd{\:-2\,\!} B & =\left(2 x^2-7 x+6\right)\rd{\:-2}\left(3 x^2+2\right) \\
&=\bl{2x^2} - \tl{7x} + \pk6 - \bl{6x^2} - \pk4\\
& =\bl{-4 x^2}-\tl{7x}+\pk2
\end{align*}
$$



이러한 계산에서, 다음과 같은 다항식의 성질이 활용되었습니다.
<video width="800" height="450" controls src="media/H11_0103_Scene3.mp4" autoplay muted></video>
</details>




<br><br><br><br><br><br>
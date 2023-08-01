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

# 다항식의 곱셈
> 이번 시간에는 **다항식의 곱셈**에 대해 알아보겠습니다. 

## 분배법칙과 지수법칙

예를 들어, 분배법칙으로 다음과 같이 계산되어요.
$$
\begin{align*}
m(a+b+c)&=ma+mb+mc\\
\left( a+b \right)\left( x+y \right)&=ax+ay+bx+by\\
\end{align*}
$$
분배법칙을 적용하다가 같은 문자끼리 곱해질 때
지수법칙을 적용합니다.
$$
\begin{align*}
x\cdot x^2 &= x^3\\
x\left( x+1 \right)&=x\cdot x + x\cdot 1=x^2 + x
\end{align*}
$$

분배법칙과 지수법칙을 적용하여 아래 두 식을 계산해봅시다.
$$
\begin{align*}
&2 x(x+y-3),\qquad &(x+2)\left(x^2-x+3\right)
\end{align*}
$$

<details><summary>해설 보기</summary>

$$
\begin{align*} 2 x(x+y-3) & =2 x \cdot x+2 x \cdot y+2 x \cdot(-3) \\ & =2 x^2+2 x y-6 x \\ (x+2)\left(x^2-x+3\right) & =x \cdot x^2-x \cdot x+x \cdot 3+2 \cdot x^2-2 \cdot x+2 \cdot 3 \\ & =x^3-x^2+2 x^2+3 x-2 x+6 \\ & =x^3+x^2+x+6\end{align*}
$$
시뮬레이션으로도 식 전개 과정을 확인할 수 있어요!

<video width="800" height="450" controls src="media/H11_0105_Scene2.mp4">


</details>

## 다항식의 곱셈에 대한 성질

일반적으로 **다항식의 곱셈**에 대하여
다음과 같은 성질이 성립합니다.

>세 다항식 $A, B, C$에 대하여
>
>1. **교환법칙** : $A B=B A$
>2. **결합법칙** : $(A B) C=A(B C)$
>3. **분배법칙** : $\begin{aligned}[t]
A(B+C)&=A B+A C\\
(A+B) C&=A C+B C
\end{aligned}$

위의 성질은 세 실수 $a, b, c$의 곱셈에 대한 성질과 같습니다.

> 세 실수 $a, b, c$에 대하여
> 
> 1. **교환법칙** : $a b=b a$
> 2. **결합법칙** : $(a b) c=a(b c)=a b c$
> 3. **분배법칙** : $\left\{\begin{array}{l}a(b+c)=a b+a c \\ (a+b) c=a c+b c\end{array}\right.$


<video width="800" height="450" controls src="media/H11_0105_Scene3.mp4" autoplay muted></video>

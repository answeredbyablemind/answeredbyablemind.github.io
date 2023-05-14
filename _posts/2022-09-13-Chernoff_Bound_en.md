---
title: Chernoff Bound
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20220913_en
tags: Statistics
lang: en
---

# Prerequisites

To fully understand this post, it is recommended that you have knowledge of the following:

* [Markov and Chebyshev Inequalities](https://angeloyeo.github.io/2022/09/12/Markov_Chebyshev_Inequality_en.html)

# Proof

Chernoff's inequality has different forms for the lower-tail version and upper-tail version. In this post, we will introduce the proof process.

## Lower-Tail Chernoff Bound

Let $X$ be the sum of $N$ independent random variables. Assume that these random variables follow the Bernoulli distribution and have a probability of $p_i$ to take a value of 1.

$$X = \sum_{i=1}^{N}X_i$$

[//]:# (Equation 1)

For any $\delta\in (0, 1)$, the following inequality holds:

$$P(X \lt (1-\delta)E[X]) \lt e^{-E[X]\cdot \delta^2/2}$$

[//]:# (Equation 2)

Here, $e$ represents Euler's number.

(Proof)

First, let's prove the following inequality:

$$P(X \lt (1-\delta) E[X]) \lt \left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}$$

[//]:# (Equation 3)

To prove this, let's introduce an arbitrary parameter $t>0$. We will use this $t$ to transform the equation for $X$ into an equation for $e^{-tX}$. This method can be thought of as using the principle of moment generating functions to move the problem from the original domain of $X$, where it is difficult to solve, to the parameter domain of $t$, where it is relatively easy to solve.

To prove Equation (3), let's modify the equation for Markov's inequality in accordance with $e^{-tX}$ instead of $X$. The original Markov's inequality is as follows:

$$P(X\lt \alpha) \leq \frac{E[X]}{\alpha}$$

[//]:# (Equation 4)

If we change the right-hand side of the equation, we get:

$$P(X\lt\alpha) \leq \frac{E[e^{-tX}]}{e^{-t\alpha}}$$

[//]:# (Equation 5)

When applying equation (5) to the left-hand side of equation (2), the result is as follows. Here, $\alpha = (1-\delta)E[X]$; thus,

$$\Rightarrow P(X\lt (1-\delta)E[X]) \leq \frac{E[e^{-tX}]}{e^{-t(1-\delta)E[X]}}$$

[//]:# (Equation 6)

is established. Moreover, the events that constitute $X$, namely $X_i$, occur independently. Looking at the numerator on the right-hand side of the above equation, we have

$$E[e^{-tX}] = E[e^{-t\cdot\sum_{i}X_i}] = E[e^{-t(X_1+X_2+\cdots+X_N)}]\notag$$

$$=E[e^{-tX_1}\cdot e^{-tX_2}\cdot e^{-tX_3}\cdot \cdots \cdot e^{-t X_N}]$$

[//]:# (Equation 7)

which can be rewritten as follows, where the expected value of the product of independent random variables is the product of their expected values:

$$\Rightarrow E[e^{-tX_1}\cdot e^{-tX_2}\cdots e^{-tX_N}]=\prod_{i=1}^{N}E[e^{-tX_i}]$$

[//]:# (Equation 8)

If we take a closer look at $E[e^{-tX_i}]$, we can see that it is the expected value of the transformation equation $e^{-tX_i}$ for the experiment $X_i$ following a Bernoulli distribution. Since $X_i$ has a probability of $(1-p_i)$ or $p_i$ of taking on the values 0 or 1, respectively, the expected value of $X_i$ is

$$E[X_i] = (1-p_i)\cdot 0 + p_i \cdot 1 = p_i$$

Similarly, the expected value of $e^{-tX_i}$ is

$$E[e^{-tX_i}]=(1-p_i)e^{-t\cdot 0}+p_i e^{-t\cdot 1}\notag$$

$$=1-p_i + p_i e^{-t}=1+p_i(e^{-t}-1)\notag$$

$$ = 1+E[X_i](e^{-t}-1)$$

Considering that the last product is equal to the two leading terms of the Taylor series of $\exp(E[X_i]\cdot(e^{-t}-1))$, we can conclude that:

$$E[e^{-tX_i}]=1+E[X_i](e^{-t}-1) \lt e^{E[X_i](e^{-t}-1)}$$

[//]:# (Equation 11)

Substituting equation (11) into equation (8), we have

$$\prod_{i=1}^{N}E[e^{-tX_i}]\lt\prod_{i=1}^{N}e^{E[X_i](e^{-t}-1)}$$

Thus, it follows that the right-hand side of the above equation can be rewritten as:

$$\prod_{i=1}^{N}\exp(E[X_i](e^{-t}-1))=\exp\left(\sum_{i=1}^{N}E[X_i]\cdot (e^{-t}-1)\right)\notag$$

$$=\exp\left(E[X](e^{-t}-1)\right)$$

[//]:# (Equation 13)

Hence, substituting the result of equation (13) into equation (6) yields the following equation.

$$P(X<(1-\delta)E[X]) \leq \frac{\exp\left(E[X](e^{-t}-1)\right)}{\exp\left(-t(1-\delta)E[X]\right)}$$

[//]:# (식 14)

The given equation holds true for any $t>0$. Now, let's find the value of $t=t^\ast$, which minimizes the equation (14) as tightly as possible. This process can be resolved by differentiating equation (14), and finding $t^\ast$ where the derivative is zero.

By applying the exponential law to the right-hand side of the equation (14), it can be written in one line as follows:

$$\exp(E[X](e^{-t}-1)+t(1-\delta)E[X])$$

[//]:# (Equation 15)

Simplifying this a little more and naming it $f(t)$, we have:

$$f(t) = \exp\left(E[X]e^{-t}-E[X]+tE[X]-t\delta E[X]\right)\notag$$

$$=\exp\left(E[X](e^{-t}+t-t\delta -1)\right)$$

[//]:# (Equation 16)

Now, when $f(t)$ is differentiated with respect to $t$:

$$f'(t) = \exp\left(E[X](e^{-t}+t-t\delta -1)\right)(E[X])(e^{-t}+1-\delta)$$

[//]:# (Equation 17)

It can be seen that the exponential function at the front of the equation (17) is always positive, and $E[X]$ is also positive. Therefore, $t=t^\ast$ can be found by making only the value inside the rightmost parentheses zero.

Thus, 

$$e^{-t}+1-\delta = 0$$

Satisfying $t=t^\ast$ is:

$$t=t^\ast = \ln\left(\frac{1}{1-\delta}\right)$$

[//]:# (Equation 19)

By substituting equation (19) into equation (14), we can obtain equation (3). Substituting equation (19) into equation (14), we get:

$$\Rightarrow P(X<(1-\delta) E[X])
\leq 
\frac{\exp\left(E[X]\left(e^{-\ln\left(1/(1-\delta)\right)}-1\right)\right)}{\exp\left(-\ln(1/(1-\delta))(1-\delta)E[X]\right)}$$

[//]:# (Equation 20)

Looking only at the right-hand side of the above equation,

$$(RHS)\Rightarrow \frac{\exp(E[X](1-\delta -1))}{\exp(-(1-\delta)E[X]\ln\left(1/(1-\delta)\right))}$$

[//]:# (Equation 21)

$$=\frac{\exp(E[X](-\delta))}{\exp(\ln(1-\delta)^{(1-\delta E[X])})}=\frac{\exp(-\delta E[X])}{(1-\delta)^{(1-\delta)E[X]}}$$

[//]:# (Equation 22)

$$=\left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}$$

[//]:# (Equation 23)

Meanwhile, 

$$\ln(1-x)=-x-\frac{x^2}{2}-\frac{x^3}{3}\cdots = -\sum_{i=1}^{N}\frac{x^n}{n}$$

[//]:# (Equation 24)

Thus,

$$(1-\delta)\ln(1-\delta) = - (1-\delta)\delta - (1-\delta)\frac{\delta^2}{2}\cdots\notag$$

$$=-\delta+\delta^2-\frac{\delta^2}{2}+\frac{\delta^3}{2}\cdots\notag$$

$$=-\delta+\delta^2/2+\cdots$$

[//]:# (Equation 25)

Therefore, 

$$(1-\delta)\ln(1-\delta) \gt -\delta +\frac{\delta^2}{2}$$

holds, and by the property of logarithm, we can know that 

$$(1-\delta)^{(1-\delta)}\gt\exp\left(-\delta + \frac{\delta^2}{2}\right)$$

[//]:# (Equation 27)

Substituting Equation (27) into Equation (23), we get:

$$\left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}\lt \left(\frac{e^{-\delta}}{e^{(-\delta+\delta^2/2)}}\right)^{E[X]}$$

$$\Rightarrow \left(\frac{e^{-\delta}}{(1-\delta)^{(1-\delta)}}\right)^{E[X]}\lt \left(e^{-\delta^2/2}\right)^{E[X]}$$

Therefore, if we substitute this result into Equation (20) and Equation (23), we get:

$$\Rightarrow P(X\lt (1-\delta)E[X])\lt \exp(-E[X]\delta^2/2)$$

[//]:# (Equation 30)

(Proof completed)

## Upper-Tail Chernoff Bound

The proof for the upper-tail part is similar to the one for the lower-tail part, so it proceeds quickly, and the parts that we skip over quickly are referred to in the proof for the lower-tail part. For a random variable $X$ like Equation (1), if we select any $\delta \in (0, 1)$[^1], the following holds:

$$P(X\gt(1+\delta)E[X]) \lt e^{-E[X]\cdot \delta^2/3}$$

[//]:# (Equation 31)

[^1]: The book 'Outlier Analysis' (Charu C. Aggarwal) shows the Chernoff Bound that holds in the range (0, 2e-1), but I still don't know how to prove it. Hence, I introduce the Chernoff Bound for the (0, 1) bound that is presented in other textbooks.

Here, $e$ denotes Euler's number.

(Proof)

As in the proof for the lower-tail part, the first step is to prove the following:

$$P(X\gt(1+\delta)E[X]) \lt \left(\frac{e^\delta}{(1+\delta)^{(1+\delta)}}\right)^{E[X]}$$

[//]:# (Equation 32)

Introduce a parameter $t>0$ and change the function from $X$ to $e^tX$. We can obtain a similar equation as for the lower-tail part if we apply Markov's inequality using the information on the left-hand side of Equation (32).

$$P(X\gt(1+\delta)E[X]) \leq \frac{E[e^{tX}]}{e^{t(1+\delta)E[X]}}$$

[//]:# (Equation 33)

By separating the numerator of the right-hand side of Equation (33) using the definition of $X$ in Equation (1), we can obtain the following:

$$E[e^{tX}]=E[e^{t\sum_i X_i}]=E\left[\prod_{i=1}^{N}e^{tX_i}\right]=\prod_{i=1}^{N}E[e^{tX_i}]$$

[//]:# (Equation 34)

On the other hand, since $X_i$ is a Bernoulli trial, equation (9) holds, and the expected value of $e^{tX_i}$ is as follows.

$$E[e^{tX_i}]=(1-p_i)e^{t\cdot 0}+p_i e^{t\cdot 1}=1-p_i+p_ie^t\notag$$

$$=1+p_i(e^t-1)=1+E[X_i](e^t-1)$$

[//]:# (Equation 35)

Also, the last equation of equation (35) coincides with the first two terms of the Taylor series of $\exp(1+E[X_i]\cdot(e^t-1))$, that is,

$$\exp(x) = 1+\frac{x}{1!}+\frac{x^2}{2}+\cdots$$

[//]:# (Equation 36)

Therefore, $\exp(E[X_i]\cdot(e^t-1))$ is

$$\exp(E[X_i]\cdot(e^t-1))=1+E[X_i](e^t-1)+\frac{1}{2!}(E[X_i](e^t-1))^2+\cdots \notag$$

$$\gt 1+E[X_i](e^t-1)$$

[//]:# (Equation 37)

Thus, we can arrange the final result in equation (34) as follows.

$$\prod_{i=1}^{N}E[e^{tX_i}]=\prod_{i=1}^{N}(1+E[X](e^t-1))<\prod_{i=1}^{N}\exp(E[X_i](e^t-1))$$

[//]:# (Equation 38)

Meanwhile,

$$\prod_{i=1}^{N}\exp(E[X_i](e^t-1))=\exp\left(E\left[\sum_{i=1}^{N}X_i\right](e^t-1)\right)=\exp(E[X](e^t-1))$$

[//]:# (Equation 39)

If we substitute the above result into equation (33) from above, we get

$$P(X\gt(1+\delta)E[X])\leq \frac{\exp(E[X](e^t-1))}{e^{t(1+\delta)E[X]}}$$

[//]:# (Equation 40)

As in the lower-tail boundary, if we differentiate the right-hand side of equation (40), find the most tight value of $t=t^\ast$ that makes the coefficient of differentiation equal to 0, then we get the following.

$$t^\ast=\ln(1+\delta)$$

[//]:# (식 41)

Substituting equation (41) into equation (40) gives us equation (32). 

$$P(X\gt(1+\delta)E[X]) \leq \frac{\exp(E[X](e^{\ln(1+\delta)}-1))}{\exp((1+\delta)E[X]\ln(1+\delta))}$$

[//]:# (Equation 42)

$$\Rightarrow P(X\gt(1+\delta)E[X]) \leq \frac{\exp(E[X]\delta)}{(1+\delta)^{(1+\delta)E[X]}}$$

[//]:# (Equation 43)

$$\Rightarrow P(X\gt(1+\delta)E[X]) \leq \left(\frac{e^\delta}{(1+\delta)^{(1+\delta)}}\right)^{E[X]}$$

[//]:# (Equation 44)

To prove equation (31) from equation (44), we just need to verify whether the following equation is true.

$$\frac{e^\delta}{(1+\delta)^{(1+\delta)}}<e^{-\mu^2/3}$$

[//]:# (Equation 45)

Taking the logarithm of both sides of equation (45), we can obtain the following equation.

$$f(\delta) = \delta - (1+\delta)\ln (1+\delta) + \frac{\delta^2}{3}< 0$$

[//]:# (Equation 46)

The differential coefficient of $f(\delta)$ is

$$f'(\delta) = 1-\frac{1+\delta}{1+\delta}-\ln(1+\delta)+\frac{2}{3}\delta = -\ln(1+\delta)+\frac{2}{3}\delta$$

$$f''(\delta) = - \frac{1}{1+\delta}+\frac{2}{3}$$

From the second differential coefficient, we can know that

$$\begin{cases}f''(\delta)\lt 0\text{ for } 0\leq \delta \lt 1/2 \\ f''(\delta) > 0 \text{ for } \delta >1/2\end{cases}$$

In other words, $f'(\delta)$ decreases at first and then increases on the interval $(0,1)$. Also, from the expression of the first differential coefficient, we can see that $f'(0)=0$ and $f'(1)\lt 0$. Therefore, we know that $f'(\delta)\lt 0$ on the interval $(0,1)$. Finally, since $f(0)=0$, we can see that $f(\delta)$ is always negative on the interval $(0,1)$.

Therefore, we can see that equation (46) is true and so is equation (31).

(End of proof)

# Reference

* Outlier Analysis (2nd e.d), Charu C. Aggarwal, Springer
* Probability and Computing (2nd e.d.), Michael Mitzenmacher and Eli Upfal, Cambridge University Press
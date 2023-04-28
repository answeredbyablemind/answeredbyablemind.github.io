---
title: $\int x^{dx}-1=$?
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20200901_en
tags: Calculus
lang: en
---

※ This posting is a reorganization of Oden Petersen's answer to [What is $\int x^{dx}-1$?](https://www.quora.com/What-is-int-x-dx-1) on Quora.

$$\int x^{dx}-1$$

As soon as you see this equation, you might think, "Is this a joke?"

Not only is it not a familiar form of equation, but it is also customary to write $dx$ at the end of the integral when calculating integrals.

However, if you think about the original meaning of the Riemann integral, you will see that this integral value leads to a valid result.

The reason for writing this post is to share Oden Petersen's teachings, which focus on the original meaning of integral symbols and explore their essential meanings once again.

Moreover, solving this problem will not only help you think about the original meaning of integrals but also the meaning of differential coefficients and partial integration, making it a faithful example to reconsider the basics of calculus.

# The original meaning of the Riemann integral

The Riemann integral is used to calculate the area under any function.

For example, the Riemann integral can be used to calculate the area of the region bounded by an arbitrary function $f(x)$ and $a\leq x \leq b$, as shown in Figure 1 below.

If we calculate the area of the region in Figure 1, we can express it as follows:

$$\int_a^b f(x) dx$$

We often overlook the original meaning of the integral symbol $\int$ and the infinitesimal displacement $dx$ and simply think of them as symbols.

<p align="center">
  <img width="400" src="https://upload.wikimedia.org/wikipedia/commons/f/f2/Integral_as_region_under_curve.svg">
  <br>
  Figure 1. The area $S$ of the interval $a\leq x\leq b$ for the function $f(x)$
  <br>
  Source: <a href="https://en.wikipedia.org/wiki/Riemann_integral" target="_blank">Wikipedia, Riemann integral</a>
</p>

But what is the original meaning of the Riemann integral?

The Riemann integral approximates the area under a function by dividing the domain into small intervals and approximating the area on each small interval using the area of a rectangle.

<p align = "center">
  <img width = "400" src = "https://upload.wikimedia.org/wikipedia/commons/2/28/Riemann_integral_regular.gif">
  <br>
  Figure 2. The Riemann integral can be described as the process of dividing a specific interval into smaller subintervals and calculating the sum of the areas of the rectangles. The number at the top represents the total area of the rectangles that converge to the function's integral.
  <br>
  Source: <a href = "https://en.wikipedia.org/wiki/Riemann_integral" target="_blank"> Wikipedia, Riemann integral</a>
</p>

In other words, the original meaning of the Riemann integral can be written as the following equation:

$$\int_a^b f(x)dx = \lim_{\Delta x \rightarrow 0}\sum_{x\in[a, b]} f(x) \Delta x$$

The integral symbol $\int$ originally came from the symbol $\sum$, and $dx$ represents the length of a very small rectangle's base that becomes smaller and smaller.

# Detailed Solution

Now, let's think about the meaning of the Riemann integral and try to solve the following equation:

$$\int x^{dx}-1 $$

Multiplying $dx/dx$ in the numerator and denominator does not affect the result of this equation.

$$\Rightarrow \int\frac{x^{dx} - 1}{dx}dx$$

Let's think separately about $(x^{dx} - 1)/dx$.

Since $dx$ is an infinitely small value, we can express it as follows:

$$\frac{x^{dx}-1}{dx}$$

$$ = \lim_{n\rightarrow 0}\frac{x^n - 1}{n}$$

$$=\lim_{n\rightarrow 0}\frac{x^n-x^0}{n-0}$$

If we think of $f(n) = x^n$, we can express it in the following form:

$$\Rightarrow\lim_{n\rightarrow 0}\frac{f(n)-f(0)}{n-0}$$

That is, this equation represents the derivative coefficient of $f(n) = x^n$ with respect to $n$, and specifically asks for the derivative coefficient value when $n=0$. (Note that it is not asking for the derivative coefficient value with respect to $x$.)

In other words, the original equation can be expressed as follows:

$$\Rightarrow \frac{d}{dn}x^n\big|_{n = 0}$$

Thinking about the derivative of an exponential function,

$$\Rightarrow x^n\ln(x)\big|_{n=0}$$

$$=\ln(x)$$

Therefore, the original equation can be written as:

$$\int x^{dx}-1 = \int \ln(x)dx$$

We can use integration by parts to compute the indefinite integral above. The integration by parts formula is as follows:

$$\int f(x)g'(x)dx = f(x)g(x) - \int f'(x)g(x)dx$$

Setting $f(x) = \ln(x)$ and $g'(x) = 1$, we get $f'(x) = 1/x$ and $g(x) = x$. Thus,

$$Equation\ (13) =  x\ln(x)-\int 1 dx$$

$$=x \ln(x)-x + C$$

(where $C$ is the constant of integration)
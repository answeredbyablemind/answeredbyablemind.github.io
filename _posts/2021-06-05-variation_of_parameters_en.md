---
title: Method of Variation of Parameters
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210605_en
tags: Differential_Equation
lang: en
---

# Introduction to the Method of Variation of Parameters

The method of variation of parameters is a technique devised to solve non-homogeneous differential equations.

While the method of undetermined coefficients can only be applied to non-homogeneous equations with polynomial, cosine, sine, or exponential functions, the method of variation of parameters has a wider range of applications.

Consider the following second-order non-homogeneous differential equation:

$$x''+p(t)x'+q(t)x=r(t)$$

The solution of the above equation can be expressed as follows:

$$x(t) = x_h(t) + x_p(t)$$

If we expand $x_h(t)$ with two basis functions, the equation can be written as follows:

$$x(t)=c_1x_1(t)+c_2x_2(t)+x_p(t)$$

The idea of the method of variation of parameters is to use the basis functions $x_1$ and $x_2$ of $x_h$ to find $x_p$, as seen in the reduction of order post.

In other words, if we set

$$x_p(t) = u(t)x_1(t) + v(t)x_2(t)$$

we can obtain suitable independent $u(t)$ and $v(t)$ for $x_1(t)$ and $x_2(t)$, respectively.

If we look closely at the expression for $x_p(t)$, we can see that we have simply replaced $c_1$ and $c_2$ of $x_h(t)$ with $u$ and $v$, respectively. This change in parameter values gave rise to the name "variation of parameters" for this method.

It is important to note that $x_p(t)$ is also a solution that satisfies equation (1). Therefore, if we substitute $x_p$ into equation (1), we can obtain the first and second derivatives as follows.

$$x_p=ux_1+vx_2$$

$$x_p'=u'x_1+ux_1'+v'x_2+vx_2'$$

Assuming $x_p''$ is unknown, let's add the following assumption before calculating it.

$$u'x_1+v'x_2 = 0$$

This assumption not only simplifies the differential equation but also plays a crucial role in finding the solution. This assumption is connected to the simultaneous equations used in Cramer's rule later. Our goal is to find appropriate $u$ and $v$ that satisfy this assumption. With this assumption, we can calculate $x_p''$ as follows:

$$x_p'' = u'x_1'+ux_1''+v'x_2'+vx_2''$$

Therefore, by substituting $x_p''$, $x_p'$, and $x_p$ into the original differential equation, we get:

$$x_p''+p(t)x_p'+q(t)x_p=r(t)$$

$$=\Big\lbrace u'x_1'+ux_1''+v'x_2'+vx_2''\Big\rbrace+p(t)\Big\lbrace (ux_1'+vx_2')\Big\rbrace + q(t)(ux_1+vx_2) = r(t)$$

Rearranging the above equation in terms of $u$ and $v$, we get:

$$\Rightarrow u\Big\lbrace x_1''+p(t)x_1'+q(t)x_1 \Big\rbrace\\ \\\quad\quad + v\Big\lbrace x_2''+p(t)x_2'+q(t)x_2 \Big\rbrace\\ \\\quad\quad\quad + u'x_1'+v'x_2' = r(t)$$

Here, the equations inside the curly brackets are all solutions to the homogeneous differential equation, so they are equal to 0. Therefore, the above equation can be written as:

$$\Rightarrow u'x_1'+v'x_2'=r(t)$$

---

Let's combine equation (7) and equation (12) and represent them as follows:

$$\begin{cases}u'x_1+v'x_2= 0 \\ \\ u'x_1'+v'x_2'=r(t)\end{cases}$$

This equation can also be expressed using matrices as a system of equations:

$$\begin{bmatrix}x_1 & x_2\\ x_1' & x_2'\end{bmatrix}\begin{bmatrix}u' \\ v'\end{bmatrix}=\begin{bmatrix}0 \\ r(t)\end{bmatrix}$$

Therefore, the solution we need to find is in terms of $u'$ and $v'$. One of the methods to solve this system of equations is Cramer's rule.

Using Cramer's rule, we can find the solution as follows:

$$u'=\frac  {\text{det}\left(\begin{bmatrix}0 & x_2 \\ r(t) & x_2'\end{bmatrix}\right)}  {\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)}$$

$$v'=\frac  {\text{det}\left(\begin{bmatrix}x_1 & 0 \\ x_1' & r(t) \end{bmatrix}\right)}  {\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)}$$

Here, we call the denominator, $\text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1' & x_2'\end{bmatrix}\right)$, the [Wronskian](https://en.wikipedia.org/wiki/Wronskian) of $x_1$ and $x_2$, which we write as $W(x_1, x_2)$.

Also, we can directly calculate the determinant of a $2 \times 2$ matrix for each numerator, so we have:

$$u'=\frac{-x_2r(t)}{W(x_1,x_2)}$$

$$v'=\frac{x_1r(t)}{W(x_1,x_2)}$$

Therefore, we can calculate $u(t)$ and $v(t)$ as:

$$u(t)=\int \frac{-x_2r(t)}{W(x_1,x_2)} dt$$

$$v(t)=\int \frac{x_1r(t)}{W(x_1,x_2)} dt$$

As a result, the particular solution is given by:

$$x_p(t) = -x_1\int\frac{x_2r(t)}{W(x_1,x_2)}dt+x_2\int\frac{x_1r(t)}{W(x_1,x_2)}dt$$

# Example problem

## Problem 1.

Find the solution of the following differential equation.

$$2x''+18x=6\tan(3t)$$

### Solution

One of the pitfalls that can be missed when solving the problem using the parameter transformation method is that if the coefficient of the highest order term is not 1, it must be made to 1.

Divide both sides by $2$ to achieve this.

$$\Rightarrow x''+9x=3\tan(3t)$$

As seen in [Solution to 2nd order homogeneous differential equation (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2_en.html), solving the homogeneous form of the above equation using the substitution method yields,

$$x_h(t) = c_1\cos(3t)+c_2\sin(3t)$$

Therefore, $x_1(t) = \cos(3t)$ and $x_2(t)=\sin(3t)$.

Let's calculate $x_1$, $x_2$, and the Wronskian first to use the solution in equation (21) to find the particular solution.

$$W(x_1, x_2) = \text{det}\left(\begin{bmatrix}x_1 & x_2 \\ x_1'& x_2'\end{bmatrix}\right)=\text{det}\left(\begin{bmatrix}\cos(3t) & \sin(3t) \\ -3\sin(3t) & 3\cos(3t)\end{bmatrix}\right)$$

$$=3\cos^2(3t)+3\sin^2(3t) = 3$$

Therefore, the particular solution is

$$x_p(t) = -\cos(3t)\int \frac{3\sin(3t)\tan(3t)}{3}dt+\sin(3t)\int \frac{3\cos(3t)\tan(3t)}{3}dt$$

Let's use the fact that $\tan(t)=\frac{\sin(t)}{\cos(t)}$.

$$\Rightarrow-\cos(3t)\int\frac{\sin^2(3t)}{\cos(3t)}dt+\sin(3t)\int\sin(3t)dt$$

$$=-\cos(3t)\int\frac{1-\cos^2(3t)}{\cos(3t)}dt+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

$$=-\cos(3t)\int\sec(3t)-\cos(3t)dt+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

$$=-\cos(3t)\left(\int\sec(3t)dt-\int\cos(3t)dt\right)+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

Let's use the fact that the integral of $\sec(t)$ is as follows:

$$\int\sec(t)dt = \ln|\sec(t)+\tan(t)|+C$$

$$\Rightarrow-\cos(3t)\left(\frac{1}{3}\ln|\sec(3t)+\tan(3t)|\right)+\cos(3t)\left(\frac{1}{3}\sin(3t)\right)+\sin(3t)\left(-\frac{1}{3}\cos(3t)\right)$$

Since the signs of the last two terms are opposite and their values are equal, we have:

$$\Rightarrow-\cos(3t)\left(\frac{1}{3}\ln|\sec(3t)+\tan(3t)|\right)$$

$$=-\frac{\cos(3t)}{3}\ln|\sec(3t)+\tan(3t)|$$

Therefore, we can find the particular solution as follows:

$$x(t) = c_1\cos(3t)+c_2\sin(3t)-\frac{\cos(3t)}{3}\ln|\sec(3t)+\tan(3t)|$$

Thus, the general solution is obtained.
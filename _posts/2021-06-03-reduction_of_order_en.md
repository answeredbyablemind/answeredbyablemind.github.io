---
title: Reduction of Order
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210603_en
tags: Differential_Equation
lang: en
---

# Prerequisites

To understand this post well, it is recommended to know about the following topics:

* [Solution to Second Order Linear Differential Equations (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2_en.html)
* [Separation of Variables Method](https://angeloyeo.github.io/2021/05/06/separable_differential_equations_en.html)

# Introduction

In the previous post [Solution to Second Order Linear Differential Equations (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2_en.html), we covered the general solution to the homogeneous second-order linear differential equations.

Let's consider the following form of a second-order linear homogeneous differential equation:

$$ax''+bx'+cx = 0$$

Here, we obtained the auxiliary equation and found the eigenvalues through the roots of the auxiliary equation.

In particular, when the root of the auxiliary equation is a double root, we have a repeated eigenvalue case, and we mentioned that in this case, we can choose a general solution as follows:

$$x(t)=c_1e^{\lambda t}+c_2 te^{\lambda t}$$

In other words, this solution $x(t)$ is like telling us to take $e^{\lambda t}$ as one solution and $te^{\lambda t}$ as another solution when only one solution $e^{\lambda t}$ is given.

Here, $e^{\lambda t}$ or $te^{\lambda t}$ is also referred to as a basis function, and we will delve deeper into this concept later. From now on, we will often use the term basis function.

In other words, if we use the term basis function, the solution to a second-order differential equation consists of a linear combination of two basis functions, and we have considered the case where we only have one basis function. 

So why does setting the new basis function as $te^{\lambda t}$ when the basis function $e^{\lambda t}$ is given solve the problem?

# How to Solve Problems

In fact, it is not a difficult problem if you know the formula for finding another basis when only one basis is given.

In this reduction of order section, let's solve the problem using the formula first, and then examine the process of how the formula was derived.

(We chose this structure because the formula derivation process may seem complicated.)

Suppose that one solution $x_1(t)$ is given for an equation such as equation (19).

$$x_2(t) = ux_1(t)$$

Assume that $u = \int U dt$ and $U = \frac{1}{x_1^2}\exp\left(-\int p(t) dt\right)$ to find $U$ for the purpose of solving the problem.

Integration constants can be ignored because they become meaningless during the process of finding the general solution by linearly combining two basic solutions.

## Example Problem 1.

Solve the following initial value problem:

$$x''-4x'+4x = 0 \quad x(0) = 12 \quad x'(0) = -3$$

---

This problem is an example problem in the case where the auxiliary equation has a repeated root, which was seen in [Solutions to Second-Order Linear ODEs (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2_en.html).

This can be considered a case where only one basic solution is given.

By solving the auxiliary equation, we can see that one of the basic solutions is:

$$x_1(t)=e^{2t}$$

Therefore, let us set the other basis solution $x_2(t)$ as follows:

$$x_2(t) = ux_1(t)$$

And set $u=\int U dt$ where

$$U = \frac{1}{(e^{2t})^2}\exp\left(-\int -4 dt\right)$$

Thus, if we compute $U$ a little more,

$$U = \frac{1}{e^{4t}}\exp(4t)=1$$

And,

$$u=\int U dt$$

So,

$$u(t) = t$$

Therefore, we can find that the other basis is $x_2(t)= ux_1(t) = te^{2t}$.

Thus, the general solution is

$$x(t) = c_1e^{2t}+c_2te^{2t}$$

With the initial values, we have

$$x(0) = c_1 = 12$$

$$x'(t) = 2c_1e^{2t}+c_2e^{2t}+2c_2te^{2t}$$

$$x'(0) = 2c_1+c_2= -3$$

$$c_2 = -3-24 =-27$$

$$\therefore x(t) = 12e^{2t}-27te^{2t}$$

Thus, we have solved the problem.

# Derivation method of Reduction of Order Formula

I don't want to explain the method of deriving the reduction of order formula because it is difficult to understand the equation cleanly.

However, it is important to note this method because it is related to the idea of [variation of parameters](https://angeloyeo.github.io/2021/06/05/variation_of_parameters_en.html) in the future.

---

Let's consider solving the following more general form of a second-order homogeneous linear differential equation:

$$x''+p(t)x'+q(t)x = 0 \qquad\text{(19)}$$

Assume that the basis function $x_1(t)$ is given.

Let's see if we can find $u$ assuming that $x_2(t) = u(t)x_1(t)$.

Why do we make such an assumption? There is no special reason to do so. In a differential equation, any method that produces a solution is valid as long as it guarantees the existence of a unique solution. In other words, it is a fight of ideas to find a solution.

However, assuming $x_2(t)=ux_1(t)$ gives us a basis function independent of $x_1(t)$, so this is a reasonable approach.

(To determine the independence of the basis, we can apply the [Wronskian](https://angeloyeo.github.io/2019/10/10/Wronskian_en.html).)

---

One important thing to note here is that both $x_1(t)$ and $x_2(t)$ are part of the solution of the second-order homogeneous differential equation. Therefore, both of the following equations are satisfied:

$$x_1''+p(t)x_1'+q(t)x_1= 0$$

$$x_2''+p(t)x_2'+q(t)x_2= 0$$

Thus, let's find $x_2'$ and $x_2''$ to use the second equation mentioned above.

$$x_2' = u'x_1 + ux'_1$$

$$x_2'' = u''x_1+u'x_1'+u'x_1' +ux_1''$$

$$=u''x_1+2u'x_1'+ux_1''$$

Therefore, if we substitute $x_2'$ and $x_2''$ into the original equation, we get:

$$x_2''+p(t)x_2'+q(t)x_2=0$$

$$\Rightarrow u''x_1+2u'x_1'+ux_1''+p(t)(u'x_1+ux_1')+q(t)ux_1=0$$

Now let's group the terms with $u''$ and $u$.

$$\Rightarrow u''(x_1) + u'(2x_1'+p(t)x_1)+u(x_1''+p(t)x_1'+q(t)x_1)=0$$

As previously mentioned, $(x_1''+p(t)x_1'+q(t)x_1)=0$, so

$$\Rightarrow u''x_1 + u'(2x_1'+p(t)x_1) = 0$$

Rewriting this expression gives

$$x_1u''+(2x_1'+p(t)x_1)u'=0$$

Dividing both sides by $x_1$ yields

$$\Rightarrow u'' + \left(2\frac{x_1'}{x_1}+p(t)\right)u'=0$$

From here, let's replace $u'$ with $U$.

Then the equation becomes

$$\Rightarrow U' + \left(2\frac{x_1'}{x_1}+p(t)\right)U=0 \quad\text{(Equation 31)}$$

Therefore, the order of the differential equation for solving has decreased from second order to first order. (That's why it's called the reduction of order technique.)

Looking at equation (31), we can see that it is in a simple form that can be solved using the [separation of variables method](https://angeloyeo.github.io/2021/05/06/separable_differential_equations_en.html).

Therefore, if we move all the terms involving $U$ to the left side and all the terms involving $t$ to the right side, we get the following.

$$\Rightarrow \frac{1}{U}dU=-\left(2\frac{x_1'}{x_1}+p(t)\right)dt$$

Here, if we integrate both sides, we get

$$\Rightarrow \ln(U)=-2\ln(x_1)-\int p(t)dt$$

$$\therefore U=\exp\left(-2\ln(x_1)-\int p(t) dt\right)$$

$$=\exp(-2\ln(x_1))\exp\left(-\int p(t) dt\right)$$

$$=\frac{1}{x_1^2}\exp\left(-\int p(t) dt\right)$$

This shows that we can find $U$ as above.

Since $U=u'$, we can compute $u$ as follows:

$$u=\int U dt$$

Then, the new basis $x_2(t)$ is given by

$$x_2(t)=ux_1(t)$$
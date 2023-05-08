---
title: Bernoulli Equation
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210510_en
tags: Differential_Equation
lang: en
---

In the previous post [Solution of First Order Linear Differential Equations](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations_en.html), we discussed methods for finding solutions to differential equations of the form:

$$\frac{dx}{dt}+p(t)x=q(t) % Equation (1)$$

This time, we will explore the solution to one of the slightly modified nonlinear differential equations, the Bernoulli differential equation.

# Form of the Bernoulli differential equation

The form of the Bernoulli differential equation is as follows:

$$\frac{dx}{dt}+p(t)x=q(t)x^n % Equation (2)$$

Here, let us assume that $p(t)$ and $q(t)$ are continuous functions in the interval we are analyzing, and $n$ is a real number.

If $n=0$ or $n=1$, it becomes a linear differential equation, so we can say that we are interested in the case where $n$ is not 0 or 1 in the Bernoulli differential equation.

# Solution to the Bernoulli differential equation

The key to the solution of the Bernoulli differential equation is to transform the nonlinear equation in Equation (2) into a linear form.

To do this, let's divide both sides of Equation (2) by $x^n$.

$$\Rightarrow x^{-n}\frac{dx}{dt}+p(t)x^{1-n}=q(t) % Equation (3)$$

Now, let's think of replacing $x^{1-n}$, which is on the left-hand side of Equation (3), with a new function $u=x^{1-n}$ to make it similar to Equation (1).

One thing we can confirm here is the result of differentiating $u$ with respect to $t$, which is obtained by applying the chain rule to the right-hand side of $u=x^{1-n}$:

$$\frac{du}{dt}=(1-n)x^{-n}\frac{dx}{dt} % Equation (4)$$

Therefore, Equation (3) can be written as follows:

$$Equation (3)\Rightarrow \frac{1}{1-n}\frac{du}{dt}+p(t)u=q(t) % Equation (5)$$

In other words, by appropriately applying substitutions to the Bernoulli differential equation, it can be transformed into a general [first-order linear differential equation](https://angeloyeo.github.io/2021/05/08/first_order_linear_equations_en.html).

# Example

Solving example problems, like any other differential equations, seems to be helpful in understanding how to solve Bernoulli differential equations.

## Problem 1

Find the solution to the following differential equation:

$$\frac{dx}{dt}+\frac{1}{t}x=t^2x^2 % Equation (6)$$

### Solution

The given equation is a Bernoulli differential equation with $n=2$. Dividing both sides of Equation (6) by $x^2$, we get:

$$\frac{1}{x^2}\frac{dx}{dt}+\frac{1}{t}\frac{1}{x}=t^2 % Equation (7)$$

Let $u=x^{-1}$. Then,

$$\frac{du}{dt}=\frac{d}{dt}(x^{-1})\frac{dx}{dt}=-\frac{1}{x^2}\frac{dx}{dt} % Equation (8)$$

Thus, Equation (7) can be written as:

$$Equation(7) \Rightarrow -\frac{du}{dt}+\frac{1}{t}u=t^2 % Equation (9)$$

Multiplying both sides of Equation (9) by $(-1)$, we get:

$$\frac{du}{dt}-\frac{1}{t}u=-t^2 % Equation (10)$$

Using the method of finding the solution to a first-order linear differential equation, multiply both sides of Equation (10) by the integrating factor $e^{\int -\frac{1}{t}dt}$.

Since $\int -\frac{1}{t}dt=-\ln t$, $e^{-\ln t}=e^{\ln 1/t}=1/t$ is the integrating factor.

Multiplying both sides of Equation (10) by $1/t$, we get:

$$\frac{1}{t}\frac{du}{dt}-\frac{1}{t^2}u=-t % Equation (11)$$

Equation (11) can be rewritten as:

$$Equation(11)\Rightarrow \frac{d}{dt}\left(\frac{u}{t}\right)=-t$$

$$\Rightarrow \frac{u}{t} = -\int t dt + C=-\frac{1}{2}t^2+C$$

$$\therefore u(t) = -\frac{1}{2}t^3+Ct$$

Originally, as $u=1/x$, we can get the following.

$$\therefore x(t) = \frac{1}{-0.5t^3+Ct}$$

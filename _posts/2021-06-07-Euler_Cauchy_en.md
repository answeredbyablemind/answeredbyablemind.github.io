---
title: Euler-Cauchy Differential Equation
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210607_en
tags: Differential_Equation
lang: en
---

# Prerequisites

To understand the contents of this post, it is recommended to know the following:

* [Solution of Second-Order Linear Differential Equations (2)](https://angeloyeo.github.io/2021/06/02/second_order_ODE_2_en.html)* 

# Introduction to Euler-Cauchy Differential Equations

An $n$th-order Euler-Cauchy differential equation refers to a differential equation of the following form:

$$a_nx^ny^{(n)}(x)+a_{n-1}x^{n-1}y^{(n-1)}(x)+\cdots+a_0y(x)=f(x)$$

The second-order Euler-Cauchy differential equation can be expressed as follows:

$$a_2x^2y''+a_1xy'+a_0y=f(x)$$

Although the second-order Euler-Cauchy differential equation is a linear differential equation, it is difficult to apply the solution method for general second-order homogeneous differential equations because the coefficients in front of the derivative terms are not constant.

## Verification of Linearity of Operator

To confirm that the Euler-Cauchy differential equation is a linear differential equation, we can follow the procedure below.

The differential operator of the Euler-Cauchy differential equation is

$$L=a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0$$

Therefore,

$$L(c_1y_1 + c_2y_2)=c_1L(y_1)+c_2L(y_2)$$

Let's verify this.

$$L(c_1y_1+c_2y_2)=\left(a_2x^2\frac{d^2}{dx^2}+a_1x\frac{d}{dx}+a_0\right)(c_1y_1+c_2y_2)$$

$$=c_1\left(a_2x^2\frac{d^2y_1}{dx^2}+a_1x\frac{dy_1}{dx}+a_0y_1\right)+c_2\left(a_2x^2\frac{d^2y_2}{dx^2}+a_1x\frac{dy_2}{dx}+a_0y_2\right)$$

$$=c_1L(y_1)+c_2L(y_2)$$

Therefore, the Euler-Cauchy differential equation is a linear differential equation.

## How to find the solution of a differential equation (1)

If the Euler-Cauchy differential equation is a homogeneous differential equation, it is convenient to find the formula as follows.

Assume that $y$ takes the form of $y=x^m$. The reason for this is that if we assume $y=x^m$, then when we differentiate $y$ twice, we get $y''=m(m-1)x^{m-2}$, and at the same time, there is an $x^2$ immediately in front of it, so the effect of reducing the exponent by differentiating it twice is canceled out.

To repeat, when solving a differential equation, if it is judged that the differential equation has a unique solution, any method of solving it is correct as long as it is solved. Therefore, the solution of a differential equation is a battle of ideas, so the method of solution is also random.

Anyway, assuming that $y=x^m$, substitute it into the original equation (2), and consider the differential equation in the form of a homogeneous differential equation, which can be written as follows.

$$Equation\ (2)\Rightarrow a_2x^2 \cdot m (m-1)(x^{m-2})+a_1x\cdot m (x^{m-1})+a_0x^m=0$$

$$=(a_2m(m-1)+a_1m+a_0)x^m =0$$

$$=(a_2m^2+(a_1-a_2)m+a_0)x^m=0$$

Here, when $x\neq 0$, if we remove the common factor $x^m$, we get:

$$\Rightarrow a_2m^2+(a_1-a_2)m+a_0=0$$

Therefore, depending on the value of $m$, we can find the solution of the differential equation.

## How to find the solution of a differential equation (2)

Another way to solve Euler-Cauchy differential equations is to use substitution, as shown below.

This method can be useful when solving nonhomogeneous Euler-Cauchy differential equations.

$$z=\ln(x)$$

$$y(x)=\phi(\ln(x))=\phi(z)$$

Then, the derivative can be substituted as follows.

$$\frac{dy}{dx}=\frac{d\phi}{dx}=\frac{d\phi}{dz}\cdot\frac{dz}{dx}=\frac{d\phi}{dz}\cdot\frac{1}{x}$$

$$\frac{d^2y}{dx^2}=\frac{d}{dx}\left(\frac{d\phi}{dz}\cdot\frac{1}{x}\right)$$

$$=\frac{d}{dx}\frac{d\phi}{dz}\frac{1}{x}+\frac{d\phi}{dz}\cdot\frac{d}{dx}\left(\frac{1}{x}\right)$$

$$=\frac{d}{dz}\frac{d\phi}{dx}\frac{1}{x}+\frac{d\phi}{dz}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d}{dz}\left(\frac{d\phi}{dz}\frac{1}{x}\right)\frac{1}{x}+\frac{d\phi}{dz}\left(-\frac{1}{x^2}\right)$$

$$=\frac{d^2\phi}{dz^2}\cdot\frac{1}{x^2}-\frac{d\phi}{dz}\frac{1}{x^2}$$

$$=\frac{1}{x^2}\left(\frac{d^2\phi}{dz^2}-\frac{d\phi}{dz}\right)$$

Therefore, the original equation (2) can be rewritten as follows.

$$Equation\ (2)\Rightarrow a_2\left(\frac{d^2\phi}{dz^2}-\frac{d\phi}{dz}\right)+a_1\frac{d\phi}{dz}+a_0\phi(z)=f(e^z)$$

$$=a_2\frac{d^2\phi}{dz^2}+(a_1-a_2)\frac{d\phi}{dz}+a_0\phi(z)=f(e^z)$$

From now on, we can use the method for solving linear second-order differential equations to solve the above equation.

It can be seen that this result shows the same result as method (1). However, there is a difference from method (1) in that a method for handling nonhomogeneous terms is introduced.

# Example

## Problem 1.

Find the solution to the following differential equation.

$$x^2u''-3xu'+3u=0$$

## Solution

Let's assume that the solution is of the form $u=x^m$ and solve the problem.

Substituting $u=x^m$, we get

$$\Rightarrow x^2(m(m-1)x^{m-2})-3x(mx^{m-1})+3x^m=m(m-1)x^m-3mx^m+3x^m=(m^2-4m+3)x^m=0$$

In order for $x^m$ to be a solution, we must avoid the condition $x=0$. Excluding this condition, we can see that the solution $u$ is

$$u(x)=c_1x+c_2x^3$$
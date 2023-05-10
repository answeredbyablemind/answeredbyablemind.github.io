---
title: Solving Second-Order Linear Differential Equations (2)
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210602_en
tags: Differential_Equation
lang: en
---

# Prerequisites

To understand this post well, it is recommended that you know the following:

* [Solving Second-Order Linear Differential Equations (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE_en.html)
* [Deriving Euler's Formula using Differential Equations](https://angeloyeo.github.io/2020/09/22/Euler_Formula_Differential_Equation_en.html)

# Second-Order Homogeneous Linear Differential Equation

A second-order linear differential equation refers to a differential equation whose highest derivative's degree is two, as follows:

$$a(t)\frac{d^2x}{dt^2} + b(t)\frac{dx}{dt} + c(t)x(t) = g(t) % Equation (1)$$

In this session, we will focus on the second-order homogeneous linear differential equation, where $a(t)$, $b(t)$, and $c(t)$ are all constants, and $g(t)=0$.

In other words, the form of the differential equation we are dealing with is as follows:

$$a\frac{d^2x}{dt^2}+b\frac{dx}{dt}+cx(t) = 0 % Equation (2)$$

Here, $a$ must not be 0.

# Solution using Substitution Method

In the previous article [Solving Second-Order Linear Differential Equations (1)](https://angeloyeo.github.io/2021/05/27/second_order_ODE_en.html), we learned that we can modify the equation into a system of differential equations and solve it to obtain a solution when finding the solution to the second-order homogeneous linear differential equation.

Recall that the crucial point was related to eigenvalues and eigenvectors.

If we substitute $y=dx/dt$ into Equation (2), the second-order differential equation becomes a system of differential equations, as follows:

$$\begin{bmatrix}dx/dt \\ dy/dt \end{bmatrix} = \begin{bmatrix}0 & 1 \\ -c/a & -b/a\end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix} % Equation (3)$$

Then, by finding the characteristic equation of the matrix in the above equation, we obtain:

$$\lambda^2+\frac{b}{a}\lambda + \frac{c}{a}=0 % Equation (4)$$

Through this characteristic equation, we can obtain the eigenvalues as follows:

$$\lambda_{1,2}=\frac{-b\pm \sqrt{b^2-4ac}}{2a} % Equation (5) $$

And the eigenvectors are as follows:

$$v_{1,2}=\begin{bmatrix}1\\ \lambda_{1,2}\end{bmatrix} % Equation (6)$$

And from the solution to the system of differential equations above,

$$\begin{bmatrix}x(t)\\y(t)\end{bmatrix}=c_1e^{\lambda_1 t}\begin{bmatrix}1 \\ \lambda_1\end{bmatrix}+c_2e^{\lambda_2 t}\begin{bmatrix}1 \\ \lambda_2\end{bmatrix} % equation (7)$$

you can obtain the solution for $x(t)$ by simply taking it out of the above expression.

Therefore,

$$x(t)=c_1 e^{\lambda_1 t}+c_2e^{\lambda_2 t} % equation (8)$$

We can see that the most important part in obtaining the solution to a second-order linear differential equation is the eigenvalues.

Let's try using the substitution method to obtain a slightly easier solution for finding the solution to a second-order linear differential equation.

The substitution method is a solution method commonly introduced in textbooks, in which we assume the solution to the differential equation as 

$$x(t) = e^{\lambda t} % equation (3+6)$$

and proceed with the solution.

Therefore, assuming that for a linear homogeneous second-order differential equation like equation (1), $x(t) = e^{\lambda t}$, we have

$$\Rightarrow a\lambda^2 e^{\lambda t} + b \lambda e^{\lambda t} + c e^{\lambda t} = 0$$

Here, if we group the terms by $e^{\lambda t}$, we get

$$\Rightarrow e^{\lambda t}(a\lambda^2+b\lambda + c)=0$$

Since $e^{\lambda t}$ is always positive, we have

$$a\lambda^2+b\lambda + c=0$$

Thus, by using the substitution method, we can obtain the characteristic equation, which is the same as equation (4).

Therefore, if we find the roots of this equation, we can determine what $\lambda$ corresponds to the eigenvalues.

Note that equation (12) is called the auxiliary equation.

Also, since a second-order equation has two roots, if we find both eigenvalues, we can obtain two solutions as follows.

$$x_1(t)=e^{\lambda_1 t} % 식 (7+6)$$

$$x_2(t)=e^{\lambda_2 t} % 식 (8+6)$$

## Case of distinct real eigenvalues

We have considered a method to find the solution of a homogeneous second-order differential equation using the substitution method as shown in equation (9).

In this case, the solution is ultimately determined by the eigenvalues obtained from the quadratic equation such as equation (12).

Then, we can easily see that the solutions of the second-order equation can be divided into real and complex cases. According to the quadratic formula,

$$\lambda = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$$

Thus, we can see that if the relationship between the coefficients $a$, $b$, and $c$ of equation (2) satisfies $b^2-4ac>0$, the equation has distinct real eigenvalues.

### Example Problem

Solve the following initial value problem:

$$x''+11x'+24x = 0\quad x(0) = 0\quad x'(0) = -7$$

---

Assuming $x=e^{\lambda t}$, we obtain the auxiliary equation:

$$\lambda^2+11\lambda+24 = 0$$

Then, solving the auxiliary equation, we get:

$$(\lambda+8)(\lambda+3) = 0$$

$$\therefore \lambda = -8 \quad \text{or}\quad \lambda = -3$$

Therefore, the general solution of this initial value problem is[^1]:

$$x(t) = c_1 e^{-8t}+c_2 e^{-3t}$$

[^1]: The reason for multiplying the constants $c_1$ and $c_2$ is that there are infinitely many possible solutions before being determined by the initial values, as we saw in the direction field or phase plane.

Using the initial conditions here,

$$x(0) = c_1+c_2 = 0$$

$$x'(0) = c_1(-8)+c_2(-3) = -7$$

$$\therefore c_1 = 1.4,\quad c_2 = -1.4$$

Therefore, the solution is

$$x(t) = 1.4e^{-8t}-1.4e^{-3t}$$

## In case of complex eigenvalues

We can see that if the relationship between coefficients $a$, $b$, and $c$ in equation (2) is $b^2-4ac<0$, then it has complex eigenvalues.

### Example Problem

Solve the following initial value problem.

$$x''-4x'+9x = 0,\quad x(0) = 0,\quad x'(0)=-8$$

Assuming $x=e^{\lambda t}$, we can obtain the auxiliary equation as

$$\lambda^2-4\lambda+9=0$$

Therefore, $\lambda$ is

$$\lambda = \frac{4\pm\sqrt{16-4*9}}{2}$$

$$=\frac{4\pm\sqrt{-20}}{2}=2\pm i \sqrt 5$$

Therefore, the general solution of the equation is

$$x(t)=c_1e^{(2+i\sqrt 5)t}+c_2e^{(2-i\sqrt 5)t}$$

Let's write $e^t$ as $\exp(t)$ from here on. (It's hard to see the exponent)

$$=c_1\exp(2t)\exp(i\sqrt 5 t)+c_2\exp(2t)\exp(-i\sqrt 5t)$$

Using the Euler's formula

$$e^{i\theta}=\cos(\theta)+i\sin(\theta)$$

we can get

$$\Rightarrow c_1\exp(2t)\left(\cos(\sqrt{5}t)+i\sin(\sqrt{5}t)\right) + c_2\exp(2t)\left(\cos(\sqrt{5}t)-i\sin(\sqrt{5}t)\right)$$

$$=\exp(2t)\left(  c_1\cos(\sqrt{5}t)+c_2\cos(\sqrt{5}t)+ic_1\sin(\sqrt{5t})-ic_2\sin(\sqrt{5}t)  \right)$$

If we replace $c_1+c_2$ and $ic_1-ic_2$ with new constants $c_3$ and $c_4$ respectively, we get

$$\Rightarrow \exp(2t)\left(c_3\cos(\sqrt{5}t)+c_4\sin(\sqrt{5}t)  \right)$$

If we substitute the initial conditions here,

$$x(0) = c_3=0$$

$$x'(t)=2\exp(2t)\left(c_3\cos(\sqrt{5}t)+c_4\sin(\sqrt{5}t)\right)+\exp(2t)\left(  -\sqrt{5}c_3\sin(\sqrt 5 t) + \sqrt{5}c_4\cos(\sqrt{5}t)  \right)$$

$$=2\exp(2t)(c_4\sin(\sqrt{5}t))+\exp(2t)(\sqrt{5}c_4\cos(\sqrt{5}t))$$

$$x'(0) = \exp(0)(\sqrt{5}c_4)=-8$$

$$\therefore c_4 = -\frac{8}{\sqrt{5}}$$

Therefore, the solution to this differential equation is

$$\therefore x(t) = -\frac{8}{\sqrt{5}}\exp(2t)\sin(\sqrt{5}t)$$

## The case of a repeated root

We can see that when the relationship between the coefficients $a$, $b$, and $c$ in equation (2) satisfies $b^2-4ac=0$, the equation has a repeated eigenvalue.

In this case, the solution method is slightly different. We set one solution as $e^{\lambda t}$ and another solution as $te^{\lambda t}$, using $\lambda$ which is the solution to the auxiliary equation as the common factor.

The reason why we can set the solution in this way will be explained in detail in another post. This technique is called [reduction of order](https://angeloyeo.github.io/2021/06/03/reduction_of_order_en.html).

### Example problem

Solve the initial value problem below.

$$x''-4x'+4x=0\quad x(0) = 12\quad x'(0) = -3$$


The auxiliary equation for this differential equation is as follows.

$$\lambda^2-4\lambda+4 = 0$$

Therefore, $\lambda = 2\text{(repeated root)}$.

So, we can consider the general solution as follows.

$$x(t)=c_1e^{2t}+c_2te^{2t}$$

Using the initial conditions,

$$x(0) = c_1 = 12$$

$$x'(t) = 2c_1e^{2t}+c_2e^{2t}+2c_2te^{2t}$$

$$x'(0) = 2c_1+c_2= -3$$

$$c_2 = -3-24 =-27$$

$$\therefore x(t) = 12e^{2t}-27te^{2t}$$
---
title: Vector Field and Path Independence
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20201001_en
tags: Calculus
lang: en
---
When performing a line integral, some vector fields show the same result regardless of the path. This is called path independence. If a vector field is the gradient of some scalar function F, then it is said to be path-independent. This is a result that naturally follows from the fundamental theorem of calculus. Let's now explore the meaning of this statement.

The proof and content were referenced from a Khan Academy YouTube video.

# 1. Conservative field

Assume there is a vector field on the $xy$ plane, and its equation is as follows:

$$f(x,y) = y^2\hat{i}+2xy\hat{j}$$

(For now, the specific equation of the vector field may not be important.)

If this vector field satisfies the following equation:

$$\int_C\vec{f}\cdot d\vec{r} = \int_{C_2}\vec{f}\cdot d\vec{r} = \int_{C_3}\vec{f}\cdot d\vec{r}$$

where $C$, $C_2$, and $C_3$ are curves with the same start and end points, then it is called a conservative field.

In other words, if the value of the line integral is the same for different paths with the same start and end points, regardless of the path taken, it can be called a conservative field.

# 2. Multivariate chain rule

For any scalar function $f(x(t), y(t))$, the following holds true:

$$\frac{df}{dt}=\frac{\partial f}{\partial x}\frac{dx}{dt} + \frac{\partial f}{\partial y}\frac{dy}{dt}$$

What the chain rule above is saying is that we want to know the rate of change of $f$ when $t$ changes a little bit. However, since $f$ is related to $x$ and $y$, and $x$ and $y$ are related to $t$, this relationship is formed.

# 3. Conditions and Proof of the Conserved Field

For a vector field to be a conserved field, it must be the gradient of some scalar function. In other words,

$$\vec{f}(x,y) = \nabla F$$

$$ \text{where} \notag$$

$$F = F(x,y)$$

That is,

$$\vec{f}(x,y) = \frac{\partial F}{\partial x}\hat{i} + \frac{\partial F}{\partial y}\hat{j}$$

Proof is possible as follows.

$$d\vec{r} = dx\hat{i} + dy\hat{j}$$

Therefore, we can say:

$$\frac{d\vec{r}}{dt} = \frac{dx}{dt}\hat{i} + \frac{dy}{dt}\hat{j}$$

Furthermore, it can be written as follows: 

$$d\vec{r} = \frac{dx}{dt}dt\hat{i} + \frac{dy}{dt}dt\hat{j}$$

Now, let's determine whether the vector field $\vec{f}$ is a conservative vector field. Let the range of the parameter $t$ be $a \leq t \leq b$.

To calculate the line integral, let's first find $\vec{f} \cdot d\vec{r}$.

$$\vec{f}\cdot d\vec{r} = \left(\frac{\partial F}{\partial x}\hat{i} + \frac{\partial F}{\partial y}\hat{j}\right)\cdot \left(\frac{dx}{dt}dt\hat{i}+\frac{dy}{dt}dt\hat{j}\right)$$

$$=\frac{\partial F}{\partial x}\frac{dx}{dt}dt + \frac{\partial F}{\partial y}\frac{dy}{dt}dt$$

Therefore, the line integral can be written as:

$$\int_C\vec{f}\cdot d\vec{r} = \int_{t = a}^{t = b}\frac{\partial F}{\partial x}\frac{dx}{dt}dt + \frac{\partial F}{\partial y}\frac{dy}{dt}dt$$

$$=\int_{a}^{b}\left(\frac{\partial F}{\partial x}\frac{dx}{dt} + \frac{\partial F}{\partial y}\frac{dy}{dt}\right)dt$$

The final expression (13) can be written as:

$$\frac{\partial F}{\partial x}\frac{dx}{dt}+\frac{\partial F}{\partial y}\frac{dy}{dt}=\frac{dF}{dt}$$

Thus, the line integral above can be written as:

$$\int_C\vec{f}\cdot d\vec{r} = \int_a^b\left(\frac{\partial F}{\partial x}\frac{dx}{dt} + \frac{\partial F}{\partial y}\frac{dy}{dt}\right)dt=\int_a^bdF = F(b) - F(a)$$

Therefore, in a conservative vector field, the line integrals of paths that have the same starting and ending points yield the same result regardless of the path taken. 

This can be explained by the fundamental theorem of calculus, as mentioned earlier.
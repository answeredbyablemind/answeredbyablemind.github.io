---
title: Why does Wronskian work?
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20191010_en
tags: Linear_Algebra
lang: en
---

# Definition

Let's first understand how the linear dependence/independence of functions is defined[^1].

[^1]: All definitions in this section are quoted from Dennis G. Zill and Michael R. Cullen's Advanced Engineering Mathematics 3rd edition.

| DEFINITION 1. Linear Dependence/Independence |
| --------- |
|A set of functions $f_1(x), f_2(x),\cdots f_n(x)$ is said to be linearly dependent on an interval $I$ if there exist constants $c_1, c_2, \cdots c_n$, not all zero, such that <br><br><center>$$c_1f_1(x)+c_2f_2(x)+\cdots+c_nf_n(x) = 0$$</center><br><br>for every $x$ in the interval. If the set of functions is not linearly dependent on the interval, it is said to be linearly independent|

In other words, a set of $n$ functions is linearly independent if the equation

$$c_1f_1(x) + c_2f_2(x)+\cdots+c_nf_n(x) = 0$$

is satisfied for all $x$ in the interval only when all coefficients $c_i(i=1,2,\cdots,n)$ are zero.

Now let's look at how the Wronskian is defined.

| DEFINITION 2. Wronskian |
| --------- |
|Suppose each of the functions $f_1(x), f_2(x), \cdots, f_n(x)$ possesses at least $n-1$ derivatives. The determinant <br><br><center>$$W(f_1,f_2,\cdots,f_n) = \begin{vmatrix}    f_1 & f_2 & \cdots & f_n \\    f_1' & f_2' & \cdots & f_n' \\    \vdots & \vdots & \vdots & \vdots \\    f_1^{(n-1)} &f_2^{(n-1)} & \cdots & f_n^{(n-1)} \\    \end{vmatrix}$$</center> <br><br> where the primes denote derivatives, is called the Wronskian of the function.|

Note that when the Wronskian $W$ is not equal to zero, we say that the set of functions $f_1(x), f_2(x), \cdots, f_n(x)$ is linearly independent.

It is important to note that just because the Wronskian $W$ is zero does not necessarily mean that the set of functions is always linearly dependent.

# Wronskian and Linear Independence Test

To understand the idea of the Wronskian, let's consider the following process. For a set of functions $f_1(x), f_2(x), \cdots, f_n(x)$ that have at least $n-1$ derivatives, we can think of the following equation:

$$c_1f_1(x)+c_2f_2(x)+\cdots+c_nf_n(x) = 0$$

This equation represents a linear combination of the functions we initially wrote. Depending on the conditions, we can differentiate the above equation with respect to $x$ as follows:

$$c_1f_1(x) + c_2f_2(x)+\cdots+c_nf_n(x)=0$$

$$c_1f_1'(x) + c_2f_2'(x)+\cdots+c_nf_n'(x)=0$$

$$\vdots \notag$$

$$c_1f_1^{(n-1)}(x) + c_2f_2^{(n-1)}(x)+\cdots+c_nf_n^{(n-1)}(x)=0$$

Now we have obtained a system of $n$ simultaneous equations with $n$ unknowns $c_i(i=1,2,\cdots,n)$. We can represent these $n$ equations as a matrix and a vector multiplication.

$$
    \begin{pmatrix}
    f_1(x) & f_2(x) & \cdots & f_n(x) \\
    f_1'(x) & f_2'(x) & \cdots & f_n'(x) \\
    \vdots & \vdots & \vdots & \vdots \\
    f_1^{(n-1)}(x) & f_2^{(n-1)}(x) & \cdots & f_n^{(n-1)}(x) \\
    \end{pmatrix}

    \begin{pmatrix}
    c_1 \\
    c_2 \\
    \vdots \\
    c_n \\
    \end{pmatrix}

  = 
    
    \begin{pmatrix}
    0 \\
    0 \\
    \vdots \\
    0 \\
    \end{pmatrix}
$$

Now let's confirm the fact that we can determine linear independence using the Wronskian through a proof by contradiction.

In equation (8), the determinant of the matrix on the left-hand side is the Wronskian $W$. Let's assume that the functions are linearly dependent even though $W \neq 0$.

This means that the matrix on the left-hand side of equation (8) has an inverse, and the only solution for $c_i(i=1,2,\cdots,n)$ is the zero vector.

According to the initial Definition 1, when the unique solution for $c_i$ is the zero vector, the function set $f_1(x), f_2(x), \cdots, f_n(x)$ is linearly independent. This is a clear contradiction.

Therefore, if the Wronskian is not equal to zero, the function set $f_1(x), f_2(x), \cdots, f_n(x)$ is always linearly independent.
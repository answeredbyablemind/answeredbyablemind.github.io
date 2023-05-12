---
title: Cholesky Decomposition
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210617_en
tags: Linear_Algebra
lang: en
---

# Prerequisites

To better understand the content of this post, it is recommended to be familiar with the following:

* [LU decomposition](https://angeloyeo.github.io/2021/06/16/LU_decomposition_en.html)

# Another way to perform LU decomposition

In the [LU decomposition](https://angeloyeo.github.io/2021/06/16/LU_decomposition_en.html) post, it was introduced that LU decomposition is a matrix decomposition method obtained using the basic row operations used in performing Gaussian elimination.

However, even if we assume that matrix $A$ is decomposed into the product of a lower triangular matrix and an upper triangular matrix, we can still obtain the result of LU decomposition as it is.

Let's consider that the matrix $A$ of arbitrary size $3 \times 3$ can be decomposed into the following form.

$$
    \begin{bmatrix}
        a_{11} & a_{12} & a_{13} \\
        a_{21} & a_{22} & a_{23} \\
        a_{31} & a_{32} & a_{33} \\
    \end{bmatrix} = 
    \begin{bmatrix}
        1      & 0      & 0 \\
        l_{21} & 1      & 0 \\
        l_{31} & l_{32} & 1 \\
    \end{bmatrix}
    \begin{bmatrix}
        u_{11} & u_{12} & u_{13} \\
        0      & u_{22} & u_{23} \\
        0      & 0      & u_{33} \\
    \end{bmatrix}
$$

$$=\begin{bmatrix}
    u_{11}          & u_{12}                      & u_{13} \\
    u_{11}l_{21}    & u_{12}l_{21} + u_{22}       & u_{13}l_{21}+u_{23} \\
    u_{11}l_{31}    & u_{12}l_{31} + u_{22}l_{32} & u_{13}l_{31}+u_{23}l_{32}+u_{33} \\
\end{bmatrix}$$

Based solely on these results, it can be seen that $u_{11}$, $u_{12}$, and $u_{13}$ are the same as $a_{11}$, $a_{12}$, and $a_{13}$, respectively, and the internal values of the next row can be obtained from the calculated $u_{11}$, $u_{12}$, and $u_{13}$. In this way, the elements of $L$ and $U$ can be sequentially obtained.

# LU factorization of symmetric matrices?

For symmetric matrices[^1], LU factorization can also be considered in the following way.

[^1]: If it is a complex matrix, it can be extended to a Hermitian matrix. However, since the idea of Cholesky factorization can also be applied to Hermitian matrices in the same way as for symmetric matrices, let us consider only symmetric matrices with real components in this post.

If $A$ is a symmetric matrix, **could** it be factored as follows?

$$A=LL^T=L^TL$$

Because a symmetric matrix satisfies $A=A^T$, we could write $(LL^T)^T = LL^T$, and since $L^T$ is an upper triangular matrix, we might obtain a result similar to the $LU$ decomposition.

[//]:# (Why is Positive Definite condition necessary?)

However, just because $A$ is a symmetric matrix, it doesn't always mean that $A$ can be factored as $A=LL^T=L^TL$. Let's think about what characteristics any $L$ must have.

Consider the product of the matrix $L$ and an arbitrary vector $x$, $Lx$. The L2-norm value of this $Lx$ vector is always greater than or equal to 0.

And the L2-norm can also be calculated by inner product, which can be written as follows:

$$|Lx|^2 = (Lx)^T(Lx)$$

By the properties of the transpose operator, we can rearrange this as follows:

$$x^TL^TLx$$

And by grouping the parentheses around $L^TL$, we have:

$$x^T(L^TL)x$$

And if we let $(L^TL)$ be some matrix $A$,

$$x^TAx$$

and since this calculation comes from a method of calculating the L2-norm of an arbitrary vector $Lx$, we have

$$x^TAx\geq 0$$

We call a matrix that satisfies the property $x^TAx\geq 0$ a semi-positive definite matrix. In other words, the matrix that satisfies $A=LL^T=L^TL$ must be semi-positive definite.

Assuming that matrix A is a square matrix, symmetric, and semi-positive definite, it can be factorized as $A=LL^T=L^TL$ using Cholesky factorization method.

# Calculation of Cholesky factorization

Cholesky factorization can be computed in a similar context as in the previous method of LU decomposition.

Assuming that matrix A is symmetric and semi-positive definite, it can be factorized as follows.

$$A = LL^T= 
    \begin{bmatrix}
        L_{11} & 0      & 0 \\
        L_{21} & L_{22} & 0 \\
        L_{31} & L_{32} & L_{33} \\
    \end{bmatrix}
    \begin{bmatrix}
        L_{11} & L_{21} & L_{31} \\
        0      & L_{22} & L_{32} \\
        0      & 0      & L_{33} \\
    \end{bmatrix}
$$

When calculating the matrix product, the following result can be obtained:

$$\Rightarrow \begin{bmatrix}
    L_{11}^2     &                           & \text{(symmetric)}\\\\
    L_{21}L_{11} & L_{21}^2+L_{22}^2         &             \\\\
    L_{31}L_{11} & L_{31}L_{21}+L_{32}L_{22} & L_{31}^2+L_{32}^2+L_{33}^2
\end{bmatrix}$$

By comparing the elements of matrix $A$ to the above calculation result one-to-one, it can be seen that they can be organized as follows:

$$L=\begin{bmatrix}
    \sqrt{a_{11}}    &    0 & 0 \\\\
    a_{21}/L_{11}    &    \sqrt{a_{22}-L_{21}^2}  & 0 \\\\
    a_{31}/L_{11}    &    (a_{32}-L_{31}L_{21})/L_{22} & \sqrt{a_{33}-L_{31}^2-L_{32}^2}
\end{bmatrix}$$

It is also possible to consider generalizing this pattern as follows.

$$L_{jj}=\sqrt{a_{jj}-\sum_{k=1}^{j-1}L_{jk}^2}$$

$$L_{ij}=\frac{1}{L_{jj}}\left(a_{ij}-\sum_{k=1}^{j-1}L_{ik}L_{jk}\right)\quad \text{for }i>j$$

## MATLAB Implementation

One of the algorithms that directly implements the calculation method of Cholesky factorization is the Cholesky–Banachiewicz algorithm.

This algorithm is implemented by computing the lower triangular matrix of Cholesky factorization for each row.

Below is an implementation of the Cholesky-Banachiewicz algorithm in MATLAB.

```{MATLAB}
A = [4,12,-16;12,37,-43;-16,-43,98];
L = zeros(size(A));

for i = 1:size(A,1)
    for j = 1:i
        my_sum = 0;
        
        for k = 1:j-1
            my_sum = my_sum + L(i,k)*L(j,k);
        end
        
        if i == j
            L(i,j)=sqrt(A(i,i)-my_sum);
        else
            L(i,j)=(1/L(j,j)*(A(i,j)-my_sum));
        end
    end
end

L
transpose(chol(A))
```

From the above result, it can be confirmed that the results of L and transpose(chol(A)) are the same.

# References

* [Cholesky decomposition, Wikipedia](https://en.wikipedia.org/wiki/Cholesky_decomposition)
---
title: Proof of Central Limit Theorem
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20200110_en
tags: Statistics
lang: en
---

# Essential Background Knowledge for the Proof of the Central Limit Theorem

## Convolution of the Sum of Probability Variables and Probability Density Functions

Let's consider independent random variables X and Y. Let the probability mass functions of X and Y be denoted as $m_1(x)$ and $m_2(x)$, respectively.

Now, let's think about a new random variable defined as $Z=X+Y$. For any integer $z$, in order for the relation $Z=X+Y$ to hold when $X=k$ for some integer $k$, it must be the case that $Y=z-k$. From the perspective of events, we can write this as 

$$(X=k)\text{ and }(Y=z-k)$$

must hold. Now, the probability that $Z=z$ for all integers $k$ can be determined as follows:

$$P(Z=z) = \sum_{k=-\infty}^{\infty}{P(X=k)P(Y=z-k)}$$

Therefore, the probability mass function of the sum $Z$ of independent random variables $X$ and $Y$ can be expressed as follows:

$$m_3(j) = \sum_km_1(k)m_2(j-k) \text{ for }j = \cdots, -2, -1, 0, 1, 2, \cdots$$

Using this logic, we can express the sum of $n$ independent random variables $X_1, X_2, \cdots, X_n$ as $S=X_1+X_2+\cdots+X_n$, which can also be expressed as $S_n=S_{n-1}+X_n$. Therefore, the probability mass function (pmf) of the sum of an infinite number of independent random variables can be obtained using convolution.

Furthermore, for continuous random variables $X$ and $Y$, the following relationship holds. Let $f(x)$ and $g(x)$ be the probability density functions of $X$ and $Y$, respectively, defined for all real numbers.

The probability density function of $X+Y$ can be expressed as the convolution of the two probability density functions:

$$(f*g)(z) = \int_{-\infty}^{\infty}f(z-y)g(y)dy = \int_{-\infty}^{\infty}g(z-x)f(x)dx$$

## Characteristic Function

In signal processing, the Fourier transform plays a role in transforming a time function into the frequency domain in the time domain, and the inverse Fourier transform plays a role in transforming a function in the frequency domain into the time domain. Moreover, functions in the time domain and their counterparts in the frequency domain have a one-to-one mapping.

In statistics, utilizing this relationship, the concept of a characteristic function was introduced. It mathematically has the same expression as the inverse Fourier transform and inherits properties of the Fourier transform, and is also used in relation to concepts related to moments of probability density functions that are unique to statistics.

In probability statistics, the characteristic function for a random variable is defined as follows:

| DEFINITION. Characteristic Function |
| --------- |
| The characteristic function of a probability density function $f_X(x)$ for a random variable is given by <br> <center> $$\phi_X(t) = E\left[e^{jtx}\right]=\int_{-\infty}^{\infty}e^{jtx}f_X(x)dx$$</center>|

Among the properties of the characteristic function necessary for the proof of the Central Limit Theorem (CLT), the following can be mentioned:

1) Each random variable has a unique characteristic function. In other words, there is a one-to-one mapping relationship between a random variable and its corresponding characteristic function.

2) For p independent random variables X_1, X_2, ..., X_p, the following holds true. As mentioned earlier, the pdf of the sum of independent random variables is represented as a convolution. Therefore, the characteristic function of the sum of independent random variables in the domain of the characteristic function can be expressed as the product of the characteristic functions of the individual independent random variables.

Meanwhile, using the Maclaurin series, we can express $e^{jtx}$ as follows:

$$e^{jtx}=\sum_{k=1}^{\infty}\frac{(jtx)^k}{k!}=1+jtx+\frac{(jtx)^2}{2!}+\frac{(jtx)^3}{3!}+\cdots = 1+jtx+\frac{(jtx)^2}{2!}+O(t^2)$$

Here, $O(t^2)$ represents the combination of terms from the fourth term onwards. Then, calculating the characteristic function is related to calculating the moments of the pdf. Let's see the following. For any probability density function $f_Y(y)$,

$$\phi_Y(t) = \int_{-\infty}^{\infty}e^{jty}f_Y(t)dy=\int_{-\infty}^{\infty}\left\{1+jty-\frac{t^2}{2}y^2+O(t^2)\right\}f_Y(y)dy\notag$$

$$=\int_{-\infty}^{\infty}f_Y(y)dy + \int_{-\infty}^{\infty}yf_Y(y)dy - \frac{t^2}{2}\int_{-\infty}^{\infty}y^2f_Y(y)dy+O(t^2)\notag$$

$$=1+jtE\left[y\right]-\frac{t^2}{2}E\left[y^2\right]+O(t^2)$$

and so on.

# Proof of the Central Limit Theorem

Let's consider a random sample of $N$ observations, denoted as $X_i \sim iid(\mu, \sigma^2)$, drawn from a population. Then, the sample mean is given by:

$$\bar{X}_N=\frac{1}{N}\sum_{i=1}^{N}X_i$$

The expected value of $\bar{X}_N$ is:

$$E\left[\bar{X}_N\right] = E\left[\frac{1}{N}\sum_{i=1}^{N}X_i\right]=\frac{1}{N}\sum_{i=1}^{N}E\left[X_i\right] = \frac{1}{N}(N\times\mu) = \mu$$

And the variance of $\bar{X}_N$ is:

$$Var\left[\bar{X}_N\right] = Var\left[\frac{1}{N}\sum_{i=1}^{N}X_i\right]=\frac{1}{N^2}\sum_{i=1}^{N}Var\left[X_i\right]=\frac{1}{N^2}\left(N\sigma^2\right)=\frac{\sigma^2}{N}$$

Now, if we define a standardized variable for $\bar{X}_N$ as $Z_N$:

$$Z_N = \frac{\bar{X}_N-\mu}{\left(\frac{\sigma}{\sqrt{N}}\right)}=\frac{N\bar{X}_N-N\mu}{\sqrt{N}\mu} = \frac{\sum_{i=1}^{N}(X_i-\mu)}{\sqrt{N}\sigma} \notag$$

$$=\sum_{i=1}^{N}\left(\frac{X_i-\mu}{\sqrt{N}\sigma}\right)= \sum_{i=1}^{N}\frac{y_i}{\sqrt{N}}$$

Where $y_i = (X_i-\mu)/\sigma$, and thus $E[y_i]=0$ and $Var[y_i]=Var[X_i]/\sigma^2=1$.

Then, the characteristic function $\phi_Y(y)$ can be calculated as follows:

$$\phi_Y(y) = 1+0-\frac{t^2}{2}+O(t^2) = 1-\frac{t^2}{2}+O(t^2)$$

Furthermore, from earlier results, we know that the sum of random variables is expressed as convolution in the probability density function. Also, upon closer examination of the characteristic function, we can see that it resembles the inverse Fourier transform, which in signal processing theory, states that the convolution of functions in the frequency domain is equivalent to the multiplication of their respective transforms in the time domain.

Therefore, $Z_N$ is composed of sums of $Y$ variables, and this will be represented as the convolution of $f_Y(y)$, and once again, in the domain of characteristic functions, it can be expressed as the multiplication of characteristic functions. Hence, the following holds true.

$$\phi_{Z_N}(t) = [\phi_Y(t/\sqrt{N})]^N = [1-\frac{t^2}{2N}+O\left(\frac{t^2}{N}\right)]^N$$

Assuming that $N$ goes to infinity, we can consider the following limit:

$$\lim_{N\rightarrow\infty}\phi_{Z_N}(t) = \lim_{N\rightarrow\infty}\left[1-\frac{t^2}{2N}+O\left(\frac{t^2}{N}\right)\right]^N$$

From this, we can observe that $O(\frac{t^2}{N})$ converges to 0 faster than $\frac{t^2}{2N}$. Therefore, the above limit converges as follows:

$$\lim_{N\rightarrow \infty}\phi_{Z_N}(t) = \lim_{N\rightarrow\infty}\left[1-\frac{t^2}{2N}\right]^N=e^{-t^2/2}$$

On the other hand, the characteristic function of a Gaussian distribution with mean 0 and standard deviation 1 is $e^{-t^2/2}$. Since the characteristic function has a one-to-one mapping relationship with a random variable, the distribution of the sample mean follows a Gaussian distribution.
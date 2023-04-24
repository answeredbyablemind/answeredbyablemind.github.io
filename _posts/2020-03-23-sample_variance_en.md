---
title: Sample variance is divided by n-1 instead of n
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20200323_en
tags: Statistics
lang: en
---

# The expected value of sample variance should be equal to population variance.

In statistics, estimators are used to estimate population parameters. Representative population parameters include population mean, population variance, and population proportion. Ideally, as the sample size increases, the estimated value calculated from the sample should be equal to the parameter being estimated. Therefore, the ideal estimator is one whose expected value is equal to the population parameter.

One of the representative sample statistics, sample variance, is defined as follows:

$$s^2 = \frac{1}{n-1}\sum_{k=1}^n{\left(X_k-\bar{X}\right)^2}$$

The reason for dividing by n-1 instead of n in the definition of sample statistic is that this way the expected value of sample variance becomes equal to the population variance.

## Proof: Expected Value of Sample Variance = Value of Population Variance

Let's consider a sample of size n with sample mean $\bar{X}$ and sample variance $s^2$, where the population mean is denoted as $m$ and population variance is denoted as $\sigma^2$.

Now, let's verify if $E(s^2)=\sigma^2$.

$$E\left[s^2\right]=\frac{1}{n-1}E\left[\sum_{k=1}^n\left(X_k-\bar{X}\right)^2\right]$$

Let's focus on the summation part separately.

$$\sum_{k=1}^n\left(X_k-\bar{X}\right)^2 

= \sum_{k=1}^{n}\left((X_k-m) + (m-\bar{X})\right)^2$$

$$=\sum_{k=1}^{n}\left(
  (X_k-m)^2 + 2(X_k-m)(m-\bar{X})+(m-\bar{X})^2
  
  \right)$$

$$=\sum_{k=1}^{n}
  (X_k-m)^2 + 2(\bar{X}-m)n(m-\bar{X})+n(m-\bar{X})^2
  $$

$$=\sum_{k=1}^{n}(X_k-m)^2-n(\bar{X}-m)^2$$

$$\therefore E\left[s^2\right]=
  \frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2\right]\notag$$

$$=\frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-m\right)^2-n\left(\bar{X}-m\right)^2\right]$$

At this point,

$$E\left[\left(X_k-m\right)^2\right]=\sigma^2$$

and,

$$E\left[\left(\bar{X}-m\right)^2\right]=V\left[\bar{X}\right]=\frac{\sigma^2}{n}$$

hold.

Therefore,

$$E\left[s^2\right]=\frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2\right]= \frac{1}{n-1}E\left[\sum_{k=1}^{n}\left(X_k-m\right)^2-n\left(\bar{X}-m\right)^2\right]$$

holds.

At this point, since the expectation operator is a linear operator,

$$=\frac{1}{n-1}\left[\sum_{k=1}^{n}E\left[(X_k-m)^2\right]-n(E\left[(\bar{X}-m\right)^2])\right]$$

$$=\frac{1}{n-1}\left(n\sigma^2-n\frac{\sigma^2}{n}\right)=\sigma^2$$

Therefore,

$$s^2=\frac{1}{n-1}\sum_{k=1}^{n}\left(X_k-\bar{X}\right)^2$$

must hold for the expected value of the sample variance to be equal to the population variance.

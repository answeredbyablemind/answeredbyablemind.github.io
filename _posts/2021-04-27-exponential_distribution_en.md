---
title: Exponential Distribution
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20210427_en
tags: Statistics
lang: en
---

<center>
  <iframe width = "500" height = "500" frameborder = "0" src="https://angeloyeo.github.io/p5/2021-04-27-exponential_distribution/"></iframe>
  <br>
  Let's explore the appearance of exponential distribution in various cases by modifying the parameter λ.
  <br>
  What does the variable t on the x-axis of the exponential distribution represent?
  <br>
  Can you explain what the shape of the exponential distribution means?
  <br>
  <br>
</center>

# Prerequisites

To understand exponential distribution, it is recommended that you know the following:

* [Poisson distribution](https://angeloyeo.github.io/2021/04/26/Poisson_distribution_en.html)

# Definition of exponential distribution

The probability density function of the exponential distribution is defined as

$$ f(x;\lambda) = \begin{cases}  \lambda e^{-\lambda x} & \text{ where } x\geq 0 \\[.5em]  0 & \text{ where } x \lt 0\end{cases}$$

When events are independent of each other and the number of events occurring in a fixed time period follows a Poisson distribution, the waiting time until the next event follows an exponential distribution.

# Utility of exponential distribution

Exponential distribution is closely related to Poisson distribution.

Let's think again about what Poisson distribution is.

Poisson distribution refers to the distribution of the probability of an event occurring k times in a fixed time period, when the average number of events occurring in the same time period is λ.

$$P(K=k) = \frac{\lambda^k e^{-\lambda}}{k!}$$

Now, the problem we can think of here is the probability of the time until such an event occurs for the first time being less than T hours.

This can be a very important question in industry. For example, the probability of the time until the first patient arrives at a clinic where patients come rarely being less than 5 hours, can be approached probabilistically with precision.

So, this could be an answer to the question "Will the first patient come within five hours?" or a problem like "When will the first registered customer arrive?", among others.

# Derivation of the exponential distribution

If we have the distribution described above and call this distribution (i.e., the probability density function) $f(t)$, then the probability that the first event occurs within $T$ time units can be calculated as follows:

$$Pr(0\leq t\leq T)=\int_{0}^{T}f(t)dt$$

Meanwhile, when using the Poisson distribution to solve the above problem, using the complement may be a good approach.

By using the Poisson distribution, the probability that an event will not occur in $T$ time units can be calculated, and this can be subtracted from the total probability (1) to obtain the probability that the event will occur in $T$ time units.

In other words, the probability of the event occurring $T$ times is calculated by multiplying $P(K=0)$ by $T$.

$$\left(P(K=0)\right)^T$$

Here, ${}^T$ denotes to the T-th power.

Therefore, the probability of the event occurring in $T$ time units is:

$$1-(P(K=0))^T = 1-\left(\frac{\lambda^k e^{-\lambda}}{k!}\right)^T_{k=0} = 1-e^{-\lambda T}$$

In other words,

However, the probability calculated using the probability density function $f(t)$ that can be considered an exponential distribution is the same as equation (2):

$$\int_{0}^{T}f(t)dt = 1-e^{-\lambda T}$$

Therefore,

$$f(t) = \frac{d}{dt}(1-e^{-\lambda t}) = \lambda e^{-\lambda t}$$

and this distribution is an exponential distribution.

# Example problem of exponential distribution

## Problem 1

At a small rural health center, patients do not come often, so it is quiet. If 3 patients come on average per day, what is the probability that the first patient will visit within 5 hours?

### Solution to Problem 1

Assuming that 3/24 patients visit every hour because there are 24 hours in a day, the problem follows an exponential distribution of the form:

$$f(t) = \frac{3}{24}\exp\left(-\frac{3}{24}t\right)$$

Therefore, the probability that the first patient will visit within 5 hours is:

$$\int_{0}^{5}\frac{3}{24}\exp\left(-\frac{3}{24}t\right)dt = \left[-\exp\left(-\frac{3}{24}t\right)\right]_0^5 = \exp(0) - \exp\left(-\frac{5}{8}\right) = 0.4674$$

Thus, there is a 46% chance that the first patient will visit within 5 hours.
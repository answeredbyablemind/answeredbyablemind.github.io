---
title: Information Entropy
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20201026_en
tags: Statistics Machine_Learning
lang: en
---

# What is Information?

When studying, we often get stuck on terminology.

In particular, I remember struggling with many terms while studying statistics.

For example, the term ["null hypothesis"](https://angeloyeo.github.io/2020/03/25/hypothesis_en.html)  was so unfamiliar that it was a good example of a term that took a lot of effort to learn.

However, the term "information" that I want to talk about in this post is actually a term that is used too often in everyday life, and therefore it can be a case where it is difficult to study.

What is information? There are several ways to interpret "information" from various perspectives.

For example, from the perspective of a database, information refers to data that has been processed to make it easy to use.

This perspective is entirely based on the viewpoint of computer science, and it can be seen as an abstract concept of information that can be thought of from the perspective of using data.

Then, mathematically speaking, what does "information" mean in statistics?

I want to call the concept of information in statistics a "wow factor". In other words, it is a factor that is surprising enough to make one say "wow".

That is, in statistics, the more surprising the content, the more information it contains. 

This concept can also be seen as a reinterpretation of the concept of probability, in other words, the lower the probability of an event, the higher the information content, because it is an event that is unlikely to occur.

So, if we define information mathematically, it would probably be best to define it as a value that is inversely proportional to the probability value.

In other words, the concept of information (expressed as "Info" in the equation) for a random variable X of any event can be thought of as follows:

$$\text{Info} \propto \frac{1}{P(X)}$$

[//]:# (Equation 1)

## Informational Quantity

More specifically, in statistics, informational quantity is defined as follows:

For a discrete random variable $X$,

$$I(x)=-\log_b(P(X))$$

[//]:# (Equation 2)

where $b$ is the base of the logarithm, which can be $2$, $e$, or $10$, depending on the application. (The unit of informational quantity when each base is used is bit, nat, and dit, respectively.)

The negative sign in the definition of informational quantity is because logarithm is used in the definition, as shown below:

$$\log_b\left(\frac{1}{P(X)}\right)=-\log_b(P(X))$$

[//]:# (Equation 3)

Then why did we define informational quantity with logarithm?

It is because the formula for informational quantity must satisfy the following concepts related to information:

1) It should be inversely proportional to the probability value (or probability density value).

2) The informational quantity of two events combined should be equal to the sum of the informational quantity of each event.

# Entropy: Average Informational Quantity

In statistics, entropy refers to the average informational quantity.

Just as in the introduction, let's not try to connect the term entropy used in thermodynamics with the entropy used in statistics.

Entropy in statistics has some similarities with the formula of Gibbs entropy used in thermodynamics, and we can eventually find a connection between the two, but let's think about informational entropy from a new perspective, as introduced in the terminology of 'information.'

The informational entropy (or Shannon entropy) is the average informational quantity.

If the sample space of a discrete random variable $X$ is $\lbrace x_1, x_2, \cdots, x_n \rbrace$, then the informational entropy is as follows.

$$H(X)=E[I(X)]=-\sum_{i=1}^nP(x_i)\log_b(P(x_i))$$

[//]:# (식 4)

Here, $E[\cdot]$ denotes the expectation operator.

If you're wondering why equation (4) represents the expected value of informational quantity (i.e., average informational quantity), consider the following example.

Suppose you are playing a dice game, where you receive between 100 won and 600 won depending on the number that comes up on the dice, ranging from 1 to 6.

The expected value of this game would be as follows:

$$\frac{1}{6}\times 100 + \frac{1}{6}\times 200 + \cdots+\frac{1}{6}\times 600$$

$$=\sum_{i=1}^{6}P(x_i)M(x_i)$$

Here, let's think of $M(x_i)$ as the amount of money you receive for the event of rolling $x_i$ on the dice, ranging from 100 won to 600 won.

In other words, we can define the expected value as the sum of the probabilities of all possible events multiplied by their corresponding values.

Therefore, the information entropy is the sum of the probabilities of all possible events multiplied by their corresponding informational quantities:

$$H(x)=\sum_{i=1}^{n}P(x_i)(-\log_b(P(x_i)))$$

This formula allows us to calculate the value of information entropy.
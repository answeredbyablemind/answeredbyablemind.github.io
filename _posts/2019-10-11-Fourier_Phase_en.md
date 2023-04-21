---
title: Fourier Transform and Phase
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20191011_en
tags: Fourier Signal_Processing
lang: en
---

# Before we begin

One of the challenging aspects of understanding Fourier transform is the concept of phase. While the concept of amplitude is usually intuitive and easy to understand, phase often poses difficulties for many, and it is sometimes overlooked. To truly understand amplitude and phase through Fourier transform, one must first grasp the meaning of the inner product of functions, as well as the fundamental meaning of complex numbers.

Fourier transform serves as a mapping from real-valued functions to the complex number domain. Due to the unique properties of the mapping kernel, we can think of it as a transformation from the time domain to the frequency domain. Then, why does Fourier transform yield both amplitude and phase as results?

# The formula of Fourier transform

Let's reconsider the formula of Fourier transform.

$$X(f) = \int_{-\infty}^{\infty}x(t)\exp(-j2\pi ft)dt$$

There are various perspectives to look at this formula, but the most fundamental one is to view it as an inner product of functions. In other words, the above formula can be understood from the following perspective:

<center>"For any frequency $f$, $X(f)$ is the inner product of $x(t)$ and $\exp(-j2\pi ft)$."</center>

We need to think more about the meaning of inner product, and the most prominent aspect of it here is "similarity". Let's consider the Correlation formula, which is commonly used in statistics. The correlation between two random vectors $X$ and $Y$ is defined as follows:

$$\frac{E[(X-\mu_x)(Y-\mu_y)]}{\sigma_X\sigma_Y}$$

If we carefully look at the above formula, we can see that it involves statistics such as $\mu_X, \mu_Y,\sigma_X,\sigma_Y$, and also includes statistics that are obtained by using both $X$ and $Y$ simultaneously, such as $E[XY]$.

If we separate the numerator and denominator of the correlation coefficient and think about them separately, we can see that the division by the standard deviation in the denominator is a normalization to scale the correlation value between -1 and 1, and subtracting the mean values of X and Y is to examine the extent of change with respect to the mean. Therefore, the essence of the correlation coefficient can be regarded as the expectation of the inner product of random variables X and Y.

Hence, we should also derive a similar meaning from the inner product of functions. In other words, the formula of Fourier transform also encompasses the following meaning:

<center>"For any frequency $f$, $X(f)$ indicates how similar $x(t)$ and $\exp(-j2\pi ft)$ are."</center>

# Fourier Transform and Phase

As we discussed earlier, the meaning of the Fourier transform in equation (1) is "how similar is $x(t)$ to $\exp(-j2\pi ft)$?"

But what does $\exp(-j2\pi ft)$ mean? It can be written as $\exp(-j2\pi ft)=\cos(2\pi ft)-j\sin(2\pi ft)$. So, the above sentence can be rewritten as follows:

<center> "Let's find out how similar $x(t)$ is to $\cos(2\pi ft)$, and also how similar it is to $\sin(2\pi ft)$.

Let's express them as complex numbers, using their real and imaginary parts."</center>

This way, we can determine the magnitude and phase of any harmonic signal. 

In other words, the Fourier transform tells us how much $x(t)$ resembles cosine and sine waves, and by using it, we can determine both the magnitude and phase of a sinusoidal component at a given frequency. Since any harmonic signal can be thought of as a sum of cosines, we can think of it in terms of the cosine formula:

$$A\cos(2\pi f_0 t + \phi) = A\cos(2\pi f_0 t) \cos(\phi) - A \sin (2\pi f_0 t) \sin(\phi)$$

The degree of resemblance to cosine is represented by $A\cos(\phi)$, and the degree of resemblance to sine is represented by $A\sin(\phi)$, allowing us to determine both the magnitude $A$ and phase $\phi$ of the component at frequency $f_0$ in the signal.

Let's now verify the above content with mathematical equations.

$$\mathfrak{F}[A\cos(2\pi f_0 t + \phi)] = \mathfrak{F}[A\cos(2\pi f_0 t)\cos(\phi) - A\sin(2\pi f_0 t)\sin(\phi)]$$


If we briefly consider the Fourier transform of a cosine wave,

$$\cos(2\pi f_0 t) = \frac{\exp(j2\pi f_0 t) + \exp(-j2\pi f_0 t)}{2}$$

Using the frequency shift property of the Fourier transform,

$$\mathfrak{F}[\cos(2\pi f_0 t)] = \mathfrak{F}[\frac{\exp(j2\pi f_0 t) + \exp(-j2\pi f_0 t)}{2}] = \frac{1}{2}[\delta(f-f_0) + \delta(f+f_0)]$$

For a sine wave, on the other hand,

$$\sin(2\pi f_0 t) = \frac{\exp(j2\pi f_0 t) - \exp(-j2\pi f_0 t)}{2j}$$

So,

$$\mathfrak{F}[\sin(2\pi f_0 t)] = \mathfrak{F}[\frac{\exp(j2\pi f_0 t) - \exp(-j2\pi f_0 t)}{2j}] = \frac{1}{2j}[\delta(f-f_0) - \delta(f+f_0)]$$

Therefore, going back to the beginning,

$$\mathfrak{F}[A\cos(2\pi f_0 t + \phi)] = \mathfrak{F}[A \cos(2\pi f_0 t) \cos(\phi) - A\sin(2\pi f_0 t) \sin(\phi)]$$

$$ = A\cos(\phi)\mathfrak{F}[\cos(2\pi f_0 t)] - A\sin(\phi)\mathfrak{F}[\sin(2\pi f_0 t)]$$

$$ = A\cos(\phi)[\frac{1}{2}(\delta(f-f_0)+\delta(f+f_0))] - A\sin(\phi)[\frac{1}{2j}(\delta(f-f_0)-\delta(f+f_0))]$$

Where $\frac{1}{2j} = -\frac{j}{2}$, so,

$$ = A\cos(\phi)[\frac{1}{2}(\delta(f-f_0)+\delta(f+f_0))] + A\sin(\phi)[\frac{j}{2}(\delta(f-f_0)-\delta(f+f_0))]$$

$$ = \frac{A}{2}\delta(f-f_0)(\cos(\phi) + j\sin(\phi)) + \frac{A}{2}\delta(f+f_0)(\cos(\phi)-j\sin(\phi))$$

We can rearrange it as shown above.

When a real signal is Fourier transformed, both positive and negative frequencies are obtained. However, we can understand the essence of the result by only observing the positive frequencies. Therefore, we can think as follows:

<center> 

"We compared the similarity between $A\cos(2\pi f_0t+\phi)$ and $\exp(-j2\pi ft)=\cos(2\pi ft)-j\sin(2\pi ft)$ through inner product, and found that they are similar by $A\cos(\phi)$ at the frequency $f_0$.
<br><br>
Based on this, we represented the real part as $A\cos(\phi)$ and the imaginary part as $A\sin(\phi)$, which is similar to $A\sin(\phi)$ with the sine part. In other words, this function has a magnitude of $A$ and a phase of $\phi$ at the frequency $f_0$."

</center>
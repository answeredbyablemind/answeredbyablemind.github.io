---
title: Time-Frequency Uncertainty
sidebar:
  nav: docs-en
aside:
  toc: true
key: 20200116_en
tags: Fourier Signal_Processing
lang: en
---

# Gaussian Function

The Gaussian function is defined by the following equation:

$$g(t) = a\cdot \exp\left(-\frac{(t-b)^2}{2c^2}\right)$$

In the context of complex Morlet wavelet, the Gaussian function serves as the envelope or time window in the time domain. By appropriately manipulating the constants a, b, and c in the equation, we can assume a Gaussian function with mean $\mu$ and standard deviation $\sigma$.

The reason for using the Gaussian function can be explained with the Copenhagen interpretation of quantum mechanics. When the position or momentum of a freely moving quantum is probabilistically determined in their respective spaces, we can describe the probability distribution representing the quantum's position with a normal distribution, centered around the mean value $\mu$ with a standard deviation of $\sigma$[^1].

[^1]: For those curious about how the normal distribution is derived with these assumptions, I recommend watching my YouTube video on "Derivation of the Normal Distribution Formula." https://www.youtube.com/watch?v=vQghF8hjwbw

In our case, when performing time-frequency analysis on a time signal, we cannot accurately determine the time-frequency characteristics of the signal in the time-frequency domain. Assuming that the signal exists probabilistically with some average position and a certain standard deviation, expressing the probabilistic position in the time-frequency space with a normal distribution is mathematically the most reasonable choice.

Now let's examine the Fourier transform of the Gaussian function and apply the principle of uncertainty to investigate the relationship between time-frequency uncertainty.

# Fourier Transform of Gaussian Function

The Gaussian function that represents a distribution with standard deviation $\sigma$ and mean 0 can be expressed as follows, which is equivalent to the well-known normal distribution:

$$g(t) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{t^2}{2\sigma^2}\right)$$

Applying the Continuous-Time Fourier Transform (CTFT) to $g(t)$, we get the following expression for $G(f)$:

$$G(f) = \mathfrak{F}\left[g(t)\right]\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}{\exp\left(-\frac{t^2}{2\sigma^2} \right) \exp\left(-j2\pi ft\right)dt}$$

Although it may seem a bit complicated, we can determine the form of $G(f)$ by differentiating $G(f)$ with respect to $f$ and solving the resulting differential equation.

$$\frac{dG(f)}{df}=\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)\cdot(-j2\pi t)\cdot \exp\left(-j2\pi ft\right)dt$$

Let's apply partial integration here. Let $u$ be equal to $e^{-j2\pi ft}$, and let $dv$ be equal to $e^{-\frac{t^2}{2\sigma^2}}(-j2\pi t)dt$. We can derive the following relationships in order to utilize the partial integration formula:

$$u= \exp\left(-j2\pi ft\right) \Rightarrow du = (-j2\pi f)\exp\left(-j2\pi ft\right) dt$$

$$dv = \exp\left(-\frac{t^2}{2\sigma^2}\right)(-j2\pi t)dt \Rightarrow v = (j2\pi)\sigma^2 \cdot \exp\left(-\frac{t^2}{2\sigma^2}\right)$$

And by using the partial integration formula, we can expand the expression as follows:

$$\int u dv = uv - \int v du$$

Thus, we can expand the equation accordingly.

$$\frac{dG(f)}{df}

= \frac{1}{\sigma\sqrt{2\pi}} \left\{
    \left[
        \exp\left(-j2\pi ft\right) (j2\pi) \sigma^2 \exp\left(-\frac{t^2}{2\sigma^2}\right)
        \right]^{\infty}_{-\infty}

        - \int_{-\infty}^{\infty}\left(j2\pi \sigma^2 \exp\left(-\frac{t^2}{2\sigma^2}\right)\right)(-j2\pi f)\exp\left(-j2\pi ft\right)dt
    \right\}$$

Here, the first term on the right-hand side, $\exp\left(-\frac{t^2}{2\sigma^2}\right)$, converges to 0 as $t$ approaches $\pm \infty$.

$$\frac{dG(f)}{df}=\frac{1}{\sigma\sqrt{2\pi}}\left\{-\int_{-\infty}^{\infty} {4\pi^2\sigma^2 f \exp\left(-\frac{t^2}{2\sigma^2}\right)\exp\left(-j2\pi ft\right)}dt \right\} = -4\pi^2\sigma^2 f G(f)$$

Thus, we can obtain the following differential equation:

$$\frac{dG(f)}{df}=-4\pi^2\sigma^2fG(f)$$

This equation can be rearranged as follows:

$$\frac{1}{G(f)}dG(f) = -4\pi^2\sigma^2fdf$$

Applying the integral sign to both sides:

$$\int\frac{1}{G(f)}dG(f) = -4\pi^2\sigma^2\int fdf$$

$$\Rightarrow ln(G(f)) = -4\pi^2\sigma^2\cdot \frac{1}{2}\cdot f^2+C$$

Therefore,

$$G(f) = C\exp\left(-2\pi^2\sigma^2f^2\right)= C\exp\left(-\frac{(2\pi f \sigma)^2}{2}\right)$$

Where the constant of integration $C$ can be found by evaluating $G(0)$ as:

$$G(0) = C = \frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty} \exp\left(-\frac{t^2}{2\sigma^2}\right)\exp\left(-j2\pi\cdot0\cdot t\right)dt\notag$$

$$=\frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt$$

This can be obtained by solving the so-called [Gaussian integral](https://angeloyeo.github.io/2020/01/17/Gaussian_Integral_en.html).

The solution of the general [Gaussian integral](https://angeloyeo.github.io/2020/01/17/Gaussian_Integral_en.html) is given as follows:

$$\int_{-\infty}^{\infty}\exp\left(-x^2\right)dx = \sqrt{\pi}$$

Therefore, by utilizing variable substitution:

$$x = \frac{t}{\sigma\sqrt 2}, \quad dx = \frac{1}{\sigma\sqrt 2}dt$$

Through this, we can confirm the following:

$$\Rightarrow \int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)\frac{1}{\sigma\sqrt 2}dt = \sqrt \pi$$

$$\therefore \int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt = \sigma \sqrt{2\pi}$$

Thus,

$$G(0) = \frac{1}{\sigma\sqrt{2\pi}}\int_{-\infty}^{\infty}\exp\left(-\frac{t^2}{2\sigma^2}\right)dt = \frac{1}{\sigma\sqrt{2\pi}}\sigma\sqrt{2\pi} = 1$$

Therefore,

$$G(f) = C\exp\left(    -\frac{(2\pi f\sigma)^2}{2}    \right)    = \exp\left(    -\frac{(2\pi f\sigma)^2}{2}    \right)$$

can be concluded.

Thus,

$$g(t) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{t^2}{2\sigma^2}\right)$$

has a Fourier transform of

$$G(f) = \exp\left(    -\frac{(2\pi f\sigma)^2}{2}    \right)$$

This confirms that the Fourier transform of a Gaussian function is also a Gaussian function.

# Uncertainty in Time and Frequency Domains and Their Relationship

Considering the properties of the normal distribution once again, we can determine that the time uncertainty $\sigma_t$ of $g(t)$ in the time domain is $\sigma$, and the frequency uncertainty $\sigma_f$ of $G(f)$ in the frequency domain is $\frac{1}{2\pi \sigma}$.

Therefore, the relationship between time and frequency uncertainties is as follows:

$$\sigma_t\sigma_f = \frac{1}{2\pi}$$
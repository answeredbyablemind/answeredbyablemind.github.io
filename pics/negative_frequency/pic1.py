# -*- coding: utf-8 -*-
"""
Created on Mon Jul 22 16:12:19 2019

@author: icbab
"""

import matplotlib.pyplot as plt
import numpy as np

Fs = 2000                    # Sampling frequency
T = 1/Fs                     # Sample interval time
te= 0.5                     # End of time
t = np.arange(0, te, T)    # Time vector

y = np.cos(2*np.pi*10*t)


# Calculate FFT ....................
n=len(y)        # Length of signal
NFFT=n      # ?? NFFT=2^nextpow2(length(y))  ??
k=np.arange(NFFT)
f0=k*Fs/NFFT - 1000   # double sides frequency range

Y=np.fft.fftshift(np.fft.fft(y)/NFFT)        # fft computing and normaliation
amplitude_Hz = abs(Y)

# figure 1 ..................................
plt.figure(num=2,dpi=100,facecolor='white')
plt.subplots_adjust(hspace = 0.6, wspace = 0.3)
plt.subplot(2,1,1)

plt.plot(t,y,'r')
plt.title('Signal FFT analysis')
plt.xlabel('time($sec$)')
plt.ylabel('y')
#plt.xlim( 0, 0.1)

# Amplitude ....
#plt.figure(num=2,dpi=100,facecolor='white')
plt.subplot(2,1,2)

# Plot single-sided amplitude spectrum.
plt.stem(f0,amplitude_Hz,'r')   #  2* ???
plt.xticks(np.arange(-500,500,10))
plt.xlim( -30, 30)
plt.ylim( 0, 1.2)
plt.xlabel('frequency($Hz$)')
plt.ylabel('amplitude')
plt.grid()

plt.show()
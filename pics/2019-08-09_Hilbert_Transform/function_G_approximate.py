# -*- coding: utf-8 -*-
"""
Created on Fri Aug  9 21:19:05 2019

@author: icbab
"""

import numpy as np
import matplotlib.pyplot as plt

alpha = 0.3

f_neg= np.linspace(-3, 0, num = 50)
f_pos = np.linspace(0, 3, num = 50)

G_neg = - np.exp(alpha * f_neg)
G_pos = np.exp(-alpha * f_pos)


plt.plot(np.concatenate((f_neg, f_pos)), np.concatenate((G_neg, G_pos)))
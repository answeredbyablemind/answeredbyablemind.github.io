# -*- coding: utf-8 -*-
"""
Created on Sun Jul  7 08:12:35 2019

@author: icbab
"""

import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(20,80, num=60)
x = np.zeros(60);

x[20:40]=1;

plt.plot(t[0:20],x[0:20],'b')
plt.hold
plt.plot([40,40],[0,1],'b--');
plt.plot(t[20:40],x[20:40],'b')
plt.plot([60,60],[0,1],'b--');
plt.plot(t[40:],x[40:],'b')
plt.plot(40,0.5,'bo')
plt.plot(60,0.5,'bo')
plt.plot(40,0,'bo',markerfacecolor = 'white')
plt.plot(40,1,'bo',markerfacecolor = 'white')
plt.plot(60,0,'bo',markerfacecolor = 'white')
plt.plot(60,1,'bo',markerfacecolor = 'white')


plt.xticks([50], ('a'))
plt.show();

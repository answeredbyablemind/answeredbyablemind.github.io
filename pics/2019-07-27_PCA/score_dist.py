# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 20:35:22 2019

@author: icbab
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import matplotlib.font_manager as fm

font_location = 'C:/HANDotum.ttf'  
                    # ex - 'C:/asiahead4.ttf'
font_name = fm.FontProperties(fname = font_location).get_name()
matplotlib.rc('font', family = font_name)


D = np.random.randn(2,100)

S = np.array([
        [3, 1],
        [1, 1]
        ])

D = np.dot(S,D)

D = D * 10 + 40

for i in range(D.shape[0]):
    for j in range(D.shape[1]):
        if D[i][j] < 0:
            D[i][j] = np.abs(D[i][j])
        if D[i][j] >= 100:
            D[i][j] = 100


plt.scatter(D[0,:], D[1,:])
plt.title('시험 점수의 분포')
plt.xlabel('국어 점수')
plt.ylabel('영어 점수')
plt.ylim([0, 100])
plt.grid(b=True)
plt.savefig('C:/angeloyeo.github.io/pics/2019-07-27_PCA/pic1.png', dpi = 300)
plt.show()


plt.scatter(D[0,:], D[1,:])
plt.plot([0, 100], [0, 100], 'r--', linewidth = 2)
plt.plot([0, 100], [0, 100*3/4], 'b-.', linewidth = 2)
plt.title('시험 점수의 분포')
plt.xlabel('국어 점수')
plt.ylabel('영어 점수')
plt.ylim([0, 100])
plt.grid(b=True)
plt.savefig('C:/angeloyeo.github.io/pics/2019-07-27_PCA/pic2.png', dpi= 300)
plt.show()

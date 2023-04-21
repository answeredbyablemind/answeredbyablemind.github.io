    # -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 20:35:22 2019

@author: icbab
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import matplotlib.font_manager as fm
import os

# font_location = 'C:/HANDotum.ttf'  
#                     # ex - 'C:/asiahead4.ttf'
# font_name = fm.FontProperties(fname = font_location).get_name()
# matplotlib.rc('font', family = font_name)


D = np.random.randn(2,500)

S = np.array([
        [2, 1],
        [1, 2]
        ]) / np.sqrt(10)

D = np.dot(S,D)

D = D * 10 + 80

for i in range(D.shape[0]):
    for j in range(D.shape[1]):
        if D[i][j] < 0:
            D[i][j] = np.abs(D[i][j])
        if D[i][j] >= 100:
            D[i][j] = 100

D[1,:] = D[1,:]-5

plt.scatter(D[0,:], D[1,:])
# plt.title('시험 점수의 분포')
# plt.xlabel('수학 점수')
# plt.ylabel('영어 점수')
plt.title('Distribution of Test Scores')
plt.xlabel('Math Score')
plt.ylabel('English Score')
# plt.grid(True)

savepath = 'C:/angeloyeo.github.io/pics/2019-08-20_correlation_and_inner_product/'

if not os.path.exists(savepath):
    os.makedirs(savepath)

plt.savefig(savepath + 'pic1_en.png', dpi = 300)
plt.show()
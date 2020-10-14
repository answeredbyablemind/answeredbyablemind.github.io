# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 17:23:28 2020

@author: biosensor1
"""

import numpy as np
from sklearn.decomposition import PCA
from sklearn.datasets import fetch_openml
import matplotlib.pyplot as plt

mnist =  fetch_openml('mnist_784')

data = mnist.data/255.

def f(x):
    return np.int(x)

f2 = np.vectorize(f)

target = f2(mnist.target)

#%% PCA 적용하기
pca = PCA(n_components=2)
pca.fit(data.T)


x = pca.components_[0,:]
y = pca.components_[1,:]

#%%
plt.figure()
for i in range(np.unique(target).shape[0]):
    idx = np.where(target == i)[0]
    plt.plot(x[idx], y[idx],'o', label = str(i))
    
plt.legend()

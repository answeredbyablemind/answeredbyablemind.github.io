# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 17:23:28 2020

@author: biosensor1
"""

import numpy as np
from sklearn.decomposition import PCA
from sklearn.datasets import fetch_openml
import matplotlib.pyplot as plt
import torch
import torchvision.transforms as transforms

mnist_transform = transforms.Compose([
    transforms.ToTensor()
    ])

from torchvision.datasets import MNIST

download_root = './MNIST_DATASET'
train_dataset = MNIST(download_root, transform = mnist_transform, train = True, download = True)

data = train_dataset.data.view(-1, 28*28).type(torch.FloatTensor)/255.

target = train_dataset.targets.numpy()

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

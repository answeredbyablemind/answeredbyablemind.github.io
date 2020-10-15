# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 17:45:44 2020

@author: biosensor1

어떠한 비선형성도 없는 AutoEncoder 제작
"""

import torch
import torchvision.transforms as transforms
from torch.utils import data
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
import numpy as np


mnist_transform = transforms.Compose([
    transforms.ToTensor()
    ])

from torchvision.datasets import MNIST

download_root = './MNIST_DATASET'
train_dataset = MNIST(download_root, transform = mnist_transform, train = True, download = True)


EPOCH = 100
BATCH_SIZE = 64
USE_CUDA = torch.cuda.is_available()
DEVICE = torch.device("cuda" if USE_CUDA else "cpu")

train_loader = data.DataLoader(
    dataset = train_dataset,
    batch_size = BATCH_SIZE,
    shuffle = True
    )

#%% 뉴럴넷 구성하기

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        
        self.encoder = nn.Sequential(
            nn.Linear(784, 2)
            )
        self.decoder = nn.Sequential(
            nn.Linear(2, 784)
            )
        
    def forward(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        
        return encoded, decoded
    
model = Net().to(DEVICE)
optimizer = optim.Adam(model.parameters(), lr = 0.001)
criterion = nn.MSELoss()

def train(model, train_loader):
    model.train()
    for step, (x, label) in enumerate(train_loader):
        
        x = x.view(-1, 28*28).to(DEVICE)
        y = x.view(-1, 28*28).to(DEVICE)
        label = label.to(DEVICE)
        
        encoded, decoded = model(x)
        loss = criterion(decoded, x)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
    
    loss_history.append(loss.item())
    print('LOSS: {}'.format(loss.item()))
    return loss.item()

loss_history = []
for epoch in range(EPOCH):
    print('epoch: {}'.format(epoch))
    loss = train(model, train_loader)
    loss_history.append(loss)
    
#%% evaluate
model.eval()

mnist_data = train_dataset.data.view(-1, 28*28).type(torch.FloatTensor)/255.
mnist_data = mnist_data.to(DEVICE)

mnist_labels = train_dataset.targets.cpu().detach().numpy()

encoded, decoded = model(mnist_data)


data2visualize = encoded.cpu().detach().numpy()


import matplotlib.pyplot as plt
plt.figure()
for i in range(10):
    idx = np.where(mnist_labels == i)[0]
    plt.plot(data2visualize[idx,0], data2visualize[idx,1],'o', label = str(i))
    
plt.legend()


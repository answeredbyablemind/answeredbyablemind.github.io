# -*- coding: utf-8 -*-
"""
Created on Thu Aug 15 18:07:59 2019

@author: icbab
"""

import plotly.graph_objects as go
import numpy as np

# x, y 정의하기
# x와 y는 모두 -2, 2 사이에 있고, 총 100개 정의하도록 하자.
N = 100

x = np.linspace(-2, 2, num = N)
y = np.linspace(-2, 2, num = N)

f = np.zeros((N,N))
p = np.zeros((N,N)) # phase 정의하기

# 원래 함수 정의하기
for i in range(x.shape[0]):
    for j in range(y.shape[0]):
        f[j,i] = np.sqrt(
                (x[i]**2 - y[j] **2 + 1) ** 2 + (2 * x[i] * y[j]) **2
                );

for i in range(x.shape[0]):
    for j in range(y.shape[0]):
        p[j,i] = np.arctan2(2*x[i]*y[j], x[i] **2 - y[j] ** 2 + 1)
        
# 빨간 띠 그려주기
red_x = np.linspace(-2, 2, num = N)
red_y = np.squeeze(np.zeros((N,1)))
red_f = np.zeros((N,1))

for i in range(red_x.shape[0]):
        red_f[i] = red_x[i] ** 2 + 1

red_f = np.squeeze(red_f)

        
fig = go.Figure(data=[
        go.Surface(
                x=x,
                y=y,
                z=f),
        go.Scatter3d(
                x = red_x,
                y = red_y,
                z = red_f,
                mode = 'lines',
                line=dict(
                        color='#ff0000',
                        width=20
                        ))
        ])
    


data = fig['data']

data[0]['surfacecolor'] = p

fig['data'] = data;

camera = dict(
    up=dict(x=0, y=0, z=1),
    center=dict(x=0, y=0, z=0),
    eye=dict(x=3, y=2, z=0.1)
)

fig.update_layout(scene = dict(
                    xaxis_title='real(Z)',
                    yaxis_title='imag(Z)',
                    zaxis_title='abs(f(z))',
                    zaxis = dict(nticks=10, range=[0,10])),
                    width=800,
                    margin=dict(r=20, b=10, l=20, t=10))

fig['layout'].update(
        scene = dict(camera = camera))

fig.write_html('main_figure.html', auto_open = True)
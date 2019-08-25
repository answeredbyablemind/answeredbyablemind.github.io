# -*- coding: utf-8 -*-
"""
Created on Thu Aug 15 18:07:59 2019

@author: icbab
"""

import plotly.graph_objects as go
import numpy as np

# x, y 정의하기
# x와 y는 모두 -2, 2 사이에 있고, 총 100개 정의하도록 하자.
N = 10

x = np.linspace(-1, 1, num = N)
y = np.linspace(-1, 1, num = N)

f = np.zeros((N,N))

# 원래 함수 정의하기
for i in range(x.shape[0]):
    for j in range(y.shape[0]):
        f[j,i] = x[i]**2 + x[i]*y[j] + y[j]**2

fig = go.Figure(data=[
        go.Surface(
                x=x,
                y=y,
                z=f)
        ])

#camera = dict(
#    up=dict(x=0, y=0, z=1),
#    center=dict(x=0, y=0, z=-0.5),
#    eye=dict(x=3, y=2, z=0.1)
#)

fig.update_layout(scene = dict(
                    xaxis_title='x',
                    yaxis_title='y',
                    zaxis_title='f(x,y)',
                    zaxis = dict(nticks=10, range=[0,3])),
                    width=800,
                    margin=dict(r=20, b=10, l=20, t=10))
#
#fig['layout'].update(
#        scene = dict(camera = camera))

fig.write_html('main_figure.html', auto_open = True)
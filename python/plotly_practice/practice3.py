# -*- coding: utf-8 -*-
"""
Created on Thu Aug 15 18:33:18 2019

@author: icbab
"""

import plotly.graph_objects as go
from plotly.subplots import make_subplots
import numpy as np

N = 50

fig = make_subplots(
        rows = 2, cols = 2,
        specs = [
                [{'is_3d': True}, {'is_3d': True}],
                [{'is_3d': True}, {'is_3d': True}]
                ],
        print_grid = False)

for i in [1,2]:
    for j in [1,2]:
        fig.append_trace(
                go.Mesh3d(
                        x = (60 * np.random.randn(N)),
                        y = (25 * np.random.randn(N)),
                        z = (40 * np.random.randn(N)),
                        opacity = 0.5
                        ),
                    row = i, col = j)
                
fig.update_layout(width = 700, margin = dict(r=10, l=10, b=10, t=10))

fig.update_layout(scene_aspectmode= 'cube')
fig.update_layout(scene2_aspectmode='manual',
                  scene2_aspectratio=dict(x=1, y=1, z=2))
# draw axes in proportion to the proportion of their ranges
fig.update_layout(scene3_aspectmode='data')
# automatically produce something that is well proportioned using 'data' as the default
fig.update_layout(scene4_aspectmode='auto')
fig.write_html('third_figure.html', auto_open = True)

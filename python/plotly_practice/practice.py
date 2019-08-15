# -*- coding: utf-8 -*-
"""
Created on Thu Aug 15 18:07:59 2019

@author: icbab
"""

import plotly.graph_objects as go

fig = go.Figure(data=go.Bar(
        y=[2,3,1]))
fig.write_html('first_figure.html', auto_open = True)
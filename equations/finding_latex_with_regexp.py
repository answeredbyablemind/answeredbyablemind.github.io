# -*- coding: utf-8 -*-
"""
Created on Sun Jul 17 20:59:41 2022

@author: 여동훈
"""

import re

def find_newline(list_all, list_to_find):
    res = []
    for elem in list_all:
        if elem in list_to_find:
            res.append(True)
        else:
            res.append(False)
            
    return res

f = open(r'D:\angeloyeo.github.io\_posts\2019-06-04-2-1-angle_rad.md',encoding = 'UTF-8')
my_text = f.read()

regex_all = re.compile("\${1,2}(.*?)\${1,2}")
mo_all = regex_all.findall(my_text)

regex_newline = re.compile("\${2}(.*?)\${2}")
mo_newline = regex_newline.findall(my_text)

is_newline = find_newline(mo_all, mo_newline)

#%%

import matplotlib.pyplot as plt
import io
from PIL import Image, ImageChops

white = (255, 255, 255, 255)

def latex_to_img(tex):
    buf = io.BytesIO()
    plt.rc('text', usetex=True)
    plt.rc('font', family='serif')
    plt.axis('off')
    plt.text(0.05, 0.5, f'$${tex}$$', size=40)
    plt.savefig(buf, format='png')
    plt.close()

    im = Image.open(buf)
    bg = Image.new(im.mode, im.size, white)
    diff = ImageChops.difference(im, bg)
    diff = ImageChops.add(diff, diff, 2.0, -100)
    bbox = diff.getbbox()
    return im.crop(bbox)

latex_to_img(mo_all[1]).save('img.png')



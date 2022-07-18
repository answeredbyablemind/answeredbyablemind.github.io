# -*- coding: utf-8 -*-
"""
Created on Sun Jul 17 20:59:41 2022

@author: 여동훈
"""

import re
import requests
import os

def find_newline(list_all, list_to_find):
    res = []
    for elem in list_all:
        if elem in list_to_find:
            res.append(True)
        else:
            res.append(False)
            
    return res

def formula_as_file( formula, file):
    # https://gist.github.com/JackMorganNZ/6aeb18c74be3765d3d00de0d8c894e32
    formula = formula.replace('\n', ' ')
    r = requests.get( 'http://latex.codecogs.com/png.latex?\dpi{{1500}} {formula}'.format(formula=formula))
    f = open(file, 'wb')
    f.write(r.content)
    f.close()
    
basefolder = 'D:/angeloyeo.github.io/_posts/'
filename = '2019-06-04-2-1-angle_rad'
extension = '.md'

f = open(basefolder+filename+extension ,encoding = 'UTF-8')
my_text = f.read()

regex_all = re.compile("\${1,2}(.*?)\${1,2}")
mo_all = regex_all.findall(my_text)

regex_newline = re.compile("\${2}(.*?)\${2}")
mo_newline = regex_newline.findall(my_text)

is_newline = find_newline(mo_all, mo_newline)

#%%
path2save = 'D:/angeloyeo.github.io/equaions/'+filename
isExist = os.path.exists(path2save)

if not isExist:
    os.makedirs(path2save)
    
for i, eq in enumerate(mo_all):
    formula_as_file(eq, path2save+'/eq'+str(i+1)+'.png')
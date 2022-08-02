# -*- coding: utf-8 -*-
"""
Created on Sun Jul 17 20:59:41 2022

@author: 여동훈
"""

import re
import requests
import os
import glob

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
    r = requests.get( 'http://latex.codecogs.com/png.latex?\dpi{{100}} {formula}'.format(formula=formula))
    f = open(file, 'wb')
    f.write(r.content)
    f.close()
    
basefolder = 'D:/angeloyeo.github.io/_posts/'
extension = '.md'

filenames = glob.glob(basefolder+'*.md')
for i in range(len(filenames)):
    filenames[i] = filenames[i][len(basefolder):-3]
    
filename = filenames[98]

f = open(basefolder+filename+extension ,encoding = 'UTF-8')
my_text = f.read()

regex_all = re.compile("\${1,2}(.*?)\${1,2}")
mo_all = regex_all.findall(my_text)

regex_newline = re.compile("\${2}(.*?)\${2}")
mo_newline = regex_newline.findall(my_text)

is_newline = find_newline(mo_all, mo_newline)

#%%
path2save = 'D:/angeloyeo.github.io/equations/'+filename
isExist = os.path.exists(path2save)

if not isExist:
    os.makedirs(path2save)
    
for i, eq in enumerate(mo_all):
    formula_as_file(eq, path2save+'/eq'+str(i+1)+'.png')
    
#%%
# 모든 equation이 invalid가 없는지 점검한 후에 md 파일의 내용물을 수정할 것.

# regexp의 위치 찾아낼 것

for i in range(len(mo_all)):
    match = re.search("\${1,2}(.*?)\${1,2}", my_text)
    if not is_newline[i]:
        my_text = my_text[:match.start()] + '<img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/'+filename+'/eq'+str(i+1)+'.png">' + my_text[match.end():]
    else:
        my_text = my_text[:match.start()] + '<p align = "center"> <img src = "https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/equations/'+filename+'/eq'+str(i+1)+'.png"> </p>' + my_text[match.end():]
            
            
#%%
# my_text를 직접 열어보고 괜찮으면 원래의 md 파일에 붙여넣기.
# 필요한 경우 my_text를 직접 수정하고 붙여넣도록 하자.
# 결국은 visual studio code에서 직접 수정할 일이 많을수도 ㅠ
print('')
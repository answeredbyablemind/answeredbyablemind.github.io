---
title: 숄레스키 분해
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20210617
tags: 선형대수학
---

Cholesky–Banachiewicz algorithm

```{MATLAB}
A = [4,12,-16;12,37,-43;-16,-43,98];
L = zeros(size(A));

for i = 1:size(A,1)
    for j = 1:i
        my_sum = 0;
        
        for k = 1:j-1
            my_sum = my_sum + L(i,k)*L(j,k);
        end
        
        if i == j
            L(i,j)=sqrt(A(i,i)-my_sum);
        else
            L(i,j)=(1/L(j,j)*(A(i,j)-my_sum));
        end
    end
end

L
transpose(chol(A))
```

# 참고문헌

* [Cholesky decomposition, 위키피디아](https://en.wikipedia.org/wiki/Cholesky_decomposition)
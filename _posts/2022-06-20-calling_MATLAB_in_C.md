---
title: C에서 MATLAB 호출하기
sidebar:
  nav: docs-ko
aside:
  toc: true
key: 20220620
tags: MATLAB
---

본 내용에 대한 더 자세한 내용은 MathWorks 홈페이지를 참고하시기 바랍니다.

- [Call MATLAB from C](https://www.mathworks.com/help/matlab/calling-matlab-engine-from-c-programs-1.html?s_tid=CRUX_lftnav)

# Windows Visual Studio의 설정

작성 예정

# 실행 예제

```C
#define _USE_MATH_DEFINES

#include <iostream>
#include <math.h>
#include <conio.h>
#include <ctype.h>
#include "engine.h"

using namespace std;

int main() {
    Engine* ep = engOpen(NULL);
    double x[1000];

    int i;
    double t = 0;
    const double dt = 0.001;

    mxArray* x_array = mxCreateDoubleMatrix(1000, 1, mxREAL);
    mxDouble* px = mxGetDoubles(x_array);

    for (i = 0; i < 1000; i++) {
        x[i] = cos(2 * M_PI * t); // To check numbers in C
        t += dt;

        px[i] = x[i];
    }

    engPutVariable(ep, "x", x_array);
    engEvalString(ep, "plot(x)");
   
    _getch(); // To make cmd stop until pressing any keys.

    engClose(ep);

    return 0;
}

```
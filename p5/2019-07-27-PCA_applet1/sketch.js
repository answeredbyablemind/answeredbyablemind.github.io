let scl;
let ellipseSize;
let numData = 80;
let randomTemp = [
     [],
     []
]
let button1, button2, button3, button4, button5
let mtx1 = [
     [3, 2],
     [2, 4]
]
let mtx2 = [
     [3, -2],
     [-2, 4]
]
let mtx3 = [
     [5, 0],
     [0, 1]
]
let mtx4 = [
     [1, 0],
     [0, 5]
]
let mtx2Apply = [
     [],
     []
]
let inc;

function setup() {
     createCanvas(windowWidth - 20, windowHeight - 60);
     scl = width / 32;
     for (let i = 0; i < numData; i++) {
          randomTemp[0][i] = randomGaussian(0, 1)
          randomTemp[1][i] = randomGaussian(0, 1)
     }

     if (width < 500) {
          ellipseSize = 25 / 800 * width;
     } else {
          ellipseSize = 15 / 800 * width;
     }

     // Defining buttons
     button1 = createButton('Matrix 1')
     button2 = createButton('Matrix 2')
     button3 = createButton('Matrix 3')
     button4 = createButton('Matrix 4')
     button5 = createButton('Reset')

     // button1.position(0, 0)
     // button2.position(0, 0)
     // button3.position(0, 0)
     // button4.position(0, 0)

     // button1.mousePressed(button1Function)
     // button2.mousePressed(button2Function)
     // button3.mousePressed(button3Function)
     // button4.mousePressed(button4Function)

     // Preparing Matrices
     mtx1 = math.add(mtx1, [
          [-1, 0],
          [0, -1]
     ])
     mtx2 = math.add(mtx2, [
          [-1, 0],
          [0, -1]
     ])
     mtx3 = math.add(mtx3, [
          [-1, 0],
          [0, -1]
     ])
     mtx4 = math.add(mtx4, [
          [-1, 0],
          [0, -1]
     ])

     inc = 0;
     mtx2Apply = [
          [0, 0],
          [0, 0]
     ]

     button1.mousePressed(m1Func)
     button2.mousePressed(m2Func)
     button3.mousePressed(m3Func)
     button4.mousePressed(m4Func)
     button5.mousePressed(m5Func)
}

function draw() {
     background(0);
     // plot data and do nothing
     plotAxis();

     push();
     tempMtx = math.add(math.multiply(inc, mtx2Apply), [
          [1, 0],
          [0, 1]
     ]);
     dataMtx = math.multiply(tempMtx, randomTemp);
     noStroke();
     translate(width / 2, height / 2);
     scale(1, -1);
     fill(100, 150, 225, 200);
     for (let i = 0; i < numData; i++) {
          ellipse(dataMtx[0][i] * scl, dataMtx[1][i] * scl, ellipseSize, ellipseSize);
     }
     pop();


     if (inc < 1) {
          inc += 0.01;
     } else {
          inc = 1;
     }
     fill(255)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', 0.9 * width, 0.9 * height)
}

function m5Func() {
     mtx2Apply = [[0, 0],[0, 0]]
     inc = 0;
}
function m1Func() {
     mtx2Apply = mtx1
     inc = 0;
}

function m2Func() {
     mtx2Apply = mtx2
     inc = 0;
}

function m3Func() {
     mtx2Apply = mtx3
     inc = 0;
}

function m4Func() {
     mtx2Apply = mtx4
     inc = 0;
}


function plotAxis() {
     push();
     stroke(200);
     strokeWeight(3);
     line(width / 2, 0, width / 2, height);
     line(0, height / 2, width, height / 2);
     pop();

     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     stroke(150);
     strokeWeight(0.5);
     // vertical lines
     for (let i = -16; i <= 16; i+=4) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }

     for (let i = -16; i <= 16; i+=4) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }
     pop();
}
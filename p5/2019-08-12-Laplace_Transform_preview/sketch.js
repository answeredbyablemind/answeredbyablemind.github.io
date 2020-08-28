var scl;
var sig = [];
var t = []
fs = 500;

var dragging = false; // 물체가 dragged 되고 있는가?
var rollover = false; // 마우스가 원 위에 위치해 있는가?
var circle_x, circle_y, circle_r; // 움직일 원의 위치와 사이즈
var offsetX, offsetY; // mouse offset

function setup() {
     createCanvas(800, 400);
     scl = width / 8;
     for (let i = 0; i < 3; i += 1 / fs) {
          t.push(i)
     }
     for (let i = 0; i < t.length; i++) {
          sig.push(
               cos(2 * PI * 1 * t[i]) * exp(-1 * t[i])
          )
     }

     left_O_x = 50 / 800 * width;
     left_O_y = (height - 30 + 80 / 800 * width) / 2;
     right_O_x = 3 / 4 * width;
     right_O_y = (height - 30 + 80 / 800 * width) / 2;

     ////////////// drag될 원에 대한 정의 ////////////////////
     // 위치는 오른쪽 면의 축의 원점 기준으로 위치를 잡고자 함.
     // starting position
     circle_x = -1;
     circle_y = 1;
     // circle size
     circle_r = 0.2;
}

function draw() {
     background(0);

     // titles 그리기
     plotTitles();

     // 좌, 우측 axes 그리기
     plotAxes();

     // Mouse Dragging에 관한 함수
     mouseDragToMoveAPoint();

     // 왼쪽 패널에 코사인 함수 그려놓기
     plotTimeSignal();

     fill(255);
     textAlign(RIGHT)
     textSize(12 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)

     push();
     translate(right_O_x + 0.1 * scl, right_O_y - 0.1 * scl)
     scale(1,-1)
     drawArrowAbsCoord(0, 0, 1.5 * scl , 0, 255, 100, 100, 3)
     scale(1, -1)
     textAlign(CENTER)
     text('빠르게 발산', 0.7 * scl, - 0.1 * scl)
     pop();
     
     push();
     translate(right_O_x - 0.1 * scl, right_O_y - 0.1 * scl)
     scale(1,-1)
     
     drawArrowAbsCoord(0, 0, -1.5 * scl , 0, 100, 100, 255, 3)
     scale(1, -1)
     textAlign(CENTER)
     text('빠르게 수렴', - 0.7 * scl, - 0.1 * scl)
     pop();

     push();
     translate(right_O_x - 0.1 * scl, right_O_y - 0.2 * scl)
     scale(1,-1)
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     drawArrowAbsCoord(0, 0, 0, 1 * scl, 255, 255, 255, 1)
     scale(1, -1)
     rotate(-HALF_PI)
     textAlign(CENTER)
     text('주파수 증가', 0.4 * scl, - 0.05 * scl)
     pop();

     push();
     translate(right_O_x + 0.1 * scl, right_O_y + 0.25 * scl)
     scale(1,-1)
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     drawArrowAbsCoord(0, 0, 0, - 1 * scl, 255, 255, 255, 1)
     scale(1, -1)
     rotate(HALF_PI)
     textAlign(CENTER)
     text('주파수 증가', 0.4 * scl, - 0.05 * scl)
     pop();

}

function drawArrowAbsCoord(x1, y1, x2, y2, c1, c2, c3, w) {
     push();
     strokeWeight(w);
     stroke(c1, c2, c3);
     fill(c1, c2, c3);
     line(x1, y1, x2, y2); //draw a line beetween the vertices
     let offset = 10 / 800 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}

function mouseDragToMoveAPoint() {
     push();
     translate(right_O_x, right_O_y);
     scale(1, -1);
     newMouseX = mouseX - right_O_x;
     newMouseY = -1 * (mouseY - right_O_y);

     if (
          ((circle_x * scl - newMouseX) ** 2 + (circle_y * scl - newMouseY) ** 2) < (circle_r * scl) ** 2) {
          rollover = true;
     } else {
          rollover = false;
     }
     if (dragging) {
          circle_x = newMouseX / scl + offsetX;
          circle_y = newMouseY / scl + offsetY;
     }
     // console.log(dragging)
     noFill()
     stroke(255, 0, 0)
     strokeWeight(2)
     ellipse(circle_x * scl, circle_y * scl, circle_r * scl, circle_r * scl);
     line(scl * (circle_x - circle_r * 0.6), scl * circle_y, scl * (circle_x + circle_r * 0.6), scl * circle_y)
     line(scl * (circle_x), scl * (circle_y - circle_r * 0.6), scl * (circle_x), scl * (circle_y + circle_r * 0.6))
     pop();
}


function mousePressed() {
     if (
          ((circle_x * scl - newMouseX) ** 2 + (circle_y * scl - newMouseY) ** 2) < (circle_r * scl) ** 2) {
          dragging = true;
     }

     offsetX = (circle_x * scl - newMouseX) / scl
     offsetY = (circle_y * scl - newMouseY) / scl
}

function mouseReleased() {
     dragging = false;
}


function plotTimeSignal() {
     sig = []
     for (let i = 0; i < t.length; i++) {
          sig.push(
               cos(2 * PI * circle_y * t[i]) * exp(circle_x * t[i])
          )
     }

     push();
     stroke(255);
     noFill();
     translate(50 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     scale(1, -1);
     beginShape();
     for (i = 0; i < sig.length; i++) {
          vertex(t[i] * scl, sig[i] * scl);
     }
     endShape();
     pop();
}

function plotTitles() {
     push();
     stroke(100);
     line(width / 2, 0, width / 2, height);
     line(0, 50 / 800 * width, width, 50 / 800 * width);
     fill(255);
     textAlign(CENTER);
     textSize(25 / 800 * width);
     text('시간-신호 그래프', width / 4, 35 / 800 * width);
     text('s-plane 상의 신호 표현', 3 / 4 * width, 35 / 800 * width);
     pop();
}

function plotAxes() {

     // triangle의 크기
     let offset = 7 / 800 * width;

     // //////////////////////// 왼쪽 pannel에 axes 그려주기///////////////////////////
     push();
     stroke(255);
     line(50 / 800 * width, 80 / 800 * width, 50 / 800 * width, height - 30);
     triangle(50 / 800 * width, 80 / 800 * width, 50 / 800 * width - 1 / 2 * offset, 80 / 800 * width + offset, 50 / 800 * width + 1 / 2 * offset, 80 / 800 * width + offset);
     line((50 - 10) / 800 * width, (height - 30 + 80 / 800 * width) / 2, width / 2 - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     pop();

     push();
     stroke(255);
     translate(width / 2 - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     rotate(-PI / 2);
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();


     // 원점에 O 글자 써주기
     push();
     fill(255);
     translate(50 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     textAlign(RIGHT)
     textStyle(ITALIC);
     textSize(15);
     text('O', -12 / 800 * width, 17 / 800 * width);
     pop();

     // x축에 't' 글자 써주기
     push();
     fill(255);
     translate(width / 2 - 50 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     textSize(15 / 800 * width);
     textStyle(ITALIC)
     text('t', 10 / 800 * width, 15 / 800 * width)
     pop();

     // y축에 'x(t)' 글자 써주기
     push();
     fill(255);
     translate(50 / 800 * width, 80 / 800 * width);
     textSize(15 / 800 * width);
     textStyle(ITALIC)
     textAlign(LEFT);
     text('x(t)', 10 / 800 * width, 15 / 800 * width)
     pop();

     // //////////////오른쪽 pannel에 axes 그려주기///////////////////////////
     // x축
     push();
     stroke(255);
     line(width / 2 + 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2, width - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     translate(width - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2)
     rotate(-PI / 2);
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();

     // y축
     push();
     stroke(255);
     line(3 / 4 * width, 80 / 800 * width, 3 / 4 * width, height - 30 / 800 * width)
     translate(3 / 4 * width, 80 / 800 * width)
     rotate(PI)
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();

     // 원점에 O 써주기
     push();
     translate(3 / 4 * width, (height - 20 + 80 / 800 * height) / 2)
     fill(255);
     textStyle(ITALIC)
     textAlign(RIGHT, TOP)
     textSize(15 / 800 * width);
     text('O', -10 / 800 * width, 20 / 800 * width)
     pop();

     // x 축에 σ 글씨 써주기
     push();
     translate(width - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2)
     fill(255)
     textStyle(ITALIC)
     textAlign(RIGHT)
     textSize(15 / 800 * width)
     text('σ', 0, 20 / 800 * width)
     pop();

     // y 축에 ω 글씨 써주기
     push();
     translate(3 / 4 * width, 80 / 800 * width)
     fill(255)
     textStyle(ITALIC)
     textAlign(LEFT)
     textSize(15 / 800 * width)
     text('ω', 10 / 800 * width, 20 / 800 * width)
     pop();

}
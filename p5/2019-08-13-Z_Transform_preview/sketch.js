var scl;
var sig = [];
var t = []
var z_circle_x = []
var z_circle_y = []
fs = 500;

var angle
var offset

var dragging = false; // 물체가 dragged 되고 있는가?
var rollover = false; // 마우스가 원 위에 위치해 있는가?
var circle_x, circle_y, circle_r; // 움직일 원의 위치와 사이즈
var offsetX, offsetY; // mouse offset

function setup() {
     createCanvas(windowWidth, windowWidth / 2);
     scl = width / 8;
     for (let i = 0; i < 3; i += 1 / fs) {
          t.push(i)
     }
     for (let i = 0; i < t.length; i++) {
          sig.push(
               cos(2 * PI * 1 * t[i]) * exp(-1 * t[i])
          )
     }

     for (let i = 0; i < 2 * PI; i += 1 / 100) {
          z_circle_x.push(cos(i))
          z_circle_y.push(sin(i))
     }

     left_O_x = 50 / 800 * width;
     left_O_y = (height - 30 + 80 / 800 * width) / 2;
     right_O_x = 3 / 4 * width;
     right_O_y = (height - 30 + 80 / 800 * width) / 2;

     ////////////// drag될 원에 대한 정의 ////////////////////
     // 위치는 오른쪽 면의 축의 원점 기준으로 위치를 잡고자 함.
     // starting position
     circle_x = 0.2;
     circle_y = 0.2;
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

     push()
     translate(right_O_x, right_O_y)
     scale(1, -1)
     beginShape()
     noFill()
     stroke(255)

     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     for (let i = 0; i < z_circle_x.length; i++) {
          vertex(z_circle_x[i] * scl, z_circle_y[i] * scl)
     }
     endShape()
     pop()

     fill(255);
     textAlign(RIGHT)
     textSize(12 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)

     // plotting ARC 1
     plotArc1();

     // plotting ARC 2
     plotArc2();

     // plot Converging Arrow
     plotConvergeArrow();

     plotDivergeArrow();


     function plotConvergeArrow() {
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          noFill();
          for (let i = 3 * PI / 4; i < 2 * PI; i += PI) {
               let x1 = cos(i) * scl;
               let y1 = sin(i) * scl;
               let x2 = 0.7 * x1;
               let y2 = 0.7 * y1;
               let c1 = 150;
               let c2 = 255;
               let c3 = 100;
               let w = 2;
               drawArrowAbsCoord(x1, y1, x2, y2, c1, c2, c3, w);
          }
          pop();
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          translate(cos(7 / 4 * PI) * 0.7 * scl, sin(7 / 4 * PI) * 0.7 * scl);
          scale(1, -1);
          textAlign(CENTER, BOTTOM);
          textSize(15 / 800 * width);
          text('수렴', 0, 0);
          pop();
     }

     function plotDivergeArrow() {
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          noFill();
          for (let i = 3* PI / 4; i < 2 * PI; i += PI) {
               let x1 = cos(i) * scl;
               let y1 = sin(i) * scl;
               let x2 = 1.3 * x1;
               let y2 = 1.3 * y1;
               let c1 = 235;
               let c2 = 152;
               let c3 = 50;
               let w = 2;
               drawArrowAbsCoord(x1, y1, x2, y2, c1, c2, c3, w);
          }
          pop();
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          translate(cos(7 / 4 * PI) * 1.3 * scl, sin(7 / 4 * PI) * 1.35 * scl);
          scale(1, -1);
          textAlign(LEFT, BOTTOM);
          textSize(15 / 800 * width);
          text('발산', 0, 0);
          pop();
     }
     
     function plotArc1() {
          push();
          noFill();
          stroke(255, 100, 100);
          strokeWeight(3);
          translate(right_O_x, right_O_y);
          scale(1, -1);
          arc(0, 0, 2.2 * scl, 2.2 * scl, 0, 3 / 8 * PI);
          translate(cos(3 / 8 * PI) * 1.05 * scl, sin(3 / 8 * PI) * 1.05 * scl);
          angle = atan2(sin(3 / 8 * PI), cos(3 / 8 * PI));
          rotate(angle - PI / 3);
          offset = 8 / 800 * width;
          fill(255, 100, 100);
          triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0);
          pop();
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          translate(cos(1/ 5 * PI) * 1.1 * scl, sin(1 / 5* PI) * 0.8 * scl);
          translate(0.1 * scl, 0.1 * scl);
          scale(1, -1);
          textAlign(LEFT, BOTTOM);
          text('주파수 증가', 0, 0);
          pop();
     }

     function plotArc2() {
          push();
          noFill();
          stroke(100, 100, 255);
          strokeWeight(3);
          translate(right_O_x, right_O_y);
          scale(1, -1);
          arc(0, 0, 2.2 * scl, 2.2 * scl, PI, 3 / 8 * PI + PI);
          translate(cos(3 / 8 * PI + PI) * 1.05 * scl, sin(3 / 8 * PI + PI) * 1.05 * scl);
          angle = atan2(sin(3 / 8 * PI + PI), cos(3 / 8 * PI + PI));
          rotate(angle - PI / 3);
          offset = 8 / 800 * width;
          fill(100, 100, 255);
          triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0);
          pop();
          push();
          translate(right_O_x, right_O_y);
          scale(1, -1);
          translate(cos(1 / 4 * PI + PI) * scl, sin(1 / 4 * PI + PI) * scl);
          translate(-0.15 * scl, -0.15 * scl);
          scale(1, -1);
          textAlign(RIGHT, BOTTOM);
          text('주파수 감소', 0, 0);
          pop();
     }

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
     absZ = sqrt(
          circle_x ** 2 + circle_y ** 2
     )
     sigma = log(absZ)

     omega = -1 * atan2(circle_y, circle_x)

     for (let i = 0; i < t.length; i++) {
          sig.push(
               cos(2 * PI * omega * t[i]) * exp(sigma * t[i])
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
     text('Z-plane 상의 신호 표현', 3 / 4 * width, 35 / 800 * width);
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

     // x축에 'n' 글자 써주기
     push();
     fill(255);
     translate(width / 2 - 50 / 800 * width, (height - 30 + 80 / 800 * width) / 2);
     textSize(15 / 800 * width);
     textStyle(ITALIC)
     text('n', 10 / 800 * width, 15 / 800 * width)
     pop();

     // y축에 'x[n]' 글자 써주기
     push();
     fill(255);
     translate(50 / 800 * width, 80 / 800 * width);
     textSize(15 / 800 * width);
     textStyle(ITALIC)
     textAlign(LEFT);
     text('x[n]', 10 / 800 * width, 15 / 800 * width)
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

     // x 축에 Real(z) 글씨 써주기
     push();
     translate(width - 20 / 800 * width, (height - 30 + 80 / 800 * width) / 2)
     fill(255)
     textStyle(ITALIC)
     textAlign(RIGHT)
     textSize(15 / 800 * width)
     text('real(z)', 0, 20 / 800 * width)
     pop();

     // y 축에 imag(z) 글씨 써주기
     push();
     translate(3 / 4 * width, 80 / 800 * width)
     fill(255)
     textStyle(ITALIC)
     textAlign(LEFT)
     textSize(15 / 800 * width)
     text('imag(z)', 10 / 800 * width, 20 / 800 * width)
     pop();

}
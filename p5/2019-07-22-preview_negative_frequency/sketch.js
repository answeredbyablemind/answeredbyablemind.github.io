var scl;
var sig = [];
var t = []
var fs = 100;
var tt;

var circle_x = [],
     circle_y = [];

function setup() {
     createCanvas(windowWidth, windowWidth/2);
     scl = width/8;
     for (let i = 0; i < 3; i += 1 / fs) {
          t.push(i)
     }
     for (let i = 0; i < t.length; i++) {
          sig.push(
               cos(2 * PI * 1 * t[i])
          )
     }

     for (let i = 0; i < 2 * PI; i += 0.01) {
          circle_x.push(cos(i))
          circle_y.push(sin(i))
     }

     tt = 0;

}

function draw() {
     background(0);

     // titles 그리기
     plotTitles();

     // 좌, 우측 axes 그리기
     plotAxes();

     // 왼쪽 패널에 코사인 함수 그려놓기
     plotCosine();

     // 오른쪽 패널에 원 그리기 (점선으로 표시)
     plotCircle();

     // 오른쪽 패널 원 위에 움직이는 화살표 그리기
     drawArrow(0, 0, cos(2 * PI * 1 * tt), sin(2 * PI * 1 * tt), 66, 135, 245)
     drawArrow(0, 0, cos(2 * PI * 1 * tt), -sin(2 * PI * 1 * tt), 245, 135, 66)

     // 오른쪽 패널 원 위에 움직이는 화살표를 따라가는 점선 그리기
     push();
     stroke(255);
     translate(3 / 4 * width, (height + 50) / 2)
     scale(1, -1);
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     line(cos(2 * PI * 1 * tt) * scl, sin(2 * PI * 1 * tt) * scl, cos(2 * PI * 1 * tt) * scl, -1 * sin(2 * PI * 1 * tt) * scl)
     pop();


     // 왼쪽 패널에 움직이는 빨간 점 그리기
     plotDotLeft();

     // 오른쪽 패널에 움직이는 빨간 점 그리기
     plotDotRight();

     tt += 0.005
     if (tt > 3) {
          tt = 0;
     }

     // 화살표 legend 그려주기
     push();
     textSize(12 / 800 * width);
     drawArrowAbsCoord(
          width * 0.54, height * 0.83, width * 0.60, height * 0.83, 
          66, 135, 245);
     fill(255);
     textAlign(LEFT, CENTER);
     text(': 양의 주파수 회전', width * 0.61, height * 0.83)
     drawArrowAbsCoord(
          width * 0.54, height * 0.9, width * 0.60, height * 0.9, 
          245, 135, 66);
     fill(255);
     text(': 음의 주파수 회전', width * 0.61, height * 0.9)
     pop();

     fill(255);
     textAlign(RIGHT)
     textSize(12/800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)


}
function drawArrowAbsCoord(x1, y1, x2, y2, c1, c2, c3) {
     push();
     strokeWeight(3);
     stroke(c1, c2, c3);
     fill(c1, c2, c3);
     line(x1, y1, x2, y2); //draw a line beetween the vertices
     let offset = 16/800 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}

function plotDotRight() {
     push();
     fill(252, 73, 3);
     noStroke();
     translate(3 / 4 * width, (height + 50) / 2);
     ellipse(cos(2 * PI * 1 * tt) * scl, 0, 10 / 800 * width, 10/ 800 * width);
     pop();
}

function plotDotLeft() {
     push();
     translate(50/ 800 * width, (height + 50) / 2);
     scale(1, -1);
     fill(252, 73, 3);
     noStroke();
     ellipseMode(CENTER);
     ellipse(tt * scl, cos(2 * PI * 1 * tt) * scl, 10 / 800 * width, 10 / 800 * width);
     pop();
}

function plotCircle() {
     push();
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     stroke(255);
     translate(3 / 4 * width, (height + 50) / 2);
     noFill();
     beginShape();
     for (let i = 0; i < circle_x.length; i++) {
          vertex(circle_x[i] * scl, circle_y[i] * scl);
     }
     endShape();
     pop();
}

function plotCosine() {
     push();
     stroke(255);
     noFill();
     translate(50/ 800 * width, (height + 50) / 2);
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
     textSize(25/800 * width);
     text('시간-신호 그래프', width / 4, 35 / 800 * width);
     text('복소평면 상의 신호 표현', 3 / 4 * width, 35 / 800 * width);
     pop();
}

function plotAxes() {

     // triangle의 크기
     let offset = 7 / 800 * width;

     // //////////////////////// 왼쪽 pannel에 axes 그려주기///////////////////////////
     push();
     stroke(255);
     line(50 / 800 * width, 80/ 800 * width, 50/ 800 * width, height - 30);
     triangle(50/ 800 * width, 80/ 800 * width, 50 / 800 * width - 1 / 2 * offset, 80/ 800 * width + offset, 50 / 800 * width + 1 / 2 * offset, 80/ 800 * width + offset);
     line((50 - 10)/ 800 * width, (height + 50) / 2, width / 2 - 20/ 800 * width, (height + 50) / 2);
     pop();

     push();
     stroke(255);
     translate(width / 2 - 20/ 800 * width, (height + 50) / 2);
     rotate(-PI / 2);
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();


     // 원점에 O 글자 써주기
     push();
     fill(255);
     translate(50/ 800 * width, (height + 50) / 2 );
     textAlign(RIGHT)
     textStyle(ITALIC);
     textSize(15);
     text('O', -12/ 800 * width, 17/ 800 * width);
     pop();

     // x축에 't' 글자 써주기
     push();
     fill(255);
     translate(width / 2 - 50/ 800 * width, (height + 50) / 2);
     textSize(15/ 800 * width);
     textStyle(ITALIC)
     text('t', 10/ 800 * width, 15/ 800 * width)
     pop();

     // y축에 'x(t)' 글자 써주기
     push();
     fill(255);
     translate(50/ 800 * width, 80/ 800 * width);
     textSize(15/ 800 * width);
     textStyle(ITALIC)
     textAlign(LEFT);
     text('x(t)', 10/ 800 * width, 15/ 800 * width)
     pop();

     // //////////////오른쪽 pannel에 axes 그려주기///////////////////////////
     // x축
     push();
     stroke(255);
     line(width / 2 + 20/ 800 * width, (height + 50) / 2, width - 20/ 800 * width, (height + 50) / 2);
     translate(width - 20/ 800 * width, (height + 50) / 2)
     rotate(-PI / 2);
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();

     // y축
     push();
     stroke(255);
     line(3 / 4 * width, 80/ 800 * width, 3 / 4 * width, height - 30/ 800 * width)
     translate(3 / 4 * width, 80/ 800 * width)
     rotate(PI)
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();

     // 원점에 O 써주기
     push();
     translate(3/4 * width, (height+50)/2)
     fill(255);
     textStyle(ITALIC)
     textAlign(RIGHT)
     textSize(15/ 800 * width);
     text('O', -10/ 800 * width, 20/ 800 * width)
     pop();

     // x 축에 Real 글씨 써주기
     push();
     translate(width - 20/ 800 * width, (height + 50) / 2)
     fill(255)
     textStyle(ITALIC)
     textAlign(RIGHT)
     textSize(15/ 800 * width)
     text('Real', 0, 20/ 800 * width)
     pop();

     // y 축에 Imaginary 글씨 써주기
     push();
     translate(3/ 4* width, 80/ 800 * width)
     fill(255)
     textStyle(ITALIC)
     textAlign(LEFT)
     textSize(15/ 800 * width)
     text('Imaginary', 10 / 800 * width, 20 / 800 * width)
     pop();

}

function drawArrow(x1, y1, x2, y2, c1, c2, c3) {
     push();
     translate(3 / 4 * width, (height + 50) / 2)
     scale(1, -1)
     strokeWeight(3)
     stroke(c1, c2, c3);
     fill(c1, c2, c3)
     line(x1 * scl, y1 * scl, x2 * scl, y2 * scl); //draw a line beetween the vertices
     let offset = 16 / 800 * width

     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2 * scl, y2 * scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}

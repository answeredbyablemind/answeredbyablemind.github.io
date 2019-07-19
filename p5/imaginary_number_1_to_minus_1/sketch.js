let scl
let arrow
let theta = [];
let ii;
let fs = 60;

function setup() {
     createCanvas(400, 300);
     scl = 120;
     for (let t = 0; t < 0.3; t += 1 / fs) {
          theta.push(PI / 2 * sin(2 * PI / 1.2 * t))
     }
     for (t = 0; t < 0.5; t += 1 / fs) {
          theta.push(PI / 2);
     }
     for (t = 0; t < 0.5; t += 1 / fs) {
          theta.push(PI / 2 * sin(2 * PI / (0.5 * 4) * t) + PI / 2)
     }
     for (t = 0; t < 0.3; t += 1 / fs) {
          theta.push(PI)
     }
     
     ii = 0;
}

function draw() {
     background(255);

     // line 그려주기
     drawLine();

     drawArrow(0, 0, cos(theta[ii]), sin(theta[ii]), 52, 113, 235)

     ii++
     if (ii > theta.length) {
          ii = 0;
     }
     textAlign(RIGHT)
     textSize(10)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.98)
     // noLoop();

}

function drawLine() {
     let offset = 15;
     push()
     stroke(75);
     strokeWeight(2.5);
     line(30, 250, width - 30, 250);
     line(width / 2, 90, width / 2, height - 30);
     pop();

     push();
     fill(75);
     translate(width - 30, 250);
     rotate(PI / 2);

     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle)
     pop();
     push();
     fill(75);
     translate(width / 2, 90);
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle)
     pop();

     push();

     translate(width / 2, 250);
     scale(1, -1)
     stroke(0);
     strokeWeight(0.5);
     line(scl * 1, -8, scl * 1, 8)
     line(scl * (-1), -8, scl * (-1), 8)
     line(-8, scl * 1, 8, scl * 1)
     pop();
     textAlign(RIGHT)
     text('Real Axis', width * 0.95, height * 0.90)

     textAlign(LEFT);
     text('Imaginary Axis', width / 2 + 20, height * 0.35)
}

function drawArrow(x1, y1, x2, y2, c1, c2, c3) {
     let offset = 16
     push();
     translate(width / 2, 250);
     scale(1, -1);
     strokeWeight(7)
     stroke(c1, c2, c3);
     fill(c1, c2, c3)
     // line(x1 * scl, y1 * scl, x2 * scl, y2 * scl); //draw a line beetween the vertices
     line(x1 * scl, y1 * scl, x2 * scl * 0.95, y2 * scl * 0.95); //draw a line beetween the vertices


     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2 * scl, y2 * scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     strokeWeight(3)
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}

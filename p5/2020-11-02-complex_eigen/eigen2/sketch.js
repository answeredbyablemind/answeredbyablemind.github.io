let A = [],
     x = [],
     Ax = [];

let scl;
var slider1

function setup() {
     createCanvas(350, 350);
     // myP = createP('$$\\begin{bmatrix}0.25 & 0.75\\\\ 1 & 0.5\\end{bmatrix}$$');
     // myP.style('color','white')
     
     slider1 = createSlider(0, 2*PI, 0, 0);
     slider1.position(0, height + 10)
     
     scl = width / 3;
}

function draw() {
     background(0);
     x = math.matrix([
          [cos(-slider1.value())],
          [sin(-slider1.value())]
     ])
     y = math.matrix([
          [-sin(-slider1.value())],
          [cos(-slider1.value())]
     ])
     plotAxis();

     drawArrow(0, 0, x._data[0][0], x._data[1][0], 245, 135, 66)
     drawArrow(0, 0, -y._data[0][0], -y._data[1][0], 0, 114, 189)
     textOnArrow();

     push()
     fill(255)
     // stroke(255,0 ,0)
     translate(width/2, height/2)
     scale(1, -1)
     let arc_end = 0

     if (slider1.value() == 0){
          arc_end = 0.0001
     } else {
          arc_end = slider1.value()
     }
     arc(1.25*scl, 1.25*scl, 0.25 * scl, 0.25 * scl, 0, arc_end, PIE)
     
     translate(1.25 * scl, 1.25 * scl)
     
     stroke(255, 0, 0)
     strokeWeight(2)
     line(0, 0, 0.25 / 2 * scl * cos(arc_end), 0.25 / 2 * scl * sin(arc_end))
     pop()

     fill(255)
     textSize(12)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)
     // myP.position(width * 0.8, height * 0.1)
}

function textOnArrow() {
     push();
     translate(width / 2, height / 2);
     // scale(1, -1)
     fill(255);
     textSize(13);
     text('C1', -y._data[0][0] * 0.5 * scl + 20, y._data[1][0] * 0.5 * scl)
     text('C2', x._data[0][0] * 0.5 * scl, -x._data[1][0] * 0.5 * scl -5)

     text('1', 1 * scl + 15, 15)
     text('i', 20, - 1 * scl)
     text('-1', -1 * scl + 15, 15)
     text('-i', 20, 1 * scl)
     pop();
}

function plotAxis() {
     push();
     stroke(255);
     strokeWeight(2);
     line(width / 2, 0, width / 2, height);
     line(0, height / 2, width, height / 2);
     pop();

     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     stroke(150);
     strokeWeight(0.5);
     // vertical lines
     for (let i = -2; i <= 2; i++) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }

     for (let i = -2; i <= 2; i++) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }

     pop();

}

function drawArrow(x1, y1, x2, y2, c1, c2, c3) {
     push();
     translate(width / 2, height / 2)
     scale(1, -1)
     strokeWeight(4)
     stroke(c1, c2, c3);
     fill(c1, c2, c3)
     line(x1 * scl, y1 * scl, x2 * scl, y2 * scl); //draw a line beetween the vertices
     let offset = 16 / 480 * width

     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2 * scl, y2 * scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}

let img;

function setup() {
     createCanvas(480, 480);
     img = loadImage('https://latex.codecogs.com/png.latex?\vec{x}')

     
     background(255);
     image(img, 210, 230)

}

function draw() {
     drawAxis();
     drawArrow(300, 100)
     drawArrow(225, 255)

     // console.log(mouseX, mouseY)
     // textAlign(RIGHT)
     // text('x', 210, 230)
     // text('Ax = λx', 300, 160)
     noLoop()
}

function drawAxis() {
     push();
     strokeWeight(1.5);
     line(50, width - 50, height - 50, height - 50);
     line(50, 50, 50, height - 50);

     textAlign(RIGHT, TOP);
     textSize(15);
     textStyle(BOLDITALIC);
     text('O', 45, height - 50);
     textAlign(LEFT, TOP);
     text('X', width - 50, height - 50);
     textAlign(RIGHT, TOP);
     text('Y', 35, 60);

     // plotting triangle
     fill(0);
     triangle(width - 50, height - 50, width - 50 - 10, height - 50 - 4, width - 50 - 10, height - 50 + 4);
     fill(0);
     triangle(50, 50, 50 - 4, 50 + 10, 50 + 4, 50 + 10);
     pop();

     // plotting xticks
     line(275, height - 50 - 5, 275, height - 50 + 5)
     textAlign(CENTER, TOP)
     textSize(18)
     text('x', 275, height - 50 + 4)

     line(350, height - 50 - 5, 350, height - 50 + 5)
     text('λx', 350, height - 50 + 4)

     // plotting yticks
     line(50 - 5, height - 275, 50 + 5, height - 275)
     textAlign(RIGHT, CENTER)
     text('y', 50 - 12, height - 275 - 10)
     line(50 - 5, height - 350, 50 + 5, height - 350)
     text('λy', 50 - 15, height - 350 - 10)

     push();
     drawingContext.setLineDash([0.5, 2]); // 점선 효과 주기
     line(275, height - 50, 275, height - 275)
     line(50, height - 275, 275, height - 275)
     line(350, height - 50, 350, height - 350)
     line(50, height - 350, 350, height - 350)
     pop();
}


function drawArrow(scl, alpha) {
     push();
     translate(50, height - 50)
     scale(1, -1)
     strokeWeight(8)
     stroke(255, 75, 75, alpha);
     fill(255, 75, 75, alpha)
     line(0, 0, scl * 0.923, scl * 0.923); //draw a line beetween the vertices
     let offset = 30

     let angle = atan2(-scl, -scl); //gets the angle of the line
     translate(scl, scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     noStroke();
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}
function setup() {
     createCanvas(480, 480);
}

function draw() {
     background(255);

     drawAxis();
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
     line(275, height-50-5, 275, height-50+5)
     line(350, height-50-5, 350, height-50+5)

}

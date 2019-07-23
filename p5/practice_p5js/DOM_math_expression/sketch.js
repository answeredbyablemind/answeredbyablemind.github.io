let myPara;

function setup() {
     createCanvas(800, 400);
     myPara = createP('$x$')
     myPara.position(100,100);
}

function draw() {
     background(255);

     myPara.style('color:red')
     rotate(PI/3)
}
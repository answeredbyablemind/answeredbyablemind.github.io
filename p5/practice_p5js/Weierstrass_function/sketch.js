var scl
var t = []
var mySlider
var a = 0.5
var b

var x = []


function setup() {
     createCanvas(320, 320); // 위아래로 20씩 여유 pixel 주기. 
     scl = 60
     b = linspace(0.1, 5, 1000)

     my_slider = createSlider(0, b.length-1, 0)
     my_slider.position(0, height)

     x = linspace(-2, 2, 100)
}


function draw() {
     var y = []
     background(0);
     plotAxes();

     for(var i =0; i<x.length; i++){
          y.push(
               my_function(x[i], a, b[my_slider.value()])
          )
     }


     push()
     beginShape()
     translate(width/2, height/2)
     scale(1, -1)
     noFill()
     stroke(255)
     for (i = 0; i<x.length; i++){
          vertex(x[i] * scl, y[i] * scl)
     }
     endShape()
     pop()
}

function plotAxes() {
     drawArrow(0, height / 2, width, height / 2);
     drawArrow(width / 2, height, width / 2, 0);
     push()
     fill(255);
     textAlign(RIGHT, TOP);
     text('0', width / 2 - 5, height / 2 + 5);
     pop()

     push();
     translate(width / 2, height / 2);
     textAlign(CENTER, TOP);
     fill(255)
     for (var i = -3; i <= 3; i++) {
          if (i != 0) {
               stroke(255);
               line(i * scl, -5, i * scl, 5);
               noStroke();
               text(str(i), i * scl, 10);
          }
     }

     for (var i = -3; i <= 3; i++) {
          if (i != 0) {
               stroke(255);
               line(-5, i * scl, 5, i * scl);
               noStroke();
               text(str(-i), -12, i * scl - 5);
          }
     }
     pop();

     push()
     fill(255)
     noStroke()
     text('x', width-10, height/2 - 10)

     text('y', width/2 + 10, 10)

     text('b = 0.1', 10, height- 5)
     text('b = 5', 100, height - 5)

     text('ⓒ공돌이의 수학정리노트', 180, height-5)
     pop()


}

function linspace(stt, end, steps){
     var res = []
     for(i=stt; i<=end; i+=((end-stt)/(steps-1))){
          res.push(
               i
          )
     }

     if (res.length < steps){
          res.push(end)
     }
     return res
}

function drawArrow(x1, y1, x2, y2) {
     push();
     // strokeWeight(w);
     stroke(255);
     fill(255);
     line(x1, y1, x2, y2); //draw a line beetween the vertices
     let offset = 10 / 320 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}

function my_function(x, a, b){
     var fx = 0

     for (var n = 0 ; n<300; n++){
          fx += a**n * cos(b**n*PI*x)
     }

     return fx
}
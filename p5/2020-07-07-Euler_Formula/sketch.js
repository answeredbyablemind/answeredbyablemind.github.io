var scl;
var n
var slider
function setup() {
     createCanvas(windowWidth * 0.9, windowHeight * 0.9);
     // createCanvas(400, 300);
     scl = width / 2;
     slider = createSlider(0, 20, 1, 1)
     slider.position(width * 0.05, height * 0.9)
}

function draw() {
  
     background(0);
     plotSignature()
     
     push();
     translate(0, -height / 15) // 살짝만 위로 올려서 그려줘서 slide 위치 확보
     plotAxes()
     plot_Euler_Discretely(slider.value())
     pop()

     let array = ['n = ', str(slider.value())]
     let separator = ' ';
     let message = join(array, separator)
     textSize(15 / 800 * width);
     text(message, width * 3 / 4, height / 4)
}

function plotSignature(){
     fill(255);
     textAlign(RIGHT)
     textSize(12 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)
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

function plotAxes() {

     // triangle의 크기
     let offset = 7 / 800 * width;

     // x축
     push();
     stroke(255);
     line(1/8 * width - 1/12 * width, 7/8 * height, 7/8 * width, 7/8 * height);
     
     line(1/8 * width + scl, height * 7/8 - offset, 1/8 * width + scl, height * 7/8 + offset)
     text('1', 1/8 * width + scl, height * 7/8 + offset * 3)

     translate(7/8 * width, 7/8 * height);
     rotate(-PI / 2);
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);


     pop();

     // y축
     push();
     stroke(255);
     line(1/8 * width, 7/8 * height + 1/12 * height, 1/8 * width, 1/8 * height)
     
     line(1/8 * width - offset, height * 7/8 - scl, 1/8 * width + offset, height * 7/8 - scl)
     text('1', 1/8 * width - offset * 3, height * 7/8 - scl)

     translate(1/8 * width, 1/8 * height)
     rotate(PI)
     triangle(0, 0, -1 / 2 * offset, -offset, 1 / 2 * offset, -offset);
     pop();

     // 원점에 O 써주기
     push();
     translate(1/8 * width, 7/8 * height)
     fill(255);
     textStyle(ITALIC)
     textAlign(RIGHT, TOP)
     textSize(15 / 800 * width);
     text('O', -10 / 800 * width, 10 / 800 * height)
     pop();

     // x 축에 Real(z) 글씨 써주기
     push();
     translate(7/8 * width, 7/8 * height)
     fill(255)
     textStyle(ITALIC)
     textAlign(RIGHT)
     textSize(15 / 800 * width)
     text('real', 0, 20 / 800 * width)
     pop();

     // y 축에 imag(z) 글씨 써주기
     push();
     translate(1/8 * width, 1/8 * height)
     fill(255)
     textStyle(ITALIC)
     textAlign(LEFT)
     textSize(15 / 800 * width)
     text('imag', 10 / 800 * width, 20 / 800 * width)
     pop();
}

function plot_Euler_Discretely(n){
     var prev_coord = math.complex(1, 0)
     var new_coord = math.complex(0, 0)
     

     var i = math.complex(0,1)
     push()
     translate(1/8 * width, 7/8 * height)
     scale(1, -1)
     stroke(255)
     noFill()

     for(let k = 0; k <= n; k++){
          
          let a = math.pow(math.add(1, math.divide(i, n)), k)          

          new_coord = [a.re, a.im]
          line(0, 0, new_coord[0] * scl, new_coord[1] * scl)
          fill(255)
          ellipse(new_coord[0] * scl, new_coord[1] * scl, scl / 30)
          noFill()
          line(prev_coord[0] * scl, prev_coord[1] * scl, new_coord[0] * scl, new_coord[1] * scl)
          prev_coord = new_coord
          
     }
     pop()

}
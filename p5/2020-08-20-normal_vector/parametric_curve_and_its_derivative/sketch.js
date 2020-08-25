var scl
var t = []
var mySlider

var x = []
var y = []

function setup() {
     createCanvas(320, 320); // 위아래로 20씩 여유 pixel 주기. 
     scl = 60
     t = linspace(0, 3, 500)

     my_slider = createSlider(0, 500, 0, 1)
     my_slider.position(0, height)

     var temp = []

     for(var i = 0; i<t.length; i++){
          temp = my_function(t[i])
          x.push(temp[0])
          y.push(temp[1])
     }
}


function draw() {
     background(0);
     plotAxes();

     // 함수는 미리 그려놓기

     push()
     noFill()
     stroke(242,245,66)
     translate(width/2, height/2)
     scale(1, -1)

     beginShape()
     strokeWeight(1.5)
     for(i = 0; i<x.length; i++){
          vertex(x[i] * scl, y[i] * scl)
     }
     endShape()
     
     // 곡선의 기울기 그리기
     var temp

     temp = my_function_prime(t[my_slider.value()])
     x_prime = temp[0]
     y_prime = temp[1]

     var x1 = x[my_slider.value()]
     var y1 = y[my_slider.value()]
     var tangent = y_prime / x_prime // 무조건 화살표가 오른쪽으로만 향하게 되는 문제 있음.
     var delta_x = 0.5
     var tan_length = sqrt(y_prime ** 2/x_prime **2)
     // 각도가 90'가 될 때 화살표의 크기가 너무 커지는 문제 있음.
     drawArrow(x1 * scl, y1 * scl, (x1 + delta_x) * scl, (y1 + delta_x * tangent/tan_length) * scl)
     // print(x_prime, y_prime)
     print(tan_length)
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

     text('t = 0', 10, height- 5)
     text('t = 3', 100, height - 5)

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

function my_function(t){
     x0 = t * cos(2*PI*t)
     y0 = t * sin(2*PI*t)
     return [x0, y0]
}

function my_function_prime(t){
     x0 = cos(2 * PI * t) - t * sin(2 * PI * t) * 2 * PI
     y0 = sin(2 * PI * t) + t * cos(2 * PI * t) * 2 * PI
     return [x0, y0]
}
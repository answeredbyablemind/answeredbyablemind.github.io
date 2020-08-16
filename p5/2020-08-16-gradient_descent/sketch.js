var scl
var x = []
var y = []
var y_dif = []
var loc
var step_size

var new_loc
var old_loc

var my_slider
var my_slider2

function setup() {
     createCanvas(320, 320); // 위아래로 20씩 여유 pixel 주기. 
     scl = 120;

     x = linspace(-1.5, 1.5, 100)
     for(let i = 0; i < x.length; i++){
          y.push(
               my_function(x[i])
          )
          y_dif.push(
               my_function_prime(x[i])
          )
     }
     // loc = random(-1, 0.8)

     my_slider = createSlider(0.01, 1.2, 0.8, 0.0001) // step size
     my_slider.position(0, height - 30)

     my_slider2 = createSlider(-1.3, 1.3, 1.3, 0.00001) // loc
     my_slider2.position(0, height - 70)

}


function draw() {
     background(0);
     step_size = my_slider.value()
     noStroke()
     fill(255)
     text('시작 위치', 10, height - 70)

     loc = my_slider2.value()
     text('step size', 10, height - 30)

     noStroke()
     fill(255)
     drawArrow(10, height * 2/3, width - 10, height * 2/3)
     text('x', width - 20, height * 2 / 3 + 15)

     drawArrow(width / 2, height - 40, width / 2, 10)
     text('y', width / 2 + 10, 10)

     push()
     noFill()
     stroke(255)
     translate(width/2, height * 2/3)
     scale(1, -1)
     strokeWeight(2)
     beginShape()
     for (let i = 0; i < x.length; i++){
          vertex(x[i] * scl, y[i] * scl)
     }
     endShape()
     strokeWeight(1.5)
     fill(255, 0, 0)
     ellipse(loc * scl, my_function(loc) * scl, 10)
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     old_loc = loc
     stroke(255, 100, 100)
     for (let i = 0; i < 30; i++){
          new_loc = old_loc - step_size * my_function_prime(old_loc)
          line(old_loc * scl, my_function(old_loc) * scl, new_loc * scl, my_function(new_loc) * scl)
          old_loc = new_loc;
     }

     drawingContext.setLineDash([1, 1]); // 점선 효과 종료

     pop()

     text('(c) 공돌이의 수학정리노트', width - 150, height - 10)
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
     let offset = 10 / 800 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}

function my_function(x){
     // return 3 * (x+1)*(x+0.1)*(x-0.3)*(x-0.7) + 1
     return x ** 2
}

function my_function_prime(x){
     // return 12*x**3 + (9*x**2)/10 - (237*x)/50 + 393/1000       
     return 2 * x
}
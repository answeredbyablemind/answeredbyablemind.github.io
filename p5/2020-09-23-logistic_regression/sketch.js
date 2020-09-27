var scl
var xx = []
var yy = []
var a, b

var slider1, slider2


var txt_slp
var txt_intcpt
var txt_signature

function setup() {
     createCanvas(640, 280);
     scl = round(width / 12)

     slider1 = createSlider(-5, 5, 1, 0.1)
     slider1.position(10, 50)
     slider2 = createSlider(-10, 10, 0, 0.1)
     slider2.position(150, 50)
     

     txt_slp = createElement("text", " ")
     txt_signature = createElement("text", " ")

     txt_signature.position(width-190, height)
     txt_signature.html("ⓒ 공돌이의 수학정리노트")
}


function draw() {
     background(255);

     plotAxes();

     // y = 1 점선 하나 그어주자

     stroke(0)
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     line(0, height - 20 - 1 * scl * 2, width, height - 20 - 1 * scl * 2)

     drawingContext.setLineDash([1, 1]); // 점선 효과 종료
     
     xx = linspace(-6, 6, 100)

     a = slider1.value();
     b = slider2.value();

     for(let i = 0; i<xx.length; i++){
          yy[i] = my_function(xx[i], a, b)
     }
     push()
     translate(width/2, height - 20)
     scale(1, -1)
     stroke(3, 165, 252)
     strokeWeight(2)
     noFill()
     beginShape()
     for(let i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, yy[i] * scl * 2)          
     }
     endShape()
     pop()
     
     txt_slp.position(20, height / 2 - 30)

     if (b >= 0){
          if (a < 0){
               txt_slp.html(join(['= 1/(1+exp(', str(round(-a, 2)),'x -', str(round(b, 2)),'))'], ' '))     
          }
          else {
               txt_slp.html(join(['= 1/(1+exp(-', str(round(a, 2)),'x -', str(round(b, 2)),'))'], ' '))     
          }
          
     } else {
          if (a<0) {
               txt_slp.html(join(['= 1/(1+exp(', str(round(-a, 2)),'x +', str(round(-b, 2)),'))'], ' '))     
          }
          else {
               txt_slp.html(join(['= 1/(1+exp(-', str(round(a, 2)),'x +', str(round(-b, 2)),'))'], ' '))     
          }
          
     }     

     noStroke()
     fill(0)
     text('a 값', 70, 45)
     text('b 값', 210, 45)
     textSize(15)
     text('S(x) = 1/(1+exp(-ax-b))', 20, 100)



}

function plotAxes() {
     drawArrow(0, height - 20, width, height - 20);
     drawArrow(width / 2, height, width / 2, 0);

     for (i = -5; i < 6; i++) {
          stroke(0)
          line(width / 2 + i * scl, height - 20 + 5, width / 2 + i * scl, height - 20 - 5);
          noStroke()
          text(i, width / 2 + i * scl - 8, height - 5);
     }

     for (i = 0; i < 3; i++) {
          stroke(0)
          line(width / 2 - 5, height - 20 - i * scl * 2, width / 2 + 5, height - 20 - i * scl * 2);
          noStroke()
          if (i != 0) {
               text(i, width / 2 + 8, height - 20 - i * scl * 2 + 5);
          }
     }
}

function linspace(stt, end, steps){
     var res = []
     for(i=stt; i<=end; i+=((end-stt)/(steps-1))){
          res.push(
               i
          )
     }

     if(res.length < steps){
          res.push(end)
     }
     return res
}

function drawArrow(x1, y1, x2, y2) {
     push();
     // strokeWeight(w);
     stroke(0);
     fill(0);
     line(x1, y1, x2, y2); //draw a line beetween the vertices
     let offset = 10 / 800 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}

function my_function(x, a, b){
     return 1/(1+exp(-a*x-b))
}

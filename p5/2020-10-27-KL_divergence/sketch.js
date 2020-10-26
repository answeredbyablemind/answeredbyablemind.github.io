var scl
var xx = []
var yy1 = []
var yy2 = []
var mu1 = 0
var mu2
var height_scl_factor = 15
var alpha_val = 175
var mySlider
var newScl = 200

var dragged = false; // 마우스가 dragged 되고 있는가?
var rollover = false; // 마우스가 threshold bar 위에 위치해 있는가?
var bar_center = (400+10)/2
var n_xx = 200
var D_KL

var tex_div
var div 

function setup() {
     createCanvas(860, 320); // 위아래로 20씩 여유 pixel 주기. 
     scl = 30;
     xx = linspace(-10,10,n_xx)
     
     // 왼쪽에 고정되어 있는 (mu = 2)인 gaussian distribution 미리 계산
     for(var i = 0; i < xx.length; i++){
          yy1.push(
               gaussian(xx[i], mu1)
          )
     }

     mySlider = createSlider(-3, 3, -2, 0.1)
     mySlider.position(0, height)

     tex_div = createP()
     tex_div.style('font-size', '15px')
     tex_div.style('color','#ffffff')
     tex_div.position(width*3/4 + 25, height * 0.17)

}


function draw() {
     background(0);
     // 왼쪽 오른쪽 패널 구분 선 그리기
     stroke(150)
     line(430, 0, 430, height)

     //// 패널 제목 적어주기
     noStroke()
     fill(255)
     textAlign(CENTER)
     // 왼쪽 패널 제목 적어주기
     text('확률 분포 P(x)와 Q(x)', 200, 30)
     // 오른쪽 패널 제목 적어주기
     
     // text('KL divergence', 430+145, 30)

     mu2 = mySlider.value()
     yy2 = [] // clear yy2
     // 왼쪽 패널에서 움직이는 (mu = -2)인 gaussian distribution 계산
     for(var i = 0; i < xx.length; i++){
          yy2.push(
               gaussian(xx[i], mu2)
          )
     }

     // gaussian distribution 두 개 그려주기
     push()
     translate((10+400)/2, height - 40) // 0,0 좌표
     scale(1, -1)

     my_color = color(100, 100, 255)
     my_color.setAlpha(alpha_val)
     fill(my_color)
     
     beginShape()
     for(var i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, yy1[i] * scl * height_scl_factor)
     }
     endShape()


     var my_color = color(255, 100, 200)
     my_color.setAlpha(alpha_val)
     fill(my_color)

     beginShape()
     for(var i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, yy2[i] * scl * height_scl_factor)
     }
     endShape()
     pop()

     //// axis 그려주기
     // 왼쪽 panel에 axis 그려주기
     drawArrow(10, height - 40, 400, height - 40)

     // 오른쪽 panel에 axis 그려주기
     drawArrow(440, height - 40, width - 10, height - 40) // x축
     text('x', width-25, height - 20) // x축 이름
     drawArrow(645, height - 30, 645, 40) // y축
     text('y', 645, 35)
     
     push()
     translate(645, height - 40)
     scale(1, -1)
     var P
     var Q
     D_KL = []
     for(i = 0; i<xx.length; i++){
          P = gaussian(xx[i], mu1)
          Q = gaussian(xx[i], mu2)
          D_KL.push(
               P * log(P/Q)
          )
     }

     div = 0
     for (i=0; i<xx.length; i++){
          div += D_KL[i]
     }

     let my_arr = ['D_{KL}(P\\|Q) =', str(round(div, 2))]
     let separator = ' '
     katex.render(
          join(my_arr, separator)
          , tex_div.elt
     )
     
     var my_color = color(158, 219, 127)
     my_color.setAlpha(alpha_val)
     fill(my_color)

     beginShape()

     for(i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, D_KL[i] * scl * 3)
     }

     endShape()

     pop()
     // 사인하고 마무리
     text('ⓒ 공돌이의 수학정리노트', width * 0.85, height * 0.95)
     

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

function gaussian(x, mu){
     var sigma = 1;
     
     return  1/(sigma * sqrt(2 * PI)) * exp(-1 * (x-mu)**2 / (2 * sigma**2))
}


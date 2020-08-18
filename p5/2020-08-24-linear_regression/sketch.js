var scl = 40
var cell_size = 10

var dataPoints = []
var slp
var intcpt

var slp_saved = []
var intcpt_saved = []

var lr = 0.01
var MSE

var coord_slp_intcpt = [] // 오른쪽 패널의 imagesc 처럼 그리기 위한 cell 내부의 좌표용
var slps = []
var intcpts = []

var N_slps
var N_intcpts

var txt_slp
var txt_intcpt
var txt_signature

function setup() {
     createCanvas(640, 280);

     slp = random(-1, 1)
     intcpt = random(-1, 1)
     N_slps = floor(240 / 10)
     N_intcpts = floor(240 / 10)

     slps = linspace(-3, 3, N_slps)
     intcpts = linspace(-3, 3, N_intcpts)
     txt_slp = createElement("text", " ")
     txt_intcpt = createElement("text", " ")
     txt_signature = createElement("text", " ")

     txt_signature.position(width-190, height)
     txt_signature.html("ⓒ 공돌이의 수학정리노트")
}


function draw() {
     background(0);
     
     txt_slp.position(20, height)
     txt_slp.html(join(['기울기: ', str(round(slp, 2))], ' '))

     txt_intcpt.position(20, height + 20)
     txt_intcpt.html(join(['절편: ', str(round(intcpt, 2))], ' '))

     // text 아랫쪽
     fill(255, 0, 0)
     // 왼쪽 패널 좌표축 그려주기
     plotLeftPanel();

     // 마우스로 찍는 데이터 포인트들 그려주기
     plotDataPoints();

     let N = dataPoints.length

     // gradient descent
     let rEra = 0
     let rErb = 0
     let yhat
     MSE = 0

     for (i = 0; i<N; i++){
          yhat = my_function(dataPoints[i][0], slp, intcpt)
          rEra += 1/N * (yhat-dataPoints[i][1]) * dataPoints[i][0]
          rErb += 1/N * (yhat-dataPoints[i][1])
          MSE += 1/(2*N) * (yhat - dataPoints[i][1])**2
     }

     slp -= lr * rEra
     intcpt -= lr * rErb

     slp_saved.push(slp)
     intcpt_saved.push(intcpt)

     stroke(252, 223, 3)
     push()
     translate(160, 140)
     scale(1, -1)
     line(-3 * scl, (-3 * slp + intcpt) * scl, 3 * scl, (3 * slp + intcpt) * scl)
     pop()

     // 오른쪽 패널 사각형 그려주기
     fill(255)
     noStroke()
     push()
     translate(340 + 120, height - 20)
     
     strokeWeight(1)
     for(var i = -3; i<=3; i++){
          stroke(255)
          line(i * scl, 0, i * scl, 5)
          noStroke()
          text(i, i*scl + 5, 3)
     }
     translate(-120, -120)
     for(var i = -3; i<=3; i++){
          stroke(255)
          line(-5, i * scl, 0, i * scl)
          noStroke()
          text(-i, -10, i * scl - 5)
     }
     pop()

     drawArrow(340, height - 20, width - 20, height - 20)
     text('기울기', width-40, height - 40)

     drawArrow(340, height - 20, 340, 5)
     text('절편', 310, 20)

     
     var maxMSE = -999
     var minMSE = 999

     for(let i = 0; i< N_slps; i++){
          coord_slp_intcpt[i] = []
          for(let j = 0; j < N_intcpts; j++){
               MSE = 0
               // MSE 계산하기
               for (let k = 0; k<N; k++){
                    yhat = my_function(dataPoints[k][0], slps[i], intcpts[j])
                    MSE += 1/(2*N) * (yhat - dataPoints[k][1]) ** 2
               }
               coord_slp_intcpt[i][j] = MSE

               if (MSE > maxMSE){
                    maxMSE = MSE
               }

               if (MSE < minMSE){
                    minMSE = MSE
               }
          }
     }
     push()
     noStroke()
     translate(341, height -21)
     scale(1, -1)
     for(let i = 0; i< N_slps; i++){
          for(let j = 0; j < N_intcpts; j++){
               fill((coord_slp_intcpt[i][j] - minMSE) / (maxMSE - minMSE + 0.001) * 255)
               rect( i * cell_size, j * cell_size, cell_size, cell_size)
          }
     }

     translate(120, 120)
     beginShape()
     noFill()
     stroke(255)
     for (i = 0; i<slp_saved.length; i++){
          vertex(slp_saved[i] * scl, intcpt_saved[i] * scl)
          if (i % 100 == 0){
               fill(100, 255, 0)
               noStroke()
               ellipse(slp_saved[i] * scl, intcpt_saved[i] * scl, 5, 5)
          }
          noFill()
          stroke(255)
          
     }
     
     endShape()
     
     fill(255, 100, 100)
     ellipse(slp * scl, intcpt * scl, 5, 5)
     pop()

     

     

}

function plotDataPoints() {
     push()
     fill(255, 100, 100, 180)
     noStroke()
     translate(160, 140) // 원점 좌표로 translate
     scale(1, -1)
     for (var i = 0; i < dataPoints.length; i++) {
          ellipse(dataPoints[i][0] * scl, dataPoints[i][1] * scl, 10, 10)
     }
     pop()
}

function mouseClicked(){
     if (mouseX > 40 & mouseX< 280 & mouseY > 20 & mouseY < height - 20){
          dataPoints.push(
               [(mouseX- 160) / scl, -1 * (mouseY - 140) / scl]
          )
     }

     return false // 브라우저별 mouseClicked 기능 차이에 의한 에러 방지
}
function plotLeftPanel() {
     fill(255)
     drawArrow(40, height / 2, 280, height / 2);
     drawArrow(160, height - 20, 160, 20);
     textAlign(RIGHT, TOP);
     text('0', 160 - 5, 140 + 5);

     textAlign(CENTER, TOP);
     push();
     translate(160, 140);

     for (var i = -3; i <= 3; i++) {
          if (i != 0) {
               text(str(i), i * scl, 5);
               text(str(i), -10, -i * scl);
          }
     }
     // 세로줄 그려주기
     stroke(186, 213, 255);
     for (i = -3; i <= 3; i++) {
          if (i != 0) {
               line(i * scl, -120, i * scl, 120);
          }

     }
     // 가로줄 그려주기
     for (i = -3; i <= 3; i++) {
          if (i != 0) {
               line(-120, i * scl, 120, i * scl);
          }

     }
     pop()
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

function my_function(x, a, b){
     return a*x+b
}

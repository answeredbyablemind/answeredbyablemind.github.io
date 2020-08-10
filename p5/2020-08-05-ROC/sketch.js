var scl
var xx = []
var yy1 = []
var yy2 = []
var mu1 = 2
var mu2
var height_scl_factor = 15
var alpha_val = 175
var mySlider
var newScl = 200

var dragged = false; // 마우스가 dragged 되고 있는가?
var rollover = false; // 마우스가 threshold bar 위에 위치해 있는가?
var bar_center = (400+10)/2
var n_xx = 200

function setup() {
     createCanvas(720, 320); // 위아래로 20씩 여유 pixel 주기. 
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
     text('distributions for classes', 200, 30)
     // 오른쪽 패널 제목 적어주기
     
     text('ROC curve', 430+145, 30)

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

     var my_color = color(255, 100, 200)
     my_color.setAlpha(alpha_val)
     fill(my_color)

     beginShape()
     for(var i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, yy1[i] * scl * height_scl_factor)
     }
     endShape()

     my_color = color(100, 100, 255)
     my_color.setAlpha(alpha_val)
     fill(my_color)

     beginShape()
     for(var i = 0; i<xx.length; i++){
          vertex(xx[i] * scl, yy2[i] * scl * height_scl_factor)
     }
     endShape()
     pop()

     // TPR, FPR 계산
     temp = calc_ROC(mu1, mu2)
     var TPR = temp[0]
     var FPR = temp[1]

     // Threshold bar 그려주기
     push()
     bar_h = max(yy2)
     bar_w = 7
     fill(255)

     if (bar_center > 380){
          bar_center = 380
     }

     if (bar_center < 20){
          bar_center = 20
     }
     translate(bar_center, 0)

     if (dragged){
          bar_center = mouseX
     }

     rect(0-bar_w/2, height-40-bar_h*scl*height_scl_factor, bar_w, bar_h * scl * height_scl_factor)
     pop()

     //// axis 그려주기
     // 왼쪽 panel에 axis 그려주기
     drawArrow(10, height - 40, 400, height - 40)

     // 오른쪽 panel에 axis 그려주기
     drawArrow(440, height - 40, width - 10, height - 40)
     text('FPR', width-25, height - 20) // x축 이름
     drawArrow(440 + 10, height - 30, 440 + 10, 40)
     text('TPR', 440 + 10, 35)
     
     // 오른쪽 패널에 사선 그려주기 (점선)
     push()
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     stroke(255)
     line(440+10, height -40, 440+10+FPR[FPR.length-1]*newScl, height - 40 - TPR[TPR.length-1]*newScl)
     pop()

     push()
     translate(440+10, height - 40)
     scale(1, -1)
     fill(255, 0, 0)

     beginShape()
     noFill()
     stroke(255)
     for (var i = 0; i<xx.length; i++){
          vertex(FPR[i] * newScl, TPR[i] * newScl)
     }
     endShape()

     fill(255,0, 0)
     var loc = (bar_center - (400+10)/2) / scl
     var TPR_loc = GetZPercent(loc - mu2)
     var FPR_loc = GetZPercent(loc - mu1)

     ellipse(FPR_loc * newScl, TPR_loc * newScl, 10)
     pop()
     
     //
     text('ⓒ공돌이의 수학정리노트',width * 0.9, height * 0.9)
     

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

function calc_ROC(mu1, mu2){
     // sigma = 1이고 mu1, mu2인 정규분포 두 개가 있다고 했을 때
     // 생각하고 있는 모든 xx에 대해 TPR과 FPR 값을 계산해야 함
     var TPR = []
     var FPR = []
     for (var i = 0; i<xx.length; i++){
          TPR.push(
               GetZPercent(xx[i]-mu2)  // sigma = 1이므로 나누기는 생략
               )
          FPR.push(
               GetZPercent(xx[i]-mu1) 
               )
     }

     return [TPR, FPR]
}

function GetZPercent(z) 
  { //출처: https://stackoverflow.com/questions/16194730/seeking-a-statistical-javascript-function-to-return-p-value-from-a-z-score
    //z == number of standard deviations from the mean

    //if z is greater than 6.5 standard deviations from the mean
    //the number of significant digits will be outside of a reasonable 
    //range
    if ( z < -6.5)
      return 0.0;
    if( z > 6.5) 
      return 1.0;

    var factK = 1;
    var sum = 0;
    var term = 1;
    var k = 0;
    var loopStop = Math.exp(-23);
    while(Math.abs(term) > loopStop) 
    {
      term = .3989422804 * Math.pow(-1,k) * Math.pow(z,k) / (2 * k + 1) / Math.pow(2,k) * Math.pow(z,k+1) / factK;
      sum += term;
      k++;
      factK *= k;

    }
    sum += 0.5;

    return sum;
}

function mousePressed(){
     if (
          (mouseX > (-bar_w/2 + bar_center)) & (mouseX < (bar_w + bar_center)) 
               & (mouseY < (height - 40)) & (mouseY > (height-40-bar_h*scl*height_scl_factor))
          ){
          dragged = true
     }
}

function mouseReleased(){
     dragged = false
}

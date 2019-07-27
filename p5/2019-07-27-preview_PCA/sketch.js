var scl;
var randomTemp = [[],[]]
var myCov = [[2,1],[1,2]]
var dataMtx
var numData = 80;
var axisAngle;
var axisX, axisY, axisXOppo, axisYOppo
var projMtx, dataMtx_proj;
var ellipseSize;

function setup() {
     createCanvas(windowWidth-20, windowWidth-20);
     scl = width / 8;
     for (i=0; i<numData; i++){
          randomTemp[0][i] = random(1) * 2 - 1
          randomTemp[1][i] = random(1) * 2 - 1
     }
     dataMtx = math.multiply(myCov, randomTemp)
     axisAngle = 0;

     if(width<500){
          ellipseSize = 8 / 800 * width;
     } else {
          ellipseSize = 10 / 800 * width;
     }
}

function draw() {
     background(0);
     plotAxis();
     plotData();

     push();
     translate(width/2, height/2);
     scale(1, -1)
     axisX = width * cos(axisAngle)
     axisY = width * sin(axisAngle)
     axisXOppo = width * cos(axisAngle + PI)
     axisYOppo = width * sin(axisAngle + PI)
     stroke(202, 252, 3);
     strokeWeight(2)
     line(axisX, axisY, axisXOppo, axisYOppo)
     projMtx = math.multiply([[cos(axisAngle)],[sin(axisAngle)]],[[cos(axisAngle), sin(axisAngle)]])     
     dataMtx_proj = math.multiply(projMtx, dataMtx)
     stroke(232,67,67, 100);
     strokeWeight(ellipseSize / 3)
     for(i=0;i<numData; i++){
          line(dataMtx[0][i] * scl , dataMtx[1][i] * scl, dataMtx_proj[0][i] * scl, dataMtx_proj[1][i] * scl)
     }
     pop();

     // noLoop();
     axisAngle += 0.01;

     if(axisAngle > 2 * PI){
          axisAngle = 0;
     }

     if(abs(axisAngle - PI/4) < 0.005){
          delayTime();
     }
     
     if(abs(axisAngle - (PI/4 + PI)) < 0.005){
          delayTime();
     }
     fill(255)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.9, height * 0.9)


}
function delayTime(){
     var lastTime = millis()
     while(millis() - lastTime < 500){
          noLoop();
     }
     loop();
}

function plotData(){
     push();
     translate(width/2, height/2)
     fill(3, 177, 252, 200)
     noStroke();
     scale(1,-1)
     for(i=0; i<numData; i++){
          ellipse(dataMtx[0][i] * scl, dataMtx[1][i] * scl, ellipseSize);
     }
     pop();
}
function plotAxis() {
     push();
     stroke(200);
     strokeWeight(3);
     line(width / 2, 0, width / 2, height);
     line(0, height / 2, width, height / 2);
     pop();

     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     stroke(150);
     strokeWeight(0.5);
     // vertical lines
     for (let i = -3; i <= 3; i++) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }

     for (let i = -3; i <= 3; i++) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }

     pop();

}
// alpha는 0.01에서 0.3까지 변하는 걸로 하자.
// ylim은 -2에서 2로 하고, xlim은 -3에서 3까지.
var scl
var f_neg = []
var f_pos = []
var G_neg = []
var G_pos = []

var a
var mySlider

function setup() {
     createCanvas(windowWidth - 20, 2/ 3 * (windowWidth - 20));
     scl = (width / 6); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.
     for (let i = -3; i <= 0; i += 3/50){
          f_neg.push(i)
     }
     f_neg.push(0)
     for (let i = 0; i <= 3; i += 3/50){
          f_pos.push(i)
     }
     mySlider = createSlider(0.01, 1, 0.2, 0.001)

}

function draw() {
     background(0);
     a = mySlider.value()

     drawGrid();
     plotFunction();
     text('↓ alpha 값', 0, height * 0.95)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)
}

function plotFunction() {
     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     // G 계산하기
     for (let i = 0; i <= f_neg.length; i++) {
          G_neg[i] = -1 * exp(a * f_neg[i]);
     }
     for (let i = 0; i <= f_pos.length; i++) {
          G_pos[i] = exp(-1 * a * f_pos[i]);
     }
     // G 그려주기
     noFill();
     stroke(242, 125, 50);
     strokeWeight(4);
     beginShape();
     for (let i = 0; i < G_neg.length; i++) {
          vertex(f_neg[i] * scl, G_neg[i] * scl);
     }
     for (let i = 0; i < G_pos.length; i++) {
          vertex(f_pos[i] * scl, G_pos[i] * scl);
     }
     vertex();
     endShape();
     pop();
}

function drawGrid() {
     push();
     stroke(100);
     translate(width / 2, height / 2);
     // vertical lines
     for (let i = -3; i <= 3; i++) {
          line(i * scl, -height / 2, i * scl, height / 2);
     }
     // horizontal lines
     for (let j = -2; j <= 2; j++) {
          line(-width / 2, j * scl, width / 2, j * scl);
     }
     // vertical center line
     stroke(255);
     strokeWeight(2);
     line(0, -height / 2, 0, height / 2);
     // horizontal center line
     line(-width / 2, 0, width / 2, 0);
     pop();
}

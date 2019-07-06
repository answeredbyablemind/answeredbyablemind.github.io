let ylabel = []
let xlabel = []
let t = []
let x = []
// let i = 0;

let mySlider;

function setup() {
     // put setup code here
     scl = 40;
     n_xlabel = 11;
     n_ylabel = 9;

     myCanvas = createCanvas(scl * n_xlabel + 20, scl * n_ylabel + 20);
     mySlider = createSlider(3,75,10,3);
     mySlider.position(300, 54);

     // x, y label을 만들어주기
     for (let i = 0; i < n_ylabel; i++) {
          ylabel[i] = 6 - i;
     }
     for (let i = 0; i < n_xlabel; i++) {
          xlabel[i] = 0 + i;
     }

     // t 설정
     for (let i = 0; i < 400; i++) {
          t[i] = map(i, 0, 400, 0, 10);
     }

     // x 설정
     for (let i = 0; i < 400; i++) {
          // x=sin(t)+3*cos(t/3)+4*sin(t/4);
          x[i] = sin(t[i]) + 3 * cos(t[i] / 3) + 4 * sin(t[i] / 4);
     }
}


function draw() {
     // console.log(mouseX, mouseY)
     // put drawing code here
     background(255);

     push();
     text('슬라이더를 움직여 보세요!', 435, 40)
     text('(c) 공돌이의 수학정리노트', 435, height-10)
     text('x',232,360)
     text('y',20,170)
     pop();

     push();
     fill(200,150,150)
     noStroke();
     rectMode(CORNER);
     rect(292,51, 432-292+5,73-51+10)
     pop();

     // // drawing axes and grid
     drawAxis();

     // plotting the function
     push();
     noFill();
     beginShape()
     for (let i = 0; i < 400; i = i + 3) {
          // point(map(t[i],0,10,1,400), x[i]*scl)
          vertex(map(t[i], 0, 10, 1, 400), x[i] * scl)
     }
     endShape()
     pop();

     n_rect = mySlider.value();
     // n_rect = 6;
     w_rect = 400 / n_rect;

     push();
     translate(-w_rect / 2, 0)
     stroke(100)
     strokeWeight(1)
     fill(255, 100, 100, 100)
     for (let i = 0; i < n_rect; i++) {
          rect(0 + w_rect * i, 0, w_rect, x[floor(i * w_rect)] * scl)
          push();
          fill(0);
          translate(w_rect / 2, 0)
          ellipse(w_rect * i, x[floor(i * w_rect)] * scl, 8)
          pop();
     }

     pop();
     // i++
     // saveCanvas(myCanvas, "Screenshot" + i, "png")
     // noLoop();



}

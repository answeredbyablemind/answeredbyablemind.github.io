let slider1;
let t = [];
let sineWave = [];
let x_r = [];
let fs;
let t_sampled = [];
let xscl
let yscl


function setup() {
     createCanvas(windowWidth - 20, windowHeight - 20);
     slider1 = createSlider(0.5, 10, 0.8, 0.1);
     slider1.position(30, height * 0.92);

     for (let i = 0; i < 6 - 1 / 100; i += 1 / 100) {
          t.push(i)
     }
     for (let i = 0; i < t.length; i++) {
          sineWave.push(sin(2 * PI * 0.5 * t[i]))
     }

}

function draw() {
     xscl = floor(width / 7)
     yscl = 0.2 * height;

     background(0)

     // plotting axis
     plottingAxis(xscl);

     // plotting a sinusoidal signal
     push();
     translate(30, 0.4 * height)
     scale(1, -1)
     noFill();
     beginShape();
     for (let i = 0; i < t.length; i++) {
          vertex(t[i] * xscl, sineWave[i] * yscl)
     }
     endShape();
     pop();

     t_sampled = [];
     fs = slider1.value();
     for (let i = 0; i <= 6; i += 1 / fs) {
          t_sampled.push(i)
     }

     push();
     translate(30, 0.4 * height)
     scale(1, -1)
     fill(200, 50, 50)
     for (let i = 0; i < t_sampled.length; i++) {
          ellipse(t_sampled[i] * xscl, sin(2 * PI * 1 / 2 * t_sampled[i]) * yscl, 10)
     }
     pop();

     // calculating the reconstructed Function

     for (let i=0; i<t.length;i++){
          x_r[i]=0;
     }

     for (let i =0; i < t_sampled.length; i++){
          temp = mySinc(t_sampled[i])
          for (let j = 0; j<x_r.length; j++){
               x_r[j]+=temp[j] * sin(2 * PI * 1 / 2 * t_sampled[i]);
          }
     }

     // plotting the reconstructed Function
     push();
     translate(30, 0.4 * height);
     scale(1, -1)
     stroke(100, 100, 200)
     strokeWeight(2)
     noFill();
     beginShape();
     for (let i = 0; i < t.length; i++) {
          vertex(t[i] * xscl, x_r[i] * yscl)
     }
     endShape();
     pop();

     // noLoop();
}

function mySinc(delay) {
     let result = [];
     for (i = 0; i < t.length; i++) {
          x = (t[i] - delay) * fs;
          if (x != 0) {
               result[i] = sin(PI *x) / (PI * x)
          } else {
               result[i] = 1;
          }
     }
     return result
}

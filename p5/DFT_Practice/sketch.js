let time = 0;
let wave = [];
let y = [];
let fourierY;


function setup() {
     createCanvas(600, 400);
     y = [100, 100, 100, -100, -100, -100, 100, 100, 100, -100, -100, -100, 100, 100, 100, -100, -100, -100]
     fourierY = dft(y);
     console.log(fourierY)
}

function draw() {
     background(0)
     let x = 0
     let y = 0

     for (i = 0; i < fourierY.length; i++) {
          let prevx = x;
          let prevy = y;
          //
          // let n = i * 2 + 1
          // let radius = 50 * (4 / (n * PI));
          // x += radius * cos(n * time)
          // y += radius * sin(n * time)
          //
          // stroke(255, 100)
          // noFill()
          // ellipse(prevx, prevy, radius * 2)
          //
          // stroke(255)
          // fill(255)
          // line(prevx, prevy, x, y)
     }
     wave.unshift(y)

     translate(200, 0)
     line(x - 200, y, 0, wave[0])
     noFill()

     beginShape()
     for (let i = 0; i < wave.length; i++) {
          vertex(i, wave[i]);
     }
     endShape();

     time += 0.05;

     if (wave.length > 260) {
          wave.pop()
     }
}

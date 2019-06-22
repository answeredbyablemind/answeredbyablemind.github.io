let time = 0;
let wave = [];

function setup() {
     createCanvas(600, 400);
}

function draw() {
     background(0)
     translate(200, 200)

     stroke(255)
     noFill()

     let radius = 100 * (4 / (1 * PI));
     ellipse(0, 0, radius * 2)
     let x = radius * cos(1 * time)
     let y = radius * sin(1 * time)
     wave.unshift(y)
     fill(255)
     line(0, 0, x, y)
     ellipse(x, y, 8);

     translate(200, 0)
     line(x - 200, y, 0, wave[0])
     noFill()
     beginShape()
     for (let i = 0; i < wave.length; i++) {
          vertex(i, wave[i]);
     }
     endShape();

     time += 0.05;

     if (wave.length > 250) {
          wave.pop()
     }
}

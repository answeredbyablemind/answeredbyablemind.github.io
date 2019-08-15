var scl;
var dx = 0.1;
var dy = dx;
var xMin = -2;
var xMax = 2;
var yMin = -2;
var yMax = 2;
var f = []
let x = []
let y = []
var prev_mean
function setup() {
  // put setup code here
  createCanvas(windowWidth, windowHeight, WEBGL)
  perspective()

  scl = width / 8;

  for (let i = xMin; i <= xMax; i += dx) {
    x.push(i)
  }
  for (let i = yMin; i <= yMax; i += dy) {
    y.push(i)
  }
  setAttributes('antialias', true);
  translate(0,0,-1000)
  for (let i = 0; i < x.length; i++) {
    f[i] = []
    for (let j = 0; j < y.length; j++) {
      f[i][j] = sqrt(
        (x[i] ** 2 - y[j] ** 2 + 1) ** 2 + (2 * x[i] * y[i]) ** 2
      )
    }
  }
  prev_mean = 9999;
  for (let i = 0; i < x.length; i ++) {
    for (let j = 0; j < y.length; j ++){
      if (prev_mean > f[i][j]){
        prev_mean = f[i][j]
      }
    }
  }
}

function draw() {
  // put drawing code here
  background(250);
  // ambientMaterial(250);
  orbitControl();
  rotateX(PI / 3);
  rotateY(0.001)
  plane(100, 100)
  beginShape();
  noFill();
  for (let i = 0; i < x.length-1; i++) {
    for (let j = 0; j < y.length; j++) {
      vertex(x[i] * scl, y[j] * scl, f[i][j] * scl)
      vertex(x[i+1] * scl, y[j] * scl, f[i+1][j] * scl)
    }
  }
  endShape();

}
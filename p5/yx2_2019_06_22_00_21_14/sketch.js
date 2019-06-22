// var x, y;
let x = []
let y = []
let xx = []
let yy = []
let xx2plot = []
let yy2plot = []

function setup() {
  createCanvas(480, 480);

  for (var i = 0; i < 100; i += 1) {
    x[i] = i;
    xx[i] = map(x[i], 0, 100, -3, 3)
  }

  for (i = 0; i < xx.length; i++) {
    yy[i] = xx[i] ** 2 + 1
  }

  for (i = 0; i < xx.length; i++) {
    xx2plot[i] = map(xx[i], min(xx), max(xx), width / 2 - 40 * 3, width / 2 + 40 * 3)
    yy2plot[i] = map(yy[i], min(yy), max(yy), height / 2 - 40, height / 2 - 40 * 9)
  }

  textAlign(LEFT, CENTER)

}

function draw() {

  background(255);
  stroke(220)

// 격자 그리기
  for (i = 0; i < width; i += 40) {
    line(0, i, width, i)
    line(i, 0, i, height)
  }

// x축 그리기, y축 그리기
  stroke(0)
  line(0, height / 2, width, height / 2)
  line(width / 2, height, width / 2, 0)

// plot 해주기
  stroke(50, 50, 200)
  noFill()
  beginShape()
  for (i = 0; i < xx.length; i++) {
    vertex(xx2plot[i], yy2plot[i])
  }
  endShape()

  // x축 숫자 써주기
  ii = -5;
  for (i = 40; i < width; i += 40) {
    text(ii,i+1,height/2+10)
    ii++
  }

  //y축 숫자 써주기
  ii = 5;
  for (i = 40; i < height/2; i += 40) {
    text(ii, width/2+5, i)
    ii--
  }

  ii = -1;
  for (i = height/2+40 ; i < height; i += 40) {
    text(ii, width/2+5, i)
    ii--
  }

}

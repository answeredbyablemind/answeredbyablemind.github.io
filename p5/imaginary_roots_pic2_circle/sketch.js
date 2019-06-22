let x = []
let y = []
let theta = []
let r = []
var ii

function setup() {
  createCanvas(320, 320);

  ii = 0;
  for (var i = 0; i < 2 * PI; i += 0.01) {
    theta[ii] = i;
    r[ii] = 40 * 3;

    x[ii] = r[ii] * cos(theta[ii])
    y[ii] = r[ii] * sin(theta[ii])
    ii++
  }
}

function draw() {
  background(255);

  // 격자 그리기
  stroke(220)
  for (var i = 0; i < height + 1; i += 40) {
    line(0, i, width, i) // 가로선 그리기
  }
  for (i = 0; i < width + 1; i += 40) {
    line(i, 0, i, height) // 세로선 그리기
  }

  // 원 그리기
  noFill()
  strokeWeight(4)
  stroke(150,150, 255)
  beginShape()
  for (i = 0; i < x.length; i++) {
    vertex(x[i] + width/2, y[i]+height/2)
  }
  endShape()

  strokeWeight(1)
  stroke(0)
  // x축 그리기
  line(0, height/2, width, height/2)
  fill(0)
  triangle(width, height/2, width-5, height/2-3, width-5, height/2+3)
  text("Real",width-30, height/2+10)

  text("1", width-35, height/2-10)
  text("-1", 25, height/2-10)

  // y축 그리기
  line(width/2, height, width/2, 0)
  triangle(width/2, 0, width/2-3, 0+5, width/2+3, 0+5)
  text("Imaginary", width/2+10, 10)
  text("1", width/2+10, 35)
  text("-1", width/2+10, height - 30)
}

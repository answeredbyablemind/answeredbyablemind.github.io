function plottingAxis(xscl) {
     stroke(255)
     lineEnd = width - 20;
     line(10, 0.8 * height, lineEnd, 0.8 * height)

     triangle(lineEnd - 5, 0.8 * height - 5, lineEnd + 5, 0.8 * height, lineEnd - 5, 0.8 * height + 5)
     noStroke();
     fill(255)
     textSize(20)
     text("t", lineEnd, 0.87 * height)

     stroke(255);
     textAlign(CENTER)
     textSize(15);

     for (i = 0; i < 7; i++) {
          line(i * xscl + 30, 0.78 * height, i * xscl + 30, 0.82 * height)
          text(i, i * xscl + 30, 0.87 * height)
     }
     textSize(12)
     text('(c) 공돌이의 수학정리노트', width * 0.87, height * 0.95)
}

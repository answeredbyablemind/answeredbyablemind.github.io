function setup() {
     createCanvas(720, 320); // 위아래로 20씩 여유 pixel 주기. 
}


function draw() {
     background(0);
     // 왼쪽 오른쪽 패널 구분 선 그리기
     stroke(150)
     line(430, 0, 430, height)

     //// 패널 제목 적어주기
     noStroke()
     fill(255)
     textAlign(CENTER)
     // 왼쪽 패널 제목 적어주기
     text('distributions for classes', 200, 30)
     // 오른쪽 패널 제목 적어주기
     
     text('ROC curve', 430+145, 30)


     //// axis 그려주기
     // 왼쪽 panel에 axis 그려주기
     drawArrow(20, height - 30, 20, 50)
     drawArrow(10, height - 40, 400, height - 40)

}

function linspace(stt, end, steps){
     var res = []
     for(i=stt; i<=end; i+=((end-stt)/(steps-1))){
          res.push(
               i
          )
     }
     res.push(end)
     return res
}


function drawArrow(x1, y1, x2, y2) {
     push();
     // strokeWeight(w);
     stroke(255);
     fill(255);
     line(x1, y1, x2, y2); //draw a line beetween the vertices
     let offset = 10 / 800 * width;
     let angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2, y2); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(-offset * 0.5, offset, offset * 0.5, offset, 0, 0); //draws the arrow point as a triangle
     pop();
}
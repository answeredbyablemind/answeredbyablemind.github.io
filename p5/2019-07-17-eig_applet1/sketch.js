let scl;
let myMtx = [];
let redDot = [],
     newRedDot = [];

let t;

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(600, 480);
     scl = (height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.


     // vector input

     vec_text = createElement('h3', 'vector');
     vec_text.position(0, height- 20);
     inp_vec1 = createInput('1')
     inp_vec1.position(0, height + 30)

     inp_vec2 = createInput('1')
     inp_vec2.position(0, height + 30 + 22 + 1)

     // matrix input
     vec_text = createElement('h3', 'matrix');
     vec_text.position(width/2 - 50 + 30, height- 20);

     inp1 = createInput('2');
     inp1.position(width/2 - 50 + 30 , height + 30)

     inp2 = createInput('-3');
     inp2.position(width/2 - 50 + 161 + 30, height + 30)

     inp3 = createInput('1');
     inp3.position(width/2 - 50 + 30, height + 30 + 22 + 1)

     inp4 = createInput('1');
     inp4.position(width/2 - 50 + 161 + 30, height + 30 + 22 + 1)

     // button
     button = createButton("Apply the Matrix")
     button.position(width - 111, height + 3);
     button.mousePressed(Refresh);

     // matrix 설정하기
     myMtx = [
          [2, -3],
          [1, 1]
     ];

     myMtx = math.add(myMtx, math.matrix([
          [-1, 0],
          [0, -1]
     ]))

     redDot = math.matrix([
          [1],
          [1]
     ])

     // 시간 초기화
     t = 0;


}

function draw() {
     background(0);

     // 희미한 grid line 그리기: scale 간격으로.
     plotDimGrid();

     mtx2Apply = math.add(math.matrix([
          [1, 0],
          [0, 1]
     ]), math.multiply(t, myMtx));
     t += 0.01
     if (t > 1) {
          noLoop();
     }
     newRedDot = math.multiply(mtx2Apply, redDot)

     drawArrow(0, 0, redDot._data[0][0], redDot._data[1][0], 50, 60, 220)
     drawArrow(0, 0, newRedDot._data[0][0], newRedDot._data[1][0], 244, 50, 60)

}

function plotDimGrid() {
     push();
     translate(width / 2, height / 2);
     scale(1, -1); // 결과는 같아 보이지만, 의도한 것이 문제없이 표현되도록...
     stroke(100);
     strokeWeight(0.5);
     for (let i = -floor(height / scl) / 2; i < floor(height / scl) / 2; i++) {
          line(-width / 2, i * scl, width / 2, i * scl);
     }
     for (let i = -floor(width / scl) / 2; i < floor(width / scl) / 2; i++) {
          line(i * scl, -height / 2, i * scl, height / 2);
     }
     pop();
     push();
     // center lines 그려주기
     stroke(200);
     strokeWeight(2);
     line(0, height / 2, width, height / 2)
     line(width / 2, 0, width / 2, height)
     pop();
}

function drawArrow(x1, y1, x2, y2, c1, c2, c3) {
     push();
     translate(width / 2, height / 2)
     scale(1, -1)
     strokeWeight(3)
     stroke(c1, c2, c3);
     fill(c1, c2, c3)
     line(x1 * scl, y1 * scl, x2 * scl, y2 * scl); //draw a line beetween the vertices
     let offset = 16

     var angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2 * scl, y2 * scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}

function Refresh() {
     
     redDot = math.matrix([
          [int(inp_vec1.value())],
          [int(inp_vec2.value())]
     ])

     myMtx = math.matrix([
          [int(inp1.value()), int(inp2.value())],
          [int(inp3.value()), int(inp4.value())]
     ])

     myMtx = math.add(myMtx, math.matrix([
          [-1, 0],
          [0, -1]
     ]))

     t = 0;
     loop();

}
let scl;
let vu = [] // vertical line의 upper point에 해당하는 vector
let vd = []
let hl = []
let hr = []
let new_vu = [],
     new_vd = [],
     new_hl = [],
     new_hr = [];

let basisVecX = [],
     basisVecY = [],
     newBasisVecX = [],
     newBasisVecY = [];

let redDot = [],
     newRedDot = [];

let redArrowTip = [],
     greenArrowTip = [];

let tipCircleRadius = 20

let dist_mouse_red;
let dist_mouse_green;

let redArrowTipCircle;
let greenArrowTipCircle;

let tex
let eigvals

let isSymmetric
let isPD
function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(800, 480);
     scl = (height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.

     // 각 아래의 내용을 vu, vd, hl, hr에 맞출 수 있게... 벡터화 하고자 함.
     // 즉, 초기화된 벡터를 만들고 싶음.
     // vertical line에 해당하는 vectors
     for (let i = -floor(480 * 10/ scl) / 2; i < floor(480 * 10/ scl) / 2; i++) {
          // line(i * scl, -height / 2, i * scl, height / 2)
          vu.push([
               [i],
               [480 * 10 / (2 * scl)]
          ]);
          vd.push([
               [i],
               [-480 * 10/ (2 * scl)]
          ]);
     }
     // horizontal line에 해당하는 vectors
     for (let i = -floor(480 * 10 / scl) / 2; i < floor(480 * 10 / scl) / 2; i++) {
          // line(-width / 2, i * scl, width / 2, i * scl)
          // line(x1, y1, x2, y2) 형식으로 그려짐
          hl.push([
               [-480 * 10/ (2 * scl)],
               [i]
          ]);
          hr.push([
               [480 * 10/ (2 * scl)],
               [i]
          ]);
     }

     basisVecX = [
          [1],
          [0]
     ]
     basisVecY = [
          [0],
          [1]
     ]
     redDot = [
          [1],
          [1]
     ]

     redArrowTip =[
          [1],
          [0]
     ]

     greenArrowTip =[
          [0],
          [1]
     ]

     redArrowTipCircle = new Draggable(480 / 2 + redArrowTip[0][0] * scl, 480 / 2 - redArrowTip[1][0] * scl, tipCircleRadius)
     // greenArrowTipCircle = new Draggable(480 / 2 + greenArrowTip[0][0] * scl, 480 / 2 - greenArrowTip[1][0] * scl, tipCircleRadius)

     tex = createSpan()
}

function draw() {
     background(0);

     // 희미한 grid line 그리기: scale 간격으로.
     plotDimGrid();

     mtx2Apply = math.matrix([
          [redArrowTip[0][0], greenArrowTip[0][0]],
          [redArrowTip[1][0], greenArrowTip[1][0]]
     ]     
     )

     isSymmetric =  math.deepEqual(mtx2Apply, math.transpose(mtx2Apply))
     eigvals = [0, 0]
     if (isSymmetric){
          let eig_res = math.eigs(mtx2Apply)
          eigvals = eig_res.values._data
     }
     isPD = false;
     if (eigvals[0] >0 & eigvals[1] > 0){
          isPD = true;
     }

     for (let i = 0; i < vu.length; i++) {
          new_vu[i] = math.multiply(mtx2Apply, vu[i]);
          new_vd[i] = math.multiply(mtx2Apply, vd[i]);
     }

     for (let i = 0; i < hl.length; i++) {
          new_hl[i] = math.multiply(mtx2Apply, hl[i]);
          new_hr[i] = math.multiply(mtx2Apply, hr[i]);
     }

     newBasisVecX = math.multiply(mtx2Apply, basisVecX)
     newBasisVecY = math.multiply(mtx2Apply, basisVecY)

     // 새로운 grid line 그리기. 이 grid는 선형변환이 apply 될 것임.
     plotNewGrid(new_vu, new_vd, new_hl, new_hr);
     // noLoop();

     drawArrow(0, 0, newBasisVecX._data[0][0], newBasisVecX._data[1][0], 200, 50, 50)
     drawArrow(0, 0, newBasisVecY._data[0][0], newBasisVecY._data[1][0], 50, 200, 50)

     newRedDot = math.multiply(mtx2Apply, redDot)

     drawRedDot();

     
     noStroke()
     if (isPD){
          fill(79, 129, 189)     
     } else {
          fill(189, 129, 79)     
     }

     rect(480, 0, 320, 480)

     // RedArrow Tip과 Green Arrow Tip에 동그라미 그려놓기
     
     redArrowTipCircle.over();
     redArrowTipCircle.update();
     redArrowTipCircle.show();

     // greenArrowTipCircle.over();
     // greenArrowTipCircle.update();
     // greenArrowTipCircle.show();

     redArrowTip =[
          [round((redArrowTipCircle.x - 480/2) / scl * 10) / 10],
          [round((480/2 - redArrowTipCircle.y) / scl * 10) / 10]
     ]

     // greenArrowTip =[
     //      [round((greenArrowTipCircle.x - 480/2) / scl * 10)/10],
     //      [round((480/2 - greenArrowTipCircle.y) / scl * 10)/10]
     // ]
     greenArrowTip = [
          redArrowTip[1],
          redArrowTip[0],
     ]

     fill(255);
     textSize(15)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)
     tex.style('align','center')
     tex.style('font-size', '20px')
     tex.position(480 + 60, 165)
     tex.style('color','white')
     let str_mtx = 'A = \\begin{bmatrix} ' + redArrowTip[0][0] + ' & ' + greenArrowTip[0][0] + '\\\\' + redArrowTip[1][0] + ' & ' + greenArrowTip[1][0] + ' \\end{bmatrix}'
     katex.render(str_mtx , tex.elt)
     
     push()
     textAlign(CENTER, CENTER)
     textSize(25);
     if (isPD){
          text('고윳값: '+round(eigvals[0]*10)/10+','+round(eigvals[1]*10)/10+'\nA is positive definite', 480+160, 300)
     } else {
          text('고윳값: '+round(eigvals[0]*10)/10+','+round(eigvals[1]*10)/10+'\nA is not positive definite', 480+160, 300)
     }
     pop()
}

function drawRedDot() {
     push();
     translate(480 / 2, 480 / 2);
     scale(1, -1);
     fill(255, 50, 50);
     noStroke();
     ellipse(newRedDot._data[0][0] * scl, newRedDot._data[1][0] * scl, 10);
     pop();
}

function plotDimGrid() {
     push();
     translate(480 / 2, 480 / 2);
     scale(1, -1); // 결과는 같아 보이지만, 의도한 것이 문제없이 표현되도록...
     stroke(100);
     strokeWeight(0.5);
     for (let i = -floor(480 / scl) / 2; i < floor(480 / scl) / 2; i++) {
          line(-480 / 2, i * scl, 480 / 2, i * scl);
     }
     for (let i = -floor(480 / scl) / 2; i < floor(480 / scl) / 2; i++) {
          line(i * scl, -480 / 2, i * scl, 480 / 2);
     }
     pop();
}

function plotNewGrid(vu, vd, hl, hr) {
     // 각각은 grid의 가장자리에 있는 위치에 관한 vector임.
     // vu: vertical up
     // vd: vertical down
     // hl: horizontal left
     // hr: horizontal right

     push();
     translate(480 / 2, 480 / 2);
     scale(1, -1); // 결과는 같아 보이지만, 의도한 것이 문제없이 표현되도록...
     // 변환 적용할 lines 그리기
     stroke(109, 155, 222);
     strokeWeight(1);

     // TODO: arrow 그리기

     // vertical line
     for (let i = 0; i < vu.length; i++) {
          line(vu[i]._data[0] * scl, vu[i]._data[1] * scl, vd[i]._data[0] * scl, vd[i]._data[1] * scl);
     }
     // horizontal line
     for (let i = 0; i < hl.length; i++) {
          line(hl[i]._data[0] * scl, hl[i]._data[1] * scl, hr[i]._data[0] * scl, hr[i]._data[1] * scl);
     }
     // plotting vertical and horizontal lines in the center
     stroke(255);
     strokeWeight(2);
     // vertical
     line(vu[vu.length / 2]._data[0] * scl, vu[vu.length / 2]._data[1] * scl, vd[vd.length / 2]._data[0] * scl, vd[vd.length / 2]._data[1] * scl);
     // horizontal
     line(hl[hl.length / 2]._data[0] * scl, hl[hl.length / 2]._data[1] * scl, hr[hr.length / 2]._data[0] * scl, hr[hr.length / 2]._data[1] * scl);
     pop();
}

function drawArrow(x1, y1, x2, y2, c1, c2, c3) {
     push();
     translate(480 / 2, 480 / 2)
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

function mousePressed(){
     redArrowTipCircle.pressed();
     // greenArrowTipCircle.pressed();

}

function mouseReleased(){
     redArrowTipCircle.released();
     // greenArrowTipCircle.released()
}
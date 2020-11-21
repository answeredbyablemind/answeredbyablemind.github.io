let scl;
let vu = [] // vertical line의 upper point에 해당하는 vector
let vd = []
let hl = []
let hr = []
let new_vu = [],
     new_vd = [],
     new_hl = [],
     new_hr = [];
// let slider1;
let basisVecX = [],
     basisVecY = [],
     newBasisVecX = [],
     newBasisVecY = [];
let redDot = [],
     newRedDot = [];

var slider1
var slider2
var slider3

var V = []
var D = []
var Vinv = []

let myMtx = [];

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(300, 240);
     scl = (height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.

     // 각 아래의 내용을 vu, vd, hl, hr에 맞출 수 있게... 벡터화 하고자 함.
     // 즉, 초기화된 벡터를 만들고 싶음.
     // vertical line에 해당하는 vectors
     for (let i = -30; i < 30; i++) {
          // line(i * scl, -height / 2, i * scl, height / 2)
          vu.push([
               [i],
               [3 * height / (scl)]
          ]);
          vd.push([
               [i],
               [-3 * height / (scl)]
          ]);
     }
     // horizontal line에 해당하는 vectors
     for (let i = -30; i < 30; i++) {
          // line(-width / 2, i * scl, width / 2, i * scl)
          // line(x1, y1, x2, y2) 형식으로 그려짐
          hl.push([
               [-3 * width / (scl)],
               [i]
          ]);
          hr.push([
               [3 * width / (scl)],
               [i]
          ]);
     }

     // // slider 만들기
     // slider1 = createSlider(0, 1, 0, 0.01);

     // matrix 설정하기

     V = [
          [0.6089, -0.3983],
          [0.7933, 0.9172]
     ]

     D = [
          [0.5486, 0],
          [0, 2.3514]
     ]

     Vinv = [
          [1.0489, 0.4555],
          [-0.9072, 0.6963]
     ]

     V = math.add(V, math.matrix([
          [-1, 0],
          [0, -1]
     ]))

     D = math.add(D, math.matrix([
          [-1, 0],
          [0, -1]
     ]))

     Vinv = math.add(Vinv, math.matrix([
          [-1, 0],
          [0, -1]
     ]))

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
     
     slider1 = createSlider(0,1,0,0.01)
     slider2 = createSlider(0,1,0,0.01)
     slider3 = createSlider(0,1,0,0.01)

     slider1.style('width', '95px')
     slider2.style('width', '95px')
     slider3.style('width', '95px')


}

function draw() {
     background(0);

     // 희미한 grid line 그리기: scale 간격으로.
     plotDimGrid();
     a1 = slider1.value()
     a2 = slider2.value()
     a3 = slider3.value()

     mtx2Apply1 = math.add(math.matrix([
          [1, 0],
          [0, 1]
     ]), math.multiply(a1, V));

     mtx2Apply2 = math.add(math.matrix([
          [1, 0],
          [0, 1]
     ]), math.multiply(a2, D));
     
     mtx2Apply3 = math.add(math.matrix([
          [1, 0],
          [0, 1]
     ]), math.multiply(a3, Vinv));

     mtx2Apply = math.multiply(mtx2Apply1, math.multiply(mtx2Apply2, mtx2Apply3))

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

     fill(255);
     textSize(12)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)

     // textAlign(LEFT)
     // textSize(15)
     // text('↓ 슬라이더를 움직여 보세요.', width * 0.05, height * 0.95)

     // // matrix 써주기
     // push();
     // translate(13,-7);
     // stroke(255);
     // line(451, 62, 451, 142);
     // line(548, 62, 548, 142);
     // line(451,62, 460, 62);
     // line(451,142, 460, 142);
     // line(539,62, 548, 62);
     // line(539, 142, 548, 142);

     // textSize(25)
     // textAlign(CENTER);

     // text(myMtx._data[0][0]+1, 480, 90);
     // text(myMtx._data[0][1]+0, 520, 90);
     // text(myMtx._data[1][0]+0, 480, 130);
     // text(myMtx._data[1][1]+1, 520, 130);
     // pop();

}

function drawRedDot() {
     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     fill(255, 50, 50);
     noStroke();
     ellipse(newRedDot._data[0][0] * scl, newRedDot._data[1][0] * scl, 10);
     pop();
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
}

function plotNewGrid(vu, vd, hl, hr) {
     // 각각은 grid의 가장자리에 있는 위치에 관한 vector임.
     // vu: vertical up
     // vd: vertical down
     // hl: horizontal left
     // hr: horizontal right

     push();
     translate(width / 2, height / 2);
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
     translate(width / 2, height / 2)
     scale(1, -1)
     strokeWeight(3)
     stroke(c1, c2, c3);
     fill(c1, c2, c3)
     line(x1 * scl, y1 * scl, x2 * scl, y2 * scl); //draw a line beetween the vertices
     let offset = 8

     var angle = atan2(y1 - y2, x1 - x2); //gets the angle of the line
     translate(x2 * scl, y2 * scl); //translates to the destination vertex
     rotate(angle - HALF_PI); //rotates the arrow point
     triangle(
          -offset * 0.5, offset,
          offset * 0.5, offset,
          0, 0); //draws the arrow point as a triangle
     pop();
}


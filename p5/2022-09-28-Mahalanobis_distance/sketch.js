let scl;
let vu = [] // vertical line의 upper point에 해당하는 vector
let vd = []
let hl = []
let hr = []
let new_vu = [],
     new_vd = [],
     new_hl = [],
     new_hr = [];
let slider1;
let myMtx = [];
let basisVecX = [],
     basisVecY = [],
     newBasisVecX = [],
     newBasisVecY = [];
let dots = [[],[]],
     newdots = [[],[]];
let n_dots = 1000;

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(600, 480);
     scl = round(height / 13); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.

     // 각 아래의 내용을 vu, vd, hl, hr에 맞출 수 있게... 벡터화 하고자 함.
     // 즉, 초기화된 벡터를 만들고 싶음.
     // vertical line에 해당하는 vectors
     for (let i = -floor(width / scl) / 2 -40; i < floor(width / scl) / 2+40; i++) {
          // line(i * scl, -height / 2, i * scl, height / 2)
          vu.push([
               [i],
               [height / (2 * scl)+40]
          ]);
          vd.push([
               [i],
               [-height / (2 * scl)-40]
          ]);
     }
     // horizontal line에 해당하는 vectors
     for (let i = -floor(height / scl) / 2-40; i < floor(height / scl) / 2+40; i++) {
          // line(-width / 2, i * scl, width / 2, i * scl)
          // line(x1, y1, x2, y2) 형식으로 그려짐
          hl.push([
               [-width / (2 * scl)-40],
               [i]
          ]);
          hr.push([
               [width / (2 * scl)+40],
               [i]
          ]);
     }

     // slider 만들기
     slider1 = createSlider(0, 1, 0, 0.01);

     // matrix 설정하기
     myMtx = [
          [0.5774, 0],
          [-0.4082, 0.6124]
     ]; // R = chol([3,2;2,4]); inv(R')

     myMtx = math.add(myMtx, math.matrix([
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

     for (let i = 0; i < n_dots; i++){
          dots[0][i] = randomGaussian(0, 1)
          dots[1][i] = randomGaussian(0, 1)
     }

     // additional dots for reference
     dots[0][n_dots] = 2.3094;
     dots[1][n_dots] = 0.8165;

     dots[0][n_dots+1] = 2.3094;
     dots[1][n_dots+1] = -4.0825;

     dots[0][n_dots+2] = -2.3094;
     dots[1][n_dots+2] = -0.8165;

     dots[0][n_dots+3] = -2.3094;
     dots[1][n_dots+3] = 4.0825;

     dots = math.multiply(math.matrix([
          [1.7321, 0],
          [1.1547, 1.6330]
     ]), dots) // R = chol([3,2;2,4]); R'

}

function draw() {
     background(0);

     // 희미한 grid line 그리기: scale 간격으로.
     plotDimGrid();
     a = slider1.value();

     mtx2Apply = math.add(math.matrix([
          [1, 0],
          [0, 1]
     ]), math.multiply(a, myMtx));

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

     newdots = math.multiply(mtx2Apply, dots)

     drawdots();

     fill(255);
     textSize(15)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)

     textAlign(LEFT)
     textSize(15)
     text('↓ 슬라이더를 움직여 보세요.', width * 0.05, height * 0.95)

}

function drawdots() {
     push();
     translate(width / 2, height / 2);
     scale(1, -1);
     fill(0, 144, 190);
     noStroke();
     for (let i =0; i<n_dots; i++){
          ellipse(newdots._data[0][i] * scl, newdots._data[1][i] * scl, 10);
     }

     fill(218, 83, 25)
     ellipse(newdots._data[0][n_dots+0] * scl, newdots._data[1][n_dots+0] * scl, 20);
     fill(238,178,32)
     ellipse(newdots._data[0][n_dots+1] * scl, newdots._data[1][n_dots+1] * scl, 20);
     fill(218, 83, 25)
     ellipse(newdots._data[0][n_dots+2] * scl, newdots._data[1][n_dots+2] * scl, 20);
     fill(238,178,32)
     ellipse(newdots._data[0][n_dots+3] * scl, newdots._data[1][n_dots+3] * scl, 20);

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

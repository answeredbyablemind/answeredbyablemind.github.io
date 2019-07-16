let scl;
let vu = [] // vertical line의 upper point에 해당하는 vector
let vd = []
let hl = []
let hr = []
let slider1;
let myMtx = [];

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     createCanvas(800, 400);
     scl = floor(height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.

     // 각 아래의 내용을 vu, vd, hl, hr에 맞출 수 있게... 벡터화 하고자 함.
     // 즉, 초기화된 벡터를 만들고 싶음.
     // vertical line에 해당하는 vectors
     for (let i = -floor(width / scl) / 2; i < floor(width / scl) / 2; i++) {
          // line(i * scl, -height / 2, i * scl, height / 2)
          vu.push([
               [i],
               [height / (2 * scl)]
          ]);
          vd.push([
               [i],
               [-height / (2 * scl)]
          ]);
     }
     // horizontal line에 해당하는 vectors
     for (let i = -floor(height / scl) / 2; i < floor(height / scl) / 2; i++) {
          // line(-width / 2, i * scl, width / 2, i * scl)
          // line(x1, y1, x2, y2) 형식으로 그려짐
          hl.push([
               [-width / (2 * scl)],
               [i]
          ]);
          hr.push([
               [width / (2 * scl)],
               [i]
          ]);
     }

     // slider 만들기
     slider1 = createSlider(0, 1, 0, 0.01);

     // matrix 설정하기
     myMtx = [
          [2, -3],
          [1, 1]
     ];

}

function draw() {
     background(0);
     fill(255);
     textSize(15)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)

     // 희미한 grid line 그리기: scale 간격으로.
     plotDimGrid();

     // 새로운 grid line 그리기. 이 grid는 선형변환이 apply 될 것임.
     plotNewGrid(vu, vd, hl, hr);
     noLoop();


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

     // vertical line
     for (let i = 0; i < vu.length; i++) {
          line(vu[i][0] * scl, vu[i][1] * scl, vd[i][0] * scl, vd[i][1] * scl);
     }
     // horizontal line
     for (let i = 0; i < hl.length; i++) {
          line(hl[i][0] * scl, hl[i][1] * scl, hr[i][0] * scl, hr[i][1] * scl);
     }
     // plotting vertical and horizontal lines in the center
     stroke(255);
     strokeWeight(2);
     line(-width / 2, 0, width / 2, 0);
     line(0, -height / 2, 0, height / 2);
     pop();
}

function multiplyMatrices(m1, m2) {
     var result = [];
     for (var i = 0; i < m1.length; i++) {
          result[i] = [];
          for (var j = 0; j < m2[0].length; j++) {
               var sum = 0;
               for (var k = 0; k < m1[0].length; k++) {
                    sum += m1[i][k] * m2[k][j];
               }
               result[i][j] = sum;
          }
     }
     return result;
}
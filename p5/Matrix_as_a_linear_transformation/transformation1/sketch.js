let scl;
let vu = [] // vertical line의 upper point에 해당하는 vector
let vd = []
let hl = []
let hr = []

function setup() {
     createCanvas(windowWidth - 20, windowHeight - 20);
     scl = floor(height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임.

     // 각 아래의 내용을 vu, vd, hl, hr에 맞출 수 있게... 벡터화 하고자 함.
     // 즉, 초기화된 벡터를 만들고 싶음.
     for (let i = -floor(height / scl) / 2; i < floor(height / scl) / 2; i++) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }
     for (let i = -floor(width / scl) / 2; i < floor(width / scl) / 2; i++) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }
     // a = multiplyMatrices([[2,1],[1,2]],[[1],[0]])
     // console.log(a);
}

function draw() {
     background(0);


     push();
     translate(width / 2, height / 2);

     // 희미한 grid line 그리기: scale 간격으로.
     stroke(100);
     strokeWeight(0.5);
     for (let i = -floor(height / scl) / 2; i < floor(height / scl) / 2; i++) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }
     for (let i = -floor(width / scl) / 2; i < floor(width / scl) / 2; i++) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }

     // 변환 적용할 lines 그리기
     stroke(109, 155, 222);
     strokeWeight(1)
     for (let i = -floor(height / scl) / 2; i < floor(height / scl) / 2; i++) {
          line(-width / 2, i * scl, width / 2, i * scl)
     }
     for (let i = -floor(width / scl) / 2; i < floor(width / scl) / 2; i++) {
          line(i * scl, -height / 2, i * scl, height / 2)
     }

     // plotting vertical and horizontal lines in the center
     stroke(255);
     strokeWeight(2)
     line(-width / 2, 0, width / 2, 0);
     line(0, -height / 2, 0, height / 2);


     pop();
     noLoop();


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

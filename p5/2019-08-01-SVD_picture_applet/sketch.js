let img; // 그림 image object
let img_r; // reconstructed image의 image object

let X = []; // array로 표현된 image
let temp = []
let mySlider;
var val;

var S = []
var S_diag = []
var U = []
var V = []
var UV = [] //SVD로 reconstructed된 array로 표현된 image

var ii;

function preload() {
     img = loadImage('https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/p5/2019-08-01-SVD_picture_applet/lena.png')
     img_r = createImage(512, 512);
}

function setup() {
     createCanvas(512, 512);
     img.loadPixels();

     ii = 0
     for (let i = 0; i < 512; i++) {
          X[i] = []
          for (let j = 0; j < 512; j++) {
               X[i][j] = img.pixels[ii]
               ii += 4
          }
     }

     // Singular Value Decomposition
     // A = U S V'
     SVD_result = numeric.svd(X)
     S = SVD_result.S // (512,) array
     U = SVD_result.U // (512, 512)
     V = SVD_result.V // (512, 512)

     for (let i = 0; i < 512; i++) {
          UV[i] = []
          S_diag[i] = []
          for (let j = 0; j < 512; j++) {
               UV[i][j] = 0;
               S_diag[i][j] = 0;
          }
     }

     for (let i = 0; i < 512; i++) {
          S_diag[i][i] = S[i];
     }

     // slider
     mySlider = createSlider(1, 100, 10, 1);

}

function draw() {
     background(0);

     let newU = []
     let newV = []
     let newS_diag = []

     val = mySlider.value();

     // U, V 중 필요한 열까지 빼오기
     for (let i = 0; i < 512; i++) {
          newU[i] = []
          newV[i] = []
          for (let j = 0; j < val; j++) {
               newU[i][j] = U[i][j]
               newV[i][j] = V[i][j]
          }
     }

     // newS_diag 계산
     for (let i = 0; i < val; i++) {
          newS_diag[i] = []
          for (let j = 0; j < val; j++) {
               if (i == j) {
                    newS_diag[i][j] = S_diag[i][j]
               } else {
                    newS_diag[i][j] = 0;
               }
          }
     }


     UV = numeric.dotMMbig(
          newU, numeric.dotMMbig(
               newS_diag, numeric.transpose(
                    newV
               )
          )
     )

     // image(img_r,0,0, width, height);
     // SVD로 reconstruct된 image 넣어주기
     img_r.loadPixels();
     ii = 0
     for (let i = 0; i < 512; i++) {
          for (let j = 0; j < 512; j++) {
               img_r.pixels[ii] = UV[i][j] //Red
               ii++

               img_r.pixels[ii] = UV[i][j] // Green
               ii++

               img_r.pixels[ii] = UV[i][j] // Blue
               ii++

               img_r.pixels[ii] = 255; // Alpha
               ii++

          }
     }
     img_r.updatePixels();
     image(img_r, 0, 0)

     fill(255, 0, 0)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.9, height * 0.9)
}
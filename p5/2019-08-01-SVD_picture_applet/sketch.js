let img;
let X = [];
let temp = []

function preload() {
     img = loadImage('https://raw.githubusercontent.com/angeloyeo/angeloyeo.github.io/master/p5/2019-08-01-SVD_picture_applet/lena.png')
}

function setup() {
     createCanvas(windowWidth - 20, windowWidth - 20);
     img.loadPixels();
     let ii=0
     for(let i=0;i<img.width;i++){
          X[i]=[]
          for(let j=0;j<img.height;j++){
               X[i][j] = img.pixels[ii]
               ii++
          }
     }
}

function draw() {
     // background(0);



}
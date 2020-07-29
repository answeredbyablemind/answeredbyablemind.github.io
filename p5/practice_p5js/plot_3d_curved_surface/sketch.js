var f = [[]]
var scl
var x = []
var y = []
let cameraLocation;

function setup() {
     createCanvas(320, 320, WEBGL);
     setAttributes('antialias', true)
     // my function
     // z = sqrt(4- x^2- y^2)

     x = linspace(-2, 2, 20)
     y = linspace(-2, 2, 20)

     // calc function

     for(var i = 0; i<x.length; i++){
          f[i] = []
          for(var j = 0; j<y.length; j++){
               f[i][j] = 4 - x[i]**2 - y[j]**2
          }
     }

     scl = width / 8
     cameraLocation = createVector(0, 0, (height/2.0) / tan(PI*30.0 / 180.0));

}


function draw() {
     background(255);
     rotateX(PI/4)
     ambientMaterial(10)
     noStroke()
     for(var j = 0; j < y.length-1; j++){
          beginShape()
          for(var i = 0; i < x.length-1; i++){
               vertex(x[i] * scl, y[j] * scl, f[i][j] * scl / 5)
               vertex(x[i] * scl, y[j+1] * scl, f[i][j+1] * scl / 5)
               vertex(x[i+1] * scl, y[j+1] * scl,f[i+1][j+1] * scl / 5)
               vertex(x[i+1] * scl, y[j] * scl,f[i+1][j] * scl / 5)
          }
          endShape()
     }



     updateCameraLocation();
     // console logging camera location helps to conceptialize what's happening
     // console.log(`Camera: x:${cameraLocation.x}, y:${cameraLocation.y}, z:${cameraLocation.z}`)
     camera(cameraLocation.x, cameraLocation.y, cameraLocation.z, 0, 0, 0, 0, 1, 0);
     // noLoop()

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

function updateCameraLocation() {
     if (keyIsDown(LEFT_ARROW)) cameraLocation.x -= 5;
     if (keyIsDown(RIGHT_ARROW)) cameraLocation.x += 5;
     if (keyIsDown(UP_ARROW)) cameraLocation.z -= 5;
     if (keyIsDown(DOWN_ARROW)) cameraLocation.z += 5;
   }
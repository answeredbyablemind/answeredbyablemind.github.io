var f = [[]]
var scl
var x = []
var y = []
var tex
var signature

var delta_x
var delta_y
var box_height
var z_axis_ratio = 2

var delta_x_slider
var delta_y_slider

function setup() {
     createCanvas(320, 320, WEBGL);

     setAttributes('antialias', true)
     // my function
     // z = 4- x^2- y^2

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

     // 글씨 쓰기
     tex = createP()
     tex.style('font-size', '15px')
     tex.position(width/4, 0)
     katex.render('f(x,y) = 4 - x^2 - y^2', tex.elt)

     delta_x_slider = createSlider(0.1, 2, 0.1, 0.05)
     delta_x_slider.position(0, height)
     
     delta_y_slider = createSlider(0.1, 2, 0.1, 0.05)
     delta_y_slider.position(width/2, height)

     // 서명 쓰기
     signature = createP()
     signature.style('font-size', '10px')
     signature.position(width*0.7, height*0.88)
     katex.render('(c) 공돌이의 수학정리노트', signature.elt)
}


function draw() {
     background(255);
     plotSignature()

     rotateX(PI/4)
     delta_x = delta_x_slider.value()
     delta_y = delta_y_slider.value()

     plotAxes()

     plotBoxes() //TODO: 남는 부분 box 채워넣어주기

     orbitControl()

     plotCurvedPlane()

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

function plotAxes(){
     let stt = -3
     let end = 3

     push()
     
     stroke(0)
     // x axis
     line(stt * scl, 0, 0, end * scl, 0, 0)
     // y axis
     line(0, stt * scl, 0, 0, end * scl, 0)
     // z axis
     // line(0, 0, -3 * scl, 0, 0, 3 * scl)

     // xtick 그려주기
     for(let i = stt; i<=end; i++){
          line(i * scl, -0.1 * scl, 0, i * scl, 0.1 * scl, 0)
     }
     // ytick 그려주기
     for(let i = stt; i<=end; i++){
          line(-0.1 * scl, i * scl, 0, 0.1 * scl, i * scl, 0)
     }
     pop()
}
function plotBoxes(){
     for(var i = -1; i <= 1; i+=delta_x){
          for(var j = -1; j <= 1; j+=delta_y){
               let box_height_arr = [
                    box_height1 = 4 - (i - delta_x/2)**2 - (j - delta_y/2)**2, 
                    box_height2 = 4 - (i + delta_x/2)**2 - (j - delta_y/2)**2, 
                    box_height3 = 4 - (i - delta_x/2)**2 - (j + delta_y/2)**2, 
                    box_height4 = 4 - (i + delta_x/2)**2 - (j + delta_y/2)**2]
               box_height = min(box_height_arr)

               push()
               translate(i * scl, j * scl, box_height/2 * scl / z_axis_ratio)
               fill(255)
               stroke(0)
               box(delta_x * scl, delta_y * scl, box_height * scl / z_axis_ratio)
               pop()
          }
     }
     
}

function plotCurvedPlane(){
     my_color = color(100, 50, 100);
     my_color.setAlpha(50)
     fill(my_color)
     // stroke(0)
     noStroke()

     for(var j = 0; j < y.length-1; j++){
          beginShape(TESS) // p5.js 버전 확실히 체크할 것. 버전 낮으면 TESS 작동 안함.
          for(var i = 0; i < x.length-1; i++){
               vertex(x[i] * scl, y[j] * scl, f[i][j] * scl / z_axis_ratio)
               vertex(x[i] * scl, y[j+1] * scl, f[i][j+1] * scl / z_axis_ratio)
               vertex(x[i+1] * scl, y[j+1] * scl, f[i+1][j+1] * scl / z_axis_ratio)
               vertex(x[i+1] * scl, y[j] * scl, f[i+1][j] * scl / z_axis_ratio)
          }
          endShape()
     }

}
function plotSignature(){
     fill(255);
     textAlign(RIGHT)
     textSize(20 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)
}


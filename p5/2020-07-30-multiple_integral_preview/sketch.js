var f = [[]]
var scl
var x = []
var y = []
var tex
var signature
var texVol
var texVolReal

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

     delta_x_slider = createSlider(1, 21, 9, 1)
     delta_x_slider.position(0, height)
     
     delta_y_slider = createSlider(1, 21, 9, 1)
     delta_y_slider.position(width/2, height)

     // 서명 쓰기
     signature = createP()
     signature.style('font-size', '10px')
     signature.position(width*0.7, height*0.88)
     katex.render('(c) 공돌이의 수학정리노트', signature.elt)

     texVolReal = createP()
     texVolReal.style('font-size', '10px')
     texVolReal.position(width*0.85, height * 0.68)
     katex.render('\\int_{-1}^{1}\\int_{-1}^{1}(4-x^2-y^2)dxdy = 13.333\\cdots', texVolReal.elt)

     texVol = createP()
     texVol.style('font-size', '10px')
     texVol.position(width, height * 0.75)
     
}


function draw() {
     let sumOfVolumes
     background(255);
     orbitControl()

     rotateX(PI/4)
     delta_x = 2/delta_x_slider.value()
     delta_y = 2/delta_y_slider.value()

     plotAxes()

     sumOfVolumes = plotBoxes()
     let my_arr = ['부피 추정값:', str(round(sumOfVolumes,2))]
     let separator = ' '
     katex.render(
          join(my_arr, separator)
          , texVol.elt)

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
     var sumOfVolumes = 0
     for(var i = -(1-delta_x/2); i < 1; i+=delta_x){
          for(var j = -(1-delta_y/2); j < 1 ; j+=delta_y){
               let box_height_arr = [
                    4 - (i - delta_x/2)**2 - (j - delta_y/2)**2, 
                    4 - (i + delta_x/2)**2 - (j - delta_y/2)**2, 
                    4 - (i - delta_x/2)**2 - (j + delta_y/2)**2, 
                    4 - (i + delta_x/2)**2 - (j + delta_y/2)**2]
               box_height = min(box_height_arr) //visualization 용
               
               sumOfVolumes += delta_x * delta_y * box_height_arr[3] // 실제 계산
               push()
               translate(i * scl, j * scl, box_height/2 * scl / z_axis_ratio)
               fill(255)
               stroke(0)
               box(delta_x * scl, delta_y * scl, box_height * scl / z_axis_ratio)
               pop()
          }
     }
     return sumOfVolumes

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
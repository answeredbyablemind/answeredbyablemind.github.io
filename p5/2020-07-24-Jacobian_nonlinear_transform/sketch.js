var n_steps = 20
var delta = 0.1
var num_lines_ROI = 5
var xs_ROI = []
var ys_ROI = []
var range = 11
var ROI = [1, 1]

var scl
var my_slider

function setup() {
     createCanvas(windowHeight* 0.9, windowHeight * 0.9);
     xs_ROI = [ROI[0]-delta * Math.floor(num_lines_ROI/2), ROI[0]+delta * Math.floor(num_lines_ROI/2)]
     ys_ROI = [ROI[1]-delta * Math.floor(num_lines_ROI/2), ROI[1]+delta * Math.floor(num_lines_ROI/2)]

     scl = width / 8
     my_slider = createSlider(0, n_steps, 0, 1)
     my_slider.position(0, height)

}
function draw() {
     background(0);
     push();
     
     noFill()

     translate(width/2, height/2)
     scale(1, -1)
     let i_step = my_slider.value()

     // 원래 위치의 격자 그리기
     
     stroke(100);
     strokeWeight(0.5);
     plot_original_grid()

     stroke(109, 155, 222);
     strokeWeight(1)
     nonlin_trans_vertical(-range, range, 1) // 세로축의 비선형 변환
     nonlin_trans_horizon(-range, range, 1) // 가로축의 비선형 변환

     stroke(255)
     strokeWeight(3)
     nonlin_trans_vertical(0, 0, 1) // y축의 비선형 변환
     nonlin_trans_horizon(0, 0, 1) // x축의 비선형 변환

     // nonlin_trans_vertical(xs_ROI[0], xs_ROI[1], delta) // 세로축 ROI의 비선형 변환
     // nonlin_trans_horizon(ys_ROI[0], ys_ROI[1], delta) // 세로축 ROI의 비선형 변환


     pop()

     function plot_original_grid(){
          for(i = -range; i <= range; i ++){
               line(i * scl, -height/2, i * scl, height/2)
               line(-width/2, i * scl, width/2, i * scl)
          }

     }
     function nonlin_trans_vertical(range_stt, range_end, incre) {
          // range_stt: 시작하고자 가장 왼쪽의 x 좌표
          // range_end: 끝내하고자 가장 오른쪽의 x 좌표
          // incre: 세로축의 간격
          let y = []

          y = linspace(-range, range, 100)
          for (let i_x = range_stt; i_x <= range_end; i_x+=incre) {
               var changeX = []
               var changeY = []
               var new_X = []
               var new_Y = []
               let x = []

               // x range 만들기
               for (let j = 0; j < 100; j++) {
                    x.push(i_x)
               }

               let temp = []
               temp = my_nonlin_func(x, y)
               changeX = temp[0]
               changeY = temp[1]

               for (i = 0; i < x.length; i++) {
                    new_X.push(
                         x[i] + changeX[i] * i_step / n_steps
                    )
                    new_Y.push(
                         y[i] + changeY[i] * i_step / n_steps
                    )
               }

               // 그림 그리기
               beginShape()
               for (let i = 0; i < new_X.length; i++) {
                    vertex(new_X[i] * scl, new_Y[i] * scl)
               }
               endShape()
          }
     }

     function nonlin_trans_horizon(range_stt, range_end, incre) {
          // range_stt: 시작하고자 가장 아랫쪽의 y 좌표
          // range_end: 끝내하고자 가장 윗쪽의 y 좌표
          // incre: 가로축의 간격
          let x = []
          // x range 만들기
          x = linspace(-range, range, 100)
          for (let i_y = range_stt; i_y <= range_end; i_y+=incre) {
               var changeX = []
               var changeY = []
               var new_X = []
               var new_Y = []
               let y = []

               // x range 만들기
               for (let j = 0; j < 100; j++) {
                    y.push(i_y)
               }

               let temp = []
               temp = my_nonlin_func(x, y)
               changeX = temp[0]
               changeY = temp[1]

               for (let i = 0; i < x.length; i++) {
                    new_X.push(
                         x[i] + changeX[i] * i_step / n_steps
                    )
                    new_Y.push(
                         y[i] + changeY[i] * i_step / n_steps
                    )
               }

               // 그림 그리기
               beginShape()
               for (let i = 0; i < new_X.length; i++) {
                    vertex(new_X[i] * scl, new_Y[i] * scl)
               }
               endShape()
          }
     }

     // 마지막 서명
     plotSignature();

}

function plotSignature(){
     fill(255);
     textAlign(RIGHT)
     textSize(20 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)
}

function my_nonlin_func(x, y){
     let newX = []
     let newY = []
     let changeX = []
     let changeY = []

     for (let i =0; i<x.length; i++){
          newX.push(
               x[i] + sin(y[i]/2)
               // x[i] * cos([y[i]]) // to polar coordinate
               // x[i] + y[i] ** 2 // 뚫고 올라가는 느낌
          )
          newY.push(
               y[i] + sin(x[i]/2)
               // x[i] * sin([y[i]]) // to polar coordinate
               // y[i] + exp(x[i]) // 뚫고 올라가는 느낌
          )
     }

     for (let i =0; i<x.length; i++){
          changeX.push(
               newX[i] - x[i]
          )
          changeY.push(
               newY[i] - y[i]
          )
     }
     
     return [changeX, changeY]

}

function linspace(start, end, num){
     var res_vec = []

     for (let i =0; i < num; i ++){
          res_vec.push(
               start + (end-start)/(num-1) * i
          )
     }
     return res_vec

}
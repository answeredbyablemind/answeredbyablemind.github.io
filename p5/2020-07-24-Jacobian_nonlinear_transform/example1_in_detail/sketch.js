var n_steps = 20
var delta = 0.1
var num_lines_ROI = 5
var xs_ROI = []
var ys_ROI = []
var range = 8
var ROI = [1, 1]

var scl
// var my_slider

var time

var extraCanvas

function setup() {
     createCanvas(windowHeight* 0.9 * 2, windowHeight * 0.9);
     xs_ROI = [ROI[0]-delta * Math.floor(num_lines_ROI/2), ROI[0]+delta * Math.floor(num_lines_ROI/2)]
     ys_ROI = [ROI[1]-delta * Math.floor(num_lines_ROI/2), ROI[1]+delta * Math.floor(num_lines_ROI/2)]

     scl = height / 8
     // my_slider = createSlider(0, n_steps, 0, 1)
     // my_slider.position(0, height)

     time = 0

     extraCanvas = createGraphics(windowHeight* 0.9 * 2, windowHeight * 0.9)
     extraCanvas.background(0)
}
function draw() {

     a = n_steps/(1+Math.exp(-(time-6)))
     time += 0.05
     if (time>13){
          time = 0
     }

     // a = my_slider.value()
     background(0);

     // 왼쪽 절반 그려주기
     draw_left_half(width / 4, height / 2)

     // 오른쪽 절반 그려주기
     // ROI 중심으로 중점 잡기

     let changeX_for_center
     let changeY_for_center
     let new_X_for_center
     let new_Y_for_center

     let temp_for_center = []
     temp_for_center = my_nonlin_func([ROI[0]], [ROI[1]])
     changeX_for_center = temp_for_center[0]
     changeY_for_center = temp_for_center[1]

     new_X_for_center = ROI[0] + changeX_for_center * a / n_steps // 새로운 중점 x 좌표
     new_Y_for_center = ROI[1] + changeY_for_center * a / n_steps // 새로운 중점 y 좌표


     image(extraCanvas, width/2, 0)
     extraCanvas.clear()
     extraCanvas.fill(0)
     extraCanvas.rect(0, 0, width, height)

     extraCanvas.push();
     extraCanvas.translate(1/4 * width, 1/2 * height)
     extraCanvas.scale(12, -12)
     extraCanvas.strokeWeight(0.3)

     // extraCanvas에 vertical lines 그리기
     extraCanvas.translate(-new_X_for_center * scl, -new_Y_for_center * scl)

     
     var center_moved_by_func = my_nonlin_func([new_X_for_center], [new_X_for_center])
     extraCanvas.translate(-center_moved_by_func[0] * a / n_steps* scl, -center_moved_by_func[1] * a / n_steps * scl)

     extraCanvas.noFill()
     for(i_vert = 0; i_vert < 4; i_vert ++){
          let x_r = [] // 오른쪽 panel에 그려질 x
          let y_r = [] // 오른쪽 panel에 그려질 y

          for (i = 0; i<100; i++){
               x_r.push(new_X_for_center - 1.5 * delta + i_vert * delta)
          }

          y_r = linspace(new_Y_for_center - 5 * delta, 
                         new_Y_for_center + 5 * delta, 100)

          let changeX = []
          let changeY = []
          let new_X = []
          let new_Y = []
          let temp = []

          temp = my_nonlin_func(x_r, y_r)    
          changeX = temp[0]
          changeY = temp[1]
               
          for(let i = 0; i < x_r.length; i++) {
               new_X.push(
                    x_r[i] + changeX[i] * a / n_steps
               )
               new_Y.push(
                    y_r[i] + changeY[i] * a / n_steps
               )
          }
          

          extraCanvas.stroke(112, 196, 125)
          extraCanvas.beginShape()

          for (let i = 0; i < new_X.length; i++) {
               extraCanvas.vertex(new_X[i] * scl, new_Y[i] * scl)
          }

          extraCanvas.endShape()
     }
     
     // extraCanvas에 horizontal lines 그리기

     for(i_vert = 0; i_vert < 4; i_vert ++){
          let x_r = [] // 오른쪽 패널에 그려질 x
          let y_r = [] // 오른쪽 패널에 그려질 y

          for (i = 0; i<100; i++){
               y_r.push(new_Y_for_center - 1.5 * delta + i_vert * delta)
          }

          x_r = linspace(new_X_for_center - 5 * delta, 
                         new_X_for_center + 5 * delta, 100)

          let changeX = []
          let changeY = []
          let new_X = []
          let new_Y = []
          let temp = []

          temp = my_nonlin_func(x_r, y_r)    
          changeX = temp[0]
          changeY = temp[1]
               
          for(let i = 0; i < x_r.length; i++) {
               new_X.push(
                    x_r[i] + changeX[i] * a / n_steps
               )
               new_Y.push(
                    y_r[i] + changeY[i] * a / n_steps
               )
          }

          // extraCanvas.translate(new_X_for_center * scl, new_Y_for_center * scl)

          extraCanvas.stroke(230, 57, 57)
          extraCanvas.beginShape()

          for (let i = 0; i < new_X.length; i++) {
               extraCanvas.vertex(new_X[i] * scl, new_Y[i] * scl)
          }

          extraCanvas.endShape()
     }

     extraCanvas.pop()

     extraCanvas.push();
     extraCanvas.translate(1/4 * width, 1/2 * height)
     extraCanvas.scale(12, -12)

     extraCanvas.rectMode(CENTER)
     extraCanvas.noFill()
     extraCanvas.stroke(255)
     extraCanvas.rect(0, 0, 4.5 * delta * scl, 4.5 * delta * scl)
     extraCanvas.pop()

     // 마지막 서명
     plotSignature();


     function draw_left_half(pos1, pos2) {
          push()

          noFill()

          translate(pos1, pos2)
          scale(1, -1)
          // let i_step = my_slider.value()
          let i_step = a

          // 원래 위치의 격자 그리기
          stroke(100)
          strokeWeight(0.5)
          plot_original_grid()

          stroke(109, 155, 222)
          strokeWeight(1)
          nonlin_trans_vertical(-range, range, 1) // 세로축의 비선형 변환
          nonlin_trans_horizon(-range, range, 1) // 가로축의 비선형 변환

          stroke(255)
          strokeWeight(3)
          nonlin_trans_vertical(0, 0, 1) // y축의 비선형 변환
          nonlin_trans_horizon(0, 0, 1) // x축의 비선형 변환

          strokeWeight(1)
          stroke(112, 196, 125)

          nonlin_trans_vertical(xs_ROI[0], xs_ROI[1], delta) // 세로축 ROI의 비선형 변환

          stroke(230, 57, 57)
          nonlin_trans_horizon(ys_ROI[0], ys_ROI[1], delta) // 가로축 ROI의 비선형 변환

          // ROI를 따라가는 빨간색 박스
          plot_ROI_box(ROI)

          pop()

          function plot_original_grid() {
               for (i = -range; i <= range; i++) {
                    line(i * scl, -height / 2, i * scl, height / 2)
                    line(-width / 2, i * scl, width / 2, i * scl)
               }

          }
          function nonlin_trans_vertical(range_stt, range_end, incre) {
               // range_stt: 시작하고자 가장 왼쪽의 x 좌표
               // range_end: 끝내하고자 가장 오른쪽의 x 좌표
               // incre: 세로축의 간격
               let y = []

               y = linspace(-range, range, 100)
               for (let i_x = range_stt; i_x <= range_end; i_x += incre) {
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
               for (let i_y = range_stt; i_y <= range_end; i_y += incre) {
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

          function plot_ROI_box(pos){

               pos_x = pos[0]
               pos_y = pos[1]
          
               var changeX
               var changeY
               var new_X
               var new_Y

               let temp = []
               temp = my_nonlin_func([pos_x], [pos_y])
               changeX = temp[0]
               changeY = temp[1]

               new_X = pos_x + changeX * i_step / n_steps

               new_Y = pos_y + changeY * i_step / n_steps

               push()
               noFill()
               stroke(255)
               rectMode(CENTER)
               rect((new_X -delta/2)* scl, (new_Y-delta/2) * scl, 4.5* delta * scl, 4.5 * delta * scl )
               pop()


          }
     }
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

var xrange = []
var online = []
var temp_vertical = []
var temp_horizontal = []
var temp = []
var x = []
var y = []
var z = []
var z_re = []
var z_im = []
var change_x = []
var change_y = []
var n_step = 100

var idx_red = []
var idx_blue = []

var scl

var x_pos, y_pos

var my_slider

function setup() {
     createCanvas(windowHeight* 0.9, windowHeight * 0.9);
     scl = width / 8
     let i

     xrange= [-PI, PI]

     for(i=0; i<100; i++){
          online.push(xrange[0] + (xrange[1]-xrange[0])/99*i)
     }

     let i_range = []
     i = 0
     let ii = 0

     while(i < PI){
          i = -PI + PI/8 * ii
          i_range.push(i)
          ii+=1
     }

     // temp_vertical 만들기
     for(ii=0; ii<i_range.length; ii++){
          for(let j=0; j<(online.length-1);j++){
               temp_vertical.push(
                    [i_range[ii], online[j]]
               )
          }
     }

     // temp_horizontal 만들기
     for(ii=0;ii<temp_vertical.length;ii++){
          temp_horizontal.push(
               [temp_vertical[ii][1], temp_vertical[ii][0]]
          )
     }

     // temp 만들기
     for (ii = 0; ii< temp_vertical.length; ii++){
          temp.push(temp_vertical[ii])
     }
     for (ii = 0; ii< temp_horizontal.length; ii++){
          temp.push(temp_horizontal[ii])
     }
     
     for (ii=0; ii<temp.length; ii++){
          x.push(
               temp[ii][0]
          )
          y.push(
               temp[ii][1]
          )
     }

     // z-plane의 점들 위치 계산
     for(ii=0; ii<x.length; ii++){     
          z.push(math.exp(
               math.complex(x[ii], y[ii])
          ))
     }

     // z-plane 위의 점들 real, imag 값으로 분리
     for (ii=0;ii<x.length;ii++){
          z_re.push(
               math.re(z[ii])
          )
          z_im.push(
               math.im(z[ii])
          )
     }

     for(ii=0; ii<x.length;ii++){
          change_x.push(
               z_re[ii]-x[ii]
          )
          change_y.push(
               z_im[ii]-y[ii]
          )
     }

     // x == 0인 index 추출

     my_slider = createSlider(0, n_step, 0, 1)
     my_slider.position(0, height)

     // 빨간색으로 칠할 좌표의 INDEX 추출 (원래의 real axis)
     for(ii=0; ii<x.length; ii++){
          if(x[ii]==0){
               idx_red.push(ii)
          }
     }
     
     // 파란색으로 칠할 좌표의 INDEX 추출 (원래의 imaginary axis)
     for(ii=0; ii<x.length; ii++){
          if(y[ii]==0){
               idx_blue.push(ii)
          }
     }
}
function draw() {
     background(0);
     push()
     translate(width/2, height/2)
     scale(1, -1)
     noStroke()
     fill(255)
     i_step = my_slider.value()
     for(let ii =0; ii<x.length; ii++){
          x_pos = temp[ii][0] + change_x[ii] * i_step / n_step
          y_pos = temp[ii][1] + change_y[ii] * i_step / n_step
          ellipse(x_pos * scl, y_pos * scl, 5)
     }
     
     fill(255, 70, 50)
     for(let ii =0; ii<idx_red.length; ii++){
          x_pos = temp[idx_red[ii]][0] + change_x[idx_red[ii]] * i_step / n_step
          y_pos = temp[idx_red[ii]][1] + change_y[idx_red[ii]] * i_step / n_step
          ellipse(x_pos * scl, y_pos * scl, 5)
     }
     
     fill(0, 120, 255)
     for(let ii =0; ii<idx_red.length; ii++){
          x_pos = temp[idx_blue[ii]][0] + change_x[idx_blue[ii]] * i_step / n_step
          y_pos = temp[idx_blue[ii]][1] + change_y[idx_blue[ii]] * i_step / n_step
          ellipse(x_pos * scl, y_pos * scl, 5)
     }
     pop()
     // 마지막 서명
     plotSignature();

}

function plotSignature(){
     fill(255);
     textAlign(RIGHT)
     textSize(12 / 800 * width)
     text('(c) 공돌이의 수학정리노트', width * 0.98, height * 0.95)
}

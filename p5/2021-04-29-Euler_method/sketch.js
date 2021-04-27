var scl_w, scl_h;
let f = []
let f_approx = []
let n_fun = 100
let f_approx_xx = []
let f_xx = []

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(500, 500);
     // n = 50
     // p = 0.5;

     slider_h = createSlider(0.01, 3, 0.5, 0.01)
     slider_h.position(width/2-50, 80)

     f_xx = linspace(0, 8, n_fun)

     for(let i = 0; i<n_fun; i++){
          f.push(exp(f_xx[i]))
     }

}

function draw() {
     
     background(0);
     h = slider_h.value()
     f_approx = []
     f_approx_xx = []

     f_approx.push(f[0])
     f_approx_xx.push(f_xx[0])

     while(1){
          
          if(f_approx_xx[f_approx_xx.length-1] > f_xx[f_xx.length-1]){
               break
          }

          f_approx_xx.push(
               f_approx_xx[f_approx_xx.length-1] + h
          )
          f_approx.push(
               (1+h) * f_approx[f_approx.length - 1]
          )
     }

     scl_w = width / 6.5
     scl_h = scl_w / 8

     textSize(15)
     let separator = ' '     

     array = ['h =', String(Math.round(h*100)/100)]
     message = join(array, separator)
     textAlign(LEFT)

     text(message, 250, 75)

     // xy 축 그려주기
     plotAxes()

     // plot from (0, 0) point
     push()
     translate(50, 450)
     scale(1, -1)
     noFill()
     stroke(0, 114, 189)
     strokeWeight(3)
     beginShape()
     for(let i = 0; i<n_fun; i++){
          vertex(f_xx[i] * scl_w, f[i] * scl_h)
     }
     endShape()

     stroke(255, 0, 0)
     for (let i = 0; i<f_approx_xx.length-2; i ++){
          line(f_approx_xx[i] * scl_w, f_approx[i]* scl_h, f_approx_xx[i+1]* scl_w, f_approx[i+1]* scl_h)
     }
     for (let i = 0; i<f_approx_xx.length-1; i ++){
          circle(f_approx_xx[i] * scl_w, f_approx[i]* scl_h, 4)
     }
     pop()

     fill(0, 114, 189)
     stroke(0, 114, 189)
     textSize(18)
     text('True Solution', 190, 300)
     
     fill(255, 0, 0)
     stroke(255, 0, 0)
     textSize(18)
     text('Euler Method Approx.', 150 + scl_w * (2.5 + h/2), 380)
     
     fill(255); 
     textSize(12)
     textAlign(RIGHT)
     noStroke()
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.98)
}

function plotAxes(){     

     textSize(14)
     // 0 써주기
     textAlign(CENTER, CENTER)
     noStroke()
     text(0, 50-8, 450+10)
     // horizontal axis
     stroke(255)
     line(0, 450, width, 450)
     
     let xx = range(1, 5, 1)
     for (let i = 0; i < xx.length; i++){
          noStroke()
          let xpos = round(xx[i])
          text(xpos, 50 + xpos * scl_w, 450+18)
          stroke(255)
          line(50 + xpos * scl_w, 450-5, 50 + xpos * scl_w, 450+5)
     }

     noStroke()
     text('x', width/2+20, height-13)

     // vertical axis
     stroke(255)
     line(50, 0, 50, height)

     // yy = linspace(0, max(Pr), 7)
     let yy = range(0, 42, 3)

     for (let i = 1; i < yy.length; i++){
          noStroke()
          let my_num = round(yy[i])
          my_num_str = String(my_num)
          
          text(my_num_str, 30, 450 - my_num * scl_h)
          stroke(255)
          line(50-5, 450 - my_num * scl_h, 50 + 5, 450 - my_num * scl_h)
     }
     noStroke()
     // text('Pr(K=k)',40, 40)
}
function range(start, stop, interval = 0.1){
     let res = []

     for (i = start;i<=stop; i+=interval){
          res.push(i.toFixed(2))
     }
     return res
}

function linspace(start, stop, num, endpoint = true) {
     const div = endpoint ? (num - 1) : num;
     const step = (stop - start) / div;
     return Array.from({length: num}, (_, i) => start + step * i);
 }
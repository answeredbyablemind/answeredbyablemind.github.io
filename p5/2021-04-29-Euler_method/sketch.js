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
     slider_h.position(width/2+30, 80)

     f_xx = linspace(-20, 20, n_fun)

     for(let i = 0; i<n_fun; i++){
          f.push(0.5*f_xx[i]**2)
     }

}

function draw() {
     
     background(0);
     h = slider_h.value()
     f_approx = []
     f_approx_xx = []

     array1 = range(0, 20, h)
     array2 = range(-20, 0, h)

     f_approx_xx = array2.concat(array1)
     // let find_0 = f_approx_xx.findIndex(element => element == 0)
     let temp = []
     for(let i = 0; i< f_approx_xx.length; i++){
          temp.push(Math.abs(f_approx_xx[i]))
     }
     find_0 = indexOfSmallest(temp)

     f_approx[find_0] = 0

     // 양의 x에 대해서

     for(i=find_0; i < f_approx_xx.length - 1; i ++){
          f_approx[i+1]= h * f_approx_xx[i] + f_approx[i]
     }

     // 음의 x에 대해서
     for(i=find_0; i > 0; i --){
          f_approx[i-1]= f_approx[i] - h * f_approx_xx[i-1]
     }
     
     scl_w = width / 22
     scl_h = height / 50

     textSize(15)
     let separator = ' '     

     array = ['h =', String(Math.round(h*100)/100)]
     message = join(array, separator)
     textAlign(LEFT)

     text(message, 325, 75)

     // xy 축 그려주기
     plotAxes()

     // plot from (0, 0) point
     push()
     translate(width/2, 450)
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
function indexOfSmallest(a) {
     var lowest = 0;
     for (var i = 1; i < a.length; i++) {
      if (a[i] < a[lowest]) lowest = i;
     }
     return lowest;
}

function plotAxes(){     

     textSize(14)
     // 0 써주기
     textAlign(CENTER, CENTER)
     noStroke()
     // text(0, 50-8, 450+10)
     // horizontal axis
     stroke(255)
     line(0, 450, width, 450)
     
     let xx = range(-10, 10, 1)
     for (let i = 0; i < xx.length; i++){
          noStroke()
          let xpos = round(xx[i])
          text(xpos, width/2 + xpos * scl_w, 450+18)
          stroke(255)
          line(width/2 + xpos * scl_w, 450-5, width/2 + xpos * scl_w, 450+5)
     }

     noStroke()
     text('x', width/2+20, height-13)

     // vertical axis
     stroke(255)
     line(width/2, 0, width/2, height)

     // yy = linspace(0, max(Pr), 7)
     let yy = range(0, 42, 3)

     for (let i = 1; i < yy.length; i++){
          noStroke()
          let my_num = round(yy[i])
          my_num_str = String(my_num)
          
          text(my_num_str, width/2-20, 450 - my_num * scl_h)
          stroke(255)
          line(width/2-5, 450 - my_num * scl_h, width/2 + 5, 450 - my_num * scl_h)
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
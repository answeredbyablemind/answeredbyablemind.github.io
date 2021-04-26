var n, p, k;
// n: 전체 시행 횟수 n>=0
// p: 발생확률. 0<=p<=1
// k: 실현 횟수


var scl_w, scl_h;
let Pr = []
function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(500, 500);
     // n = 50
     // p = 0.5;

     slider_n = createSlider(0, 100, 50, 1)
     slider_p = createSlider(0, 1, 0.5, 0.01)

     slider_n.position(width-150, 50)
     slider_p.position(width-150, 80)

}

function draw() {
     
     background(0);
     n = slider_n.value()
     p = slider_p.value()
     Pr = []
     for(let k =0; k<=n; k++){
          Pr[k]= binomial(k,n,p)
     }

     scl_w = width / (n*1.2)
     scl_h = height * 3

     textSize(20)
     textAlign(CENTER)
     text('<n, p 값에 따른 이항 분포>', width/2, 30)

     textSize(15)
     let array = ['n =', String(n)]
     let separator = ' '
     let message = join(array, separator)
     textSize(14)
     textAlign(LEFT)
     text(message, 350, 45)
     
     array = ['p =', String(Math.round(p*100)/100)]
     message = join(array, separator)
     text(message, 350, 78)

     // xy 축 그려주기
     plotAxes()

     // plot from (0, 0) point
     push()
     translate(50, 450)
     scale(1, -1)

     for(let k =0; k<Pr.length; k++){
          stroke(0,114,189)
          strokeWeight(4)
          line(k * scl_w, 0, k * scl_w, Pr[k] * scl_h)
          circle(k * scl_w, Pr[k] * scl_h, 7)
     }
          
     pop()

     fill(255); 
     textSize(12)
     textAlign(RIGHT)
     noStroke()
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.98)
}

function factorial(n) {
     let res = 1
     for(let i = 1; i <= n; i++){
          res *= i
     }

     return res

}

function binomial(k, n, p) {
     return factorial(n)/(factorial(k)*factorial(n-k)) * p**k * (1-p)**(n-k)
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
     
     xx = linspace(0, n, 11, endpoint = true)
     for (let i = 1; i < xx.length; i++){
          noStroke()
          let xpos = round(xx[i])
          text(xpos, 50 + xpos * scl_w, 450+18)
          stroke(255)
          line(50 + xpos * scl_w, 450-5, 50 + xpos * scl_w, 450+5)
     }

     noStroke()
     text('k', width/2+20, height-13)

     // vertical axis
     stroke(255)
     line(50, 0, 50, height)

     // yy = linspace(0, max(Pr), 7)
     yy = linspace(0, 0.25, 7)

     for (let i = 1; i < yy.length; i++){
          noStroke()
          let my_num = yy[i]
          my_num_str = String(my_num)
          
          text(my_num_str.substr(0, 4), 30, 450 - my_num * scl_h)
          stroke(255)
          line(50-5, 450 - my_num * scl_h, 50 + 5, 450 - my_num * scl_h)
     }
     noStroke()
     text('Pr(K=k)',40, 40)
}

function linspace(start, stop, num, endpoint = true) {
     const div = endpoint ? (num - 1) : num;
     const step = (stop - start) / div;
     return Array.from({length: num}, (_, i) => start + step * i);
 }
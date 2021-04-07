let scl;

//////////////////////// 궤적 plot 용 ///////////////////////////////
let C = []
let C_pred = []
let history_C = []
let history_C_pred = []

////////////////////// Kalman Filter에 필요한 것들 ///////////////////
let dt
let A = []
let H = []
let Q = []
let R = []

let x = []
let P = []

// Kalman filter 계산 과정에서 필요한 변수들
let xp = []
let Pp = []
let K = []
let z = []

function setup() {
     // createCanvas(windowWidth - 20, windowHeight - 20);
     // TODO: window size에 맞춰서 animation을 만들 수 없을까?
     createCanvas(500, 500);
     scl = (height / 8); // height가 낮다보니 height에 scale을 맞추는게 좋아보임
     dt = 1
     A = [
          [1, dt, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 1, dt],
          [0, 0, 0, 1]
     ]

     H = [
          [1, 0, 0, 0],
          [0, 0, 1, 0]
     ]

     Q = math.multiply(0.005, 
          [
               [1, 0, 0, 0],
               [0, 1, 0, 0],
               [0, 0, 1, 0],
               [0, 0, 0, 1]
          ]
     )

     R = math.multiply(200,
          [
               [1, 0],
               [0, 1]
          ]
     )

     // 초기값 세팅
     x = [
          [0],
          [0],
          [0],
          [0]
     ]

     P = math.multiply(100, 
          [
               [1, 0, 0, 0],
               [0, 1, 0, 0],
               [0, 0, 1, 0],
               [0, 0, 0, 1]
          ]
     )
}

function draw() {
     
     background(0);
     test()
     stroke(255)

     line(width/2, 0, width/2, height)
     line(0, height/2, width, height/2)

     fill(255);
     textSize(12)
     textAlign(RIGHT)
     text('(c) 공돌이의 수학정리노트', width * 0.95, height * 0.95)
}

function test() {
     
     // C: current mouse position
     C = [
          [(mouseX-width/2)/scl],
          [((-1 * mouseY + height) - height/2)/scl]
     ]
     C_pred = TrackKalman(C)
     history_C.push(C)
     history_C_pred.push(C_pred)

     push()
     translate(width/2, height/2)
     scale(1, -1)

     fill(255, 0, 0)
     ellipse(C[0][0] * scl, C[1][0] * scl, 10)

     fill(0, 255, 0)
     ellipse(C_pred[0][0] * scl, C_pred[1][0] * scl, 10)
     noFill()
     strokeWeight(2)
     stroke(255, 0, 0)
     beginShape()
     for (i = 0; i <history_C.length; i++){
          vertex(history_C[i][0] * scl, history_C[i][1] * scl)
     }
     endShape()

     stroke(0, 255, 0)
     
     
     beginShape()
     for (i = 0; i <history_C.length; i++){
          vertex(history_C_pred[i][0] * scl, history_C_pred[i][1] * scl)
     }
     endShape()

     pop();

     if(history_C.length > 100){
          history_C.shift()
          history_C_pred.shift()
     }
     
}


function TrackKalman(z){
     let temp = []
     let res = []
     xp = math.multiply(A, x);
     Pp = math.add(math.multiply(A, math.multiply(P, math.transpose(A))), Q)

     temp = math.add(math.multiply(H, math.multiply(Pp, math.transpose(H))), R)

     K = math.multiply(Pp, math.multiply(math.transpose(H), math.inv(temp)))

     x = math.add(xp, math.multiply(K, math.add(
          z, math.multiply(-1, math.multiply(H, xp))
          )))
     P = math.add(Pp, math.multiply(-1, math.multiply(K, math.multiply(H, Pp))))

     res = [
          [x[0]],
          [x[2]]
     ]

     return res
}




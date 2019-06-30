let ylabel = []
let xlabel = []
let t = []
let x =[]

function setup() {
     // put setup code here
     scl = 40;
     n_xlabel = 11;
     n_ylabel = 9;

     createCanvas(scl * n_xlabel + 20, scl * n_ylabel + 20);

     // x, y label을 만들어주기
     for (let i = 0; i < n_ylabel; i++) {
          ylabel[i] = 6 - i;
     }
     for (let i = 0; i < n_xlabel; i++) {
          xlabel[i] = 0 + i;
     }

     // t 설정
     for(let i =0; i<400; i++){
          t[i]=map(i,0,400,0,10);
     }

     // x 설정
     for(let i=0; i<400; i++){
          // x=sin(t)+3*cos(t/3)+4*sin(t/4);
          x[i] = sin(t[i]) + 3* cos(t[i]/3) + 4*sin(t[i]/4);
     }
}


function draw() {
     // put drawing code here
     background(255);
     // drawing axes and grid
     drawAxis();

     // plotting the function
     push();
     noFill();
     beginShape()
     for(let i=0;i<400; i++) {
          vertex(map(t[i],0,10,0,400), map(-x[i],min(x),max(x),0,height))
     }
     endShape()
     pop();




}

let snow = [];
let gravity;

let spriteSheet;
let textures = [];

function preload() {
     spriteSheet = loadImage('flake32.png');
}

function setup() {
     // put setup code here
     createCanvas(windowWidth, windowHeight);
     gravity = createVector(0, 0.03);
     for (i = 0; i < 300; i++) {
          snow.push(new Snowflake());
     }
}

function draw() {
     // put drawing code here
     background(0);

     for (flake of snow) {
          flake.applyForce(gravity)
          flake.update();
          flake.render();
     }
     //
     // for (let i = snow.length-1; i>=0;i--){
     //      if(snow[i].offScreen()){
     //           snow.splice(i,1);
     //      }
     // }
}

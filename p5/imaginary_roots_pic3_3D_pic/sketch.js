var angle

function setup() {
  createCanvas(400, 400,WEBGL);
  angle = 0
}

function draw() {
  background(175);
  // ambientLight(0,0,255)
  let locX = mouseX - width / 2;
  let locY = mouseY - height / 2;
//
// for (i=0;i<500;i+=100){
//   pointLight(0, 0, 255, -200, 0, i)
// }
directionalLight(0,0,255,-1,0,-1)
  // rectMode(CENTER)
  // stroke(0)
  noStroke()
  // fill(0,0,255)
  // basicMaterial()
  //normalMaterial()
  // translate(mouseX-width/2, mouseY-height/2)
  ambientMaterial(255)
  rotateX(angle)
  rotateY(angle*0.2)

  // rect(0,0,150,150);
  // box(10,100,50 );
  // torus(100,10)
  sphere(100)

  angle += 0.07
}

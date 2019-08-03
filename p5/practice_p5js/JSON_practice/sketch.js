var data;

function preload(){
  data = loadJSON('./birds.json')
}
function setup() {
  noCanvas();
  var bird = data.birds[1].members[2];
  createP(bird);
}

function draw() {
}
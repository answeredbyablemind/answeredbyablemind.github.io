var dir
var n_cell = 20
var cell_size

var offset_time = 0.1
var offset_x = 0.1
var offset_y = 0.1
var time_flow

var particles = []

var flowfield


function setup () {
  createCanvas(320, 320);
  cell_size = floor(width / n_cell)

  time_flow = 0

  flowfield = new Array(cell_size ** 2)

  for (var i = 0; i < 500; i++){
    particles[i] = new Particle();
  }
  background(255)
}

function draw () {
  stroke(0, 50)
  noFill()
  strokeWeight(1)
  
  for(var i = 0; i < n_cell; i++){
    for (var j = 0; j <n_cell; j++){
      // rect(i * cell_size, j * cell_size, cell_size, cell_size)
      dir = map(noise(i * offset_x, j * offset_y, time_flow), 0, 1, 0, 4*PI)
      
      var index = j + n_cell * i
      var v = p5.Vector.fromAngle(dir)
      v.setMag(0.05)
      flowfield[index] = v

      // push()
      // translate((i+0.5) * cell_size, (j+0.5) * cell_size)
      // rotate(dir)
      // line(-cell_size/2, 0, cell_size/2, 0)
      
      // pop()

    }
  }

  time_flow += offset_time

  for (var i = 0; i < particles.length; i++){
    particles[i].follow(flowfield)
    particles[i].update()
    particles[i].edges()

    particles[i].show()
  }
}


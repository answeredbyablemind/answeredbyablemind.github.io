var dir
var n_cell = 20
var cell_size

var offset_time = 0.01
var offset_x = 0.05
var offset_y = 0.05
var time_flow

function setup () {
  createCanvas(320, 320);
  cell_size = width / n_cell

  time_flow = 0
}

function draw () {
  background(255)
  stroke(0)
  noFill()
  
  
  for(var i = 0; i < n_cell; i++){
    for (var j = 0; j <n_cell; j++){
      // rect(i * cell_size, j * cell_size, cell_size, cell_size)

      dir = map(noise(i * offset_x, j * offset_y, time_flow), 0, 1, 0, 2*PI)
      push()
      translate((i+0.5) * cell_size, (j+0.5) * cell_size)
      rotate(dir)
      line(-cell_size/2, 0, cell_size/2, 0)
      
      pop()

    }
  }

  time_flow += offset_time

}


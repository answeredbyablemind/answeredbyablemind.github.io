var rows, cols
var grid = []
var w = 40

var current

function setup() {
  createCanvas(400, 400);
  
  rows = floor(height / w)
  cols = floor(width / w)
  
  for (var j = 0; j < rows; j++){
    for (var i = 0; i < cols; i++){
      grid.push(new Cell(i,j))
    }
  }

  current = grid[0]
}

function draw() {
  background(55);
  for (var i =0; i < grid.length; i ++){
       grid[i].show()
  }

  current.visited = true
  current.checkNeighbors()

}

class Cell {
     constructor(i, j) {
          this.i = i;
          this.j = j;
          this.walls = [true, true, true, true] // Top, Right, Bottom, Left
          this.visited = false

     }
     
     show() {
          var x = this.i * w;
          var y = this.j * w;
          stroke(255);
          if (this.walls[0]) {
               line(x, y, x + w, y);
          }
          if (this.walls[1]) {
               line(x + w, y, x + w, y + w);
          }
          if (this.walls[2]) {
               line(x + w, y + w, x, y + w);
          }
          if (this.walls[3]) {
               line(x, y + w, x, y);
          }
          
          if (this.visited){
               fill(255, 0, 255, 100)
               rect(x, y, w, w)
          }

     }

     checkNeighbors(){
          
     }


}
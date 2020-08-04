let cell = 25;
let walkers = [];
function setup () {
  let size = min(windowWidth, windowHeight) * 0.9;
  size -= (size % cell);
  createCanvas(size, size);
  walkers.push(new Walker());
  drawGrid();
  draw();
}
function windowResized () {
  let size = min(windowWidth, windowHeight) * 0.9;
  size -= (size % cell);
  resizeCanvas(size, size);
  clear();
  drawGrid();
}
function mouseClicked () {
  const x = mouseX - (mouseX % cell);
  const y = mouseY - (mouseY % cell);
  walkers = [];
  walkers.push(new Walker(x, y));
  clear();
  drawGrid();
}

class Walker {
  constructor (x, y) {
    this.x = x || floor((width / cell) / 2) * cell;
    this.y = y || floor((height / cell) / 2) * cell;
    this.draw();
  }
  isOut () {
    return (this.x < 0 || this.x > width || this.y < 0 || this.y > height);
  }
  move () {
    const direction = random();
    if (direction < 0.25) {
      // Go up
      this.y -= cell;
    } else if (direction < 0.5) {
      // Go down
      this.y += cell;
    } else if (direction < 0.75) {
      // Go left
      this.x -= cell;
    } else if (direction < 1) {
      // Go right
      this.x += cell;
    }
  }
  draw () {
    fill('rgba(0, 0, 0, 0.3)');
    noStroke();
    rect(this.x, this.y, cell, cell);
  }
}

function drawGrid() {
  // Hack to avoid blurry lines
  translate(0.5, 0.5);
  
  // Define the stroke color
  stroke(80);
  // Draw the rows
  for (let y = cell; y < height; y += cell) {
    line(0, y, width, y);
  }
  
  // Draw the columns
  for (let x = cell; x < width; x += cell) {
    line(x, 0, x, height);
  }
  
  resetMatrix();
}

function draw () {
  walkers.forEach(walker => {
    if (!walker.isOut()) {
      walker.move();
      walker.draw();
    }
  });
}
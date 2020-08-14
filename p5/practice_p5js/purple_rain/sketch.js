var drops = []
var n_drops = 200
function setup () {
  createCanvas(640, 360);

  for(var i = 0; i<n_drops; i++){
    drops.push(
      new Drop(random(width), random(-100, height))
    )
  }

}

function draw () {
  background(230, 230, 250)
  
  for(var i = 0; i<n_drops; i++){
    drops[i].fall()
    drops[i].show()
  }
}

class Drop{
  constructor(x, y){
    this.x = x
    this.y = y
    this.z = random(0, 20)
    this.len = map(this.z, 0, 20, 10, 20)
    this.yspeed = map(this.z, 0, 20, 0, 10)

  }

  fall(){
    this.y = this.y + this.yspeed
    this.yspeed = this.yspeed + 0.05

    if (this.y > height) {
      this.y = random(-100, 0)
      this.yspeed = map(this.z, 0, 20, 0, 10)
    }
  }

  show(){
    var thick = map(this.z, 0, 20, 1, 3)
    strokeWeight(thick)
    stroke(138, 43, 226)
    line(this.x, this.y, this.x, this.y + this.len)
  }
}
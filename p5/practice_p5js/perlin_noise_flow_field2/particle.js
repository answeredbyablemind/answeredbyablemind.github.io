function Particle(){

  this.pos = createVector(width / 2 + random(-50, 50), height / 2 + random(-50, 50))
  this.vel = createVector(0, 0)
  this.acc = createVector(0, 0)
  this.maxspeed = 1

  this.prevPos = this.pos.copy()

  this.update = function() {
    this.vel.add(this.acc)
    this.vel.limit(this.maxspeed)
    this.pos.add(this.vel)
    this.acc.mult(0)
  }

  this.follow = function(vectors) {
    var x = floor(this.pos.x / cell_size)
    var y = floor(this.pos.y / cell_size)

    var index = y + n_cell * x

    var force = vectors[index]
    this.applyForce(force)
    
  }
  this.applyForce = function(force) {
    this.acc.add(force)
  }

  this.show = function(){

    stroke(0, 10)
    strokeWeight(1)
    // point(this.pos.x, this.pos.y)
    line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y)
    this.updatePrev()
  }

  this.updatePrev = function(){
    this.prevPos.x = this.pos.x
    this.prevPos.y = this.pos.y

  }
  this.edges = function(){
    if (this.pos.x > width){
      this.pos.x = 0;
      this.updatePrev()
    }

    if (this.pos.x < 0){
      this.pos.x = width;
      this.updatePrev()
    }

    if (this.pos.y > height){
      this.pos.y = 0;
      this.updatePrev()
    }

    if (this.pos.y < 0) {
      this.pos.y = height;
      this.updatePrev()
    }

  }

}
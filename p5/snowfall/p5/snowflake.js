function getRandomSize() {

     let r = pow(random(0.5, 1), 10);
     return constrain(r * 36, 2, 36)
     // let r = randomGaussian() * 2.5;
     // return constrain(abs(r * r), 1 ,25);

     // while (true) {
     //      let r1 = random(1);
     //      let r2 = random(1);
     //
     //      if (r2 > r1) {
     //           return r1* 36
     //      }
     // }
}

class Snowflake {

     constructor() {
          let x = random(width);
          let y = random(height);
          this.pos = createVector(x, y);
          this.vel = createVector(0, 0);
          this.acc = createVector();
          this.r = getRandomSize();
     }

     applyForce(force) {
          // Parallax Effect hack(?)
          let f = force.copy();
          f.mult(this.r);

          this.acc.add(f);
     }

     randomize() {
          let x = random(width);
          let y = random(-100, -10);
          this.pos = createVector(x, y);
          this.vel = createVector(0, 0);
          this.acc = createVector();
          // this.r = random(1, 36);
          this.r = getRandomSize();
     }

     update() {
          this.vel.add(this.acc);
          this.vel.limit(this.r * 0.2);
          if (this.vel.mag() < 1) {
               this.vel.normalize();
          }
          this.pos.add(this.vel);
          this.acc.mult(0);

          if (this.pos.y > height + this.r) {
               this.randomize();
          }
     }

     render() {
          stroke(255);
          strokeWeight(this.r);
          point(this.pos.x, this.pos.y)
     }

     offScreen() {
          return (this.pos.y > height + this.r)
     }
}

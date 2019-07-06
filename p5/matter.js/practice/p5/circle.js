function Circle(x, y, radius) {
     this.x = x;
     this.y = y;
     this.r = radius;

     options = {
          restitution: 1
     }
     this.body = Bodies.circle(this.x, this.y, this.r, options);
     World.add(world, this.body);

     this.show = function() {
          var pos = this.body.position;
          var angle = this.body.angle;
          push();
          fill(255);
          translate(pos.x, pos.y);
          ellipseMode(CENTER);
          ellipse(0, 0, this.r*2);
          pop();
     }


}

function Box(x, y, w, h) {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;

     this.body = Bodies.rectangle(this.x, this.y, this.w, this.h);
     World.add(world, this.body);

     this.show = function() {
          var pos = this.body.position;
          var angle = this.body.angle;
          push();
          translate(pos.x, pos.y);
          rect(0, 0, this.w, this.h);
          pop();
     }


}

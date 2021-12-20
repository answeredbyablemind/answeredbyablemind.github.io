// Click and Drag an object
// Daniel Shiffman <http://www.shiffman.net>

class Draggable {
    constructor(x, y, radius) {
      this.dragging = false; // Is the object being dragged?
      this.rollover = false; // Is the mouse over the ellipse?
      this.x = x;
      this.y = y;
      this.radius = radius; // 원형 사용
      this.offsetX = 0;
      this.offsetY = 0;
    }
  
    over() {
      let my_dist = sqrt((mouseX - this.x) **2 + (mouseY - this.y)**2)
      // Is mouse over object
      if (my_dist < this.radius) {
        this.rollover = true;
      } else {
        this.rollover = false;
      }
    }
  
    update() {
      // Adjust location if being dragged
      if (this.dragging) {
        this.x = mouseX + this.offsetX;
        this.y = mouseY + this.offsetY;
      }
    }
  
    show() {
      stroke(0);
      // Different fill based on state
      if (this.dragging) {
        fill(50);
      } else if (this.rollover) {
        fill(100);
      } else {
        fill(175, 200);
      }
      circle(this.x, this.y, this.radius);
    }
  
    pressed() {
      // Did I click on the rectangle?
      let my_dist = sqrt((mouseX - this.x) **2 + (mouseY - this.y)**2)
      if (my_dist < this.radius) {
        this.dragging = true;
        // If so, keep track of relative location of click to corner of rectangle
        this.offsetX = this.x - mouseX;
        this.offsetY = this.y - mouseY;
      }
    }
  
    released() {
      // Quit dragging
      this.dragging = false;
    }
  }
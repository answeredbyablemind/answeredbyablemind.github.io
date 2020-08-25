var x

// Sketch A:
new p5(function(p) {
     p.setup = function() {
       p.createCanvas(100, 100, p.WEBGL);  // <--- WEBGL
     };
     p.draw = function(b) {
     p.background(0);
     p.fill(255);
       
     p.rotateX(p.frameCount * 0.01);
     p.rotateY(p.frameCount * 0.01);
     p.box(20);
     };

     console.log(x)
});

// Sketch B:
var my_slider
new p5(function(p) {
     p.setup = function() {
          p.createCanvas(100, 100, p.P2D);  // <--- P2D
          my_slider = p.createSlider(0, 255, 1)
          my_slider.position(0, p.height)

     };
     p.draw = function(b) {
          p.background(0);
          p.fill(255);
          p.rect(20,20,50,50);
     };

     x = my_slider.value()
});
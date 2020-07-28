var myButton

var circles = []
var minRadius = 2
var maxRadius = 100
var totalCircles = 500
var createCircleAttempts = 500

function setup() {
     createCanvas(320, 320);

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)
}

function draw() {
     background(255);

     for (var i = 0; i < totalCircles; i++){
          createAndDrawCircle()
     }
     
     noLoop()
}

function buttonPressed(){
     window.location.reload()
}

function createAndDrawCircle(){
     var newCircle
     for(var tries = 0; tries < createCircleAttempts; tries++) {
          newCircle = {
            x: Math.floor(Math.random() * width),
            y: Math.floor(Math.random() * width),
            radius: minRadius
          }
          
          if(doesCircleHaveACollision(newCircle)) {
            continue;
          } else {
            circleSafeToDraw = true;
            break;
          }
        }
      
        if(!circleSafeToDraw) {
          return;
        }

     for (var radiusSize = minRadius; radiusSize < maxRadius; radiusSize ++){
          newCircle.radius = radiusSize
          if (doesCircleHaveACollision(newCircle)){
               newCircle.radius--
               break;
          }
     }
     circles.push(newCircle)
     fill(255)
     stroke(0)
     ellipse(newCircle.x, newCircle.y, newCircle.radius * 2)

}

function doesCircleHaveACollision(circle){
     for (var i = 0; i < circles.length; i++){
          var otherCircle = circles[i]
          var a = circle.radius + otherCircle.radius
          var x = circle.x - otherCircle.x
          var y = circle.y - otherCircle.y;

          if (a >= Math.sqrt((x**2) + (y**2))){
               return true
          }
     }

     // 원 전체가 네모 안에는 들어올 수 있게
     if(circle.x + circle.radius >= width ||
          circle.x - circle.radius <= 0) {
          return true;
     }
     
     if(circle.y + circle.radius >= width ||
          circle.y - circle.radius <= 0) {
          return true;
     }
     
     return false
}


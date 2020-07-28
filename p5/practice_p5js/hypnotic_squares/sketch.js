var finalSize
var startSize
var startSteps
var tileStep
var directions = [-1, 0, 1]
var offset = 2

var myButton

function setup() {
     createCanvas(320, 320);
     finalSize = 3
     tileStep = (width - offset * 2) / 7
     startSize = tileStep

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)
}

function draw() {
     background(255);
     for(var x = offset; x < width - offset; x += tileStep) {
          for( var y = offset; y < width - offset; y += tileStep) {
            startSteps =  2 + Math.ceil(Math.random() * 3)
            var xDirection = directions[Math.floor(Math.random() * directions.length)]
            var yDirection = directions[Math.floor(Math.random() * directions.length)]
            my_draw(x, y, startSize, startSize, xDirection, yDirection, startSteps - 1);
          }
        }

     noLoop()
}

function buttonPressed(){
     window.location.reload()
}

function my_draw(x, y, rect_width, rect_height, xMovement, yMovement, steps){

     stroke(0)
     strokeWeight(2)
     fill(255)
     rect(x, y, rect_width, rect_height)
     
     if (steps >=0) {
          var newSize = (startSize) * (steps / startSteps) + finalSize
          var newX = x + (rect_width - newSize) / 2
          var newY = y + (rect_height - newSize) / 2

          newX = newX - ((x - newX) / (steps + 2)) * xMovement
          newY = newY - ((y - newY) / (steps + 2)) * yMovement
          my_draw(newX, newY, newSize, newSize, xMovement, yMovement, steps -1)
     }

}
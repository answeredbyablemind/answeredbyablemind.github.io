var myButton
var step = 20

function setup() {
     createCanvas(320, 320);

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)
}

function buttonPressed(){
     window.location.reload()
}

function draw() {
     background(255);
     
     for (var x = 0; x < width; x += step){
          for (var y = 0; y < width; y += step){
               my_draw(x, y, step, step)
          }
     }
     
     noLoop()


}

function my_draw(x, y, my_width, my_height){
     stroke(0)
     strokeWeight(3)

     var leftToRight = Math.random() >= 0.5

     if (leftToRight){
          line(x, y, x + my_width, y + my_height)
     } else {
          line(x + my_width, y, x, y + my_height)
     }
     
}
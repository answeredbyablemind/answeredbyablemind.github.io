var myButton
var step = 20
var aThirdOfHeight

function setup() {
     createCanvas(320, 320);

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)

     aThirdOfHeight = height / 3

}

function buttonPressed(){
     window.location.reload()
}

function draw() {
     background(255);
     strokeCap(ROUND)
     strokeWeight(4)
     for(var y = step; y < height - step; y += step){
          for(var x = step; x < width - step; x += step){
               if (y < aThirdOfHeight){
                    my_draw(x, y, step, step, [0.5])
               } else if (y < aThirdOfHeight*2){
                    my_draw(x, y, step, step, [0.2, 0.8])
               } else {
                    my_draw(x, y, step, step, [0.1, 0.5, 0.9])
               }
               
          }
     }

     
     noLoop()


}

function my_draw(x, y, my_width, my_height, positions){
     for (var i = 0; i <= positions.length; i++){
          push()
          translate(x + my_width/2, y + my_height/2)
          rotate(Math.random() * 5)
          translate(-my_width/2, -my_height/2)
          line(positions[i] * my_width, 0, positions[i] * my_width, my_height)
          pop()
     }
}

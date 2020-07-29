var myButton
var step = 20
var aThirdOfHeight

function setup() {
     createCanvas(320, 320);

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)

     aThirdOfHeight = width / 3

}

function buttonPressed(){
     window.location.reload()
}

function draw() {
     background(255);
     strokeCap(ROUND)
     strokeWeight(4)
     my_draw(0,0,10,10,[0,0])

     
     noLoop()


}

function my_draw(x, y, my_width, my_height, positions){
     for (var i = 0; i <= positions.length; i++){
          line(x + positions[i] * my_width, y, x + positions[i] * my_width, my_height)
     }
     

}

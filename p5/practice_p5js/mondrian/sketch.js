var squares = []
var white = [
     [242, 245, 241] // white
]
var colors = [
     [212, 9, 32], // red
     [19, 68, 162], // blue
     [247, 216, 66] // yellow
]

var myButton

function setup() {
     createCanvas(320, 320);
     squares.push({
          x: 0,
          y: 0,
          width: width,
          height: width
     })

     var step = round(width / 6);

     for (var i = 0; i< width; i+= step){
          splitSquaresWith({x: i})
          splitSquaresWith({y: i})
     }

     myButton = createButton('Refresh')
     myButton.position(0, height)
     myButton.mousePressed(buttonPressed)
}

function buttonPressed(){
     window.location.reload()
}

function draw() {
     background(255);
     stroke(0)
     strokeWeight(5)
     
     for (var i = 0; i< colors.length; i++){
          squares[Math.floor(Math.random() * squares.length)].color = colors[i]
     }

     for (var i = 0; i < squares.length; i++){

          if (squares[i].color){
               fill(squares[i].color[0], squares[i].color[1], squares[i].color[2])
          } else {
               fill(white[0], white[1], white[2])
          }

          rect(squares[i].x, squares[i].y, squares[i].width, squares[i].height)
     }
     
     noLoop()


}

function splitSquaresWith(coordinates){
     // 모든 사각형에 대해 loop 하면서 split되어야 할 것을 찾는다?
     const {x, y} = coordinates
     for (var i = squares.length -1; i >= 0; i--){
          const square = squares[i]

          if (x && x > square.x && x < square.x + square.width){
               if(Math.random() > 0.5){
                    squares.splice(i, 1)
                    splitOnX(square, x)
               }
          }

          if (y && y > square.y && y < square.y + square.height){
               if(Math.random() > 0.5){

                    squares.splice(i, 1)
                    splitOnY(square, y)
               }
          }
     }
}

function splitOnX(square, splitAt) {
     // x 좌표에 기반해 사각형을 두 개로 쪼갬
     var squareA = {
       x: square.x,
       y: square.y,
       width: square.width - (square.width - splitAt + square.x),
       height: square.height
     };
   
     var squareB = {
     x: splitAt,
     y: square.y,
     width: square.width - splitAt + square.x,
     height: square.height
     };
   
     squares.push(squareA);
     squares.push(squareB);
}

function splitOnY(square, splitAt) {
     var squareA = {
          x: square.x,
          y: square.y,
          width: square.width,
          height: square.height - (square.height - splitAt + square.y)
     };

     var squareB = {
     x: square.x,
     y: splitAt,
     width: square.width,
     height: square.height - splitAt + square.y
     };

     squares.push(squareA);
     squares.push(squareB);
}
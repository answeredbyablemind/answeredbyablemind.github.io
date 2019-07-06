// module aliases
var Engine = Matter.Engine,
     // Render = Matter.Render,
     World = Matter.World,
     Bodies = Matter.Bodies;

var engine;
var world;
var circles = [];
var ground;

function setup() {
     // put setup code here
     createCanvas(400, 400);
     engine = Engine.create();
     world = engine.world;

     options = {
          isStatic: true
     }
     ground = Bodies.rectangle(200, height - 50, width, 10, options);


     World.add(world, ground)

     Engine.run(engine);
}

function mouseDragged() {
     circles.push(new Circle(mouseX, mouseY, 10))
}

function draw() {
     // put drawing code here

     background(100);

     for (i = 0; i < circles.length; i++) {
          circles[i].show();
     }

     rectMode(CENTER);
     rect(ground.position.x, ground.position.y, width, 10);

}

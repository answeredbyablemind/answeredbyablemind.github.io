let img;

function preload(){
     img = loadImage('lena.png')
}

function setup() {
     createCanvas(windowWidth - 20, windowWidth - 20);
     image(img, 0, 0)
}

function draw() {
     background(0);
}
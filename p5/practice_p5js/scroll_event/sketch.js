var currentScrollValue;

document.addEventListener('scroll', function(){
     currentScrollValue = document.documentElement.scrollTop;
})

function setup() {
     createCanvas(320, 320); // 위아래로 20씩 여유 pixel 주기. 
}


function draw() {
     console.log('currentScrollValue is '+currentScrollValue)
}

let animals = []
let prey = 0, pred = 1;
let color_pred = [245, 69, 180, 100]
let color_prey = [69, 245, 157, 100]

let rate_prey_inc = 0.008
let rate_prey_dec = 0.3
let rate_pred_inc = 0.9
let rate_pred_dec = 0.008

function setup() {
     createCanvas(500, 500);
     for(let i = 0; i < 15; i++){
          animals.push(new Animal(prey))
     }

     for(let i = 0; i < 5; i++){
          animals.push(new Animal(pred))
     }
     // frameRate(5)

     // 처음부터 intersection이 있는지 체크
     let animal_to_splice = []
     
     for(let i = 0; i<animals.length; i++){
          for (let j = 0; j < animals.length; j++){
               if (i!=j && animals[i].intersects(animals[j])){
                    animal_to_splice.push(i)
               }
          }
     }
     if (animal_to_splice.length > 0){
          animals.splice(animal_to_splice, 1)
     }

}

function draw() {
     
     background(0);
     
     let num_prey_to_push =0
     let num_pred_to_push = 0

     let animal_to_splice = []

     for(let i = 0; i<animals.length; i++){
          animals[i].show()
          
          if (animals[i].type == prey && rate_prey_inc > random()){ 
               // 동물이 피식자이고 번식하는 경우
               num_prey_to_push += 1
          } else if(animals[i].type == pred && rate_pred_dec > random()) { 
               // 동물이 포식자이고 자연사하는 경우
               animal_to_splice.push(i)
          }
          
          // 피식자 혹은 포식자가 마주쳤을 때
          for (let j = 0; j < animals.length; j++){
               if (i!=j && animals[i].intersects(animals[j])){
                    animals[i].changeDirectionX()
                    animals[i].changeDirectionY()

                    if (animals[i].type == prey && animals[j].type == pred && rate_prey_dec > random()){
                         // 피식자의 경우
                         animal_to_splice.push(i)
                    } else if (animals[i].type == pred && animals[j].type == prey && rate_pred_inc > random()){
                         // 포식자의 경우
                         num_pred_to_push += 1
                    }
               }

               
          }
     }

     if (animal_to_splice.length > 0){
          animals.splice(animal_to_splice, 1)
     }

     for(let i = 0; i < num_prey_to_push; i++){
          animals.push(new Animal(prey))
     }

     for(let i = 0; i < num_pred_to_push; i++){
          animals.push(new Animal(pred))
     }
}

function linspace(start, stop, num, endpoint = true) {
     const div = endpoint ? (num - 1) : num;
     const step = (stop - start) / div;
     return Array.from({length: num}, (_, i) => start + step * i);
 }

 class Animal {
      constructor(type){
           this.loc_x = random(0, width);
           this.loc_y = random(0, height);
           this.vel_x = random(0.5, 2)
           this.vel_y = random(0.5, 2)

           this.type = type;
           this.r = 20
      }

      changeDirectionX(){
           this.vel_x *= -1
      }

      changeDirectionY(){
          this.vel_y *= -1
      }

      move() {
           this.loc_x += this.vel_x;
           this.loc_y += this.vel_y;

           if(this.loc_x > width-this.r/2 || this.loc_x < this.r/2){
                this.changeDirectionX()
           }
           
           if(this.loc_y > width-this.r/2 || this.loc_y < this.r/2){
               this.changeDirectionY()
          }

      }

      intersects(other){
           var d = dist(this.loc_x, this.loc_y, other.loc_x, other.loc_y)
           if (d < this.r/2 + other.r/2){
               return true;
           } else {
               return false;
           }
      }

      show() {
           this.move()

           if(this.type == prey){
               fill(color_prey[0], color_prey[1], color_prey[2], color_prey[3])
           } else if (this.type == pred){
               fill(color_pred[0], color_pred[1], color_pred[2], color_pred[3])
           }
           
           stroke(255)
           circle(this.loc_x, this.loc_y, this.r)
      }
 }
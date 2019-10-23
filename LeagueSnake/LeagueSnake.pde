//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  public int x = 3;
  public int y = 3;

  // Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment seggy = new Segment(3, 3);
int foodX;
int foodY;
int fA;
ArrayList<Segment> body = new ArrayList<Segment>();  
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  frameRate(20);
  dropFood();
}

void dropFood() {
  //Set the food in a new random location
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(155, 0, 00);
  drawFood();
    move();
  drawSnake();
  checkBoundaries();
}

void drawFood() {
  //Draw the food
  fill(0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
rect(seggy.x,seggy.y,10,10);
drawTail();
}


//*  
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
 
  //Draw each segment of the tail
  for(int i = 0;i < body.size(); i++){
   Segment zero = body.get(i);
   rect(zero.x,zero.y,10,10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();  
  body.add(new Segment(seggy.x, seggy.y));
  body.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*
String direction = "DOWN";
void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (keyCode == UP) {
  if (direction != "DOWN"){
  direction = "UP";
  }
  } else if (keyCode == DOWN) {
 if (direction != "UP"){
  direction = "DOWN";
  }
  } else if(keyCode == LEFT) {
     if (direction != "RIGHT"){
  direction = "LEFT";
  } 
  } else{
  if (direction != "LEFT"){
  direction = "RIGHT";
  } 
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.

  switch(direction) {
  case "UP":
    // move head up here
    seggy.y=seggy.y-10;
    break;
  case "DOWN":
  seggy.y=seggy.y+10;
    // move head down here 
    break;
  case "LEFT":
    seggy.x=seggy.x-10;
    // figure it out 
    break;
  case "RIGHT":
      seggy.x=seggy.x+10;
    // mystery code goes here 
    break;
  }
}

void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
  if (seggy.x >= 500){
    seggy.x = 0;
  }else if (seggy.x <= 0){
    seggy.x = 500;
  }else if (seggy.y >= 500){
    seggy.y = 0;
  }else if (seggy.y <= 0){
    seggy.y = 500;
  }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(seggy.x == foodX && seggy.y == foodY){
    fA++;
    dropFood();
  }
}

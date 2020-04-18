/**************************************************************
* File: AsteroidsGame.pde
* Group: Luke Dart, Scott Dimmock, Mark Gatus, group number 10
* Date: 27/03/2020
* Updated: 28/03/2020 (Luke Dart)
* Course: COSC101 - Software Development Studio 1
* Desc: Astroids is a ...
* ...
* Usage: Make sure to run in the processing environment and press play etc...
* Notes: If any third party items are use they need to be credited (don't use anything with copyright - unless you have permission)
* ...
**************************************************************/

Player player;
boolean sUP, sDOWN, sLEFT, sRIGHT;

void setup(){
 //frameRate(10);
 size(800,800);
 player = new Player();
 //println(player.getScore());
 //println(player.getLives());
 //println(player.getBearing());
 //println(player.getVelocity());
 //println(player.getBoundingBox());
}

void draw(){
 println(player.getBearing(), player.getVelocity());
 background(0); 
 player.drawShip(); 
 moveShip(); 
  
}
/* TEMPLATE CODE

PShape ship; // don't have to use pshape - can use image
int astroNums=20;
PVector[] astroids = new PVector[astroNums];
PVector[] astroDirect = new PVector[astroNums];
float speed = 0;
float maxSpeed = 4;
float radians=radians(270); //if your ship is facing up (like in atari game)
PVector shipCoord;
PVector direction;
ArrayList shots= new ArrayList();
ArrayList sDirections= new ArrayList();
boolean sUP=false,sDOWN=false,sRIGHT=false,sLEFT=false;
int score=0;
boolean alive=true;
void setup(){
  size(800,800);
  //initialise pvtecotrs 
  //random astroid initial positions and directions;
  //initialise shapes if needed
}

/**************************************************************
* Function: myFunction()

* Parameters: None ( could be integer(x), integer(y) or String(myStr))

* Returns: Void ( again this could return a String or integer/float type )

* Desc: Each funciton should have appropriate documentation. 
        This is designed to benefit both the marker and your team mates.
        So it is better to keep it up to date, same with usage in the header comment

***************************************************************/





void moveShip(){
  
  //this function should update if keys are pressed down 
     // - this creates smooth movement
  //update rotation,speed and update current location
  //you should also check to make sure your ship is not outside of the window
  if(sUP){
    player.accelerate(0.5);
    
  }
  if(sDOWN){
    player.accelerate(-0.5);
  }
  if(sRIGHT){
    player.rotateShip(0.5);
  }
  if(sLEFT){
    player.rotateShip(-0.5);
  }
}

/*
void drawShots(){
   //draw points for each shot from spacecraft 
   //at location and updated to new location
}

void drawAstroids(){
  //check to see if astroid is not already destroyed
  //otherwise draw at location 
  //initial direction and location should be randomised
  //also make sure the astroid has not moved outside of the window
    
}

void collisionDetection(){
  //check if shots have collided with astroids
  //check if ship as collided wiht astroids
}

void draw(){
  background(0);
  //might be worth checking to see if you are still alive first
  moveShip();
  collisionDetection();
  drawShots();
  // draw ship - call shap(..) if Pshape
  // report if game over or won
  drawAstroids();
  // draw score
}
*/
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      sUP=true;
      
    }
    if (keyCode == DOWN) {
      sDOWN=true;
    } 
    if (keyCode == RIGHT) {
      sRIGHT=true;
    }
    if (keyCode == LEFT) {
      sLEFT=true;
    }
  }
  if (key == ' ') {
    //fire a shot
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      sUP=false;
      //player.accelerating = false;
    }
    if (keyCode == DOWN) {
      sDOWN=false;
    } 
    if (keyCode == RIGHT) {
      sRIGHT=false;
    }
    if (keyCode == LEFT) {
      sLEFT=false;
    }
  }
}

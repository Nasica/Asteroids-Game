/**************************************************************
* File: AsteroidsGame.pde
* Group: Luke Dart, Scott Dimmock, Mark Gatus, group number 10
* Date: 27/03/2020
* Updated: 19/04/2020 (Luke Dart)
* Course: COSC101 - Software Development Studio 1
* Desc: Astroids is a ...
* ...
* Usage: Make sure to run in the processing environment and press play etc...
* Notes: If any third party items are use they need to be credited (don't use anything with copyright - unless you have permission)
* ...
**************************************************************/

Player player;
boolean sUP, sDOWN, sLEFT, sRIGHT; // Move to controller if built in functions can be moved there.

void setup(){
 size(800,800);
 player = new Player();
}

void draw(){
 background(0); 
 player.drawShip(); 
 moveShip(); 
  
}


// TO-DO: Move to controller. Check if built in functions can be abstracted to controller.
void moveShip(){
  
  if(sUP){
    player.accelerate(0.5);
    
  }

  if(sRIGHT){
    player.rotateShip(3.5);
  }

  if(sLEFT){
    player.rotateShip(-3.5);
  }
}

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

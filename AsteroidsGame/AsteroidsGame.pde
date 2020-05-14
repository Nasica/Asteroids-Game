/**************************************************************
* File: AsteroidsGame.pde
* Group: Luke Dart, Scott Dimmock, Mark Gatus, group number 10
* Date: 27/03/2020
* Updated: 03/05/2020 (Scott Dimmock)
* Course: COSC101 - Software Development Studio 1
* Desc: Astroids is a ...
* ...
* Usage: Make sure to run in the processing environment and press play etc...
* Notes: If any third party items are use they need to be credited (don't use anything with copyright - unless you have permission)
* ...
**************************************************************/

Controller controller;

void setup(){
 size(800,800);
 textSize(15);
 controller = new Controller();
 laser = new SoundFile(this, "assets/sounds/Laser.mp3");
 explosion = new SoundFile(this, "assets/sounds/Explosion.mp3");
 
}

void draw(){
 background(0); 
 controller.drawAllAsteroids();
 controller.updateShip(); 
 controller.moveShip();
 controller.checkCollisionsVsBullets();
 controller.checkCollisionsVsPlayer();
 controller.checkCollisionsVsShield();
 controller.updateBullets();
 controller.updateShield();
 controller.drawHUD();
 controller.drawMainMenu();
 controller.checkNewLevel();
 if (controller.getGameOver()){
   controller = new Controller();
 }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      controller.setSUP(true); 
      controller.moveMenu();
    }
    if (keyCode == RIGHT) {
      controller.setSRIGHT(true);
    }
    if (keyCode == LEFT) {
      controller.setSLEFT(true);
    }
    if (keyCode == DOWN) {
      controller.setSDOWN(true);
      controller.moveMenu();
    }
  }
  if (key == ENTER) {
     controller.menuAction(); 
     controller.setENTER(true);
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      controller.setSUP(false);
    }
    if (keyCode == RIGHT) {
      controller.setSRIGHT(false);
    }
    if (keyCode == LEFT) {
      controller.setSLEFT(false);
    }
    if (keyCode == DOWN) {
      controller.setSDOWN(false);
    }
  }
  if (key == ' ') {
    controller.createBullet();
  }
  if (keyCode == ENTER) {
    controller.setENTER(false);
  }
}
  

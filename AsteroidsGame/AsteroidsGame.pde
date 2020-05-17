/**************************************************************
 * File: AsteroidsGame.pde
 * Group: Luke Dart, Scott Dimmock, Mark Gatus, group number 10
 * Date: 27/03/2020
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 * Course: COSC101 - Software Development Studio 1
 *
 * Desc:     Astroids is a modern remake of the retro classic.
 *           Due to technological advances, the player ship now comes equipped
 *           with a standard four-phase pulsating shield for your protection!
 *           You have been provided with 3 ships to protect us all from
 *           destruction by the unending asteroid field that has engulfed us.
 *           Good luck!
 *
 * Usage:    Run in the processing environment and select Play Game.
 *           Press enter after end of game to play again or select exit.
 *
 * Controls: Use the Up, Left and Right keys to controll the ship. 
             The Space bar is used to fire the weapon. 
 *
 * Notes:    Third party assets used with permission as found in credits.txt
 **************************************************************/

Controller controller;

void setup() {
  size(800, 800);
  frameRate(60);
  textSize(15);
  controller = new Controller();
}


void draw() {
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
  
  if (controller.getGameOver()) {
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

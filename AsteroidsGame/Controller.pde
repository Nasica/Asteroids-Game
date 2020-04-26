/**
*  Controller class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  @since 26 April 2020 (Luke Dart
*  
*  Filename: Controller.pde
*  Date:     27 March 2020
*
*/

// TO-DO: add method headers.

class Controller{
  private Player player;
  private boolean sUP, sLEFT, sRIGHT; 
  
  Controller(){
    this.player = new Player();
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
  }
  
  Controller(int lives){
    player = new Player(lives);
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
  }
  
  Controller(int lives, int score){
    player = new Player(lives, score);
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
  }

  
  public void setSUP(boolean state){
    this.sUP = state; 
  }
  
  public void setSLEFT(boolean state){
    this.sLEFT = state; 
  }
  
  public void setSRIGHT(boolean state){
    this.sRIGHT = state; 
  }
  
  public void moveShip(){
  
    if(sUP){
      this.player.accelerate(0.5);
    
    }

    if(sRIGHT){
      this.player.rotateShip(3.5);
    }

    if(sLEFT){
      this.player.rotateShip(-3.5);
    }
  }


  /**
  * Function: drawShip()
  *
  * @param Nil 
  *
  * @return void
  *
  * Desc: Updates location based on velocity. 
  *       Checks edges of screen.
  *       Pushes matrix transformations, translate to location and rotate by bearing. 
  *       Draws flame offset on x axis by half image width and offset on y axis by flamePosition.
  *       Draws ship offset on x and y axis by half image width and height.
  *       Pop matrix transformations.
  *       Decelerates ship.
  *
  * Calls: add()
  *        edgeDetection()
  *        pushMatrix()
  *        translate()
  *        rotate()
  *        radians()
  *        image()
  *        popMatrix()
  *        decelerate()
  *
  * Affects: location 
  *          display
  *          matrix
  */
  public void updateShip(){
    //this.location.add(.velocity);
    player.setLocation(player.getLocation().add(player.getVelocity()));
    player.edgeDetection();
    pushMatrix();
    //translate(this.location.x, this.location.y);
    translate(player.getLocation().x, player.getLocation().y);
    pushMatrix();
    rotate(radians(player.getBearing()));
    player.drawShip();
    popMatrix();
    popMatrix();
    player.decelerate();
  }
  
  
}

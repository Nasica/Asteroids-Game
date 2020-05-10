/**
*  Shield class. 
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 1.0
*  @since 04 May 2020 (Mark Gatus)
*
*  Filename: Shield.pde
*  Date:     14 April 2020
*/


class Shield {
  private float[] sx = new float[4];
  private float[] sy = new float[4];
  private float angle = 0;
  private final float FREQUENCY = 1;
  private float shieldRad = 60;
  PVector shipLoc, shipVel;
  float angleInc = 1;
  float initialShieldRad = 10;
  float radDir = 1;
  float[] shieldDest = {0, 0, 0, 0};
  
  //Constructor
  
  /*
  * Function Shield()
  *
  *@ param PVectpr shipPos - Current position of ship
  *@ param PVector shipVel - Current Velocity of ship
  *
  * Desc: Constructor with shipPos and ShipVel parameters.
  */
  Shield(PVector shipPos, PVector shipVel){
    this.shipLoc = shipPos;
    this.shipVel = shipVel;
   }
   
  /**
  * Function shieldPopulate();
  *
  * @param Nil
  *
  * @return void
  *
  * Desc: Generates two arrays representing current x and y corrdinates of the four positions 
  *       around the ship representing a shield. The fucntion also changes the radial distance 
  *       of the shield relative the the centre of the ship giving the shield a "bouncing effect".
  *
  * Calls: Nil
  *
  * Affects: Nil
  */
  public void shieldPopulate(){
    for (int i = 0; i <sx.length; i++){
      sx[i] = shipLoc.x + cos(radians(angle+angleInc))*(shieldRad);
      sy[i] = shipLoc.y + sin(radians(angle+angleInc))*(shieldRad);
      angle += 1;
      angleInc += 90;
      shieldRad -= 0.1 * radDir;
      if (shieldRad < 20){
        radDir *= -1;
      }else if (shieldRad >65){
        radDir *= -1;
      }
      }
  }
   
  /**
  * Function drawShield()
  *
  * @param Nil
  *
  * @return void
  *
  * Desc: Draws 4 ellipses based on the c y corrdinates of the ellipse positions calculated in 
  *       the shieldPopulate function.
  *
  * Calls: nil
  *
  * Affects: Nil
  */        
  void drawShield(){
  fill(#02f04a);
  stroke(#db0404);
  for (int s = 0; s<shieldDest.length; s++){
    if (shieldDest[s] == 0){
      ellipse(sx[s], sy[s], initialShieldRad, initialShieldRad);
   }
  }
  }
}

/**
 *  Shield class. 
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *
 *  Filename: Shield.pde
 *  Date:     14 April 2020
 *
 *  Desc: The Shield class represents the shield object for use in the
 *        Asteroids Game
 */


class Shield {
  private float[] sx = new float[4];
  private float[] sy = new float[4];
  private float angle = 0;
  private float shieldRad = 60;
  private PVector shipLoc, shipVel;
  private float angleInc = 1;
  private float initialShieldRad = 10;
  private float radDir = 1;
  private int[] shieldDest = {0, 0, 0, 0};

  // Constructor

  /*
   * Function Shield()
   *
   *@ param PVectpr shipPos - Current position of ship
   *@ param PVector shipVel - Current Velocity of ship
   *
   * Desc: Constructor with shipPos and ShipVel parameters.
   */
  public Shield(PVector shipPos, PVector shipVel) {
    this.shipLoc = shipPos;
    this.shipVel = shipVel;
  }

  // Void Methods

  /**
   * Function shieldPopulate();
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Generates two arrays representing current x and y corrdinates of the
   *       four positions around the ship representing a shield. The fucntion 
   *       also changes the radial distance of the shield relative the the 
   *       centre of the ship giving the shield a "bouncing effect".
   *
   * Calls: Nil
   *
   * Affects: Nil
   */
  public void shieldPopulate(PVector shipLoc) {
    for (int i = 0; i < sx.length; i++) {
      sx[i] = shipLoc.x + cos(radians(angle + angleInc)) * (shieldRad);
      sy[i] = shipLoc.y + sin(radians(angle + angleInc)) * (shieldRad);
      angle += 1;
      angleInc += 90;
      shieldRad -= 0.1 * radDir;

      if (shieldRad < 20) {
        radDir *= -1;
      } else if (shieldRad > 65) {
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
   * Desc: Draws 4 ellipses based on the x y corrdinates of the ellipse 
   *       positions calculated in the shieldPopulate function.
   *
   * Calls: Nil
   *
   * Affects: Nil
   */
  void drawShield() {
    fill(#02f04a);

    for (int s = 0; s < shieldDest.length; s++) {    
      if (shieldDest[s] == 0) {     
        ellipse(sx[s], sy[s], initialShieldRad, initialShieldRad);
      }
    }
  }
}

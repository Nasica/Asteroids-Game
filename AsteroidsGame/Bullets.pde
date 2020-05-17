/**
 *  Bullet (weapons) class. 
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *
 *  Filename: Bullets.pde
 *  Date:     24 April 2020
 *
 *  Desc: The Bullet class represents bullet objects for use in the
 *        Asteroids game.
 */


class Bullets {
  private PVector location;
  private PVector velocity;
  private float bearing;
  private int firstFrame;
  private boolean active;
  private final float SHOT_SPEED = 0.5;
  private final int FRAME_LIFE = 50;

  // Constructors

  /**
   * Function Bullets()
   *
   * @param shipPosition PVector - current player(ship) position.
   * @param shipBearing PVector - current player(shup) bearing.
   *
   * @return Bullets.
   *
   * Desc: Constructor with shipPosition and shipBearing parameters.
   */
  Bullets(PVector shipPosition, float shipBearing) {
    this.location = new PVector(shipPosition.x, shipPosition.y);
    this.bearing = shipBearing;

    if (this.bearing <= 90) {
      this.velocity = new PVector(this.bearing * SHOT_SPEED, (90 -this.bearing)
        * SHOT_SPEED * - 1);
    } else if (bearing <= 180) {
      this.velocity = new PVector((180 - this.bearing) * SHOT_SPEED, 
        (this.bearing - 90) * SHOT_SPEED );
    } else if (bearing <= 270) {
      this.velocity = new PVector((this.bearing - 180) * SHOT_SPEED * -1, 
        (270 - this.bearing) * SHOT_SPEED);
    } else {
      this.velocity = new PVector((360 - this.bearing) * SHOT_SPEED * -1, 
        (this.bearing - 270) * SHOT_SPEED * -1 );
    }

    this.velocity.limit(8);
    this.firstFrame = frameCount;
    this.active = true;
  }

  // Accsessors

  /**
   * Functions: getLocation()
   *
   * @param Nil
   *
   * @return PVector 
   *
   * Desc: Returns PVector of bullet location.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public PVector getLocation() {

    return this.location;
  }


  /**
   * Functions: getActive()
   *
   * @param Nil
   *
   * @return boolean 
   *
   * Desc: returns state of the bullet.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public boolean getActive() {

    return this.active;
  }

  // Mutator

  /**
   * Functions: setActive()
   *
   * @param boolean
   *
   * @return Nil
   *
   * Desc: Sets bullet active state.
   * 
   * Calls: Nil
   *
   * Affects: active
   */
  public void setActive(boolean state) {
    this.active = state;
  }

  // Void Methods

  /**
   * Function: drawBullet()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Draws the bullets to their current position
   *
   * Calls: stroke()
   *        ellipse()
   *
   * Affects: display
   */
  public void drawBullets() {
    stroke(255, 0, 0);
    ellipse(this.location.x, this.location.y, 5, 5);
  }


  /**
   * Function: checkEdges()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Checks if the bullet has left the display windows and wraps it to 
   *       the other side if it has.
   *
   * Calls: Nil
   *
   * Affects: location 
   */
  public void checkEdges() {
    if (this.location.x < 0) {
      location.x = width;
    } else if (this.location.x > width) {
      location.x = 0;
    }

    if (this.location.y < 0) {
      location.y = height;
    } else if (this.location.y > height) {
      location.y = 0;
    }
  }


  /**
   * Function: updateBullets()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Updates the position of the bullets
   *
   * Calls: add()
   *
   * Affects: location
   *          active
   */

  public void updateBullets() {
    if (this.firstFrame + this.FRAME_LIFE > frameCount) {
      this.location.add(velocity);
    } else {
      this.active = false;
    }
  }
}

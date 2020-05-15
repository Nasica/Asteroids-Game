/*
*  Asteroid class.
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *  
 *  Filename: Asteroid.pde
 *  Date:     27 March 2020
 *
 */


class Asteroid {
  private int size;
  private int scoreValue;
  private float rotationalSpeed;
  private PVector location;
  private PVector velocity;
  private PImage asteroidImg;
  private float asteroidRotation = 0;
  private boolean clockwiseRotation;
  public final int MIN_SPEED = 1;
  public final int MAX_SPEED = 5;
  private final float MIN_ROT_SPEED = 0.1;
  private final float MAX_ROT_SPEED = 3;

  // Constructor

  /**
   * Function Asteroid()()
   *
   * @param size int - Size of asteroid.
   * @param loction PVector - Asteroid location
   *
   * Desc: Constructor with size and location parameters.
   */
  public Asteroid(int size, PVector location) {
    this.size = size;
    this.location = new PVector(location.x, location.y);
    this.velocity = new PVector(0, 0);
    this.clockwiseRotation = randomBool();
    this.rotationalSpeed = random(MIN_ROT_SPEED, MAX_ROT_SPEED);
    setImage();
    this.scoreValue = 2000 - ((size - 1) * 500);
  }



  //Accessors

  /**
   * Function: getImageSize()
   *
   * @param Nil
   *
   * @return PVector of the images width(x) and height(y)
   *
   * Desc: Gets the width(x) and height(y) of the asteroid' current image
   * 
   * Calls: PVector
   *
   * Affects: Nil
   */
  public PVector getImageSize() {

    return new PVector(asteroidImg.width, asteroidImg.height);
  }


  /**
   * Function: getImageSize()
   *
   * @param Nil
   *
   * @return PVector of object location.
   *
   * Desc: Gets the objects current location.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public PVector getLocation() {

    return this.location;
  }


  /**
   * Function: getPointsValue()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Gets the asteroid points value.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public int getPointsValue() {

    return this.scoreValue;
  }


  /**
   * Function: getSize()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Returns the size of the asteroid with 1 being the smallest
   *       and 3 being the largest.
   *
   * Calls: Nil
   *
   * Affects: Nil
   */
  public int getSize() {

    return this.size;
  }


  /**
   * Function: getVelocity()
   *
   * @param Nil
   *
   * @return PVector
   *
   * Desc: Gets the objects current velocity.
   *
   * Calls: Nil
   *
   * Affects: Nil
   */
  public PVector getVelocity() {

    return this.velocity;
  }


  // Mutators
  /**
   * Function: setImage()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Sets the objects image based on its size.
   * 
   * Calls: loadImage()
   *
   * Affects: asteroidImg
   */
  private void setImage() {
    if (size == 1) {

      // smallest
      this.asteroidImg = loadImage("assets/images/a10002.png");
    } else if (size ==2) {

      // medium
      this.asteroidImg = loadImage("assets/images/c10001.png");
    } else {

      // largest (other)
      this.asteroidImg = loadImage("assets/images/c10000.png");
    }
  }


  /**
   * Function: setLocation()
   *
   * @param location PVector The location the object is to be updated to.
   *
   * @return void
   *
   * Desc: Set the location of the object
   * 
   * Calls: Nil
   *
   * Affects: location
   */
  public void setLocation(PVector location) {
    this.location = location;
  } 


  /**
   * Function: setVelocity()
   *
   * @param velocity PVector The velocity the object is to be updated to.
   *
   * @return void
   *
   * Desc: Set the velocity of the object
   * 
   * Calls: Nil
   *
   * Affects: velocity
   */
  public void setVelocity(PVector velocity) {
    this.velocity = velocity;
  }

  // Other Methods
  
  /**
   * Functions: drawAsteroid()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Draws asteroid to screen and rotates.
   * 
   * Calls: pushMatrix()
   *        rotateAsteroid()
   *        image()
   *        popMatrix()
   *
   * Affects: Nil
   */
  public void drawAsteroid() {
    pushMatrix();
    rotateAstroid();
    image(this.asteroidImg, -this.asteroidImg.width / 2, 
      -this.asteroidImg.height / 2);
    popMatrix();
  } 


  /**
   * Function: updatePosition()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Updates the object's location based on its velocity.
   * 
   * Calls: add()
   *
   * Affects: location
   */
  public void updatePosition() {
    this.location.add(velocity);
  }


  /**
   * Function: wrapXAxis()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: If the asteroid object has left the horizontal limits of the screen,
   * this function returns the object to the opposite side of the screen with 
   * the same velocity vector.
   * 
   * Calls: PVector()
   *
   * Affects: location
   */
  public void wrapXAxis() {
    if (this.location.x > width) {
      this.location = new PVector(
        (this.location.x - width - asteroidImg.width), 
        this.location.y);
    } else {
      this.location = new PVector(
        (this.location.x + width + asteroidImg.width), 
        this.location.y);
    }
  }


  /**
   * Function: wrapYAxis()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: If the asteroid object has left the vertical limits of the screen,
   * this function returns the object to the opposite end of the screen with 
   * the same velocity vector.
   * 
   * Calls: PVector()
   *
   * Affects: location
   */
  public void wrapYAxis() {
    if (this.location.y > height) {
      this.location = new PVector(this.location.x, 
        (this.location.y - height - asteroidImg.height));
    } else {
      this.location = new PVector(this.location.x, 
        (this.location.y + height + asteroidImg.height));
    }
  }


  /**
   * Function: randomBool()
   *
   * @param Nil
   *
   * @return boolen
   *
   * Desc: returns a random boolean value.
   * 
   * Calls: random()
   *
   * Affects: Nil
   */
  private boolean randomBool() {
    int boolInt = (int)random(2);

    if (boolInt == 1) {

      return true;
    }

    return false;
  }


  /**
   * Function: rotateAsteroid()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Rotates the astroid around it's center in a direction determined 
   *       by the clockwiseRotation boolean.
   * 
   * Calls: translate()
   *        rotate()
   *        radians()
   *
   * Affects: displayMatrix
   */
  private void rotateAstroid() {
    translate(this.location.x, this.location.y);

    if (this.clockwiseRotation) {
      rotate(radians(++this.asteroidRotation));
    } else {
      rotate(radians(--this.asteroidRotation));
    }
  }
}

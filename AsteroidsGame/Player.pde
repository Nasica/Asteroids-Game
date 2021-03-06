/**
 *  Player character (ship) class. 
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *
 *  Filename: Player.pde
 *  Date:     27 March 2020
 *
 *  Desc: The Player class represents a player object for use in the 
 *        Asteroids game.
 */


class Player {
  private int score;
  private int lives;
  private int flamePosition;
  private boolean alive;
  private PVector location;
  private PVector velocity;
  private float bearing;
  private PImage shipImg, shipIcon, flame, explosion;
  private final int SHIP_SCALE = 30;
  private final int FLAME_SCALE = 20;
  private final int MIN_FLAME = 0;
  private final int MAX_FLAME = 8;
  private final int FLAME_INCREMENT = 2;
  private final int FLAME_DECREMENT = 1;
  private final int MAX_SPEED = 5;
  private final float DRIFT = 0.5;
  private final float DECELERATION = 0.97;

  // Constructors

  /**
   * Function: Player()
   *
   * @param Nil
   *
   * Desc: Empty Constructor sets default lives to three and score to zero.
   */
  public Player() {
    this.score = 0;
    this.lives = 3;
    this.alive = true;
    this.flamePosition = MIN_FLAME;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.velocity = new PVector(0, 0);
    this.shipImg = loadImage("assets/images/ship.png");
    this.shipIcon = loadImage("assets/images/ship.png");
    this.flame = loadImage("assets/images/flame.png");
    this.explosion = loadImage("assets/images/explosion.png");
    this.shipImg.resize(SHIP_SCALE, SHIP_SCALE);
    this.shipIcon.resize(SHIP_SCALE / 2, SHIP_SCALE / 2);
    this.flame.resize(FLAME_SCALE, FLAME_SCALE);
  }  

  /**
   * Function: Player()
   *
   * @param lives int - number of lives player has.
   *  
   * Desc: Constructor with lives parameter.
   */
  public Player(int lives) {
    this.score = 0;
    this.lives = lives;
    this.alive = true;
    this.flamePosition = MIN_FLAME;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.velocity = new PVector(0, 0);
    this.shipImg = loadImage("assets/images/ship.png");
    this.shipIcon = loadImage("assets/images/ship.png");
    this.flame = loadImage("assets/images/flame.png");
    this.explosion = loadImage("assets/images/explosion.png");
    this.shipImg.resize(SHIP_SCALE, SHIP_SCALE);
    this.shipIcon.resize(SHIP_SCALE / 2, SHIP_SCALE / 2);
    this.flame.resize(FLAME_SCALE, FLAME_SCALE);
  }


  /**
   * Function: Player()
   *
   * @param lives int - number of lives player has.
   * @param score int - current player score. 
   *
   * Desc: Constructor with lives and score parameters.
   */
  public Player(int lives, int score) {
    this.score = score;
    this.lives = lives;
    this.alive = true;
    this.flamePosition = MIN_FLAME;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.velocity = new PVector(0, 0);
    this.shipImg = loadImage("assets/images/ship.png");
    this.shipIcon = loadImage("assets/images/ship.png");
    this.flame = loadImage("assets/images/flame.png");
    this.explosion = loadImage("assets/images/explosion.png");
    this.shipImg.resize(SHIP_SCALE, SHIP_SCALE);
    this.shipIcon.resize(SHIP_SCALE / 2, SHIP_SCALE / 2);
    this.flame.resize(FLAME_SCALE, FLAME_SCALE);
  }

  // Accessors

  /**
   * Function: getScore()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Returns player score.
   *
   * Calls: Nil
   *
   * Affects: Nil 
   */
  public int getScore() {
    return this.score;
  }


  /**
   * Function: getLives()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Returns number of lives.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public int getLives() {
    return this.lives;
  }


  /**
   * Function: getAlive()
   *
   * @param Nil
   *
   * @return boolean
   *
   * Desc: Returns player alive state.
   *
   * Calls: Nil
   *
   * Affects: Nil 
   */
  public boolean getAlive() {
    return this.alive;
  }


  /**
   * Function: getBearing()
   *
   * @param Nil
   *
   * @return float
   *
   * Desc: Returns direction that ship is pointing in degrees.
   *
   * Calls: Nil
   *
   * Affects: Nil 
   */
  public float getBearing() {
    return this.bearing;
  }


  /**
   * Function: getVelocity()
   *
   * @param Nil
   *
   * @return PVector
   *
   * Desc: Returns PVector of ship velocity.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public PVector getVelocity() {
    return this.velocity;
  }


  /**
   * Function: getLocation()
   *
   * @param Nil
   *
   * @return PVector
   *
   * Desc: Returns PVector of ship location.
   * 
   * Calls: Nil
   *
   * Affects: Nil
   */
  public PVector getLocation() {
    return this.location;
  }


  /**
   * Function: getBoundingBox()
   *
   * @param Nil
   *
   * @return PShape
   *
   * Desc: Returns PShape of ship bounding box
   * 
   * Calls: createShape()
   *        beginShape()
   *        endShape();
   *
   * Affects: Nil
   */
  public PShape getBoundingBox() {
    PShape boundingBox = createShape();
    boundingBox.beginShape();
    boundingBox.vertex(this.location.x - this.shipImg.width / 2, 
      this.location.y - this.shipImg.height / 2);
    boundingBox.vertex((this.location.x - this.shipImg.width / 2) 
      + this.shipImg.width, this.location.y - this.shipImg.height / 2);
    boundingBox.vertex((this.location.x - this.shipImg.width / 2) 
      + this.shipImg.width, (this.location.y - this.shipImg.height / 2) 
      + this.shipImg.height);
    boundingBox.vertex((this.location.x - this.shipImg.width / 2), 
      (this.location.y - this.shipImg.height / 2) + this.shipImg.height);
    boundingBox.endShape(CLOSE);

    return boundingBox;
  }

  // Mutators

  /**
   * Function: setLocation()
   *
   * @param location PVector - new ship location.
   *
   * @return void
   *
   * Desc: Sets location of ship
   * 
   * Calls: Nil
   *
   * Affects: location
   */
  public void setLocation(PVector location) {
    this.location = location;
  }


  /**
   * Function: setAlive()
   *
   * @param state boolean
   *
   * @return Nil
   *
   * Desc: Sets player alive state.
   *
   * Calls: Nil
   *
   * Affects: Nil 
   */
  public void setAlive(boolean state) {
    this.alive = state;
  }

  // Void Methods

  /**
   * Function: rotateShip()
   *
   * @param degrees float - number of degrees to rotate ship by. Reccomended 
   *                        value +-3.5.
   *
   * @return void
   *
   * Desc: Adjusts ship bearing by degrees. Validates and wraps new bearing 
   *       between  1 and less than 361. The range of 1 <= bearing < 361 
   *       excludes 0 to < 1 so that calculations in the accelerate function 
   *       operate as expected.
   * 
   * Calls: Nil
   *
   * Affects: bearing
   */
  public void rotateShip(float degrees) {
    this.bearing += degrees;

    if (this.bearing < 1.0) {
      this.bearing = 360.9;
    } else if (this.bearing >= 361) {
      this.bearing = 1.0;
    }
  }


  /**
   * Function: addScore()
   *
   * @param points int - number of points to add to score.
   *
   * @return void
   *
   * Desc: Increases score by points.
   * 
   * Calls: Nil
   *
   * Affects: score
   */
  public void addScore(int points) {
    this.score += points;
  }


  /**
   * Function: updateLives()
   *
   * @param lives int - number of lives to update. Can be positive or negative.
   *
   * @return void
   *
   * Desc: Updates player lives.
   * 
   * Calls: Nil
   *
   * Affects: lives
   */
  public void updateLives(int lives) {
    this.lives += lives;
  }


  /**
   * Function: accelerate()
   *
   * @param speed float - acceleration value. Reccomended value 0.5. 
   *
   * @return void
   *
   * Desc: Updates velovity based on speed and direction (bearing). The 
   *       velocity vector assumes an origin at the centre of the ship. 
   *       Function checks which quadrant the ship if facing in order to apply 
   *       appropriate negative values per a cartesian plain. 
   *       Function then limits velocity by MAX_SPEED and calls 
   *       increaseFlame().
   *
   * Calls: add()
   *        limit()
   *        increaseFlame()
   *
   * Affects: velocity
   */
  public void accelerate(float speed) {
    if (this.bearing <= 90) {
      this.velocity.add(this.bearing * speed, (90 - this.bearing) * speed 
        * -1 );
    } else if (bearing <= 180) {
      this.velocity.add((180 - this.bearing) * speed, (this.bearing - 90) 
        * speed );
    } else if (bearing <= 270) {
      this.velocity.add((this.bearing - 180) * speed * -1, (270 - this.bearing) 
        * speed );
    } else {
      this.velocity.add((360 - this.bearing) * speed * -1, (this.bearing - 270) 
        * speed * -1 );
    }

    this.velocity.limit(MAX_SPEED);
    increaseFlame();
  }


  /**
   * Function: increaseFlame()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: Increases flamePosition. The flamePosition variable is used to draw 
   *       the flame graphic.
   *       Valid values range from 0 - 8, with 0 being completeley hidden by 
   *       the ship graphic, and 8 being fully exposed behind the ship. 
   *       The constant FLAME_INCREMENT must be greater than FLAME_DECREMENT.
   *
   * Calls: Nil
   *
   * Affects: flamePosition
   */
  public void increaseFlame() {
    if (this.flamePosition < this.MAX_FLAME) {
      this.flamePosition += FLAME_INCREMENT;
    }
  }


  /**
   * Function: decelerate()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: If the ship is moving along any axis faster than the DRIFT constant 
   *       the function reduces velocity by multiplying it by the DECELERATION 
   *       constant. DECELERATION must be less than 1. The difference between 
   *       DECELERATION and 1 must be greater than the value of speed passed 
   *       to accelerate().  
   *
   * Calls: PVector.mult()
   *        decreaseFlame()
   *
   * Affects: velocity
   */
  public void decelerate() {
    if (this.velocity.x < -DRIFT || this.velocity.x > DRIFT
      || this.velocity.y < -DRIFT || this.velocity.y > DRIFT) {

      this.velocity.mult(DECELERATION);
    }

    decreaseFlame();
  }


  /**
   * Function: decreaseFlame()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: Decreases flamePosition. The flamePosition variable is used to draw 
   *       the flame graphic.
   *       Valid values range from 0 - 8, with 0 being completeley hidden by 
   *       the ship graphic, and 8 being fully exposed behind the ship. 
   *       The constant FLAME_INCREMENT must be greater than FLAME_DECREMENT.
   *
   * Calls: Nil
   *
   * Affects: flamePosition
   */
  public void decreaseFlame() {
    if (this.flamePosition > this.MIN_FLAME) {
      this.flamePosition -= FLAME_DECREMENT;
    }
  }


  /**
   * Function: edgeDetection()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: Checks if the ship has left the display windows and wraps it to the 
   *       other side if it has.
   *
   * Calls: Nil
   *
   * Affects: location 
   */
  public void edgeDetection() {
    if (this.location.x < 0) {
      this.location.x = width;
    }

    if (this.location.y < 0) {
      this.location.y = height;
    }
    
    if (this.location.x > width) {
      this.location.x = 0;
    }
    
    if (this.location.y > height) {
      this.location.y = 0;
    }
  }


  /**
   * Function: drawShip()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: Draws ship and engine flame to screen.
   *
   * Calls: image()
   *
   * Affects: display 
   */

  public void drawShip() {
    image(this.flame, this.flame.width / 2 * -1, flamePosition );
    image(this.shipImg, this.shipImg.width / 2 * -1, this.shipImg.height / 2 
      * -1);
  }


  /**
   * Function: drawShipIcon()
   *
   * @param x int X-axis location of icon
   * @pram y - int Y-Axis location of icon
   *
   * @return void
   *
   * Desc: Draws ship icon to screen.
   *
   * Calls: image()
   *
   * Affects: display 
   */
  public void drawShipIcon(int x, int y) {
    image(this.shipIcon, x, y);
  }


  /**
   * Function: die()
   *
   * @param frame int - frame in explosion animtion to draw.
   * @pram location - PVector lcation to draw explosion.
   *
   * @return void
   *
   * Desc: Draws one frame of animation explosion at location.
   *
   * Calls: image()
   *
   * Affects: display 
   */
  public void die(int frame, PVector location) {
    image(explosion.get(0 + frame, 0, 192, 193), location.x - 192 / 2, 
      location.y - explosion.height / 2);
  }
}

/**
 *  Controller class.
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *  
 *  Filename: Controller.pde
 *  Date:     27 March 2020
 *
 *  Desc: The Controller class contains all the methods for interfacing all the
 *        required objects in order to run the Asteroids game
 */


class Controller {
  private Player player;
  private CollisionDetect collider;
  private Shield shield;
  private HighScore hs;
  private Bullets[] bullets;
  private MainMenu mainMenu = new MainMenu();
  private int explosionFrame;
  private int menuIndex = 0;
  private int playerLevel;
  private int asteroidsToGenerate = 1;
  private ArrayList<Asteroid> asteroids;
  private boolean sUP, sDOWN, sLEFT, sRIGHT, sENTER;
  private boolean gameStarted = false;
  private boolean gameOver;
  private boolean waitingForEnter = false;
  private boolean canCollide = false;
  private final float SHIP_ACCELERATION = 0.1;
  private final float SHIP_ROTATION = 3.5;
  private final int HUD_MARGIN = 20;
  private final int HUD_HEIGHT = 32;
  private final int TEXT_SIZE = 20;
  private final int NEW_ASTEROIDS_ON_DEST = 3;
  private PFont hudFont = createFont("Serif.plain", TEXT_SIZE, true);

  // Constructors

  /**
   * Function: Controller()
   *
   * @param Nil
   *
   * Desc: Empty Constructor creates a new default Player object and 
   *       itialises userInput booleans to false.
   */
  Controller() {
    this.player = new Player();
    this.asteroids = new ArrayList<Asteroid>();
    this.collider = new CollisionDetect();
    this.explosionFrame = 0;
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
    this.sDOWN = false;
    this.sENTER = false;
    this.bullets = new Bullets[0];
    this.addNewAsteroids(asteroidsToGenerate);
    this.gameOver = false;
    this.hs = new HighScore();
    this.hs.initialise();
    this.playerLevel = 1;
    this.shield = new Shield(player.getLocation(), player.getVelocity());
  }


  /**
   * Function: Controller()
   *
   * @param lives int - number of lives player has.
   *
   * Desc: Constructor with lives parameter, creates a new Player object with 
   * specified number of lives and initialises userInput booleans to false.
   */
  Controller(int lives) {
    this.player = new Player(lives);
    this.asteroids = new ArrayList<Asteroid>();
    this.explosionFrame = 0;
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
    this.sDOWN = false;
    this.sENTER = false;
    this.gameOver = false;
    this.hs = new HighScore();
    this.hs.initialise();
    this.playerLevel = 1;
    this.shield = new Shield(player.getLocation(), player.getVelocity());
  }  


  /**
   * Function: Controller()
   *
   * @param lives int - number of lives player has.
   * @param score int - Player score.
   *
   * Desc: Constructor with lives and score parameters, creates a new Player 
   *       object with specified score and number of lives and initialises 
   *       userInput booleans to false.
   */
  Controller(int lives, int score) {
    this.player = new Player(lives, score);
    this.asteroids = new ArrayList<Asteroid>();
    this.explosionFrame = 0;
    this.sUP = false;
    this.sLEFT = false;
    this.sRIGHT = false;
    this.sDOWN = false;
    this.sENTER = false;
    this.gameOver = false;
    this.hs = new HighScore();
    this.hs.initialise();
    this.playerLevel = 1;
    this.shield = new Shield(player.getLocation(), player.getVelocity());
  }

  // Mutators

  /**
   * Function: setSUP()
   * 
   * @param state boolean - state to set variable to.
   *
   * @return void
   *
   * desc: Sets sUP variable to desired state.
   *
   * calls: Nil
   *
   * Affects: sUP
   */
  public void setSUP(boolean state) {
    this.sUP = state;
  }


  /**
   * Function: setSDOWN()
   * 
   * @param state boolean - state to set variable to.
   *
   * @return void
   *
   * desc: Sets sUP variable to desired state.
   *
   * calls: Nil
   *
   * Affects: sDOWN
   */
  public void setSDOWN(boolean state) {
    this.sDOWN = state;
  }


  /**
   * Function: setSLEFT()
   * 
   * @param state boolean - state to set variable to.
   *
   * @return void
   *
   * desc: Sets sLEFT variable to desired state.
   *
   * calls: Nil
   *
   * Affects: sLEFT
   */
  public void setSLEFT(boolean state) {
    this.sLEFT = state;
  }


  /**
   * Function: setSRIGHT()
   * 
   * @param state boolean - state to set variable to.
   *
   * @return void
   *
   * desc: Sets sRIGHT variable to desired state.
   *
   * calls: Nil
   *
   * Affects: sRIGHT
   */
  public void setSRIGHT(boolean state) {
    this.sRIGHT = state;
  }


  /**
   * Function: setENTER()
   * 
   * @param state boolean - state to set variable to.
   *
   * @return void
   *
   * desc: Sets sENTER variable to desired state.
   *
   * calls: Nil
   *
   * Affects: sENTER
   */
  public void setENTER(boolean state) {
    this.sENTER = state;
  }

  // Other Methods

  /**
   * Function: moveShip()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Sets sUp variable to desired state.
   *
   * calls: Nil
   *
   * Affects: Nil 
   */
  public void moveShip() {
    if (sUP && gameStarted) {
      this.player.accelerate(SHIP_ACCELERATION);
    }

    if (sRIGHT && gameStarted) {
      this.player.rotateShip(SHIP_ROTATION);
    }

    if (sLEFT && gameStarted) {
      this.player.rotateShip(-SHIP_ROTATION);
    }
  }


  /**
   * Function: moveMenu()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Moves the main menu selected item up and down
   *
   * calls: menuIndexUp()
   *        menuIndexDown()
   *        drawMainMenu()
   *        sDOWN
   *        sUP
   *        gameStarted
   *
   * Affects: Nil
   */
  public void moveMenu() {
    if (!gameStarted) {
      if (sDOWN) {
        menuIndexDown();
        this.drawMainMenu();
      }

      if (sUP) {
        menuIndexUp();
        this.drawMainMenu();
      }
    }
  }


  /**
   * Function: menuIndexDown()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Increments the selected menu item index
   *
   * calls: Menu.getMenuLenth()
   *
   * Affects: menuIndex
   */
  private void menuIndexDown() {
    if (menuIndex == mainMenu.getMenuLength() - 1) {
      menuIndex = 0;
    } else {
      menuIndex++;
    }
  }


  /**
   * Function: menuIndexUp()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Decrements the selected menu item index
   *
   * calls: Menu.getMenuLenth()
   *
   * Affects: menuIndex
   */
  private void menuIndexUp() {
    if (menuIndex == 0) {
      menuIndex = mainMenu.getMenuLength() - 1;
    } else {
      menuIndex--;
    }
  }


  /**
   * Function: menuAction()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Carrys out the required action when selecting a menu item 
   *
   * calls: menuIndex
   *
   * Affects: gameStarted
   */
  public void menuAction() {
    switch(menuIndex) {

      //Start Game
    case 0:
      gameStarted = true;
      break;

      //Quit
    case 1:
      exit();
      break;
    default:
    }
  }


  /**
   * Function: drawMainMenu()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Draws the Main Menu to the screen 
   *
   * calls: Menu.getMenuLength()
   *        Menu.getMenuItems()
   *        gameStarted
   *
   * Affects: gameStarted
   */
  public void drawMainMenu() {
    if (!gameStarted) {
      int textSize = 20;
      float textOffset = 40;
      boolean boldText = false;
      float textYPos = (height / 2) - (((mainMenu.getMenuLength() * textSize) 
        + (mainMenu.getMenuLength() - 1) * textOffset) / 2);

      for (int i = 0; i < mainMenu.getMenuLength(); i++) {
        if (menuIndex == i) {
          boldText = true;
        }

        mainMenu.drawMenuItem(mainMenu.getMenuItems(i), width / 2, textYPos 
          + textOffset, boldText);
        textYPos += textOffset;
        boldText = false;
      }
    }
  }


  /**
   * Function: getGameState()
   * 
   * @param Nil
   *
   * @return boolean
   *
   * desc: Returns if the game has started
   *
   * calls: Nil 
   *
   * Affects: Nil 
   */
  public boolean getGameState() {
    return(this.gameStarted);
  }


  /**
   * Function: updateShip()
   *
   * @param Nil 
   *
   * @return void
   *
   * Desc: Updates location based on velocity. 
   *       Checks edges of screen.
   *       Pushes matrix transformations, translate to location and rotate by 
   *       bearing. 
   *       Draws flame offset on x axis by half image width and offset on y 
   *       axis by flamePosition.
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
   *        drawShip()
   *        popMatrix()
   *        decelerate()
   *
   * Affects: player.location 
   *          display
   *          matrix
   */
  public void updateShip() {
    if (player.getAlive()) {
      canCollide = true;
      player.setLocation(player.getLocation().add(player.getVelocity()));
      player.edgeDetection();
      pushMatrix();
      translate(player.getLocation().x, player.getLocation().y);
      pushMatrix();
      rotate(radians(player.getBearing()));
      player.drawShip();
      popMatrix();
      popMatrix();
      player.decelerate();
    } else if (player.getLives() > 0) {
      canCollide = false;

      if (this.explosionFrame < 130) {
        player.die(int(explosionFrame/10) * 192, player.getLocation());
        this.explosionFrame++;
        this.bullets = new Bullets[0];
        newShield();
      } else {
        this.explosionFrame = 0;
        player.updateLives(-1);

        if (player.getLives() > 0) {
          player = new Player(player.getLives(), player.getScore());
          this.bullets = new Bullets[0];
          newShield();
        } else {
          player.setAlive(false);
        }
      }
    } else {
      canCollide = false;
      textAlign(CENTER);
      text("GAME OVER", width / 2, height + 50 / 2 - textWidth("GAME"));
      checkHighScore(player.getScore());
      waitingForEnter = true;
      waitForEnterPress();
    }
  }


  /**
   * Function: waitForEnterPress()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Waits for the enter key to be pressed in order to restart the game.
   *
   * calls: Nil
   *
   * Affects: sENTER
   */
  private void waitForEnterPress() {
    if (sENTER) {
      gameOver = true;
    }
  }


  /**
   * Function: drawHUD()
   * 
   * @param Nil
   *
   * @return void
   *
   * desc: Draws a HUD to the top of the screen
   *
   * calls: Nil
   *
   * Affects: Display
   */
  public void drawHUD() {
    fill(245, 160, 60);
    textAlign(LEFT);
    textFont(hudFont);
    text("Lives:", HUD_MARGIN, HUD_HEIGHT);

    for (int i = 0; i < player.getLives(); i++) {
      player.drawShipIcon(int(HUD_MARGIN * i + textWidth("Lives:") * 2), 
        HUD_MARGIN);
    }

    text("Score: " + player.getScore(), width - HUD_MARGIN 
      - textWidth("Score: XXXXX"), HUD_HEIGHT);
    textAlign(CENTER);
    text("High Score: " + hs.getScore(), width / 2, HUD_HEIGHT);
  }


  /**
   * Function: randomPointOnCirc()
   *
   * @param Nil
   *
   * @return PVector
   *
   * Desc: produces a random point on a circle whose radius is the diagonal 
   *       screen size.
   *
   * Calls: random()
   *        sqrt()
   *        sq()
   *        cos()
   *        sin()
   *
   * Affects: Nil
   */
  private PVector randomPointOnCirc() {
    float radius = sqrt(sq(width) + sq(height));
    float angle = random(359) * TWO_PI;
    float xPoint = cos(angle) * radius;
    float yPoint = sin(angle) * radius;

    return(new PVector(xPoint, yPoint));
  }


  /**
   * Function: randomVelocity()
   *
   * @param minSpeed int - The minimum speed for the random range
   * @param maxSpeed int - The maximum speed for the random range
   *
   * @return PVector
   *
   * Desc: Returns a PVector containing randomised values for use as a velocity.
   *
   * Calls: random()
   *        randomDir()
   *
   * Affects: Nil
   */
  private PVector randomVelocity(int minSpeed, int maxSpeed) {
    int xVel = (int)random(minSpeed, maxSpeed + 1) * randomDir();
    int yVel = (int)random(minSpeed, maxSpeed + 1) * randomDir();

    return(new PVector(xVel, yVel));
  }


  /**
   * Function: randomDir()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Returns either a 1 or a -1.
   *
   * Calls: random()
   *
   * Affects: Nil
   */
  private int randomDir() {
    return(-1 + (int)random(2) * 2);
  }


  /**
   * Function: checkHighScore()
   *
   * @param score int - Player score 
   *
   * @return void
   *
   * Desc: Checks if score is highest score yet and sets new high 
   *       score if it is.
   *
   * Calls: isHighestScore()
   *        setScore()
   *        store()
   *
   * Affects: Nil
   */
  private void checkHighScore(int score) {
    if (this.hs.isHighest(score)) {
      this.hs.setScore(score);
      this.hs.store();
    }
  }


  /**
   * Function: generateAsteroid()
   *
   * @param Nil
   *
   * @return Asteroid
   *
   * Desc: Returns a single Asteroid object with randomly generate position 
   *       and velocity.
   *
   * Calls: randomPointOnCirc()
   *        randomVelocity()
   *
   * Affects: Nil
   */
  private Asteroid generateAsteroid() {
    PVector initPosition = randomPointOnCirc();
    Asteroid newAsteroid = new Asteroid(3, initPosition);
    newAsteroid.setVelocity(randomVelocity(newAsteroid.MIN_SPEED, 
      newAsteroid.MAX_SPEED));

    return(newAsteroid);
  }


  /**
   * Function: addNewAsteroids()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Adds a single asteroid to the asteroids ArrayList.
   *
   * Calls: generateAsteroid()
   *
   * Affects: ArrayList<Asteroid> asteroids
   */
  public void addNewAsteroids() {
    this.asteroids.add(generateAsteroid());
  }


  /**
   * Function: addNewAsteroids()
   *
   * @param numberOfAsteroids int - The number of asteroids to add
   *
   * @return int
   *
   * Desc: Adds a given number of asteroids to the asteroids ArrayList.
   *
   * Calls: generateAsteroid()
   *
   * Affects: ArrayList<Asteroid> asteroids
   */
  public void addNewAsteroids(int numberOfAsteroids) {
    for (int i = 0; i < numberOfAsteroids; i++) {
      this.asteroids.add(generateAsteroid());
    }
  }


  /**
   * Function: drawAllAsteroids()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Draws all asteroids in the asteroids ArrayList to the screen.
   *
   * Calls: Asteroid.updatePosition()
   *        Asteroid.getLocation()
   *        Asteroid.getImageSize()
   *        Asteroid.wrapXAxis()
   *        Asteroid.wrapYAxis()
   *        Asteroid.drawAsteroid()
   *        ArrayList.size()
   *        ArrayList.get()
   *
   * Affects: ArrayList<Asteroid> asteroids
   */
  public void drawAllAsteroids() {
    if (gameStarted) {
      for (int i = 0; i < asteroids.size(); i++) {
        Asteroid currentAsteroid = asteroids.get(i);
        currentAsteroid.updatePosition();

        if (currentAsteroid.getLocation().x > width 
            || currentAsteroid.getLocation().x 
            < -currentAsteroid.getImageSize().x) {

          currentAsteroid.wrapXAxis();
        }

        if (currentAsteroid.getLocation().y > height 
            || currentAsteroid.getLocation().y 
            < -currentAsteroid.getImageSize().y) {

          currentAsteroid.wrapYAxis();
        }

        currentAsteroid.drawAsteroid();
      }
    }
  }


  /**
   * Function: checkCollisionsVsBullets()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Calls the CollisionDetect.detectCollision() method on each asteroid 
   *       in the asteroids ArrayList against the bullet objects.
   *
   * Calls: CollisionDetect.detectCollision()
   *        explosion.play()
   *        Bullets.getActive()
   *        Bullets.setActive()
   *        ArrayList<Asteroid>.get()
   *        ArrayList<Asteroid>.size()
   *
   * Affects: ArrayList<Asteroid> asteroids
   *          bullets[] bullet
   */
  public void checkCollisionsVsBullets() {
    if (canCollide) {
      for (int i = 0; i < asteroids.size(); i++) {
        Asteroid currentAsteroid = asteroids.get(i);

        for (int j = 0; j < bullets.length; j++) {
          Bullets currentBullet = bullets[j];

          if (collider.detectCollision(currentAsteroid, 
              currentBullet.getLocation()) && bullets[j].getActive()) {

            asteroidShot(i, true);
            bullets[j].setActive(false);
          }
        }
      }
    }
  }


  /**
   * Function: checkCollisionsVsPlayer()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Calls the CollisionDetect.detectCollision() method on each asteroid 
   *       in the asteroids ArrayList against the player object
   *
   * Calls: CollisionDetect.detectCollision()
   *        explosion.play()
   *        Player.setAlive()
   *        Player.getBoundingBox()
   *        ArrayList<Asteroid>.get()
   *        ArrayList<Asteroid>.size()
   *
   * Affects: ArrayList<Asteroid> asteroids
   *          Player player
   */
  public void checkCollisionsVsPlayer() {
    if (canCollide) {
      for (int i = 0; i < asteroids.size(); i++) {
        Asteroid currentAsteroid = asteroids.get(i);

        if (collider.detectCollision(currentAsteroid, 
            this.player.getBoundingBox())) {

          asteroidShot(i, false);
          this.player.setAlive(false);
        }
      }
    }
  }


  /**
   * Function: checkCollisionsVsShield()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Calls the CollisionDetect.detectCollision() method on each asteroid 
   *       in the asteroids ArrayList
   *       against the shield objects
   *
   * Calls: CollisionDetect.detectCollision()
   *        explosion.play()
   *        ArrayList<Asteroid>.get()
   *        ArrayList<Asteroid>.size()
   *
   * Affects: ArrayList<Asteroid> asteroids
   *          Shield shield
   */
  public void checkCollisionsVsShield() {
    if (canCollide) {
      for (int i = 0; i < asteroids.size(); i++) {
        Asteroid currentAsteroid = asteroids.get(i);

        for (int j = 0; j < 4; j++) {
          if (collider.detectCollision(currentAsteroid, 
              new PVector(shield.sx[j], shield.sy[j])) 
              && shield.shieldDest[j] == 0) { 

            asteroidShot(i, true);
            this.shield.shieldDest[j] = 1;
          }
        }
      }
    }
  }


  /**
   * Function: createBullet()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Generates a bullet instance within a bullet class object array
   *
   * Calls: player.getLocation()
   *        player.getBearing()
   *
   * Affects: Bullets objects array
   */
  public void createBullet() {
    if (gameStarted && !waitingForEnter) {
      Bullets bullet = new Bullets(player.getLocation(), player.getBearing());
      bullets = (Bullets[]) append(bullets, bullet);
    }
  }


  /**
   * Function: updateBullets()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Updates the position of the bullet and draws bullets to canvas
   *
   * Calls: bullets[].drawBullets()
   *        bullets[].updateBullets()
   *        bullets[].checkEdges()
   *
   * Affects: Bullets objects array
   */
  public void updateBullets() {
    for (int i = 0; i < bullets.length; i++) {
      if (bullets[i].getActive()) {
        bullets[i].drawBullets();
        bullets[i].updateBullets();
        bullets[i].checkEdges();
      }
    }
  }


  /**
   * Function: checkNewLevel()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Checks for when no asteroids exist in order to start the next level
   *
   * Calls: calcAsteroidsToGenerate()
   *        addNewAsteroids()
   *
   * Affects: playerLevel
   */
  public void checkNewLevel() {
    if (asteroids.size() == 0) {
      playerLevel++;
      calcAsteroidsToGenerate();
      this.addNewAsteroids(asteroidsToGenerate);
    }
  }


  /**
   * Function: calcAsteroidsToGenerate()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Calculates the number of asteroids to generate based on the player 
   *       levelwith 1 new asteroid added at each 3rd level.
   *
   * Calls: Nil
   *
   * Affects: asteroidsToGenerate
   */
  private void calcAsteroidsToGenerate() {
    if ((playerLevel % 3) == 0) {
      asteroidsToGenerate++;
    }
  }


  /**
   * Function: asteroidShot()
   *
   * @param asteroidIndex Int - The index of the asteroid within ArrayList 
   *                             asteroids that was shot
   *
   * @return void
   *
   * Desc: Destroys the asteroid that has been shot and if it is not at the 
   *       smallest size replaces it with NEW_ASTEROIDS_ON_DEST asteroids.
   *
   * Calls: Asteroid.getSize()
   *        Asteroid.getLocation()
   *        ArrayList<Asteroid>.get()
   *        ArrayList<Asteroid>.remove()
   *
   * Affects: ArrayList<Asteroid> asteroids
   *          int NEW_ASTEROIDS_ON_DEST
   */
  public void asteroidShot(int asteroidIndex, boolean byWeapon) {
    Asteroid asteroid = asteroids.get(asteroidIndex);
    asteroids.remove(asteroidIndex);

    if (byWeapon) {
      player.addScore(asteroid.getPointsValue());
    }

    if (asteroid.getSize() > 1) {
      PVector destroyLocation = asteroid.getLocation();
      addNewAsteroids(NEW_ASTEROIDS_ON_DEST, destroyLocation, 
        asteroid.getSize() - 1);
    }
  }


  /**
   * Function: addNewAsteroids()
   *
   * @param numberOfAsteroids int - The number of asteroids to add
   *
   * @return int
   *
   * Desc: Adds a given number of asteroids to the asteroids ArrayList.
   *
   * Calls: generateAsteroid()
   *
   * Affects: ArrayList<Asteroid> asteroids
   */
  public void addNewAsteroids(int numberOfAsteroids, PVector location, 
    int size) {
    for (int i = 0; i < numberOfAsteroids; i++) {
      this.asteroids.add(generateAsteroid(size, location));
    }
  }


  /**
   * Function: generateAsteroid()
   *
   * @param size int - The size of the asteroid to create.
   * @param location PVector - The location to generate the asteroid in.
   *
   * @return Asteroid
   *
   * Desc: Returns a single Asteroid object with a specified position and 
   *       a random velocity.
   *
   * Calls: randomVelocity()
   *        
   *
   * Affects: Nil
   */
  private Asteroid generateAsteroid(int size, PVector location) {
    Asteroid newAsteroid = new Asteroid(size, location);
    newAsteroid.setVelocity(randomVelocity(newAsteroid.MIN_SPEED, 
      newAsteroid.MAX_SPEED));

    return(newAsteroid);
  }


  /**
   * Function: newShield()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Creates new shield on player respawn.
   *
   * Calls: Nil        
   *
   * Affects: Nil
   */

  public void newShield() {
    if (player.alive == false) {
      for (int s = 0; s < shield.shieldDest.length; s++) {
        shield.shieldDest[s] = 1;
      }
    } else {
      for (int s = 0; s <shield.shieldDest.length; s++) {
        shield.shieldDest[s] = 0;
      }
    }
  }


  /**
   * Function: updateShield()
   *
   * @param Nil
   *
   * @return void
   *
   * Desc: Populates shield class and draws position of shield to canvas
   *
   * Calls: shield.shieldPopulate()
   *        shield.drawShield()
   *
   * Affects: Shield object
   */
  public void updateShield() {
    this.shield.shieldPopulate(player.getLocation());
    this.shield.drawShield();
  }  


  /**
   * Function: getGameOver()
   *
   * @param Nil
   *
   * @return boolean
   *
   * Desc: Returns the state of the gameOver boolean.
   *
   * Calls: Nil
   *
   * Affects: Nil
   */
  public boolean getGameOver() {

    return this.gameOver;
  }
}

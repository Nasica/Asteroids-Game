/**
*  Player character (ship) class. 
*  
*  @author Luke Dart
*  @version 0.1
*  
*  Filename: Player.pde
*  Date:     27 March 2020
*  Updated:  18 April 2020 (Luke Dart)
*
*/


class Player{
  private int score;
  private int lives;
  private int flamePosition;
  private int flameScale;
  private final int MIN_FLAME = -5;
  private final int MAX_FLAME = 8;
  private final float deceleration = 0.05;
  private final int SCALE = 30;
  private final int MAX_SPEED = 5;
  private PVector  location;
  private float bearing;
  private float rotation;
  private PVector velocity;
  //private boolean accelerating;
  private PImage shipImg;
  private PImage flame;
  
  Player(){
    this.score = 0;
    this.lives = 3;
    this.flamePosition = MIN_FLAME;
    this.flameScale = 20;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.rotation = 0;
    this.velocity = new PVector(0,0);
    //this.accelerating = false;
    this.shipImg = loadImage("ship.png");
    this.flame = loadImage("flame2.png");
    this.shipImg.resize(SCALE, SCALE);
    this.flame.resize(flameScale, flameScale);
  }
  
  Player(int lives){
    this.score = 0;
    this.lives = lives;
    this.flamePosition = MIN_FLAME;
    this.flameScale = 20;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.rotation = 0;
    this.velocity = new PVector(0,0);
    //this.accelerating = false;
    this.shipImg = loadImage("S1.png");
    this.flame = loadImage("flame.png");
    this.shipImg.resize(SCALE, SCALE);
    this.flame.resize(flameScale, flameScale);
  }
  
  Player(int lives, int score){
    this.score = score;
    this.lives = lives;
    this.flamePosition = MIN_FLAME;
    this.flameScale = 20;
    this.location = new PVector(width / 2, height / 2);
    this.bearing = 360.0;
    this.rotation = 0;
    this.velocity = new PVector(0,0);
    //this.accelerating = false;
    this.shipImg = loadImage("S1.png");
    this.flame = loadImage("flame.png");
    this.shipImg.resize(SCALE, SCALE);
    this.flame.resize(flameScale, flameScale);
  }
  
  
  public void drawShip(){
   this.location.add(this.velocity);
   this.bearing += rotation;
       if(this.bearing < 1.0){
     this.bearing = 360.9;
    }
    else if(this.bearing >= 361){
     this.bearing = 1.0; 
    }
   edgeDetection();
   pushMatrix();
   translate(this.location.x, this.location.y);
   pushMatrix();
   rotate(radians(bearing));
   image(this.flame, this.flame.width / 2 * -1, flamePosition );
   image(this.shipImg, this.shipImg.width / 2 * -1, this.shipImg.height / 2 * -1);
   
   popMatrix();
   popMatrix();
   decelerate();
  }
  
  public int getScore(){
   return this.score; 
  }
  
  public void addScore(int points){
   this.score += points; 
  }
  
  public int getLives(){
    return this.lives;
  }
  
  public void increaseFlame(){
    if(this.flamePosition < this.MAX_FLAME){
      this.flamePosition++;
      this.flamePosition++;
    }
  }
  
  public void decreaseFlame(){
   if(this.flamePosition > this.MIN_FLAME){
     this.flamePosition--;
   }
  }
  
  public void updateLives(int lives){
    this.lives += lives;
  }
  
  public float getBearing(){
    return this.bearing;
  }
  
  public void rotateShip(float degrees){
    if(abs(this.rotation) < MAX_SPEED){
      this.rotation += degrees;
    }
    

  }
  
  public PVector getVelocity(){
    return this.velocity;
  }
  
  public void accelerate(float speed){
  
    if(this.bearing <= 90){
      velocity.add(this.bearing * speed, (90 - this.bearing) * speed * -1 );          
    }
    
    else if(bearing <= 180){
      velocity.add((180 - this.bearing) * speed, (this.bearing - 90) * speed );
    }
    
    else if(bearing <= 270){
      velocity.add((this.bearing - 180) * speed * -1, (270 - this.bearing) * speed );
    }
    else{
      velocity.add((360 - this.bearing) * speed * -1, (this.bearing - 270) * speed * -1 );
    }
    
    this.velocity.limit(MAX_SPEED);

    increaseFlame();
    
  }
  
  public void decelerate(){
   if(this.velocity.y > 0){
    this.velocity.y -= deceleration; 
   }
   else if(this.velocity.y < 0){
     this.velocity.y += deceleration;
   }
   
   if(this.velocity.x > 0){
    this.velocity.x -= deceleration; 
   }
   else if(this.velocity.x < 0){
     this.velocity.x += deceleration;
   }
   
   if(this.rotation > 0){
     this.rotation -= deceleration * 3;
   }
   else if(this.rotation < 0){
     this.rotation += deceleration * 3;
   }
   
   decreaseFlame();
   
  }
  
  public PVector[] getBoundingBox(){
   PVector upperLeft = new PVector(this.location.x - shipImg.width / 2, this.location.y - shipImg.height / 2);
   PVector upperRight = new PVector(this.location.x + shipImg.width / 2, this.location.y - shipImg.height / 2);
   PVector lowerLeft = new PVector(this.location.x - shipImg.width / 2, this.location.y + shipImg.height / 2);
   PVector lowerRight = new PVector(this.location.x + shipImg.width / 2, this.location.y + shipImg.height / 2);
   
   return new PVector[]{upperLeft, upperRight, lowerLeft, lowerRight};
  }
  
  public void edgeDetection(){
    if(this.location.x < 0){
     this.location.x = width;
   }
    if(this.location.y < 0){
     this.location.y = height;
   }
   if(this.location.x > width){
     this.location.x = 0;
   }
   if(this.location.y > height){
     this.location.y = 0;
   }
  }
  
}

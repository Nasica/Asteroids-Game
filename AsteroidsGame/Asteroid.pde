/*
*  Asteroid class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  
*  Filename: Asteroid.pde
*  Date:     27 March 2020
*  Updated:  03 May 2020 
*
*/


class Asteroid{
    public final int MIN_SPEED = 3;
    public final int MAX_SPEED = 5;
    private float MIN_ROT_SPEED = 0.1;
    private float MAX_ROT_SPEED = 3;
    private int size;
    private float roationalSpeed;
    private PVector location;
    private PVector velocity;
    private PImage asteroidImg;
    private float asteroidRotation = 0;
    private boolean clockwiseRotation;

    
    /**
     * Test constructor, do not use
     */
    public Asteroid(int size) {    

        this.size = size;
        
        //Test code
        this.location = new PVector(200, 400);
        this.velocity = new PVector(5,0);
        //
        
        this.clockwiseRotation = randomBool();
        this.roationalSpeed = random(MIN_ROT_SPEED, MAX_ROT_SPEED);
        setImage();
    }
    
    public Asteroid(int size, PVector location){
        this.size = size;
        this.location = new PVector(location.x, location.y);
        this.velocity = new PVector(0,0);
        this.clockwiseRotation = randomBool();
        this.roationalSpeed = random(MIN_ROT_SPEED, MAX_ROT_SPEED);
        setImage();
    }

    /**
     * Draws the current object to the screen
     */
    public void drawAsteroid(){
        pushMatrix();
        rotateAstroid();
        image(this.asteroidImg, -this.asteroidImg.width/2, -this.asteroidImg.height/2);
        popMatrix();
    } 
    
    /**
     * Updates the objections location based on its velocity
     */
    public void updatePosition(){
        this.location.add(velocity);
    }
    
    /**
     * If the asteroid object has left the horizontal limits of the screen, 
     *this function returns the object to the opposite side of the screen with 
     * the same velocity vector.
     */
    public void wrapXAxis(){
        // These are way too long, but I cant think how to shorten.
        if(this.location.x > width){
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
     * If the asteroid object has left the vertical limits of the screen, 
     *this function returns the object to the opposite side of the screen with 
     * the same velocity vector.
     */
    public void wrapYAxis(){
        // These are way too long, but I cant think how to shorten.
        if(this.location.y > height){
            this.location = new PVector(this.location.x, 
                (this.location.y - height - asteroidImg.height));
        
        } else {
            this.location = new PVector(this.location.x, 
                (this.location.y + height + asteroidImg.height));
        
        }
    }
    
    /**
     * Creates a boolean value
     * @return      Random true or false value.
     */
    private boolean randomBool(){
        int boolInt = (int)random(2);
        if (boolInt == 1){
            return true;
        }
        return false;
    }
    
    /**
     * Rotates the astroid around it's center in a direction determined 
     * by the clockwiseRotation boolean.
     */
    private void rotateAstroid(){
        translate(this.location.x, this.location.y);
        if (this.clockwiseRotation){
            rotate(radians(++this.asteroidRotation));
        } else {
            rotate(radians(--this.asteroidRotation));
        }
    }

    /**
     * Sets the objects image based on its size
     */
    private void setImage(){
        if (size == 1){
            // smallest
            this.asteroidImg = loadImage("assets/images/AsteroidBrown.png");
        } else if (size ==2) {
            // medium
            this.asteroidImg = loadImage("assets/images/AsteroidBrown.png");
        } else {
            this.asteroidImg = loadImage("assets/images/AsteroidBrown.png");
            // largest (other)
        }
    }
    
   /**
     * Set the location of the object
     * @param location      The location the object is to be updated to 
     */
    public void setLocation(PVector location){
        this.location = location;
    } 
   
    /**
    * Set the velocity of the object
    * @param velocity       The velocity the object is to be updated to.
    */
    public void setVelocity(PVector velocity){
        this.velocity = velocity;
    }
    
   /**
     * Gets the width(x) and height(y) of the asteroid' current image
     * @return      PVector of the images width(x) and height(y)
     */
    public PVector getImageSize(){
        return new PVector(asteroidImg.width, asteroidImg.height);
    }
    
    /**
     * Gets the objects current location
     * @return      objects location 
     */
    public PVector getLocation(){
        return this.location;
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
    public int getSize(){
      return this.size;
    }

    /**
     * Gets the objects current velocity
     * @return      objects velocity vector
     */
    public PVector getVelocity(){
        return this.velocity;
    }
    
    public String toString(){
       return("******\nPosition " + this.location.x + "," + this.location.y + "\nVelocity " + this.velocity.x + "," + this.velocity.y + "\n"); 
    }
}

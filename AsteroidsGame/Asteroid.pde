/*
*  Asteroid class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  
*  Filename: Asteroid.pde
*  Date:     27 March 2020
*  Updated:  19 April 2020 
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
    private PShape collisionMesh;
    private int collisionMeshDetail = 10;
    private float rotationIncrement = TWO_PI/collisionMeshDetail;
    private float radCollisionMesh;
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
        radCollisionMesh = asteroidImg.width / 4;
        collisionMesh = new PShape(PShape.PATH);
        collisionMesh.setVisible(true);
        createCollisionMesh();
    }
    
    public Asteroid(int size, PVector location){
        this.size = size;
        this.location = location;
        this.velocity = new PVector(0,0);
        this.clockwiseRotation = randomBool();
        this.roationalSpeed = random(MIN_ROT_SPEED, MAX_ROT_SPEED);
        setImage();
        radCollisionMesh = asteroidImg.width / 4;
        collisionMesh = new PShape(PShape.PATH);
        createCollisionMesh();
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
        location.add(velocity);
        updateCollisionMesh();
    }
    
    /**
     * If the asteroid object has left the horizontal limits of the screen, 
     *this function returns the object to the opposite side of the screen with 
     * the same velocity vector.
     * @param screenWidth       The width of the visable screen
     */
    public void wrapXAxis(int screenWidth){
        // These are way too long, but I cant think how to shorten.
        if(this.location.x > screenWidth){
            this.location = new PVector(
                (this.location.x - screenWidth - asteroidImg.width), 
                 this.location.y);

        } else {
            this.location = new PVector(
                (this.location.x + screenWidth + asteroidImg.width), 
                 this.location.y);

        }
    }

    /**
     * If the asteroid object has left the vertical limits of the screen, 
     *this function returns the object to the opposite side of the screen with 
     * the same velocity vector.
     * @param screenHeight       The height  of the visable screen
     */
    public void wrapYAxis(int screenHeight){
        // These are way too long, but I cant think how to shorten.
        if(this.location.y > screenHeight){
            this.location = new PVector(this.location.x, 
                (this.location.y - screenHeight - asteroidImg.height));
        
        } else {
            this.location = new PVector(this.location.x, 
                (this.location.y + screenHeight + asteroidImg.height));
        
        }
    }
    
    /**
     * Creates a PShape circular object based on the radius of asteroidImg. 
     * This can then be later used, with the PShapes 
     * .contains(float x, float y)     method for calculating collisions
     * 
     * Called by: Constructor
     */
    private void createCollisionMesh(){
        for(int i = 0; i < collisionMeshDetail; i++){
            float angle = i * rotationIncrement;
            float x = cos(angle);
            float y = sin(angle);
            collisionMesh.vertex((x * radCollisionMesh) + this.location.x + 
                    asteroidImg.width/2, 
                    (y * radCollisionMesh) + this.location.y + 
                    asteroidImg.height/2);
        
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

    /*
     * Updates the collision mesh after any movement or as required.
     *
     * Called by: updatePosition()
     */
    private void updateCollisionMesh(){
        for(int i = 0; i < collisionMeshDetail; i++){
            float angle = i * rotationIncrement;
            float x = cos(angle);
            float y = sin(angle);
            collisionMesh.setVertex(i, new PVector((x * radCollisionMesh) + 
                    this.location.x + asteroidImg.width/2,  
                    (y * radCollisionMesh) + 
                    this.location.y + asteroidImg.height/2));

        }
    }

    /**
     * Sets the objects image based on its size
     */
    private void setImage(){
        if (size == 1){
            // smallest
            this.asteroidImg = loadImage("a10000.png");
        } else if (size ==2) {
            // medium
            this.asteroidImg = loadImage("b10000.png");
        } else {
            this.asteroidImg = loadImage("c10000.png");
            // largest (other)
        }
    }
    
   /**
     * Set the location of the object
     * @param location      The location the object is to be updated to 
     */
    public void setLocation(PVector location){
        this.location = location;
        updateCollisionMesh();
    } 
   
    /**
    * Set the velocity of the object
    * @param velocity       The velocity the object is to be updated to.
    */
    public void setVelocity(PVector velocity){
        this.velocity = velocity;
    }

    /**
    * Gets the collision mesh for the objects current location
    * @return       Objects PShape to be used with its .contains() 
    *               method for collision calculations  
    */
    public PShape getCollisionMesh(){
        return this.collisionMesh;
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
     * Gets the objects current velocity
     * @return      objects velocity vector
     */
    public PVector getVelocity(){
        return this.velocity;
    }
}

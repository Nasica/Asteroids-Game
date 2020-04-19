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
    int MAX_SPEED;
    int size;
    int roationalSpeed;
    PVector location;
    PVector velocity;
    PImage asteroidImg;
    PShape collisionMesh;
    int collisionMeshDetail = 10;
    float rotationIncrement = TWO_PI/collisionMeshDetail;
    float radCollisionMesh;

    public Asteroid(int size) {
        this.size = size;
        
        //Test code
        this.location = new PVector(200, 200);
        this.velocity = new PVector(5,5);
        //
        
        setImage();
        radCollisionMesh = asteroidImg.width / 4;
        collisionMesh = new PShape(PShape.PATH);
        collisionMesh.setVisible(true);
        createCollisionMesh();
    }
    

    public Asteroid(int size, PVector location, PVector velocity){
        this.size = size;
        this.location = location;
        this.velocity = velocity;
    }
    
    /**
     * If the asteroid object has left the horizontal limits of the screen, 
     *this function returns the object to the opposite side of the screen with 
     * the same velocity vector.
     * @param screenWidth       The width of the visable screen
     */
    public void wrapXAxis(int screenWidth){
        // These are way too long, but I cant think how to shorten.
        if(this.getLocation().x > screenWidth){
            this.setLocation(new PVector(
                (this.getLocation().x - screenWidth - asteroidImg.width), 
                    this.getLocation().y));

        } else {
            this.setLocation(new PVector(
                (this.getLocation().x + screenWidth + asteroidImg.width), 
                    this.getLocation().y));

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
        if(this.getLocation().x > screenWidth){
        if(this.getLocation().y > screenHeight){
            this.setLocation(new PVector(this.getLocation().x, 
                (this.getLocation().y - screenHeight - asteroidImg.height)));
        
        } else {
            this.setLocation(new PVector(this.getLocation().x, 
                (this.getLocation().y + screenHeight + asteroidImg.height)));
        
        }
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


    /**
    * Gets the collision mesh for the objects current location
    * @return       Objects PShape to be used with its .contains() 
    *               method for collision calculations  
    */
    public PShape getCollisionMesh(){
        return this.collisionMesh;
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
     * Draws the current object to the screen
     */
    public void drawAsteroid(){
        image(this.asteroidImg, this.location.x, this.location.y);
    }   


    /**
     * Updates the objections location based on its velocity
     */
    public void updatePosition(){
        location.add(velocity);
        updateCollisionMesh();
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
}

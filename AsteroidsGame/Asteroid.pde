/*
*  Asteroid class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  
*  Filename: Asteroid.pde
*  Date:     27 March 2020
*  Updated:  28 March 2020 
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
        this.velocity = new PVector(0,0);
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
    * @return       Objects PShape to be used with its .contains() method for collision calculations  
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


    private void createCollisionMesh(){
        // If the collision mesh hasn't been initialised create it and its verticies else
        // update the verticies to its new location
        //collisionMesh.vertex(location.x, location.y);
        //collisionMesh.vertex(location.x + asteroidImg.width, location.y);
        //collisionMesh.vertex(location.x + asteroidImg.width, location.y + asteroidImg.height);
        //collisionMesh.vertex(location.x, location.y + asteroidImg.height);
        
        for(int i = 0; i < collisionMeshDetail; i++){
            float angle = i * rotationIncrement;
            float x = cos(angle);
            float y = sin(angle);
            collisionMesh.vertex((x * radCollisionMesh) + this.location.x + asteroidImg.width/2, 
                                 (y * radCollisionMesh) + this.location.y + asteroidImg.height/2);
        }
    }


    private void updateCollisionMesh(){
        //collisionMesh.setVertex(0, new PVector(location.x, location.y));
        //collisionMesh.setVertex(1, new PVector(location.x + asteroidImg.width, location.y));
        //collisionMesh.setVertex(2, new PVector(location.x + asteroidImg.width, location.y + asteroidImg.height));
        //collisionMesh.setVertex(3, new PVector(location.x, location.y + asteroidImg.height));
        for(int i = 0; i < collisionMeshDetail; i++){
            float angle = i * rotationIncrement;
            float x = cos(angle);
            float y = sin(angle);
            collisionMesh.setVertex(i, new PVector((x * radCollisionMesh) + this.location.x + asteroidImg.width/2,  
                                                   (y * radCollisionMesh) + this.location.y + asteroidImg.height/2));
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

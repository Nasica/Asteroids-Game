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


    public Asteroid(int size) {
        this.size = size;
        
        //Test code
        this.location = new PVector(200, 200);
        this.velocity = new PVector(5,0);
        //

        setImage();
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

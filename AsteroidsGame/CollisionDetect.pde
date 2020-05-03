/*
*  Collision Detection class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  
*  Filename: Asteroid.pde
*  Date:     27 March 2020
*  Updated:  03 May 2020 
*
*/
public class CollisionDetect {
  
   /**
   * Function: detectCollision()
   *
   * @param asteroid Asteroid    An Asteroid object
   * @param ship PShape    The shape bounding the area to check for collisions.
   *
   * @return boolean
   *
   * Desc: Checks if each vertex in a PShape object has collided with an asteroid object.
   *
   * Calls: PShape.getVertexCount()
   *        PVector.getVertex()
   *        Asteroid.getLocation()
   *        Asteroid.getImageSize
   *
   * Affects: Nil
   */
    public boolean detectCollision(Asteroid asteroid, PShape ship){
        for (int i = 0; i < ship.getVertexCount(); i++){
            PVector v = ship.getVertex(i);
            if((dist(asteroid.getLocation().x, asteroid.getLocation().y,
                            v.x, v.y) - asteroid.getImageSize().x/4) < 0){
                return(true);
            }
        }
        return(false);
    }
}

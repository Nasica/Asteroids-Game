/*
*  Collision Detection class.
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *  
 *  Filename: CollisionDetect.pde
 *  Date:     27 March 2020 
 *
 *  Desc: The CollisionDetect class contains methods for calculating if a
 *        collision has occured between various types of objects.
 */


public class CollisionDetect {
  /**
   * Function: detectCollision()
   *
   * @param asteroid Asteroid - An Asteroid object
   * @param ship PShape - The shape bounding the area to check for collisions.
   *
   * @return boolean
   *
   * Desc: Checks if each vertex in a PShape object has collided with an 
   *       asteroid object.
   *
   * Calls: PShape.getVertexCount()
   *        PVector.getVertex()
   *        Asteroid.getLocation()
   *        Asteroid.getImageSize()
   *
   * Affects: Nil
   */
  public boolean detectCollision(Asteroid asteroid, PShape ship) {
    for (int i = 0; i < ship.getVertexCount(); i++) {
      PVector v = ship.getVertex(i);

      if ((dist(asteroid.getLocation().x, asteroid.getLocation().y, 
          v.x, v.y) - asteroid.getImageSize().x / 4) < 0) {

        return(true);
      }
    }

    return(false);
  }


  /**
   * Function: detectCollision()
   *
   * @param asteroid Asteroid - An Asteroid object
   * @param point PVector - The point to check for collisions against the 
   *                             asteroid.
   *
   * @return boolean
   *
   * Desc: Checks if a vertex in a PVector object has collided with an asteroid
   *       object.
   *
   * Calls: PShape.getVertexCount()
   *        PVector.getVertex()
   *        Asteroid.getLocation()
   *        Asteroid.getImageSize
   *
   * Affects: Nil
   */
  public boolean detectCollision(Asteroid asteroid, PVector point) {
    if ((dist(asteroid.getLocation().x, asteroid.getLocation().y, 
        point.x, point.y) - asteroid.getImageSize().x / 4) < 0) {

      return(true);
    }

    return(false);
  }
}

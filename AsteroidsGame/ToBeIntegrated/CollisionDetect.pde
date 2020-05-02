public class CollisionDetect {

    CollisionDetect(){
    //Constructor
    }


    //asteroidMesh currently 10 sided, ship mesh 4 sided
    public void detectCollision(Asteroid aster, Player play){
        if ((dist(aster.getLocation().x, aster.getLocation().y,
                play.getLocation().x, play.getLocation().y) - aster.getImageSize().x/4)
                    < 0){
            print("BANG!");
        }
    }
}

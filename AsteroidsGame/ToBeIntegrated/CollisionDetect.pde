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

    public void detectCollision(Asteroid aster, PShape ship){
        for (int i = 0; i < ship.getVertexCount(); i++){
            PVector v = ship.getVertex(i);
            if((dist(aster.getLocation().x, aster.getLocation().y,
                            v.x, v.y) - aster.getImageSize().x/4) < 0){
                println("PShape Bang");
            }
        }
    }
}

class Shield {
  
  float[] sx = new float[4];
  float[] sy = new float[4];
  float angle = 0;
  float frequency = 1;
  float radius = 60;
  PVector shipLoc, shipVel;
  float angleInc = 1;
  float shieldRad = 10;
  float radDir = 1;
  float[] shieldDest = {0, 0, 0, 0};
  
  Shield(PVector shipPos, PVector shipVel){
    this.shipLoc = shipPos;
    this.shipVel = shipVel;
   }
   
   void shieldPopulate(){
    for (int i = 0; i <sx.length; i++){
      println(shipLoc.x);
      sx[i] = shipLoc.x + cos(radians(angle+angleInc))*(radius);
      sy[i] = shipLoc.y + sin(radians(angle+angleInc))*(radius);
      angle += 1;
      angleInc += 90;
      radius -= 0.1 * radDir;
      if (radius < 20){
        radDir *= -1;
      }else if (radius >65){
        radDir *= -1;
      }
      }
  }
   

   
  void drawShield(){
  fill(#6b0a59);
  stroke(10);
  for (int s = 0; s<shieldDest.length; s++){
    if (shieldDest[s] == 0){
      ellipse(sx[s], sy[s], shieldRad, shieldRad);
   }
  }
  }
  
  
}

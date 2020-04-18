float[] sx, sy, rx, ry;
float angle = 0;
float frequency = 1;
float radius = 30;
float radDir = 1;
PVector shipLoc, shipVel;
float angleInc = 0;
float[] shieldDest = {0, 0, 0, 0};
float shieldRad = 5;


void setup(){
  size(400,400);
  frameRate(60);
  shipLoc = new PVector(30, 30);
  shipVel = new PVector(0.6, 0.3);
  sx = new float[4];
  sy = new float[4];
  rx = new float[5];
  ry = new float[5];
  asteroids();
}
  
void draw(){
  background(125);
  rectMode(CENTER);
  rect(shipLoc.x, shipLoc.y, 5,5);
  shipLoc.add(shipVel);
  shield();
  drawShield();
  drawAsteroids();
  
  collisionDetect();
  //rect(300,220,50,50);
  //rect(110,120,50,50);
}

void shield(){
  for (int i = 0; i <sx.length; i++){
    if(shieldDest[i] == 0){  
      sx[i] = shipLoc.x + cos(radians(angle+angleInc))*(radius);
      sy[i] = shipLoc.y + sin(radians(angle+angleInc))*(radius);
      angle += frequency;
      radius -=0.1 * radDir;
      println(sx);
      if (radius < 5){
        radDir *= -1;
      }else if (radius >30){
        radDir *= -1;
      }
      }
   angleInc += 90; 
  } 
}

void drawShield(){
  fill(#008000);
  stroke(10);
  for (int s = 0; s<sx.length; s++){
    if (shieldDest[s] == 0){
      ellipse(sx[s], sy[s], shieldRad, shieldRad);
    }
  }
}

void collisionDetect(){
  for (int i=0; i<shieldDest.length; i++){
    for (int a=0; a<rx.length; a++){
      if (((rx[a] - 20 <= sx[i] + shieldRad && rx[a] + 20 >= sx[i] - shieldRad) && shieldDest[i] == 0) 
          && ((ry[a] - 20 <= sy[i] + shieldRad) && ry[a] + 20 >= sy[i] - shieldRad )){
            shieldDest[i] = 1;
            println(shieldDest);
          }
    }
    
    {
      
    }
  }
}

void asteroids(){
  for (int r = 0; r<rx.length; r++){
    rx[r] = random(100,300);
    ry[r] = random(100,300);
  }
}

void drawAsteroids(){
  for (int r = 0; r<rx.length; r++){
    rect(rx[r],ry[r], 40, 40);
  }
}

    

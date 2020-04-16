float[] sx, sy;
float angle = 0;
float frequency = 0.5;
float radius = 30;
float radDir = 1;
PVector shipLoc, shipVel;
float angleInc = 0;


void setup(){
  size(400,400);
  frameRate(60);
  shipLoc = new PVector(30, 30);
  shipVel = new PVector(0.6, 0.3);
  sx = new float[4];
  sy = new float[4];
}
  
void draw(){
  background(125);
  rectMode(CENTER);
  rect(shipLoc.x, shipLoc.y, 5,5);
  shipLoc.add(shipVel);
  shield();
  drawShield();
}

void shield(){
  for (int i = 0; i <sx.length; i++){
    sx[i] = shipLoc.x + cos(radians(angle+angleInc))*(radius);
    sy[i] = shipLoc.y + sin(radians(angle+angleInc))*(radius);
    angle += frequency;
    angleInc += 90;
    radius -=0.1 * radDir;
    if (radius < 5){
      radDir *= -1;
    }else if (radius >30){
      radDir *= -1;
    }
  } 
}

void drawShield(){
  fill(#008000);
  stroke(10);
  for (int s = 0; s<sx.length; s++){
    ellipse(sx[s], sy[s], 5, 5);
  }
}
    

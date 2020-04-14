float px, py, px2, py2, px3, py3;
float angle;
float radius = 50;
float frequency = 2;
float shipPosX = 0;
float shipPosY = 0;
void setup(){
  size(600, 200);
  background (127);
}

void draw(){
  background (127);
  noStroke();
  shipPosX += 1;
  shipPosY += 0.2;
  rect (shipPosX, shipPosY, 5, 5);
  
  // Rotates rectangle around circle
  px = shipPosX + cos(radians(angle))*(radius);
  py = shipPosY + sin(radians(angle))*(radius);
  px2 = shipPosX + cos(radians(angle+180))*(radius);
  py2 = shipPosY + sin(radians(angle+180))*(radius);
  px3 = shipPosX + cos(radians(angle+90))*(radius);
  py3 = shipPosY + sin(radians(angle+90))*(radius);
  fill(0);

  rect (px, py, 5, 5);
  rect (px2, py2, 5, 5);
  rect (px3, py3, 5, 5);

  angle -= frequency;
}

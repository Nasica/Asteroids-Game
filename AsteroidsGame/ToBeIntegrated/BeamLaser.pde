float lasWidth; 
float lasLength;
float shipPosX = 0;
float shipPosY = 0;

void setup(){
  size(400, 400);
  lasWidth = 10;
  lasLength = height/10;
}
  
void draw(){
  background(0,0,0);
  shot();
  shipPosX += 0.5;
  shipPosY += 0.5;
  fill(255);
  noStroke();
  rect(shipPosX, shipPosY, 5, 5);
}


//Shot instance when mouse pressed
void shot(){
  if (mousePressed){
      strokeWeight(5);
      stroke(#B904DE);
      line(shipPosX+5, shipPosY+5, shipPosX + 80, shipPosY + 80);
  }
}

// Trig functions to rotate beam 


//Collision detction
      

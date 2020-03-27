/**
*  Player character (ship) class. 
*  
*  @author Luke Dart
*  @version 0.1
*  
*  Filename: Player.pde
*  Date:     27 March 2020
*  Updated:  27 March 2020 (Luke Dart)
*
*/


class Player{
  int score;
  PVector location;
  int lives;
  
  Player(){
    this.score = 0;
    this.location = new PVector(width / 2, height / 2);
    this.lives = 3;
  }
}

/*
*  High Score class.
*  
*  @author Luke Dart, Scott Dimmock, Mark Gatus
*  @version 0.1
*  
*  Filename: HighScore.pde
*  Date:     27 March 2020
*  Updated:  13 May 2020 
*
*/

class HighScore{
  // Adapted by Luke Dart from COSC101 Assignment 2 2020 T1 by Luke Dart
  
  private String score;
  
  /**
   * Function: HighScore()
   *
   * @param Nil
   *
   * @return HighScore
   *
   * Desc: Empty Constructor creates a new default HighScore object.
   */
  public HighScore(){
    this.score = "Not set";
  }
  
  // Accessors
  
   /**
   * Function: getScore()
   * 
   * @param nil
   *
   * @return String
   *
   * desc: Returns the highest recorded score.
   *
   * calls: Nil
   *
   * Affects: nil
   */
  public String getScore(){
    return this.score;
  }
  
  
  // Mutators
  
   /**
   * Function: setScore()
   * 
   * @param score int - The score to set the object too.
   *
   * @return void
   *
   * desc: Sets the score for this object
   *
   * calls: Nil
   *
   * Affects: score
   */
  public void setScore(int score){
    this.score = str(score);
  }
  
  
  // Public methods
  
   /**
   * Function: initialise()
   * 
   * @param nil
   *
   * @return void
   *
   * desc: Retrieves the score from the highscore.txt file and loads it into the object.
   *
   * calls: Nil
   *
   * Affects: sUP
   */
  public void initialise(){
    String[] fromFile = loadStrings("highscore.txt");
    
    if(fromFile.length > 0){
      this.score = fromFile[0];
    }
    
  }
  
   /**
   * Function: store()
   * 
   * @param nil
   *
   * @return void
   *
   * desc: Stores the High Score object score into the file highscore.txt.
   *
   * calls: saveStrings()
   *
   * Affects: nil
   */
  public void store(){
    String[] newScore = {this.score};
    saveStrings("highscore.txt", newScore);
  }
  
   /**
   * Function: isHighest()
   * 
   * @param score int - The score to check against.
   *
   * @return boolean
   *
   * desc: Checks if the passed score is higher than the Objects score.
   *
   * calls: Nil
   *
   * Affects: Nil
   */
  public boolean isHighest(int score){
    if(score > int(this.score)){
      return true;
    }
    
    else{
      return false;
    }
  }
  
  
  }

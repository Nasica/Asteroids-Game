class HighScore{
  // Adapted by Luke Dart from COSC101 Assignment 2 2020 T1 by Luke Dart
  
  private String score;
  
  // Empty constructor 
  
  public HighScore(){
    this.score = "Not set";
  }
  
  // Accessors
  
  public String getScore(){
    return this.score;
  }
  
  
  // Mutators
  
  public void setScore(int score){
    this.score = str(score);
  }
  
  
  // Public methods
  
  public void initialise(){
    String[] fromFile = loadStrings("highscore.txt");
    
    if(fromFile.length > 0){
      this.score = fromFile[0];
    }
    
  }
  
  public void store(){
    String[] newScore = {this.score};
    saveStrings("highscore.txt", newScore);
  }
  
  
  public boolean isHighest(int score){
    if(score > int(this.score)){
      return true;
    }
    
    else{
      return false;
    }
  }
  
  
  }

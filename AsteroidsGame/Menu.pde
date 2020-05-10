class Menu{
  
  private ArrayList<String> menuItems = new ArrayList<String>();
  
  //Distance between each row of text
  private int textDistance = 40; 
  private int textOffset = textDistance * -1;
  
  PFont normalFont = createFont("Serif.plain", 20, true);
  PFont selectedFont = createFont("Serif.bold", 20, true);
  
  public Menu(ArrayList<String> menuItems) {
   textAlign(CENTER); 
   this.menuItems = menuItems;
  }
  
  public int getMenuLength(){
    return(this.menuItems.size());
  }

  public String getMenuItems(int index){
    return(this.menuItems.get(index));
  }

  public void drawMenuItem(String item, float xPos, float yPos, boolean isBold){
    fill(255,0,0);
    textFont(normalFont);
    if (isBold){
      fill(0,100,100);
      textFont(selectedFont);
    }
    text(item, xPos, yPos);
    
  }

  public void drawMenu(int selectedIndex){
    for (int i = 0; i < menuItems.size(); i++){
      if (i == selectedIndex){
        textFont(selectedFont);
        fill(255,0,0);
        text(menuItems.get(i), width/2, height/2 + textOffset);
        textOffset = textOffset + textDistance;
      } else {
        textFont(normalFont);
        fill(255,0,0);
        text(menuItems.get(i), width/2, height/2 + textOffset);
        textOffset = textOffset + textDistance;
      }
    }
    textOffset = textDistance * -1;
  }

  //class highScoreMenu extends Menu{
  //  this.menuItems.add("Back");
  //}
}

  
public class MainMenu extends Menu{
  
  public MainMenu(){
    super(new ArrayList<String>() {
      {
        add("Play Game");
        add("High Score");
        add("Exit Game");
      }
    });
  }
}
  

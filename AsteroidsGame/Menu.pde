/**
 *  Menu class.
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 1.0
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *  
 *  Filename: Menu.pde
 *  Date:     09 May 2020
 */


class Menu {
  private final int TEXT_SIZE = 20;
  private ArrayList<String> menuItems = new ArrayList<String>();
  private PFont normalFont 
    = createFont("Serif.plain", TEXT_SIZE, true);
  private PFont selectedFont 
    = createFont("Serif.bold", TEXT_SIZE, true);

  // Constructor

  /**
   * Function: Menu()
   *
   * @param menuItems ArrayList<String> - The array of menu items to display
   *
   * @return Nil
   *
   * Desc: Constructor creates a new menu based off options passed from a 
   *       child class.
   */
  public Menu(ArrayList<String> menuItems) {
    this.menuItems = menuItems;
  }

  // Accessors

  /**
   * Function: getMenuLength()
   *
   * @param Nil
   *
   * @return int
   *
   * Desc: Returns the number of items in the menu 
   */
  public int getMenuLength() {
    return(this.menuItems.size());
  }


  /**
   * Function: getMenuItems()
   *
   * @param index int - The index of the menuitem to get
   *
   * @return String       The text of the menu item
   *
   * Desc: Returns the text of a specified menu item in the array
   */
  public String getMenuItems(int index) {
    return(this.menuItems.get(index));
  }

  //Void Methods

  /**
   * Function: drawMenuItem()
   *
   * @param item String - The menu text to display
   *        xPos float      The x position to draw the text in 
   *        yPos float      The y position to draw the text in 
   *        isBold boolean  Represents if this menu item is the currently 
   *                        selected item
   * @return void
   *
   * Desc: Draws a specified string to the screen in a given position either
   *       bolded or unbold.
   */
  public void drawMenuItem(String item, float xPos, float yPos, 
    boolean isBold) {
    textAlign(CENTER);
    fill(255, 0, 0);
    textFont(normalFont);

    if (isBold) {
      fill(0, 100, 100);
      textFont(selectedFont);
    }

    text(item, xPos, yPos);
  }
}


/**
 *  MainMenu class. Extends Menu
 *  
 *  @author Luke Dart, Scott Dimmock, Mark Gatus
 *  @version 0.1
 *  @since 15 May 2020 (Normalised by Luke Dart)
 *  
 *  Filename: Menu.pde
 *  Date:     09 May 2020
 *
 */


public class MainMenu extends Menu {
  /**
   * Function: MainMenu()
   *
   * @param Nil
   *
   * @return Menu
   *
   * Desc: Constructor calls the parent constructor Menu with a given list
   *       of strings to represent a menu items.
   */
  public MainMenu() {
    super(new ArrayList<String>() {
      {
        add("Play Game");
        add("Exit Game");
      }
    }
    );
  }
}

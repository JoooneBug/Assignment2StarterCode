/*
    DIT OOP Assignment 2 Starter Code
    =================================
    Forked JW 
    C12422948
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

boolean playing;


void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  playing = false;
}

void draw()
{
  if (playing == false)
  {
    //splash screen function
    splashScreen();
    
  }
  else
  {
    for(Player player:players)
    {
      player.update();
      player.display();
    }
  }
}

void keyPressed()
{
  keys[keyCode] = true;
  
  if (keyCode == ENTER)
  {
    playing = true;
    clear();
  }
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  }
}

void splashScreen()
{
 PImage galaxy;
 galaxy = loadImage("galaxy.JPG");
 galaxy.resize(500,500);
 background(galaxy);
 
 PFont moon;
 moon = loadFont("Moonshiner-Round-48.vlw");
 textFont(moon);
 textAlign(CENTER, BOTTOM);
 text("Welcome to", 250 , 70);
 
 PFont moon2;
 moon2 = loadFont("Moonshiner-Round-24.vlw");
 
 PFont pieces;
 pieces = loadFont("PiecesNFI-48.vlw");
 textFont(pieces);
 textAlign(CENTER, CENTER);
 text("Space Run", 250, 140);
 
 textFont(moon2);
 textAlign(CENTER, TOP);
 text("Race into space and collect speed ups and slow downs as you go!", 250, 210);
 
 textFont(moon);
 textAlign(CENTER, TOP);
 text("Press Enter to begin", 250, 280);
 
 textFont(moon2);
 textAlign(CENTER, TOP);
 text("   Player 1 Controls                  Player 2 Controls",250,350);
 text("        W - UP                              I - UP",250,400);
 text("A - LEFT       D - RIGHT             J - LEFT         L - RIGHT",250,450);
 
}

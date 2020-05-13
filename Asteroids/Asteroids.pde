import processing.sound.*;

GAMESTATE gameState = GAMESTATE.PLAYING;
Game game;
Menu menu;
SoundFile thrusterSound;
Sound volume;
 
boolean keyA, keyS, keyD, keyW;

void setup()
{
  //size(500,500);
  fullScreen();
  game = new Game();
  menu = new Menu();
  keyA = false;
  keyS = false;
  keyD = false; 
  keyW = false;
  thrusterSound = new SoundFile(this, "rocket.wav");
  volume = new Sound(this);
  
}


void draw()
{
  background(0);
  volume.volume(0.1);
  
  switch(gameState)
  {
    case PLAYING:
      GameLoop();
      break;
    case MENU:
      MenuLoop();
      break;
  }
}
  
   void keyPressed() 
  {
    if(key== 'w')
    {
      keyW = true;
      print('w');
    }
    if(key=='a')
    {
      keyA = true;
    }
    if(key=='d')
    {
      keyD = true;
    }
    if(key=='s')
    {
      keyS = true;
    }
  }
 
  void keyReleased() 
  {
    if(key== 'w')
    {
      keyW = false;
    }
    if(key=='a')
    {
      keyA = false;
    }
    if(key=='d')
    {
      keyD = false;
    }
    if(key=='s')
    {
      keyS = false;
    }
  }
  
  


void GameLoop()
{
  game.OnUpdate();
  game.OnDraw();
}

void MenuLoop()
{
  menu.OnUpdate();
  menu.OnDraw();
}

enum GAMESTATE
{
  PLAYING,
  MENU
}

 

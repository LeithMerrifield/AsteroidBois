import processing.sound.*;

GAMESTATE gameState = GAMESTATE.PLAYING;
Game game;
Menu menu;
SoundFile thrusterSound;
Sound volume;
 
boolean W_held, A_held, D_held;

void setup()
{
  //size(500,500);
  fullScreen();
  game = new Game();
  menu = new Menu();
  W_held = false;
  A_held = false;
  D_held = false; 
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

void keyPressed() {
    if(key == 'a' || key == 'A') {
      A_held = true;
    }
    if(key == 'd' || key == 'D') {
      D_held = true;
    }
    if(key == 'w' || key == 'W') {
      W_held = true;
    }
}
void keyReleased() {
    if(key == 'a' || key == 'A') {
      A_held = false;
    }
    if(key == 'd' || key == 'D') {
      D_held = false;
    }
    if(key == 'w' || key == 'W') {
      W_held = false;
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

 

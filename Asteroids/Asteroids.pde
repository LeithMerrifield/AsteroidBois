import processing.sound.*;

GAMESTATE gameState = GAMESTATE.PLAYING;
Game game;
Menu menu;
SoundFile thrusterSound;
SoundFile PlayerDie1;
SoundFile PlayerDie2;
SoundFile RockHit1;
SoundFile RockHit2;
SoundFile RockHit3;
SoundFile GunFire;
Sound volume;

IntList projectiley;
IntList projectilex;
boolean W_held, A_held, D_held, S_held, Space_held;
boolean asteroidHitBox = false;

void setup()
{
  //Fram.setResizable allows us to resize the screen later.
  //fullScreen();
  textSize(50);
  size(900,900);
  surface.setResizable(true);
  game = new Game();
  menu = new Menu();
  W_held = false;
  A_held = false;
  S_held = false;
  D_held = false; 
  Space_held = false;
  thrusterSound = new SoundFile(this, dataPath("Sounds\\rocket.wav"));
  RockHit1 = new SoundFile(this, dataPath("Sounds\\RockHit1.wav"));
  RockHit2 = new SoundFile(this, dataPath("Sounds\\RockHit2.wav"));
  RockHit3 = new SoundFile(this, dataPath("Sounds\\RockHit3.wav"));
  PlayerDie1 = new SoundFile(this, dataPath("Sounds\\PlayerDie1.wav"));
  PlayerDie2 = new SoundFile(this, dataPath("Sounds\\PlayerDie1.wav"));
  GunFire = new SoundFile(this, dataPath("Sounds\\GunFire.wav"));
  volume = new Sound(this);
  projectiley = new IntList();
  projectilex = new IntList();
  
  volume.volume(0.1);
}

void draw()
{
  background(0);
  
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
    if(key == 's' || key == 'S')
    {
      S_held = true;  
    }
    if(key == ' ') {
      Space_held = true;
    }
    if(key == ESC)
    {
      key = 0;
      gameState = GAMESTATE.MENU;
    }
    
    if(keyCode == java.awt.event.KeyEvent.VK_F1)
    {
      asteroidHitBox = !asteroidHitBox;
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
    if(key =='s' || key =='S')
    {
      S_held = false;
    }
    if(key == ' ') {
      Space_held = false;
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


 

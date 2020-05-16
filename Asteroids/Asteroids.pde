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
<<<<<<< HEAD

IntList projectiley;
IntList projectilex;
boolean W_held, A_held, D_held, Space_held;
=======
 
boolean W_held, A_held, D_held;
>>>>>>> aed87260a47d54240eceb79afd3b6afbefcd6afa

void setup()
{
  //size(500,500);
  fullScreen();
  game = new Game();
  menu = new Menu();
  W_held = false;
  A_held = false;
  D_held = false; 
<<<<<<< HEAD
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
=======
  thrusterSound = new SoundFile(this, "rocket.wav");
  volume = new Sound(this);
>>>>>>> aed87260a47d54240eceb79afd3b6afbefcd6afa
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
<<<<<<< HEAD
    }
    if(key == 'd' || key == 'D') {
      D_held = true;
    }
    if(key == 'w' || key == 'W') {
      W_held = true;
    }
    if(key == ' ') {
      Space_held = true;
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
    if(key == ' ') {
      Space_held = false;
=======
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
>>>>>>> aed87260a47d54240eceb79afd3b6afbefcd6afa
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

 

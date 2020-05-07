GAMESTATE gameState = GAMESTATE.PLAYING;
Game game;
Menu menu;

void setup()
{
  size(500,500);
  game = new Game();
  menu = new Menu();
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

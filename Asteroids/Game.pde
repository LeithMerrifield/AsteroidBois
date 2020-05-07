class Game
{
  Ship player;
  
  Game() 
  {
    player = new Ship(100);
  }
  
  
  void OnUpdate()
  {
    player.OnUpdate();
  }
  
  void OnDraw()
  {
    player.OnDraw();
  }
}

class Ship
{
  int m_health = 100;
  PImage playerShip;
  PVector m_position;
  PVector m_speed; 
  
  Ship(int health)
  {
    playerShip= loadImage("ShipIdle.png");
    playerShip.resize(60,96);
    m_position= new PVector(width/2,height/2);
    m_speed= new PVector(0,0);
  }
  
  void SetHealth(int newHealth)
  {
    m_health = newHealth;
  }
  
    void OnUpdate()
  {
    
    //Ship speed negating
    m_position.add(m_speed);
  }
  
  void OnDraw()
  {
    image(playerShip,m_position.x - (playerShip.width/2) ,m_position.y - (playerShip.height/2));
    
  }

}

class Ship
{
  int m_health;
  PImage playerShip;
  PVector m_location, m_velocity, m_accelaration;
  float m_rotation, m_rotation_speed, m_thrust_force;
  int inBox;
  
  Ship(int m_health)
  {
    playerShip= loadImage("ShipIdle.png");
    playerShip.resize(60,96);
    m_location = new PVector(0,0);
    m_velocity = new PVector(0,0);
    m_accelaration = new PVector(0,0);
    inBox = 1;
    m_rotation = 0;
    m_rotation_speed = 0.05;
    m_thrust_force = 0.05;
    
  }
  //A simple function to set the ships health
  void SetHealth(int newHealth)
  {
    m_health = newHealth;
  }
  // changes the rotation and accelaration with key inputs.
  void OnUpdate() {
    if(A_held) { 
      m_rotation -= m_rotation_speed;
    }
    if(D_held) { 
      m_rotation += m_rotation_speed;
    }
    if(W_held) {
      m_accelaration.x = m_thrust_force*sin(m_rotation);
      m_accelaration.y = -m_thrust_force*cos(m_rotation);
    } else {
      m_accelaration.x = 0;
      m_accelaration.y = 0;
    }
  }

  
  void OnDraw() { // the pushing and popping of matrix allows it to rotate around the rocket.
    pushMatrix();
    translate(m_location.x+width/2, m_location.y+height/2);
    rotate(m_rotation);
    image(playerShip, -playerShip.width/2, -playerShip.height/2);
    popMatrix();
    m_velocity.add(m_accelaration);
    m_location.add(m_velocity);
  }
  
  //A function to both detect and 'bounce' the ship away from the borders of the screen.
  //We shouldnt use this at the end as ships, asteroids and UFOs should "loop" to the other side of the screen.
  void shipBorderCollision()
  {
     if(m_location.x+(playerShip.width*0.4) >= width || m_location.x-(playerShip.width*0.4) <0 || m_location.y-(playerShip.height*0.5) <= 0 || m_location.y+(playerShip.height*0.3) >= height)
    {
     
      m_velocity.mult(-1);
    }
    else inBox = 1;
    
    //This ensures a 'hard' border that the ship cannot cross
    if(m_location.x+(playerShip.width*0.4) >= width)
      m_location.x = width-(playerShip.width*0.4);
    if(m_location.x-(playerShip.width*0.4) < 0)
      m_location.x = 0+ (playerShip.width*0.4);
    if(m_location.y-(playerShip.height*0.5) <= 0)
      m_location.y = 0 +(playerShip.height*0.5);
    if(m_location.y+(playerShip.height*0.3) >= height)
      m_location.y = height-(playerShip.height*0.3);
  }
}
